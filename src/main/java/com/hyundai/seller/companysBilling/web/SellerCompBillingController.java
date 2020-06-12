package com.hyundai.seller.companysBilling.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.hyundai.cmmn.service.LoginVO;
import com.hyundai.seller.changeOrApprove.service.ChangeOrApproveService;
import com.hyundai.seller.companysBilling.service.CompanysBillingService;


/**
 * @Class Name : CompanysBillingController.java
 * @Description : seller CompanysBillingController Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.30   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.30
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class SellerCompBillingController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/** CompanysBillingService */
	@Resource(name = "sellerCompanysBillingService")
	private CompanysBillingService companysBillingService;

	/** sellerChangeOrApproveService */
	@Resource(name = "sellerChangeOrApproveService")
	private ChangeOrApproveService sellerChangeOrApproveService;

	/**
	 * 품목 수금현황 종합 목록을 조회한다.
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/seller/companysBilling/list.do")
	public String selectSellerCompanysBillingList(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
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
		String searchDate = (String) params.get("searchDate");
		Calendar calendar = Calendar.getInstance();

		if (searchDate == null || "".equals(searchDate)) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy.MM");
			searchDate = dateFormat.format(calendar.getTime());
			params.put("searchDate", searchDate);
		}

		Date date = new SimpleDateFormat("yyyy.MM").parse(searchDate);
		calendar.setTime(date);
		DateFormat dateFormat = new SimpleDateFormat("MM");
		String month3 = dateFormat.format(calendar.getTime());
		calendar.add(Calendar.MONTH, -1);
		String month2 = dateFormat.format(calendar.getTime());
		calendar.add(Calendar.MONTH, -1);
		String month1 = dateFormat.format(calendar.getTime());

		// 그룹 정보
		String groupType = (String) params.get("groupType");

		if ("0".equals(groupType)) { // 현대
			params.put("groupCode", "_h");
		} else if ("1".equals(groupType)) {
			params.put("groupCode", "_k");
		} else {
			params.put("groupCode", "");
		}

		// 수금현황 목록 조회
		List<?> list = companysBillingService.selectSellerCompanysBillingList(params);

		// 오늘 최초 로그인시 부품 B2B론 알림
		int b2bCnt = "Y".equals(user.getIsFirstLogin()) ? sellerChangeOrApproveService.selectSellerChangeOrApproveListCnt(params) : 0;

		model.addAttribute("menuId", "0202_01");
		model.addAttribute("user", user);
		model.addAttribute("params", params);
		model.addAttribute("month1", month1);
		model.addAttribute("month2", month2);
		model.addAttribute("month3", month3);
		model.addAttribute("list", list);
		model.addAttribute("b2bCnt", b2bCnt);

		return "seller/companysBillingList";
	}

}
