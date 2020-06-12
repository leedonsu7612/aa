package com.hyundai.seller.unauthorized.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name : SellerUnauthorizedService.java
 * @Description : seller SellerUnauthorizedService Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.30   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.30
 * @version 1.0
 *
 */
public interface UnauthorizedService {

	/**
	 * 품목점 기타지급 승인 목록을 조회한다.
	 * @param params
	 * @return 품목점 기타지급 승인 목록
	 */
	List<UnauthorizedVO> selectSellerUnauthorizedList(Map<String, Object> params) throws Exception;
	/**
	 * 품목점 기타지급 승인 총 갯수를 조회한다.
	 * @param params
	 * @return 품목점 기타지급 승인 총 갯수
	 */
	int selectSellerUnauthorizedListCnt(Map<String, Object> params) throws Exception;

	public int insertSellerUnauthorized(UnauthorizedVO unauthorizedVO) throws Exception;

	public int updateSellerUnauthorized(UnauthorizedVO unauthorizedVO) throws Exception;
}
