package com.hyundai.admin.limitInfo.service;

import java.util.List;

import com.hyundai.admin.member.service.MemberVO;

/**
 * @Class Name : LimitInfoService.java
 * @Description : LimitInfoService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.12.03   CDF Team        최초생성
 *
 * @author cdf dev
 * @since 2018.12.03
 * @version 1.0
 *
 */

public interface LimitInfoService {

	/**
	 * 대리점 한도요청 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 대리점 한도요청 목록
	 * @exception Exception
	 */
	List<?> selectLimitInfoList(LimitInfoVO searchVO) throws Exception;

	/**
	 * 대리점 한도요청 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 대리점 한도요청 총 갯수
	 * @exception
	 */
	int selectLimitInfoListTotCnt(LimitInfoVO searchVO);

	/**
	 * 대리점 한도승인 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 대리점 한도승인 목록
	 * @exception Exception
	 */
	List<?> selectLimitApprovalList(LimitInfoVO searchVO) throws Exception;

	/**
	 * 대리점 한도승인 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 대리점 한도승인 총 갯수
	 * @exception
	 */
	int selectLimitApprovalListTotCnt(LimitInfoVO searchVO);

	/**
	 * 대리점 한도요청을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 대리점 한도요청 목록
	 * @exception Exception
	 */
	LimitRequestVO selectLimitRequest(LimitRequestVO searchVO) throws Exception;

	/**
	 * 대리점 한도요청 내역을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 대리점 한도요청 내역
	 * @exception Exception
	 */
	List<?> selectLimitHistoryList(MemberVO searchVO) throws Exception;

	/**
	 * 대리점 한도요청 내역 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 대리점 한도요청 내역 총 갯수
	 * @exception
	 */
	int selectLimitHistoryListTotCnt(MemberVO searchVO);

	/**
	 * 대리점 한도요청 등록한다.
	 * @param vo - 등록할 정보가 담긴 LimitRequestVO
	 * @return
	 * @exception Exception
	 */
	public void insertLimitRequest(LimitRequestVO vo) throws Exception;

	/**
	 * 대리점 한도요청을 검색해서 승인된지 24시간이 지난 요청을 최종승인한다.
	 * @return
	 * @exception Exception
	 */
	public void checkLimitRequest() throws Exception;
}
