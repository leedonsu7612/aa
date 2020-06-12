package com.hyundai.buyer.salesBilling.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hyundai.buyer.accountReceivable.service.ReceivableChangeVO;
import com.hyundai.buyer.salesBilling.service.BuyerLimitVO;
import com.hyundai.buyer.salesBilling.service.DfrdAcntsRcvbleVO;
import com.hyundai.buyer.salesBilling.service.SalesBillingVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * BuyerSalesBilling에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.11.19
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *   수정일              수정자          수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.11.19          CDF Team        최초 생성
 *
 * </pre>
 */

@Repository("buyerSalesBillingMapper")
public class SalesBillingMapper extends EgovAbstractMapper {

	/**
	 * 대리점 지급내역 상세를 조회한다.
	 * @param params
	 * @return 대리점 지급내역 상세 목록
	 * @exception Exception
	 */
	public List<SalesBillingVO> selectBuyerSalesBillingList(Map<String, Object> params){
		return selectList("selectBuyerSalesBillingList", params);
	}

	/**
	 * 기간별 대리점 지급내역 상세를 조회한다.
	 * @param params
	 * @return 기간별 대리점 지급내역 상세 목록
	 * @exception Exception
	 */
	public List<?> selectBuyerSalesBillingInTheMonthList(DfrdAcntsRcvbleVO vo){
		return selectList("selectBuyerSalesBillingInTheMonthList", vo);
	}

	/**
	 * 대리점 한도를 조회한다.
	 * @param params
	 * @return 대리점 한도
	 * @exception Exception
	 */
	public BuyerLimitVO selectBuyerSalesBillingLimit(Map<String, Object> params) throws Exception {
		return selectOne("selectBuyerSalesBillingLimit", params);
	}

}
