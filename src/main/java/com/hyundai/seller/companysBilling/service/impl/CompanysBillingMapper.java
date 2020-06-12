package com.hyundai.seller.companysBilling.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
/**
 * sellerCompanysBilling에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.11.30
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *   수정일              수정자          수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.11.30          CDF Team        최초 생성
 *
 * </pre>
 */

@Repository("sellerCompanysBillingMapper")
public class CompanysBillingMapper extends EgovAbstractMapper {

	public List<?> selectSellerCompanysBillingList(Map<String, Object> params) {
		return selectList("selectSellerCompanysBillingList", params);
	}

}
