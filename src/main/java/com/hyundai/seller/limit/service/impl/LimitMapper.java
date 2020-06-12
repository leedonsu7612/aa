package com.hyundai.seller.limit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hyundai.buyer.salesBilling.service.BuyerLimitVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("sellerLimitMapper")
public class LimitMapper extends EgovAbstractMapper {

	public List<BuyerLimitVO> selectSellerLimitList(Map<String, Object> params) {
		return selectList("selectSellerLimitList", params);
	}

	public int selectSellerLimitListCnt(Map<String, Object> params) {
		return selectOne("selectSellerLimitListCnt", params);
	}

}
