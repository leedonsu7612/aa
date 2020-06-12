package com.hyundai.seller.taxBill.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.hyundai.admin.member.service.CdfMemberService;
import com.hyundai.admin.member.service.MemberVO;
import com.hyundai.cmmn.service.LoginVO;
import com.hyundai.seller.taxBill.service.TaxBillService;
import com.hyundai.seller.taxBill.service.TaxBillStatusVO;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @Class Name : SellerTaxBillController.java
 * @Description : seller SellerTaxBillController Class
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
public class SellerTaxBillController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** sellerTaxBillService */
	@Resource(name = "sellerTaxBillService")
	private TaxBillService taxBillService;

	/** CdfMemberService */
	@Resource(name = "memberService")
	private CdfMemberService memberService;

	/**
	 * 품목점 세금계산서 발행 목록을 조회한다.
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/seller/taxBill/list.do")
	public String selectSellerTaxBillList(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
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
		String startDate = (String) params.get("startDate");
		String endDate = (String) params.get("endDate");
		DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		Calendar calendar = Calendar.getInstance();

		if (startDate == null || "".equals(startDate) || endDate == null || "".equals(endDate)) {
			params.put("endDate", dateFormat.format(calendar.getTime()));
			calendar.set(Calendar.DATE, 1);
			params.put("startDate", dateFormat.format(calendar.getTime()));
		}

		// 대리점 정보 조회
		String buyerBizNo = (String) params.get("targetBizNo");
		params.put("buyerBizNo", buyerBizNo);

		// 세금계산서 발행 목록 조회
		List<TaxBillStatusVO> list = taxBillService.selectSellerTaxBillList(params);

		// 검색어
		if(buyerBizNo != null && !"".equals(buyerBizNo)) {
			String searchKeyword = null;

			if(list.size() > 0){
				searchKeyword = list.get(0).getBuyerCompanyName();
			} else{
				MemberVO seller = new MemberVO();
				seller.setBusinessNo(buyerBizNo);
				seller = memberService.selectMember(seller);
				searchKeyword = seller.getCompanyName();
			}

			params.put("searchKeyword", searchKeyword);
		}

		model.addAttribute("user", user);
		model.addAttribute("menuId", "0602_01");
		model.addAttribute("params", params);
		model.addAttribute("list", list);

		return "seller/taxBillList";
	}

	/**
	 * 품목점 세금계산서 진행 목록을 조회한다.
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/seller/taxBill/statusList.do")
	public String selectSellerTaxBillStatusList(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
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
		String startDate = (String) params.get("startDate");
		String endDate = (String) params.get("endDate");
		DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		Calendar calendar = Calendar.getInstance();

		if (startDate == null || "".equals(startDate) || endDate == null || "".equals(endDate)) {
			params.put("endDate", dateFormat.format(calendar.getTime()));
			calendar.set(Calendar.DATE, 1);
			params.put("startDate", dateFormat.format(calendar.getTime()));
		}

		// 대리점 정보 조회
		String buyerBizNo = (String) params.get("targetBizNo");
		params.put("buyerBizNo", buyerBizNo);

		// 세금계산서 진행 목록 조회
		List<TaxBillStatusVO> list = new ArrayList<TaxBillStatusVO>();
		long totSum = 0;
		int totCnt = taxBillService.selectSellerTaxBillStatusListCnt(params);

		if(totCnt > 0) {
			totSum = taxBillService.selectSellerTaxBillStatusListSum(params);
			list = taxBillService.selectSellerTaxBillStatusList(params);
		}

		// 검색어
		if(buyerBizNo != null && !"".equals(buyerBizNo)) {
			String searchKeyword = null;

			if(list.size() > 0){
				searchKeyword = list.get(0).getBuyerCompanyName();
			} else{
				MemberVO seller = new MemberVO();
				seller.setBusinessNo(buyerBizNo);
				seller = memberService.selectMember(seller);
				searchKeyword = seller.getCompanyName();
			}

			params.put("searchKeyword", searchKeyword);
		}

		model.addAttribute("user", user);
		model.addAttribute("menuId", "0603_01");
		model.addAttribute("params", params);
		model.addAttribute("list", list);
		model.addAttribute("totCnt", totCnt);
		model.addAttribute("totSum", totSum);

		return "seller/taxBillStatusList";
	}

}
