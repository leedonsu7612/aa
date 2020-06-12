package com.hyundai.buyer.taxBill.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name : TaxBillService.java
 * @Description : Buyer TaxBillService Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.28   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.28
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
	public List<TaxBillVO> selectBuyerTaxBillList(Map<String, Object> params) throws Exception;

	/**
	 * 대리점 세금계산서 총 갯수을 조회한다.
	 * @param params
	 * @return 대리점 세금계산서 총 갯수
	 * @exception Exception
	 */
	public int selectBuyerTaxBillListCnt(Map<String, Object> params) throws Exception;

	/**
	 * 대리점 세금계산서를 조회한다.
	 * @param params
	 * @return 대리점 세금계산서
	 * @exception Exception
	 */
	public TaxBillVO selectBuyerTaxBill(Map<String, Object> params) throws Exception;

}
