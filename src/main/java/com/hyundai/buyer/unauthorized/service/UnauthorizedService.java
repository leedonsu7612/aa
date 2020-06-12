package com.hyundai.buyer.unauthorized.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name : UnauthorizedService.java
 * @Description : Buyer UnauthorizedService Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.21   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.21
 * @version 1.0
 *
 */

public interface UnauthorizedService {

	/**
	 * 대리점 기타지급 승인 목록을 조회한다.
	 * @param params
	 * @return 대리점 기타지급 승인 목록
	 * @exception Exception
	 */
	public List<UnauthorizedVO> selectBuyerUnauthorizedList(Map<String, Object> params) throws Exception;

	/**
	 * 대리점 기타지급 승인 총 갯수를 조회한다.
	 * @param params
	 * @return 대리점 기타지급 승인 총 갯수
	 * @exception Exception
	 */
	public int selectBuyerUnauthorizedListCnt(Map<String, Object> params) throws Exception;

	/**
	 * 대리점 기타지급 승인을 수정한다.
	 * @param unauthorizedVO
	 * @exception Exception
	 */
	public int updateBuyerUnauthorized(UnauthorizedVO unauthorizedVO) throws Exception;
}
