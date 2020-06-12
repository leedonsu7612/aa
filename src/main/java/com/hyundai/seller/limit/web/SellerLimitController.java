package com.hyundai.seller.limit.web;

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
import com.hyundai.buyer.salesBilling.service.BuyerLimitVO;
import com.hyundai.cmmn.service.DefaultVO;
import com.hyundai.cmmn.service.LoginVO;
import com.hyundai.seller.limit.service.LimitService;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * @Class Name : SellerLimitController.java
 * @Description : seller SellerLimitController Class
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
public class SellerLimitController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/** CompanysBillingService */
	@Resource(name = "sellerLimitService")
	private LimitService sellerLimitService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** CdfMemberService */
	@Resource(name = "memberService")
	private CdfMemberService memberService;

	/**
	 * 품목점 거래처 한도을 조회한다.
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/seller/limit/list.do")
	public String selectSellerLimitList(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
		// 로그인 정보
		if (RequestContextHolder.getRequestAttributes() == null) {
			return "redirect:/login.do";
		}

		LoginVO user = (LoginVO) RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);

		if (user == null || !user.getMembClass().equalsIgnoreCase("S")) { //품목점
			return "redirect:/login.do";
		}

		params.put("sellerBizNo", user.getBusinessNo());

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

		// 대리점 정보 조회
		String buyerBizNo = (String) params.get("targetBizNo");
		params.put("buyerBizNo", buyerBizNo);

		int totCnt = sellerLimitService.selectSellerLimitListCnt(params);
		paginationInfo.setTotalRecordCount(totCnt);

		// 거래처한도 목록 조회
		List<BuyerLimitVO> list = totCnt > 0 ? sellerLimitService.selectSellerLimitList(params) : new ArrayList<BuyerLimitVO>();

		// 검색어
		if(buyerBizNo != null && !"".equals(buyerBizNo)) {
			params.put("buyerBizNo", buyerBizNo);
			String searchKeyword = null;

			if(list.size() > 0){
				searchKeyword = list.get(0).getCompanyName();
			} else{
				MemberVO seller = new MemberVO();
				seller.setBusinessNo(buyerBizNo);
				seller = memberService.selectMember(seller);
				searchKeyword = seller.getCompanyName();
			}

			params.put("searchKeyword", searchKeyword);
		}
		model.addAttribute("menuId", "0802_01");
		model.addAttribute("user", user);
		model.addAttribute("params", params);
		model.addAttribute("list", list);
		model.addAttribute("totCnt", totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "seller/limitList";
	}

}
