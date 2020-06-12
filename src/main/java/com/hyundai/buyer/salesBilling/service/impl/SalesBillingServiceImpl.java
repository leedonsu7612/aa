package com.hyundai.buyer.salesBilling.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.buyer.accountReceivable.service.ReceivableChangeVO;
import com.hyundai.buyer.salesBilling.service.BuyerLimitVO;
import com.hyundai.buyer.salesBilling.service.DfrdAcntsRcvbleVO;
import com.hyundai.buyer.salesBilling.service.SalesBillingService;
import com.hyundai.buyer.salesBilling.service.SalesBillingVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : SalesBillingServiceImpl.java
 * @Description : Buyer SalesBilling Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.19   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.19
 * @version 1.0
 *
 */

@Service("buyerSalesBillingService")
public class SalesBillingServiceImpl extends EgovAbstractServiceImpl implements SalesBillingService {

	private static final Logger LOGGER = LoggerFactory.getLogger(SalesBillingServiceImpl.class);

	@Resource(name="buyerSalesBillingMapper")
	private SalesBillingMapper salesBillingDAO;

	/**
	 * 대리점 지급내역 상세를 조회한다.
	 * @param params
	 * @return 대리점 지급내역 상세 목록
	 * @exception Exception
	 */
	@Override
	public List<SalesBillingVO> selectBuyerSalesBillingList(Map<String, Object> params) throws Exception {
		return salesBillingDAO.selectBuyerSalesBillingList(params);
	}

	/**
	 * 기간별 대리점 지급내역 상세를 조회한다.
	 * @param params
	 * @return 기간별 대리점 지급내역 상세 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectBuyerSalesBillingInTheMonthList(DfrdAcntsRcvbleVO vo) throws Exception {
		return salesBillingDAO.selectBuyerSalesBillingInTheMonthList(vo);
	}

	/**
	 * 대리점 한도를 조회한다.
	 * @param params
	 * @return 대리점 한도
	 * @exception Exception
	 */
	@Override
	public BuyerLimitVO selectBuyerSalesBillingLimit(Map<String, Object> params) throws Exception {
		return salesBillingDAO.selectBuyerSalesBillingLimit(params);
	}

}
