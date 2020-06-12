package com.hyundai.admin.member.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.admin.member.service.CdfMemberService;
import com.hyundai.admin.member.service.MemberVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : CdfMemberServiceImpl.java
 * @Description : Member Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.05    CDF Team       최초생성
 *
 * @author CDF Team
 * @since 2018.11.05
 * @version 1.0
 *
 */

@Service("memberService")
public class CdfMemberServiceImpl extends EgovAbstractServiceImpl implements CdfMemberService {

	private static final Logger LOGGER = LoggerFactory.getLogger(CdfMemberServiceImpl.class);

	@Resource(name="memberMapper")
	private MemberMapper memberDAO;

	/**
	 * 멤버를 등록한다.
	 * @param vo - 등록할 정보가 담긴 MemberVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Override
	public void insertMember(MemberVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		memberDAO.insertMember(vo);
	}

	/**
	 * 멤버를 수정한다.
	 * @param vo - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void updateMember(MemberVO vo) throws Exception {
		memberDAO.updateMember(vo);
	}

	/**
	 * 멤버를 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void deleteMember(MemberVO vo) throws Exception {
		memberDAO.deleteMember(vo);
	}

	/**
	 * 멤버를 조회한다.
	 * @param vo - 조회할 정보가 담긴 MemberVO
	 * @return 조회한 멤버
	 * @exception Exception
	 */
	@Override
	public MemberVO selectMember(MemberVO vo) throws Exception {
		MemberVO resultVO = memberDAO.selectMember(vo);
		if (resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}

	/**
	 * 멤버 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 멤버 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectMemberList(MemberVO searchVO) throws Exception {
		return memberDAO.selectMemberList(searchVO);
	}

	/**
	 * 멤버 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 멤버 총 갯수
	 * @exception
	 */
	@Override
	public int selectMemberListTotCnt(MemberVO searchVO) {
		return memberDAO.selectMemberListTotCnt(searchVO);
	}

}
