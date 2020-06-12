package com.hyundai.seller.salesBilling.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.buyer.salesBilling.service.BuyerLimitVO;
import com.hyundai.seller.salesBilling.service.DfrdAcntsRcvbleVO;
import com.hyundai.seller.salesBilling.service.SalesBillingService;
import com.hyundai.seller.salesBilling.service.SalesBillingVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : SellerSalesBillingServiceImpl.java
 * @Description : seller SellerSalesBillingServiceImpl Business Implement Class
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

@Service("sellerSalesBillingService")
public class SalesBillingServiceImpl extends EgovAbstractServiceImpl implements SalesBillingService {

	private static final Logger LOGGER = LoggerFactory.getLogger(SalesBillingServiceImpl.class);

	@Resource(name="sellerSalesBillingMapper")
	private SalesBillingMapper salesBillingDAO;

	/**
	 * 품목점 지급내역 상세를 조회한다.
	 * @param params
	 * @return 품목점 지급내역 상세 목록
	 * @exception Exception
	 */
	@Override
	public List<SalesBillingVO> selectSellerSalesBillingList(Map<String, Object> params) throws Exception {
		return salesBillingDAO.selectSellerSalesBillingList(params);
	}

	/**
	 * 기간별 품목점 지급내역 상세를 조회한다.
	 * @param params
	 * @return 기간별 품목점 지급내역 상세 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectSellerSalesBillingInTheMonthList(DfrdAcntsRcvbleVO vo) throws Exception {
		return salesBillingDAO.selectSellerSalesBillingInTheMonthList(vo);
	}

	/**
	 * 품목점 한도를 조회한다.
	 * @param params
	 * @return 품목점 한도
	 * @exception Exception
	 */
	@Override
	public BuyerLimitVO selectSellerSalesBillingLimit(Map<String, Object> params) throws Exception {
		return salesBillingDAO.selectSellerSalesBillingLimit(params);
	}


}
