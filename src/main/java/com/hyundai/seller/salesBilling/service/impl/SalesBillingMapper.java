package com.hyundai.seller.salesBilling.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hyundai.buyer.salesBilling.service.BuyerLimitVO;
import com.hyundai.seller.salesBilling.service.DfrdAcntsRcvbleVO;
import com.hyundai.seller.salesBilling.service.SalesBillingVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * SellerSalesBillingMapper에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.12.1
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *   수정일              수정자          수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.12.1          CDF Team        최초 생성
 *
 * </pre>
 */

@Repository("sellerSalesBillingMapper")
public class SalesBillingMapper extends EgovAbstractMapper {

	/**
	 * 대리점 지급내역 상세를 조회한다.
	 * @param params
	 * @return 대리점 지급내역 상세 목록
	 * @exception Exception
	 */
	public List<SalesBillingVO> selectSellerSalesBillingList(Map<String, Object> params){
		return selectList("selectSellerSalesBillingList", params);
	}

	/**
	 * 기간별 대리점 지급내역 상세를 조회한다.
	 * @param params
	 * @return 기간별 대리점 지급내역 상세 목록
	 * @exception Exception
	 */
	public List<?> selectSellerSalesBillingInTheMonthList(DfrdAcntsRcvbleVO vo){
		return selectList("selectSellerSalesBillingInTheMonthList", vo);
	}

	/**
	 * 대리점 한도를 조회한다.
	 * @param params
	 * @return 대리점 한도
	 * @exception Exception
	 */
	public BuyerLimitVO selectSellerSalesBillingLimit(Map<String, Object> params) throws Exception {
		return selectOne("selectSellerSalesBillingLimit", params);
	}

}
