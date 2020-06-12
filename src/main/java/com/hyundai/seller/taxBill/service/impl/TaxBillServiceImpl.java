package com.hyundai.seller.taxBill.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.seller.taxBill.service.TaxBillService;
import com.hyundai.seller.taxBill.service.TaxBillStatusVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : SellerTaxBillServiceImpl.java
 * @Description : seller TaxBill Business Implement Class
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

@Service("sellerTaxBillService")
public class TaxBillServiceImpl extends EgovAbstractServiceImpl implements TaxBillService {

	private static final Logger LOGGER = LoggerFactory.getLogger(TaxBillServiceImpl.class);

	@Resource(name = "sellerTaxBillMapper")
	private TaxBillMapper sellerTaxBillDAO;

	/**
	 * 대리점 세금계산서 목록을 조회한다.
	 * @param params
	 * @return 대리점 세금계산서 목록
	 * @exception Exception
	 */
	@Override
	public List<TaxBillStatusVO> selectSellerTaxBillList(Map<String, Object> params) throws Exception {
		return sellerTaxBillDAO.selectSellerTaxBillList(params);
	}

	@Override
	public List<TaxBillStatusVO> selectSellerTaxBillStatusList(Map<String, Object> params) throws Exception {
		return sellerTaxBillDAO.selectSellerTaxBillStatusList(params);
	}

	@Override
	public int selectSellerTaxBillStatusListCnt(Map<String, Object> params) throws Exception {
		return sellerTaxBillDAO.selectSellerTaxBillStatusListCnt(params);
	}

	@Override
	public long selectSellerTaxBillStatusListSum(Map<String, Object> params) throws Exception {
		return sellerTaxBillDAO.selectSellerTaxBillStatusListSum(params);
	}

}
