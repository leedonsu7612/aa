package com.hyundai.admin.member.service;

import java.util.List;

/**
 * @Class Name : CdfMemberService.java
 * @Description : CdfMemberService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.02           최초생성
 *
 * @author cdf dev
 * @since 2018.11.02
 * @version 1.0
 *
 */

public interface CdfMemberService {

	/**
	 * 상점을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MemberVO
	 * @exception Exception
	 */
	void insertMember(MemberVO vo) throws Exception;

	/**
	 * 상점을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	void updateMember(MemberVO vo) throws Exception;

	/**
	 * 상점을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	void deleteMember(MemberVO vo) throws Exception;

	/**
	 * 상점을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MemberVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	MemberVO selectMember(MemberVO vo) throws Exception;

	/**
	 * 상점 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 상점 목록
	 * @exception Exception
	 */
	List<?> selectMemberList(MemberVO searchVO) throws Exception;

	/**
	 * 상점 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 상점 총 갯수
	 * @exception
	 */
	int selectMemberListTotCnt(MemberVO searchVO);

}
