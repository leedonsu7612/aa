package com.hyundai.buyer.payment.web;

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
import com.hyundai.buyer.payment.service.PaymentService;
import com.hyundai.buyer.payment.service.PaymentVO;
import com.hyundai.cmmn.service.DefaultVO;
import com.hyundai.cmmn.service.LoginVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * @Class Name : PaymentController.java
 * @Description : Buyer PaymentController Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.26   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.26
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class BuyerPaymentController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** buyerPaymentService */
	@Resource(name = "buyerPaymentService")
	private PaymentService paymentService;

	/** CdfMemberService */
	@Resource(name = "memberService")
	private CdfMemberService memberService;

	/**
	 * 대리점 결제내역 목록을 조회한다.
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/buyer/payment/list.do")
	public String selectBuyerPaymentList(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
		// 로그인 정보
		if (RequestContextHolder.getRequestAttributes() == null) {
			return "redirect:/login.do";
		}

		LoginVO user = (LoginVO) RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);

		if (user == null || !user.getMembClass().equalsIgnoreCase("B")) {
			return "redirect:/login.do";
		}

		params.put("buyerBizNo", user.getBusinessNo());

		// 검색타입
		String searchType = (String) params.get("searchType");

		if(searchType == null || "".equals(searchType)) {
			searchType = "0";
			params.put("searchType", searchType);
		}

		// 날짜 정보
		String startDate = (String) params.get("startDate");
		String endDate = (String) params.get("endDate");
		DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		Calendar calendar = Calendar.getInstance();

		if (startDate == null || "".equals(startDate) || endDate == null || "".equals(endDate)) {
			startDate = dateFormat.format(calendar.getTime());
			params.put("startDate", startDate);
			endDate = startDate;
			params.put("endDate", endDate);
		}

		// 진행상태
		String sendStatus = (String) params.get("sendStatus");

		if(sendStatus == null || "".equals(sendStatus)) {
			sendStatus = "100";
			params.put("sendStatus", sendStatus);
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

		// 품목점 정보
		String sellerBizNo = (String) params.get("targetBizNo");
		params.put("sellerBizNo", sellerBizNo);

		// 대리점 결제내역 총 갯수 조회
		int totCnt = paymentService.selectBuyerPaymentListCnt(params);
		paginationInfo.setTotalRecordCount(totCnt);

		// 대리점 결제내역 목록 조회
		List<PaymentVO> list = totCnt > 0 ? paymentService.selectBuyerPaymentList(params) : new ArrayList<PaymentVO>();

		// 대리점 결제내역 합계 조회
		long summary = totCnt > 0 ? paymentService.selectBuyerPaymentSummary(params) : 0;


		if(sellerBizNo != null && !"".equals(sellerBizNo)) {
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

		model.addAttribute("user", user);
		model.addAttribute("menuId", "0601_01");
		model.addAttribute("params", params);
		model.addAttribute("list", list);
		model.addAttribute("totCnt", totCnt);
		model.addAttribute("summary", summary);
		model.addAttribute("paginationInfo", paginationInfo);

		return "buyer/paymentList";
	}
}
