package com.hyundai.admin.authorization.service;

import java.util.List;

import com.hyundai.admin.member.service.MemberVO;

/**
 * @Class Name : AuthorizationService.java
 * @Description : AuthorizationService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.21   CDF Team        최초생성
 *
 * @author cdf dev
 * @since 2018.11.21
 * @version 1.0
 *
 */

public interface AuthorizationService {

	/**
	 * 그룹별 사용자 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 그룹별 사용자 목록
	 * @exception Exception
	 */
	List<?> selectMemberAuthList(MemberAuthVO searchVO) throws Exception;

	/**
	 * 그룹별 사용자 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 그룹별 사용자 총 갯수
	 * @exception
	 */
	int selectMemberAuthListTotCnt(MemberAuthVO searchVO);

	/**
	 * 사용자 권한을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 사용자 권한정보
	 * @exception Exception
	 */
	MemberAuthVO selectMemberAuthEdit(MemberAuthVO searchVO) throws Exception;

	/**
	 * 사용자 권한정보를 갱신한다.
	 * @param vo - 갱신할 정보가 담긴 MemberAuthVO
	 * @return
	 * @exception Exception
	 */
	public void updateMemberAuth(MemberAuthVO vo) throws Exception;

	/**
	 * 선택된 사용자들을 삭제한다.
	 * @param arrStr - 삭제할 정보가 담긴 배열 String
	 * @return void형
	 * @exception Exception
	 */
	void deleteMember(String arrStr) throws Exception;

	/**
	 * 그룹별메뉴권한 목록을 조회한다.
	 * @param String - 조회할 정보가 담긴 membClass
	 * @return 그룹별메뉴권한 목록
	 * @exception Exception
	 */
	List<?> selectGroupAuthList(String membClass) throws Exception;

	/**
	 * 그룹별메뉴권한정보를 갱신한다.
	 * @param String - 갱신할 정보가 담긴 Array
	 * @return
	 * @exception Exception
	 */
	public void updateGroupAuth(String membClass, String arrStr) throws Exception;
}
