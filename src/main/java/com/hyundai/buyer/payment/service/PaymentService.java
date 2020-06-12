package com.hyundai.buyer.payment.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name : PaymemtService.java
 * @Description : Buyer PaymemtService Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.26   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.26
 * @version 1.0
 *
 */

public interface PaymentService {

	/**
	 * 대리점 결제내역 목록을 조회한다.
	 * @param params
	 * @return 대리점 결제내역 목록
	 * @exception Exception
	 */
	public List<PaymentVO> selectBuyerPaymentList(Map<String, Object> params) throws Exception;

	/**
	 * 대리점 결제내역 총 갯수을 조회한다.
	 * @param params
	 * @return 대리점 결제내역 총 갯수
	 * @exception Exception
	 */
	public int selectBuyerPaymentListCnt(Map<String, Object> params) throws Exception;

	/**
	 * 대리점 결제내역 총 합계을 조회한다.
	 * @param params
	 * @return 대리점 결제내역 총 합계
	 * @exception Exception
	 */
	public long selectBuyerPaymentSummary(Map<String, Object> params) throws Exception;

}
