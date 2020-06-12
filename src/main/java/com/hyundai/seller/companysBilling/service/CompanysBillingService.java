package com.hyundai.seller.companysBilling.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name : CompanysBillingService.java
 * @Description : seller CompanysBillingService Class
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

public interface CompanysBillingService {

	/**
	 * 품목점 지급현황을 조회한다.
	 * @param params
	 * @return 품목점 지급현황 목록
	 * @exception Exception
	 */
	List<?> selectSellerCompanysBillingList(Map<String, Object> params) throws Exception;

}
