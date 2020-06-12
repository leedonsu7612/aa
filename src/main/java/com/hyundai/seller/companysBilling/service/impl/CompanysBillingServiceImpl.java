package com.hyundai.seller.companysBilling.service.impl;

import java.util.List;


import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.admin.member.service.CdfMemberService;
import com.hyundai.seller.companysBilling.service.CompanysBillingService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : CompanysBillingServiceImpl.java
 * @Description : seller CompanysBilling Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.30   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.30
 * @version 1.0
 *
 */

@Service("sellerCompanysBillingService")
public class CompanysBillingServiceImpl extends EgovAbstractServiceImpl implements CompanysBillingService {

	private static final Logger LOGGER = LoggerFactory.getLogger(CompanysBillingServiceImpl.class);

	@Resource(name = "sellerCompanysBillingMapper")
	private CompanysBillingMapper companysBillingDAO;

	/** CdfMemberService */
	@Resource(name = "memberService")
	private CdfMemberService memberService;

	/**
	 * 품목점 지급현황을 조회한다.
	 * @param params
	 * @return 품목점 지급현황 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectSellerCompanysBillingList(Map<String, Object> params) throws Exception {
		return companysBillingDAO.selectSellerCompanysBillingList(params);
	}

}
