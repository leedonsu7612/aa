package com.hyundai.seller.taxBill.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name : SellerTaxBillService.java
 * @Description : seller SellerTaxBillService Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.12.1   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.12.1
 * @version 1.0
 *
 */

public interface TaxBillService {

	/**
	 * 대리점 세금계산서 목록을 조회한다.
	 * @param params
	 * @return 대리점 세금계산서 목록
	 * @exception Exception
	 */
	public List<TaxBillStatusVO> selectSellerTaxBillList(Map<String, Object> params) throws Exception;

	public List<TaxBillStatusVO> selectSellerTaxBillStatusList(Map<String, Object> params) throws Exception;

	public int selectSellerTaxBillStatusListCnt(Map<String, Object> params) throws Exception;

	public long selectSellerTaxBillStatusListSum(Map<String, Object> params) throws Exception;

}
