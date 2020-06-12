package com.hyundai.admin.authorization.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hyundai.admin.authorization.service.AuthorizationService;
import com.hyundai.admin.authorization.service.MemberAuthVO;
import com.hyundai.admin.authorization.service.MenuAuthVO;
import com.hyundai.admin.limitInfo.service.LimitRequestVO;
import com.hyundai.admin.member.service.MemberVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : AuthorizationServiceImpl.java
 * @Description : Authorization Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.20    CDF Team       최초생성
 *
 * @author CDF Team
 * @since 2018.11.20
 * @version 1.0
 *
 */

@Service("authorizationService")
public class AuthorizationServiceImpl extends EgovAbstractServiceImpl implements AuthorizationService {

	private static final Logger LOGGER = LoggerFactory.getLogger(AuthorizationServiceImpl.class);

	@Resource(name="authorizationMapper")
	private AuthorizationMapper authorizationDAO;

	@Override
	public List<?> selectMemberAuthList(MemberAuthVO searchVO) throws Exception {
		return authorizationDAO.selectMemberAuthList(searchVO);
	}

	@Override
	public int selectMemberAuthListTotCnt(MemberAuthVO searchVO) {
		return authorizationDAO.selectMemberAuthListTotCnt(searchVO);
	}

	@Override
	public MemberAuthVO selectMemberAuthEdit(MemberAuthVO vo) throws Exception {
		MemberAuthVO resultVO = authorizationDAO.selectMemberAuthEdit(vo);
		if (resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}

	@Override
	public void updateMemberAuth(MemberAuthVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		if(vo.getSendSMS().equalsIgnoreCase("Y")){	// 정지가 해제되면 SMS문자발신
//			sendSMS();
		}

		LOGGER.debug(vo.toString());
		authorizationDAO.updateMemberAuth(vo);
	}

	@Override
	public void deleteMember(String arrStr) throws Exception {
		String[] arrSeqNo = arrStr.split(",");
		MemberAuthVO vo = new MemberAuthVO();
		for(String userSeqNo : arrSeqNo){
			vo.setUserSeqNo(userSeqNo);
			authorizationDAO.deleteMember(vo);
		}
	}

	@Override
	public List<?> selectGroupAuthList(String membClass) throws Exception {
		List<MenuAuthVO> list = authorizationDAO.selectGroupAuthList(membClass);
		int numOfChildren = 1;
		String parentId = "";
		for(int i = list.size() - 1; i > 0; i--){
			MenuAuthVO vo = list.get(i);
			if(parentId.equalsIgnoreCase(vo.getMenuId())){
				vo.setNumOfChildren(numOfChildren);
				numOfChildren = 1;
			}else if(parentId.equalsIgnoreCase(vo.getParentId())){
				numOfChildren++;
				vo.setNumOfChildren(1);
			}else{
				parentId = vo.getParentId();
				vo.setNumOfChildren(1);
			}
		}
		return list;
	}

	@Override
	public void updateGroupAuth(String membClass, String arrStr) throws Exception {
		List<MenuAuthVO> list = authorizationDAO.selectGroupAuthList(membClass);
		Map<String, String> authMap = new HashMap<String, String>();
		String[] arrMenuAuth = arrStr.split(",");
		for(String menuAuth : arrMenuAuth){
			String[] mauth =  menuAuth.split(":");
			authMap.put(mauth[0], mauth[1]);
		}
		String authClass = "";
		for(MenuAuthVO vo : list){
			if(!authMap.get(vo.getMenuId()).equalsIgnoreCase(vo.getUseAt())){
				if(vo.getUseAt().equalsIgnoreCase("N")) authClass = vo.getAuthClass() + membClass + ":";
				else authClass = vo.getAuthClass().replaceAll(membClass + ":", "");
				vo.setAuthClass(authClass);
				authorizationDAO.updateGroupAuth(vo);
			}
		}
	}
}
