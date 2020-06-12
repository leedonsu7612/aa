package com.hyundai.buyer.salesBilling.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.hyundai.admin.member.service.CdfMemberService;
import com.hyundai.admin.member.service.MemberVO;
import com.hyundai.buyer.accountReceivable.service.AccountReceivableService;
import com.hyundai.buyer.salesBilling.service.BuyerLimitVO;
import com.hyundai.buyer.salesBilling.service.DfrdAcntsRcvbleVO;
import com.hyundai.buyer.salesBilling.service.SalesBillingService;
import com.hyundai.buyer.salesBilling.service.SalesBillingVO;
import com.hyundai.cmmn.service.LoginVO;

/**
 * @Class Name : SalesBillingCotroller.java
 * @Description : Buyer SalesBillingCotroller Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.19   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.19
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class BuyerSalesBillingCotroller {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/** SalesBillingService */
	@Resource(name = "buyerSalesBillingService")
	private SalesBillingService salesBillingService;

	/** CdfMemberService */
	@Resource(name = "memberService")
	private CdfMemberService memberService;

	/** buyerAccountReceivableService */
	@Resource(name = "buyerAccountReceivableService")
	private AccountReceivableService buyerAccountReceivableService;

	/**
	 * 대리점 지급내역 상세 목록을 조회한다.
	 * @param companysBillingVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/buyer/salesBilling/list.do")
	public String selectBuyerSalesBillingList(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
		// 로그인 정보
		if (RequestContextHolder.getRequestAttributes() == null) {
			return "redirect:/login.do";
		}

		LoginVO user = (LoginVO) RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);

		if (user == null || !user.getMembClass().equalsIgnoreCase("B")) {
			return "redirect:/login.do";
		}

		params.put("buyerBizNo", user.getBusinessNo());

		// 날짜 정보
		String endDate = (String) params.get("endDate");
		String startDate = (String) params.get("startDate");

		if (startDate == null || "".equals(startDate) || endDate == null || "".equals(endDate)) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy.MM");
			Calendar calendar = Calendar.getInstance();
			params.put("endDate", dateFormat.format(calendar.getTime()));
			calendar.add(Calendar.MONTH, -6);
			params.put("startDate", dateFormat.format(calendar.getTime()));
		}

		// 그룹 정보
		String groupType = (String) params.get("groupType");

		if ("0".equals(groupType)) { // 현대
			params.put("groupCode", "_h");
		} else if ("1".equals(groupType)) {
			params.put("groupCode", "_k");
		} else {
			params.put("groupCode", "");
		}

		// 대리점 한도조회
		BuyerLimitVO buyerLimit = salesBillingService.selectBuyerSalesBillingLimit(params);

		// 품목점 정보
		String sellerBizNo = (String) params.get("targetBizNo");
		params.put("sellerBizNo", sellerBizNo);

		// 대리점 거래내역 목록을 담을 변수
		List<SalesBillingVO> list = new ArrayList<>();

		if (sellerBizNo != null && !"".equals(sellerBizNo)) {
			MemberVO seller = new MemberVO();
			seller.setBusinessNo(sellerBizNo);
			seller = memberService.selectMember(seller);
			params.put("searchKeyword", seller.getCompanyName());

			// 대리점 거래내역 조회
			list = salesBillingService.selectBuyerSalesBillingList(params);
		}

		model.addAttribute("menuId", "0301_01");
		model.addAttribute("user", user);
		model.addAttribute("params", params);
		model.addAttribute("limit", buyerLimit);
		model.addAttribute("list", list);

		return "buyer/salesBillingList";
	}

	/**
	 * 기간별 결제내역을 조회한다.
	 * @param dfrdAcntsRcvbleVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buyer/salesBilling/list.json", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public List<?> selectBuyerSalesBillingListJson(@ModelAttribute("dfrdAcntsRcvbleVO") DfrdAcntsRcvbleVO dfrdAcntsRcvbleVO) throws Exception {
		// 기간별 결제내역 조회
		String groupType = dfrdAcntsRcvbleVO.getGroupType();
		if ("0".equals(groupType)) { // 현대
			dfrdAcntsRcvbleVO.setGroupType("H");
		} else if ("1".equals(groupType)) {
			dfrdAcntsRcvbleVO.setGroupType("K");
		} else {
			dfrdAcntsRcvbleVO.setGroupType("");
		}

		List<?> list = salesBillingService.selectBuyerSalesBillingInTheMonthList(dfrdAcntsRcvbleVO);

		return list;
	}

}
