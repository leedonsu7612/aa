package com.hyundai.seller.loan.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Class Name : SellerLoanService.java
 * @Description : seller SellerLoanService Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.12.5   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.12.5
 * @version 1.0
 *
 */

public interface LoanService {

	public int selectSellerLoanListCnt(Map<String, Object> params);

	public List<LoanVO> selectSellerLoanList(Map<String, Object> params);

}
