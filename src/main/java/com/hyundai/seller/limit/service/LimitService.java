package com.hyundai.seller.limit.service;

import java.util.List;
import java.util.Map;

import com.hyundai.buyer.salesBilling.service.BuyerLimitVO;

/**
 * @Class Name : SellerLimitService.java
 * @Description : seller SellerLimitService Class
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

public interface LimitService {

	public List<BuyerLimitVO> selectSellerLimitList(Map<String, Object> params);

	public int selectSellerLimitListCnt(Map<String, Object> params);

}
