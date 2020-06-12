package com.hyundai.seller.limit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.buyer.salesBilling.service.BuyerLimitVO;
import com.hyundai.seller.limit.service.LimitService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : SellerLimitServiceImpl.java
 * @Description : seller limit Business Implement Class
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
@Service("sellerLimitService")
public class LimitServiceImpl extends EgovAbstractServiceImpl implements LimitService {

	private static final Logger LOGGER = LoggerFactory.getLogger(LimitServiceImpl.class);

	@Resource(name = "sellerLimitMapper")
	private LimitMapper limitDAO;
	@Override
	public List<BuyerLimitVO> selectSellerLimitList(Map<String, Object> params) {
		return limitDAO.selectSellerLimitList(params);
	}
	@Override
	public int selectSellerLimitListCnt(Map<String, Object> params) {
		return limitDAO.selectSellerLimitListCnt(params);
	}

}
