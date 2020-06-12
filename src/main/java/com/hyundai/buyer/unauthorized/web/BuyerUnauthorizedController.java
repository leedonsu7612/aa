package com.hyundai.buyer.unauthorized.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.hyundai.admin.member.service.CdfMemberService;
import com.hyundai.admin.member.service.MemberVO;
import com.hyundai.buyer.unauthorized.service.UnauthorizedService;
import com.hyundai.buyer.unauthorized.service.UnauthorizedVO;
import com.hyundai.cmmn.service.DefaultVO;
import com.hyundai.cmmn.service.LoginVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * @Class Name : UnauthorizedController.java
 * @Description : Buyer UnauthorizedController Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.21   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.21
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class BuyerUnauthorizedController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** buyerUnauthorizedService */
	@Resource(name = "buyerUnauthorizedService")
	private UnauthorizedService unauthorizedService;

	/** CdfMemberService */
	@Resource(name = "memberService")
	private CdfMemberService memberService;

	/**
	 * 대리점 기타지급 승인 목록을 조회한다.
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/buyer/unauthorized/list.do")
	public String selectBuyerUnauthorizedList(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
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
		String searchDate = (String) params.get("searchDate");
		DateFormat dateFormat = new SimpleDateFormat("yyyy.MM");
		Calendar calendar = Calendar.getInstance();

		if (searchDate == null || "".equals(searchDate)) {
			searchDate = dateFormat.format(calendar.getTime());
			params.put("searchDate", searchDate);
		}

		/** Paging setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		DefaultVO defaultVO = new DefaultVO();
		String pageIndex = (String) params.get("pageIndex");
		int currentPageNo = (pageIndex != null && !"".equals(pageIndex)) ? Integer.parseInt(pageIndex) : 1;
		paginationInfo.setCurrentPageNo(currentPageNo);
		paginationInfo.setRecordCountPerPage(defaultVO.getPageUnit());
		paginationInfo.setPageSize(defaultVO.getPageSize());
		params.put("firstRecordIndex", paginationInfo.getFirstRecordIndex());
		params.put("lastRecordIndex", paginationInfo.getLastRecordIndex());
		params.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());
		params.put("pageUnit", propertiesService.getInt("pageUnit"));
		params.put("pageSize", propertiesService.getInt("pageSize"));

		// 품목점 정보
		String sellerBizNo = (String) params.get("targetBizNo");
		params.put("sellerBizNo", sellerBizNo);

		// 대리점 기타지급 승인 총 갯수 조회
		int totCnt = unauthorizedService.selectBuyerUnauthorizedListCnt(params);
		paginationInfo.setTotalRecordCount(totCnt);

		// 대리점 기타지급 승인 목록 조회
		List<UnauthorizedVO> list = totCnt > 0 ? unauthorizedService.selectBuyerUnauthorizedList(params) : new ArrayList<UnauthorizedVO>();

		// 검색어
		if(sellerBizNo != null && !"".equals(sellerBizNo)) {
			params.put("sellerBizNo", sellerBizNo);
			String searchKeyword = null;

			if(list.size() > 0){
				searchKeyword = list.get(0).getSellerCompanyName();
			} else{
				MemberVO seller = new MemberVO();
				seller.setBusinessNo(sellerBizNo);
				seller = memberService.selectMember(seller);
				searchKeyword = seller.getCompanyName();
			}

			params.put("searchKeyword", searchKeyword);
		}

		model.addAttribute("menuId", "0401_01");
		model.addAttribute("user", user);
		model.addAttribute("params", params);
		model.addAttribute("list", list);
		model.addAttribute("paginationInfo", paginationInfo);

		return "buyer/unauthorizedList";
	}

	/**
	 * 대리점 기타지급을 승인한다.
	 * @param unauthorizedVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/buyer/unauthorized/insert.json")
	@ResponseBody
	public Map<String, String> insertBuyerUnauthorized(@ModelAttribute UnauthorizedVO unauthorizedVO) throws Exception {
		Map<String, String> resultMap = new HashMap<>();

		String taxbillNo = unauthorizedVO.getTaxbillNo();
		String transactionNo = unauthorizedVO.getTransactionNo();

		if(taxbillNo != null || transactionNo != null) {
			int result = unauthorizedService.updateBuyerUnauthorized(unauthorizedVO);

			if(result > 0) {
				// TODO - 기타수금처리 : 세금계산서 금액 중 기타수금 금액을 기록하여 매출채권 발행 불가하도록 처리
				// TODO - 결제내역조회 목록 업데이트

				resultMap.put("resultMessage", "Success");
			}
		}

		return resultMap;
	}

	/**
	 * 대리점 기타지급을 취소한다.
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/buyer/unauthorized/delete.json")
	@ResponseBody
	public Map<String, String> deleteBuyerUnauthorized(@ModelAttribute UnauthorizedVO unauthorizedVO) throws Exception {
		Map<String, String> resultMap = new HashMap<>();

		String taxbillNo = unauthorizedVO.getTaxbillNo();
		String transactionNo = unauthorizedVO.getTransactionNo();

		if(taxbillNo != null || transactionNo != null) {
			int result = unauthorizedService.updateBuyerUnauthorized(unauthorizedVO);

			if(result > 0) {
				// TODO - 결제내역조회 목록 업데이트

				resultMap.put("resultMessage", "Success");
			}
		}

		return resultMap;
	}

}
