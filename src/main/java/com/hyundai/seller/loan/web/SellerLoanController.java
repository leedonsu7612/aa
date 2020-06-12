package com.hyundai.seller.loan.web;

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
import com.hyundai.cmmn.service.DefaultVO;
import com.hyundai.cmmn.service.LoginVO;
import com.hyundai.seller.loan.service.LoanService;
import com.hyundai.seller.loan.service.LoanVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * @Class Name : SellerLoanController.java
 * @Description : seller SellerLoanController Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.12.5   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.12.5
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class SellerLoanController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** sellerLoanService */
	@Resource(name = "sellerLoanService")
	private LoanService sellerLoanService;

	/** CdfMemberService */
	@Resource(name = "memberService")
	private CdfMemberService memberService;

	/**
	 * 대출 가능 채권 목록을 조회한다.
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/seller/loan/list.do")
	public String selectSellerLoanList(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
		// 로그인 정보
		if (RequestContextHolder.getRequestAttributes() == null) {
			return "redirect:/login.do";
		}

		LoginVO user = (LoginVO) RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);

		if (user == null || !user.getMembClass().equalsIgnoreCase("S")) {
			return "redirect:/login.do";
		}

		params.put("sellerBizNo", user.getBusinessNo());

		// 검색타입
		String searchType = (String) params.get("searchType");

		if (searchType == null || "".equals(searchType)) {
			searchType = "0";
			params.put("searchType", searchType);
		}

		// 날짜 정보
		String endDate = (String) params.get("endDate");
		String startDate = (String) params.get("startDate");

		if (startDate == null || "".equals(startDate) || endDate == null || "".equals(endDate)) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy.MM");
			Calendar calendar = Calendar.getInstance();
			params.put("endDate", dateFormat.format(calendar.getTime()));
			calendar.add(Calendar.MONTH, -1);
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

		// 대리점 정보 조회
		String buyerBizNo = (String) params.get("targetBizNo");
		params.put("buyerBizNo", buyerBizNo);

		// 대출 가능 채권 내역 총 갯수 조회
		int totCnt = sellerLoanService.selectSellerLoanListCnt(params);
		paginationInfo.setTotalRecordCount(totCnt);

		// 대출 가능 채권 내역  목록 조회
		List<LoanVO> list = totCnt > 0 ? sellerLoanService.selectSellerLoanList(params) : new ArrayList<LoanVO>();

		// 검색어
		if (buyerBizNo != null && !"".equals(buyerBizNo)) {
			String searchKeyword = null;

			if (list.size() > 0) {
				searchKeyword = list.get(0).getCompanyName();
			} else {
				MemberVO seller = new MemberVO();
				seller.setBusinessNo(buyerBizNo);
				seller = memberService.selectMember(seller);
				searchKeyword = seller.getCompanyName();
			}

			params.put("searchKeyword", searchKeyword);
		}

		model.addAttribute("user", user);
		model.addAttribute("menuId", "0702_01");
		model.addAttribute("params", params);
		model.addAttribute("list", list);
		model.addAttribute("totCnt", totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "seller/loanList";
	}
}
