package com.hyundai.usr.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.cmmn.EgovFileScrty;
import com.hyundai.cmmn.service.LoginVO;
import com.hyundai.usr.service.RegistService;
import com.hyundai.usr.service.RegistVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 회원가입 프로세스를 처리하는 비즈니스 인터페이스 클래스
 * @author CDF Team
 * @since 2018.11.16
 * @version 1.0
 *  
 * <pre>
 * << 개정이력(Modification Information) >>
 * 
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2018.11.16  CDF Team          최초 생성 
 *  </pre>
 */
@Service("registService")
public class RegistServiceImpl extends EgovAbstractServiceImpl implements RegistService {

	private static final Logger LOGGER = LoggerFactory.getLogger(RegistServiceImpl.class);

	@Resource(name="registMapper")
	private RegistMapper registDAO;

	/** ID Generation */
	@Resource(name = "egovMembIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	/**
	 * 입력한 사업자번호가 회원으로 등록되어 있는지 db에서 조회한다.
	 * @param String
	 * @return boolean
	 * @exception Exception
	 */
	@Override
	public boolean isRegistered(String businessNo) throws Exception {
		LoginVO vo = new LoginVO();
		vo.setBusinessNo(businessNo);
		if(registDAO.selectRegist(vo) != null) return true;
		return false;
	}

    /**
	 * 입력한 아이디가 회원으로 등록되어 있는지 db에서 조회한다.
	 * @param String
	 * @return boolean
	 * @exception Exception
	 */
	@Override
	public boolean checkUserId(String userId) throws Exception {
		LoginVO vo = new LoginVO();
		vo.setUserId(userId);
		if(registDAO.selectRegist(vo) != null) return true;
		return false;
	}

    /**
	 * 새로운 회원을 db에 등록한다.
	 * @param vo RegistVO
	 * @return void
	 * @exception Exception
	 */
	@Override
	public void insertRegist(RegistVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		/** userSeqNo Generation Service */
		String userSeqNo = egovIdGnrService.getNextStringId();
		vo.setUserSeqNo(userSeqNo);
		
		String membNo = Integer.toHexString((int)(new Date()).getTime());
		vo.setMembNo(membNo.substring(0, 4).toUpperCase());
		
//		String enpassword = EgovFileScrty.encryptPassword(vo.getUserPw(), vo.getUserId());
//    	vo.setUserPw(enpassword);

    	LOGGER.debug(vo.toString());

		registDAO.insertUser(vo);
		registDAO.insertRegist(vo);
	}

    /**
	 * 회원정보를 DB로부터 읽어온다.
	 * @param vo LoginVO
	 * @return RegistVO
	 * @exception Exception
	 */
	@Override
	public RegistVO selectRegist(LoginVO vo) throws Exception {
		RegistVO resultVO = registDAO.selectRegist(vo);
		if (resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}

	/**
	 * 회원정보를 수정한 내용을 db에 등록한다.
	 * @param vo RegistVO
	 * @return void
	 * @exception Exception
	 */
	@Override
	public boolean updateRegist(RegistVO vo) throws Exception {
//		String enpassword = EgovFileScrty.encryptPassword(vo.getUserPw(), vo.getUserId());
//    	vo.setUserPw(enpassword);

    	try{
			registDAO.updateUser(vo);
			registDAO.updateRegist(vo);
		}catch(Exception e){
			return false;
		}
		return true;
	}

}
