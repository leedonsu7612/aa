package com.hyundai.buyer.companysBilling.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hyundai.buyer.companysBilling.service.CompanysBillingVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * BuyerCompanysBilling에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.11.15
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *   수정일              수정자          수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.11.15          CDF Team        최초 생성
 *
 * </pre>
 */

@Repository("buyerCompanysBillingMapper")
public class CompanysBillingMapper extends EgovAbstractMapper {

	/**
	 * 대리점 지급현황을 조회한다.
	 * @param params
	 * @return 대리점 지급현황 목록
	 * @exception Exception
	 */
	public List<CompanysBillingVO> selectBuyerCompanysBillingList(Map<String, Object> params) throws Exception {
		return selectList("selectBuyerCompanysBillingList", params);
	}

}
