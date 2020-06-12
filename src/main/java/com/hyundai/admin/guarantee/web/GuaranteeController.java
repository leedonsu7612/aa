package com.hyundai.admin.guarantee.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.hyundai.admin.guarantee.service.ExtraCollectionVO;
import com.hyundai.admin.guarantee.service.GuaranteeService;
import com.hyundai.admin.guarantee.service.GuaranteeVO;
import com.hyundai.admin.guarantee.service.SalesSlipVO;
import com.hyundai.admin.guarantee.service.SetOffInfoVO;
import com.hyundai.admin.guarantee.service.TaxbillVO;
import com.hyundai.admin.guarantee.service.UnissuedVO;
import com.hyundai.admin.member.service.CdfMemberService;
import com.hyundai.admin.member.service.MemberVO;
import com.hyundai.buyer.salesBilling.service.DfrdAcntsRcvbleVO;
import com.hyundai.cmmn.service.LoginVO;
import com.hyundai.cmmn.view.ExcelVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class GuaranteeController {

	/** CdfMemberService */
	@Resource(name = "memberService")
	private CdfMemberService memberService;

	/** CdfMemberService */
	@Resource(name = "guaranteeService")
	private GuaranteeService guaranteeService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/**
	 * 상점 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "checkMemberList"
	 * @exception Exception 3148664737
	 */
	@RequestMapping(value = "/admin/companyList.do")
	public String selectCompanyList(@ModelAttribute("searchVO") MemberVO searchVO, ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() == null) return "redirect:/login.do";
		LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		if(user == null || !"AMNHI".contains(user.getMembClass())) return "redirect:/login.do";
		
		if(searchVO.getMembClass() == null || searchVO.getMembClass().isEmpty()) searchVO.setMembClass("B");

		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getRecordCountPerPage());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> memberList = memberService.selectMemberList(searchVO);
		model.addAttribute("resultList", memberList);

		int totCnt = memberService.selectMemberListTotCnt(searchVO);
		model.addAttribute("totCnt", totCnt);

		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "admin/companyList";
	}

	/**
	 * 보증내역을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 GuaranteeVO
	 * @param model
	 * @return "guaranteeList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/guaranteeList.do")
	public String selectGuaranteeList(@ModelAttribute("searchVO") GuaranteeVO searchVO, ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() == null) return "redirect:/login.do";
		LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		if(user == null || !"AMNHI".contains(user.getMembClass())) return "redirect:/login.do";
		
		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getRecordCountPerPage());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> guaranteeList = guaranteeService.selectGuaranteeList(searchVO);
		model.addAttribute("resultList", guaranteeList);

		int totCnt = guaranteeService.selectGuaranteeListTotCnt(searchVO);
		model.addAttribute("totCnt", totCnt);

		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "admin/guaranteeList";
	}

	/**
	 * 매출채권을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 DfrdAcntsRcvbleVO
	 * @param model
	 * @return "dfrdAcntsRcvbleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/dfrdAcntsRcvbleList.do")
	public String selectDfrdAcntsRcvbleList(@ModelAttribute("searchVO") DfrdAcntsRcvbleVO searchVO, ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() == null) return "redirect:/login.do";
		LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		if(user == null || !"AMNHI".contains(user.getMembClass())) return "redirect:/login.do";
		
		MemberVO vo = new MemberVO();
		if(searchVO.getMembClass().equalsIgnoreCase("B")) vo.setBusinessNo(searchVO.getBuyerBizNo());
		else vo.setBusinessNo(searchVO.getSellerBizNo());
		vo = memberService.selectMember(vo);
		if(searchVO.getMembClass().equalsIgnoreCase("B")) searchVO.setBuyerCoNm(vo.getCompanyName());
		else searchVO.setSellerCoNm(vo.getCompanyName());
		
		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("halfPageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getRecordCountPerPage());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> dfrdAcntsRcvbleList = guaranteeService.selectDfrdAcntsRcvbleList(searchVO);
		model.addAttribute("resultList", dfrdAcntsRcvbleList);

		int totCnt = guaranteeService.selectDfrdAcntsRcvbleListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "admin/dfrdAcntsRcvbleList";
	}

	/**
	 * 기타수금을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 ExtraCollectionVO
	 * @param model
	 * @return "extraCollectionList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/extraCollectionList.do")
	public String selectExtraCollectionList(@ModelAttribute("searchVO") ExtraCollectionVO searchVO, ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() == null) return "redirect:/login.do";
		LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		if(user == null || !"AMNHI".contains(user.getMembClass())) return "redirect:/login.do";
		
		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("halfPageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getRecordCountPerPage());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> extraCollectionList = guaranteeService.selectExtraCollectionList(searchVO);
		model.addAttribute("resultList", extraCollectionList);

		int totCnt = guaranteeService.selectExtraCollectionListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "admin/extraCollectionList";
	}

	/**
	 * 상계수금을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SetOffInfoVO
	 * @param model
	 * @return "setOffInfoList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/setOffInfoList.do")
	public String selectSetOffInfoList(@ModelAttribute("searchVO") SetOffInfoVO searchVO, ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() == null) return "redirect:/login.do";
		LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		if(user == null || !"AMNHI".contains(user.getMembClass())) return "redirect:/login.do";
		
		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("halfPageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getRecordCountPerPage());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> setOffInfoList = guaranteeService.selectSetOffInfoList(searchVO);
		model.addAttribute("resultList", setOffInfoList);

		int totCnt = guaranteeService.selectSetOffInfoListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "admin/setOffInfoList";
	}

	/**
	 * 세금계산서를 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 TaxbillVO
	 * @param model
	 * @return "taxbillList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/taxbillList.do")
	public String selectTaxbillList(@ModelAttribute("searchVO") TaxbillVO searchVO, ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() == null) return "redirect:/login.do";
		LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		if(user == null || !"AMNHI".contains(user.getMembClass())) return "redirect:/login.do";
		
		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("halfPageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getRecordCountPerPage());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> taxbillList = guaranteeService.selectTaxbillList(searchVO);
		model.addAttribute("resultList", taxbillList);

		int totCnt = guaranteeService.selectTaxbillListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "admin/taxbillList";
	}

	/**
	 * 매출전표를 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SalesSlipVO
	 * @param model
	 * @return "salesSlipList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/salesSlipList.do")
	public String selectSalesSlipList(@ModelAttribute("searchVO") SalesSlipVO searchVO, ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() == null) return "redirect:/login.do";
		LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		if(user == null || !"AMNHI".contains(user.getMembClass())) return "redirect:/login.do";
		
		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("halfPageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getRecordCountPerPage());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> salesSlipList = guaranteeService.selectSalesSlipList(searchVO);
		model.addAttribute("resultList", salesSlipList);

		int totCnt = guaranteeService.selectSalesSlipListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "admin/salesSlipList";
	}

	/**
	 * 보증내역 목록을 Excel파일로 만든다.
	 * @param searchVO - 조회할 정보가 담긴 GuaranteeVO
	 * @param model
	 * @return "excelDownloadView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/downloads/guaranteeList.do")
	public String SelectGuaranteeListExcel(@ModelAttribute("searchVO") GuaranteeVO searchVO, ModelMap model) throws Exception {

		ArrayList<HashMap> excelList = new ArrayList<HashMap>();
		
		///----------------------------- 종합 ----------------------------------------------
		searchVO.setFirstIndex(0);
		searchVO.setRecordCountPerPage(10000000);
		
		List<?> guaranteeList = guaranteeService.selectGuaranteeList(searchVO);

    	String excelTitle1 = "종합";

    	// * 조회조건 설정
    	ArrayList<ExcelVO> excelSearchInfoList = new ArrayList<ExcelVO>();

    	//excelSearchInfoList.add(new ExcelVO("기준년도", searchVO.getSearchKey().getFindYear()));

        // * 엑셀 다운로드 설정 : '헤더명', '컬럼명', '셀정렬(left, center, right)', 'ROWSPAN COLUMN', '셀너비'
    	ArrayList<ExcelVO> excelInfoList1 = new ArrayList<ExcelVO>();
    	excelInfoList1.add(new ExcelVO("등록월", "regDate", "center"));
    	excelInfoList1.add(new ExcelVO("대리점사업자번호", "buyerBizNo", "center"));
    	excelInfoList1.add(new ExcelVO("대리점명", "buyerCoNm", "center"));
    	excelInfoList1.add(new ExcelVO("품목점사업자번호", "sellerBizNo", "center"));
    	excelInfoList1.add(new ExcelVO("품목점명", "sellerCoNm", "center"));
    	excelInfoList1.add(new ExcelVO("거래금액", "totalSalesAmount", "right"));
    	excelInfoList1.add(new ExcelVO("발행금액", "totalTaxAmount", "right"));
    	excelInfoList1.add(new ExcelVO("매출채권발행금액", "totalReceivableAmount", "right"));
    	excelInfoList1.add(new ExcelVO("매출채권결제금액", "totalCollectAmount", "right"));
    	excelInfoList1.add(new ExcelVO("기타수금승인", "totalExtraAmountOk", "right"));
    	excelInfoList1.add(new ExcelVO("기타수금요청", "totalExtraAmount", "right"));
    	excelInfoList1.add(new ExcelVO("상계수금승인", "totalSetoffOk", "right"));
    	excelInfoList1.add(new ExcelVO("상계수금요청", "totalSetoff", "right"));
    	excelInfoList1.add(new ExcelVO("초과금액", "totalOverAmount", "right"));
    	excelInfoList1.add(new ExcelVO("미결제금액", "unpayAmount", "right"));
    	excelInfoList1.add(new ExcelVO("채권미발행금액", "unissuedAmount", "right"));
    	excelInfoList1.add(new ExcelVO("미보증초과금액", "totalOverAmount", "right"));

		HashMap excelMap1 = new HashMap();
		excelMap1.put("excelTitle", excelTitle1);
		excelMap1.put("excelInfoList", excelInfoList1);
		excelMap1.put("excelSearchInfoList", excelSearchInfoList);
		excelMap1.put("excelDataList", guaranteeList);
		excelList.add(excelMap1);
		///----------------------------- 종합 ----------------------------------------------

		///----------------------------- 매출채권 ----------------------------------------------
		DfrdAcntsRcvbleVO dvo = new DfrdAcntsRcvbleVO();
		dvo.setFirstIndex(0);
		dvo.setRecordCountPerPage(10000000);
		dvo.setMembClass(searchVO.getMembClass());
		dvo.setBuyerBizNo(searchVO.getBuyerBizNo());
		dvo.setBuyerCoNm(searchVO.getBuyerCoNm());
		dvo.setSellerBizNo(searchVO.getSellerBizNo());
		dvo.setSellerCoNm(searchVO.getSellerCoNm());

		List<?> dfrdAcntsRcvbleList = guaranteeService.selectDfrdAcntsRcvbleList(dvo);

    	String excelTitle2 = "매출채권";

    	// * 조회조건 설정
 //   	ArrayList<ExcelVO> excelSearchInfoList = new ArrayList<ExcelVO>();

    	//excelSearchInfoList.add(new ExcelVO("기준년도", searchVO.getSearchKey().getFindYear()));

        // * 엑셀 다운로드 설정 : '헤더명', '컬럼명', '셀정렬(left, center, right)', 'ROWSPAN COLUMN', '셀너비'
    	ArrayList<ExcelVO> excelInfoList2 = new ArrayList<ExcelVO>();
    	excelInfoList2.add(new ExcelVO("매출채권번호", "transactionNo", "center"));
    	excelInfoList2.add(new ExcelVO("세금계산서번호", "taxbillNo", "center"));
    	excelInfoList2.add(new ExcelVO("대리점사업자번호", "buyerBizNo", "center"));
    	excelInfoList2.add(new ExcelVO("대리점명", "buyerCoNm", "center"));
    	excelInfoList2.add(new ExcelVO("품목점사업자번호", "sellerBizNo", "center"));
    	excelInfoList2.add(new ExcelVO("품목점명", "sellerCoNm", "center"));
    	excelInfoList2.add(new ExcelVO("발행일", "issueDate", "center"));
    	excelInfoList2.add(new ExcelVO("매출월", "salesDate", "center"));
    	excelInfoList2.add(new ExcelVO("발행금액", "amount", "right"));
    	excelInfoList2.add(new ExcelVO("만기일", "expirationDate", "center"));
    	excelInfoList2.add(new ExcelVO("결제일", "paymentDate", "center"));
    	excelInfoList2.add(new ExcelVO("상태", "progressFlag", "center"));

		HashMap excelMap2 = new HashMap();
		excelMap2.put("excelTitle", excelTitle2);
		excelMap2.put("excelInfoList", excelInfoList2);
		excelMap2.put("excelSearchInfoList", excelSearchInfoList);
		excelMap2.put("excelDataList", dfrdAcntsRcvbleList);
		excelList.add(excelMap2);
		///----------------------------- 매출채권 ----------------------------------------------

		///----------------------------- 기타수금 ----------------------------------------------
		ExtraCollectionVO evo = new ExtraCollectionVO();
		evo.setFirstIndex(0);
		evo.setRecordCountPerPage(10000000);
		evo.setMembClass(searchVO.getMembClass());
		evo.setBuyerBizNo(searchVO.getBuyerBizNo());
		evo.setBuyerCoNm(searchVO.getBuyerCoNm());
		evo.setSellerBizNo(searchVO.getSellerBizNo());
		evo.setSellerCoNm(searchVO.getSellerCoNm());

		List<?> extraCollectionList = guaranteeService.selectExtraCollectionList(evo);

    	String excelTitle3 = "기타수금";

    	// * 조회조건 설정
 //   	ArrayList<ExcelVO> excelSearchInfoList = new ArrayList<ExcelVO>();

    	//excelSearchInfoList.add(new ExcelVO("기준년도", searchVO.getSearchKey().getFindYear()));

        // * 엑셀 다운로드 설정 : '헤더명', '컬럼명', '셀정렬(left, center, right)', 'ROWSPAN COLUMN', '셀너비'
    	ArrayList<ExcelVO> excelInfoList3 = new ArrayList<ExcelVO>();
    	excelInfoList3.add(new ExcelVO("기타수금번호", "transactionNo", "center"));
    	excelInfoList3.add(new ExcelVO("세금계산서번호", "taxbillNo", "center"));
    	excelInfoList3.add(new ExcelVO("대리점사업자번호", "buyerBizNo", "center"));
    	excelInfoList3.add(new ExcelVO("대리점명", "buyerCoNm", "center"));
    	excelInfoList3.add(new ExcelVO("품목점사업자번호", "sellerBizNo", "center"));
    	excelInfoList3.add(new ExcelVO("품목점명", "sellerCoNm", "center"));
    	excelInfoList3.add(new ExcelVO("발행일", "issueDate", "center"));
    	excelInfoList3.add(new ExcelVO("매출월", "salesDate", "center"));
    	excelInfoList3.add(new ExcelVO("발행금액", "amount", "right"));
    	excelInfoList3.add(new ExcelVO("만기일", "expirationDate", "center"));
    	excelInfoList3.add(new ExcelVO("결제일", "paymentDate", "center"));
    	excelInfoList3.add(new ExcelVO("상태", "progressFlag", "center"));

		HashMap excelMap3 = new HashMap();
		excelMap3.put("excelTitle", excelTitle3);
		excelMap3.put("excelInfoList", excelInfoList3);
		excelMap3.put("excelSearchInfoList", excelSearchInfoList);
		excelMap3.put("excelDataList", extraCollectionList);
		excelList.add(excelMap3);
		///----------------------------- 기타수금 ----------------------------------------------

		///----------------------------- 상계수금 ----------------------------------------------
		SetOffInfoVO svo = new SetOffInfoVO();
		svo.setFirstIndex(0);
		svo.setRecordCountPerPage(10000000);
		svo.setMembClass(searchVO.getMembClass());
		svo.setBuyerBizNo(searchVO.getBuyerBizNo());
		svo.setBuyerCoNm(searchVO.getBuyerCoNm());
		svo.setSellerBizNo(searchVO.getSellerBizNo());
		svo.setSellerCoNm(searchVO.getSellerCoNm());

		List<?> setOffInfoList = guaranteeService.selectSetOffInfoList(svo);

    	String excelTitle4 = "상계수금";

    	// * 조회조건 설정
 //   	ArrayList<ExcelVO> excelSearchInfoList = new ArrayList<ExcelVO>();

    	//excelSearchInfoList.add(new ExcelVO("기준년도", searchVO.getSearchKey().getFindYear()));

        // * 엑셀 다운로드 설정 : '헤더명', '컬럼명', '셀정렬(left, center, right)', 'ROWSPAN COLUMN', '셀너비'
    	ArrayList<ExcelVO> excelInfoList4 = new ArrayList<ExcelVO>();
    	excelInfoList4.add(new ExcelVO("상계수금번호", "transactionNo", "center"));
    	excelInfoList4.add(new ExcelVO("대리점사업자번호", "buyerBizNo", "center"));
    	excelInfoList4.add(new ExcelVO("대리점명", "buyerCoNm", "center"));
    	excelInfoList4.add(new ExcelVO("품목점사업자번호", "sellerBizNo", "center"));
    	excelInfoList4.add(new ExcelVO("품목점명", "sellerCoNm", "center"));
    	excelInfoList4.add(new ExcelVO("발행일", "issueDate", "center"));
    	excelInfoList4.add(new ExcelVO("매출월", "salesDate", "center"));
    	excelInfoList4.add(new ExcelVO("발행금액", "amount", "right"));
    	excelInfoList4.add(new ExcelVO("만기일", "expirationDate", "center"));
    	excelInfoList4.add(new ExcelVO("결제일", "paymentDate", "center"));
    	excelInfoList4.add(new ExcelVO("상태", "progressFlag", "center"));

		HashMap excelMap4 = new HashMap();
		excelMap4.put("excelTitle", excelTitle4);
		excelMap4.put("excelInfoList", excelInfoList4);
		excelMap4.put("excelSearchInfoList", excelSearchInfoList);
		excelMap4.put("excelDataList", setOffInfoList);
		excelList.add(excelMap4);
		///----------------------------- 상계수금 ----------------------------------------------

		///----------------------------- 세금계산서 ----------------------------------------------
		TaxbillVO tvo = new TaxbillVO();
		tvo.setFirstIndex(0);
		tvo.setRecordCountPerPage(10000000);
		tvo.setMembClass(searchVO.getMembClass());
		tvo.setBuyerBizNo(searchVO.getBuyerBizNo());
		tvo.setBuyerCoNm(searchVO.getBuyerCoNm());
		tvo.setSellerBizNo(searchVO.getSellerBizNo());
		tvo.setSellerCoNm(searchVO.getSellerCoNm());

		List<?> taxbillList = guaranteeService.selectTaxbillList(tvo);

    	String excelTitle5 = "세금계산서";

    	// * 조회조건 설정
 //   	ArrayList<ExcelVO> excelSearchInfoList = new ArrayList<ExcelVO>();

    	//excelSearchInfoList.add(new ExcelVO("기준년도", searchVO.getSearchKey().getFindYear()));

        // * 엑셀 다운로드 설정 : '헤더명', '컬럼명', '셀정렬(left, center, right)', 'ROWSPAN COLUMN', '셀너비'
    	ArrayList<ExcelVO> excelInfoList5 = new ArrayList<ExcelVO>();
    	excelInfoList5.add(new ExcelVO("세금계산서번호", "taxbillNo", "center"));
    	excelInfoList5.add(new ExcelVO("대리점사업자번호", "buyerBizNo", "center"));
    	excelInfoList5.add(new ExcelVO("대리점명", "buyerCoNm", "center"));
    	excelInfoList5.add(new ExcelVO("품목점사업자번호", "sellerBizNo", "center"));
    	excelInfoList5.add(new ExcelVO("품목점명", "sellerCoNm", "center"));
    	excelInfoList5.add(new ExcelVO("매출월", "salesDate", "center"));
    	excelInfoList5.add(new ExcelVO("발행금액", "amount", "right"));
    	excelInfoList5.add(new ExcelVO("매출구분", "groupType", "center"));

		HashMap excelMap5 = new HashMap();
		excelMap5.put("excelTitle", excelTitle5);
		excelMap5.put("excelInfoList", excelInfoList5);
		excelMap5.put("excelSearchInfoList", excelSearchInfoList);
		excelMap5.put("excelDataList", taxbillList);
		excelList.add(excelMap5);
		///----------------------------- 세금계산서 ----------------------------------------------

		///----------------------------- 매출전표 ----------------------------------------------
		SalesSlipVO lvo = new SalesSlipVO();
		lvo.setFirstIndex(0);
		lvo.setRecordCountPerPage(10000000);
		lvo.setMembClass(searchVO.getMembClass());
		lvo.setBuyerBizNo(searchVO.getBuyerBizNo());
		lvo.setBuyerCoNm(searchVO.getBuyerCoNm());
		lvo.setSellerBizNo(searchVO.getSellerBizNo());
		lvo.setSellerCoNm(searchVO.getSellerCoNm());

		List<?> salesSlipList = guaranteeService.selectSalesSlipList(lvo);

    	String excelTitle6 = "매출전표";

    	// * 조회조건 설정
 //   	ArrayList<ExcelVO> excelSearchInfoList = new ArrayList<ExcelVO>();

    	//excelSearchInfoList.add(new ExcelVO("기준년도", searchVO.getSearchKey().getFindYear()));

        // * 엑셀 다운로드 설정 : '헤더명', '컬럼명', '셀정렬(left, center, right)', 'ROWSPAN COLUMN', '셀너비'
    	ArrayList<ExcelVO> excelInfoList6 = new ArrayList<ExcelVO>();
    	excelInfoList6.add(new ExcelVO("매출일", "salesDate", "center"));
    	excelInfoList6.add(new ExcelVO("헤임즈전표번호", "heimsSalesSlipNo", "center"));
    	excelInfoList6.add(new ExcelVO("대리점사업자번호", "buyerBizNo", "center"));
    	excelInfoList6.add(new ExcelVO("대리점명", "buyerCoNm", "center"));
    	excelInfoList6.add(new ExcelVO("품목점사업자번호", "sellerBizNo", "center"));
    	excelInfoList6.add(new ExcelVO("품목점명", "sellerCoNm", "center"));
    	excelInfoList6.add(new ExcelVO("전표금액", "supplyValue", "right"));
    	excelInfoList6.add(new ExcelVO("세금계산서 발행여부", "useTaxbillYn", "center"));
    	excelInfoList6.add(new ExcelVO("세금계산서번호", "taxbillNo", "center"));
    	excelInfoList6.add(new ExcelVO("매출구분", "groupType", "center"));
    	excelInfoList6.add(new ExcelVO("헤임즈기록 보증초과금액", "overInput", "center"));
    	excelInfoList6.add(new ExcelVO("이니시스 잔여 보증초과금액", "overOutput", "center"));

		HashMap excelMap6 = new HashMap();
		excelMap6.put("excelTitle", excelTitle6);
		excelMap6.put("excelInfoList", excelInfoList6);
		excelMap6.put("excelSearchInfoList", excelSearchInfoList);
		excelMap6.put("excelDataList", salesSlipList);
		excelList.add(excelMap6);
		///----------------------------- 매출전표 ----------------------------------------------
		
		model.addAttribute("excelList", excelList);

        return "excelDownloadView";
    }

	/**
	 * 강제발행을 위한 미발행채권을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 UnissuedVO
	 * @param model
	 * @return "forceUnissuedList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/forceUnissuedList.do")
	public String selectForceUnissuedList(@ModelAttribute("searchVO") UnissuedVO searchVO, ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() == null) return "redirect:/login.do";
		LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		if(user == null || !"AMNHI".contains(user.getMembClass())) return "redirect:/login.do";
		
		List<?> unissuedList = guaranteeService.selectUnissuedList(searchVO);
		model.addAttribute("resultList", unissuedList);

		return "admin/forceUnissuedList";
	}

	/**
	 * 미발행 채권 목록을 Excel파일로 만든다.
	 * @param searchVO - 조회할 정보가 담긴 UnissuedVO
	 * @param model
	 * @return "excelDownloadView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/downloads/forceUnissuedList.do")
	public String selectForceUnissuedListExcel(@ModelAttribute("searchVO") UnissuedVO searchVO, ModelMap model) throws Exception {
		List<?> unissuedList = guaranteeService.selectUnissuedList(searchVO);

    	String excelTitle = "미발행 채권";

    	// * 조회조건 설정
    	ArrayList<ExcelVO> excelSearchInfoList = new ArrayList<ExcelVO>();

    	//excelSearchInfoList.add(new ExcelVO("기준년도", searchVO.getSearchKey().getFindYear()));

        // * 엑셀 다운로드 설정 : '헤더명', '컬럼명', '셀정렬(left, center, right)', 'ROWSPAN COLUMN', '셀너비'
    	ArrayList<ExcelVO> excelInfoList = new ArrayList<ExcelVO>();
    	excelInfoList.add(new ExcelVO("세금계산서 번호", "taxbillNo", "center"));
    	excelInfoList.add(new ExcelVO("매출액", "salesAmount", "center"));
    	excelInfoList.add(new ExcelVO("매출채권발행금액", "receivableAmount", "left"));
    	excelInfoList.add(new ExcelVO("기타수금금액", "extraAmount", "center"));
    	excelInfoList.add(new ExcelVO("상계수금금액", "setoffAmount", "center"));
    	excelInfoList.add(new ExcelVO("미발행금액 (미확정)", "unissuedAmount", "center"));

    	model.addAttribute("excelTitle", excelTitle);
    	model.addAttribute("excelSearchInfoList", excelSearchInfoList);
    	model.addAttribute("excelInfoList", excelInfoList);
    	model.addAttribute("excelDataList", unissuedList);

        return "excelDownloadView";
    }
}
