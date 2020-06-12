package com.hyundai.buyer.taxBill.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.buyer.companysBilling.service.impl.CompanysBillingServiceImpl;
import com.hyundai.buyer.taxBill.service.TaxBillService;
import com.hyundai.buyer.taxBill.service.TaxBillVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : TaxBillServiceImpl.java
 * @Description : Buyer TaxBill Business Implement Class
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

@Service("buyerTaxBillService")
public class TaxBillServiceImpl extends EgovAbstractServiceImpl implements TaxBillService {

	private static final Logger LOGGER = LoggerFactory.getLogger(CompanysBillingServiceImpl.class);

	@Resource(name = "buyerTaxBillMapper")
	private TaxBillMapper buyerTaxBillDAO;

	/**
	 * 대리점 세금계산서 목록을 조회한다.
	 * @param params
	 * @return 대리점 세금계산서 목록
	 * @exception Exception
	 */
	@Override
	public List<TaxBillVO> selectBuyerTaxBillList(Map<String, Object> params) throws Exception {
		return buyerTaxBillDAO.selectBuyerTaxBillList(params);
	}

	/**
	 * 대리점 세금계산서 총 갯수을 조회한다.
	 * @param params
	 * @return 대리점 세금계산서 총 갯수
	 * @exception Exception
	 */
	@Override
	public int selectBuyerTaxBillListCnt(Map<String, Object> params) throws Exception {
		return buyerTaxBillDAO.selectBuyerTaxBillListCnt(params);
	}

	/**
	 * 대리점 세금계산서를 조회한다.
	 * @param params
	 * @return 대리점 세금계산서
	 * @exception Exception
	 */
	public TaxBillVO selectBuyerTaxBill(Map<String, Object> params) throws Exception {
		return buyerTaxBillDAO.selectBuyerTaxBill(params);
	}

}
