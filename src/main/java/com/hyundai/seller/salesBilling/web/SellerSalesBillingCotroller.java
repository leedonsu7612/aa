package com.hyundai.seller.salesBilling.web;

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
import com.hyundai.buyer.salesBilling.service.BuyerLimitVO;
import com.hyundai.cmmn.service.LoginVO;
import com.hyundai.seller.salesBilling.service.DfrdAcntsRcvbleVO;
import com.hyundai.seller.salesBilling.service.SalesBillingService;
import com.hyundai.seller.salesBilling.service.SalesBillingVO;


/**
 * @Class Name : SellerSalesBillingCotroller.java
 * @Description : seller SellerSalesBillingCotroller Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.12.1   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.12.1
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class SellerSalesBillingCotroller {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/** SalesBillingService */
	@Resource(name = "sellerSalesBillingService")
	private SalesBillingService salesBillingService;

	/** CdfMemberService */
	@Resource(name = "memberService")
	private CdfMemberService memberService;

	/**
	 * 대리점 지급내역 상세 목록을 조회한다.
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/seller/salesBilling/list.do")
	public String selectSellerSalesBillingList(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
		// 로그인 정보
		if (RequestContextHolder.getRequestAttributes() == null) {
			return "redirect:/login.do";
		}

		LoginVO user = (LoginVO) RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);

		if (user == null || !user.getMembClass().equalsIgnoreCase("S")) {
			return "redirect:/login.do";
		}

		params.put("sellerBizNo", user.getBusinessNo());

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

		// 품목점 한도조회
		BuyerLimitVO sellerLimit = salesBillingService.selectSellerSalesBillingLimit(params);

		// 대리점 정보
		String buyerBizNo = (String) params.get("targetBizNo");
		params.put("buyerBizNo", buyerBizNo);

		// 품목점 거래내역 목록을 담을 변수
		List<SalesBillingVO> list = new ArrayList<>();

		if (buyerBizNo != null && !"".equals(buyerBizNo)) {
			MemberVO seller = new MemberVO();
			seller.setBusinessNo(buyerBizNo);
			seller = memberService.selectMember(seller);
			params.put("searchKeyword", seller.getCompanyName());

			// 품목점 거래내역 조회
			list = salesBillingService.selectSellerSalesBillingList(params);
		}

		model.addAttribute("menuId", "0302_01");
		model.addAttribute("user", user);
		model.addAttribute("params", params);
		model.addAttribute("limit", sellerLimit);
		model.addAttribute("list", list);

		return "seller/salesBillingList";
	}

	/**
	 * 품목점 목록을 조회한다.
	 * @param officesItemVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/seller/salesBilling/list.json", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public List<?> selectSellerSalesBillingListJson(@ModelAttribute("sellerDfrdAcntsRcvbleVO") DfrdAcntsRcvbleVO sellerDfrdAcntsRcvbleVO) throws Exception {
		// 기간별 결제내역 조회
		String groupType = sellerDfrdAcntsRcvbleVO.getGroupType();
		if ("0".equals(groupType)) { // 현대
			sellerDfrdAcntsRcvbleVO.setGroupType("H");
		} else if ("1".equals(groupType)) {
			sellerDfrdAcntsRcvbleVO.setGroupType("K");
		} else {
			sellerDfrdAcntsRcvbleVO.setGroupType("");
		}

		List<?> list = salesBillingService.selectSellerSalesBillingInTheMonthList(sellerDfrdAcntsRcvbleVO);

		return list;
	}
}
