package com.hyundai.seller.payment.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Class Name : SellerPaymentService.java
 * @Description : seller PaymemtService Class
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

public interface PaymentService {


	public List<PaymentVO> selectSellerPaymentList(Map<String, Object> params) throws Exception;
	public int selectSellerPaymentListCnt(Map<String, Object> params) throws Exception;
	public int selectSellerPaymentSummary(Map<String, Object> params)throws Exception;

}
