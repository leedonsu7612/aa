package com.hyundai.buyer.taxBill.web;

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
import com.hyundai.buyer.taxBill.service.TaxBillService;
import com.hyundai.buyer.taxBill.service.TaxBillVO;
import com.hyundai.cmmn.service.DefaultVO;
import com.hyundai.cmmn.service.LoginVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * @Class Name : TaxBillController.java
 * @Description : Buyer TaxBillController Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.28   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.28
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class BuyerTaxBillController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** buyerTaxBillService */
	@Resource(name = "buyerTaxBillService")
	private TaxBillService taxBillService;

	/** CdfMemberService */
	@Resource(name = "memberService")
	private CdfMemberService memberService;

	/**
	 * 대리점 세금계산서 승인 목록을 조회한다.
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/buyer/taxBill/list.do")
	public String selectBuyerTaxBillList(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
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
		String startDate = (String) params.get("startDate");
		String endDate = (String) params.get("endDate");
		DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		Calendar calendar = Calendar.getInstance();

		if (startDate == null || "".equals(startDate) || endDate == null || "".equals(endDate)) {
			params.put("endDate", dateFormat.format(calendar.getTime()));
			calendar.add(Calendar.MONTH, -6);
			params.put("startDate", dateFormat.format(calendar.getTime()));
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
		int totCnt = taxBillService.selectBuyerTaxBillListCnt(params);
		paginationInfo.setTotalRecordCount(totCnt);

		// 대리점 세금계산서 승인 목록 조회
		List<TaxBillVO> list = totCnt > 0 ? taxBillService.selectBuyerTaxBillList(params) : new ArrayList<TaxBillVO>();

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
		model.addAttribute("menuId", "0701_01");
		model.addAttribute("params", params);
		model.addAttribute("list", list);
		model.addAttribute("paginationInfo", paginationInfo);

		return "buyer/taxBillList";
	}

}
