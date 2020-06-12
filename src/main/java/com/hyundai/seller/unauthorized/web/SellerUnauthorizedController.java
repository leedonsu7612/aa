package com.hyundai.seller.unauthorized.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.Random;

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
import com.hyundai.cmmn.service.LoginVO;
import com.hyundai.seller.unauthorized.service.UnauthorizedService;
import com.hyundai.seller.unauthorized.service.UnauthorizedVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * @Class Name : SellerUnauthorizedController.java
 * @Description : seller UnauthorizedController Class
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
public class SellerUnauthorizedController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** sellerUnauthorizedService */
	@Resource(name = "sellerUnauthorizedService")
	private UnauthorizedService unauthorizedService;

	/** CdfMemberService */
	@Resource(name = "memberService")
	private CdfMemberService memberService;

	@RequestMapping("/seller/unauthorized/list.do")
	public String selectSellerUnauthorizedList(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
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
		DateFormat dateFormat = new SimpleDateFormat("yyyy.MM");
		Calendar calendar = Calendar.getInstance();

		if (searchDate == null || "".equals(searchDate)) {
			searchDate = dateFormat.format(calendar.getTime());
			params.put("searchDate", searchDate);
		}

		/** Paging setting */
		params.put("pageUnit", propertiesService.getInt("pageUnit"));
		params.put("pageSize", propertiesService.getInt("pageSize"));

		String pageIndex = (String) params.get("pageIndex");
		int currentPageNo = (pageIndex != null && !"".equals(pageIndex)) ? Integer.parseInt(pageIndex) : 1;
		int recordCountPerPage = (int) params.get("pageUnit");
		int pageSize = (int) params.get("pageSize");

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(currentPageNo);
		paginationInfo.setRecordCountPerPage(recordCountPerPage);
		paginationInfo.setPageSize(pageSize);

		params.put("firstRecordIndex", paginationInfo.getFirstRecordIndex());
		params.put("lastRecordIndex", paginationInfo.getLastRecordIndex());
		params.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());

		// 대리점 정보 조회
		String buyerBizNo = (String) params.get("targetBizNo");
		params.put("buyerBizNo", buyerBizNo);

		// 품목점 기타지급 요청 총 갯수 조회
		int totCnt = unauthorizedService.selectSellerUnauthorizedListCnt(params);
		paginationInfo.setTotalRecordCount(totCnt);

		// 품목점 기타지급 요청 목록 조회
		List<UnauthorizedVO> list = totCnt > 0 ? unauthorizedService.selectSellerUnauthorizedList(params) : new ArrayList<UnauthorizedVO>();

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

		model.addAttribute("user", user);
		model.addAttribute("menuId", "0502_01");
		model.addAttribute("params", params);
		model.addAttribute("list", list);
		model.addAttribute("paginationInfo", paginationInfo);

		return "seller/unauthorizedList";
	}


	@RequestMapping("/seller/unauthorized/request.do")
	@ResponseBody
	public String insertSellerUnauthorized(@ModelAttribute UnauthorizedVO unauthorizedVO) throws Exception {
		// TODO : delete - 임시 거래번호 & 세금계산서번호 생성
		Random generator = new Random();
		long num = generator.nextLong();
		num = num < 0 ? num * -1 : num;
		unauthorizedVO.setTransactionNo("C" + num);
		long num2 = generator.nextLong();
		num2 = num2 < 0 ? num2 * -1 : num2;
		unauthorizedVO.setTaxbillNo("T" + num2);

		// 기타수금 테이블에 삽입
		int result1 = unauthorizedService.insertSellerUnauthorized(unauthorizedVO);

		// 월매출 관리 테이블 업데이트
		if(result1 > 0) {
			unauthorizedService.updateSellerUnauthorized(unauthorizedVO);
		}

		return "Success";
	}

}
