package com.hyundai.buyer.salesBilling.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name : SalesBillingService.java
 * @Description : Buyer SalesBillingService Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.19   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.19
 * @version 1.0
 *
 */

public interface SalesBillingService {

	/**
	 * 대리점 지급내역 상세를 조회한다.
	 * @param params
	 * @return 대리점 지급내역 상세 목록
	 * @exception Exception
	 */
	public List<SalesBillingVO> selectBuyerSalesBillingList(Map<String, Object> params) throws Exception;

	/**
	 * 기간별 대리점 지급내역 상세를 조회한다.
	 * @param params
	 * @return 기간별 대리점 지급내역 상세 목록
	 * @exception Exception
	 */
	public List<?> selectBuyerSalesBillingInTheMonthList(DfrdAcntsRcvbleVO vo) throws Exception;


	/**
	 * 대리점 한도를 조회한다.
	 * @param params
	 * @return 대리점 한도
	 * @exception Exception
	 */
	public BuyerLimitVO selectBuyerSalesBillingLimit(Map<String, Object> params) throws Exception;

}
