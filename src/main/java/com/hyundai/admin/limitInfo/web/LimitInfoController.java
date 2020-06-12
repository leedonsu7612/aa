package com.hyundai.admin.limitInfo.web;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.multipart.MultipartFile;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.google.gson.Gson;
import com.hyundai.admin.limitInfo.service.LimitInfoService;
import com.hyundai.admin.limitInfo.service.LimitInfoVO;
import com.hyundai.admin.limitInfo.service.LimitRequestVO;
import com.hyundai.admin.member.service.MemberVO;
import com.hyundai.cmmn.service.EgovFileMngService;
import com.hyundai.cmmn.service.EgovFileMngUtil;
import com.hyundai.cmmn.service.FileVO;
import com.hyundai.cmmn.service.LoginVO;
import com.hyundai.cmmn.view.ExcelVO;
import com.hyundaicommercial.cdf.blockchain.Interface;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class LimitInfoController {

	/** LimitInfoService */
	@Resource(name = "limitInfoService")
	private LimitInfoService limitInfoService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/**
	 * 대리점 한도요청을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 LimitInfoVO
	 * @param model
	 * @return "limitInfoList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/limitInfoList.do")
	public String selectLimitInfoList(@ModelAttribute("searchVO") LimitInfoVO searchVO, ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() == null) return "redirect:/login.do";
		LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		if(user == null || !"AM".contains(user.getMembClass())) return "redirect:/login.do";
		
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

		List<?> limitInfoList = limitInfoService.selectLimitInfoList(searchVO);
		model.addAttribute("resultList", limitInfoList);

		int totCnt = limitInfoService.selectLimitInfoListTotCnt(searchVO);
		model.addAttribute("totCnt", totCnt);
		
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "admin/limitInfoList";
	}

    /**
	 * 대리점 한도요청을 Excel파일로 만든다.
	 * @param searchVO - 조회할 정보가 담긴 LimitInfoVO
	 * @param model
	 * @return "excelDownloadView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/downloads/limitInfoList.do")
	public String SelectLimitInfoListExcel(@ModelAttribute("searchVO") LimitInfoVO searchVO, ModelMap model) throws Exception {
		searchVO.setFirstIndex(0);
		searchVO.setRecordCountPerPage(10000000);
		List<?> limitInfoList = limitInfoService.selectLimitInfoList(searchVO);

    	String excelTitle = "대리점 한도요청";

    	// * 조회조건 설정
    	ArrayList<ExcelVO> excelSearchInfoList = new ArrayList<ExcelVO>();

    	//excelSearchInfoList.add(new ExcelVO("기준년도", searchVO.getSearchKey().getFindYear()));

        // * 엑셀 다운로드 설정 : '헤더명', '컬럼명', '셀정렬(left, center, right)', 'ROWSPAN COLUMN', '셀너비'
    	ArrayList<ExcelVO> excelInfoList = new ArrayList<ExcelVO>();
    	excelInfoList.add(new ExcelVO("대리점", "companyName", "left"));
    	excelInfoList.add(new ExcelVO("코드", "membNo", "center"));
    	excelInfoList.add(new ExcelVO("대표명", "ceoName", "center"));
    	excelInfoList.add(new ExcelVO("사업소", "bizPlace", "center"));
    	excelInfoList.add(new ExcelVO("사업자번호", "businessNo", "center"));
    	excelInfoList.add(new ExcelVO("모비스거래한도", "mobisLimit", "center"));
    	excelInfoList.add(new ExcelVO("HCI거래한도", "hciLimit", "center"));
    	excelInfoList.add(new ExcelVO("총거래한도", "salesLimit", "center"));
    	excelInfoList.add(new ExcelVO("잔여한도", "remLimit", "center"));
    	excelInfoList.add(new ExcelVO("초과한도", "overLimit", "center"));
    	excelInfoList.add(new ExcelVO("보증초과", "guaranteeOver", "center"));
    	excelInfoList.add(new ExcelVO("보증금액", "guaranteePrice", "center"));
    	excelInfoList.add(new ExcelVO("공증금액", "notarialPrice", "center"));
    	excelInfoList.add(new ExcelVO("휴업/폐업", "closeDate", "center"));
    	excelInfoList.add(new ExcelVO("비고", "memo", "center"));
    	excelInfoList.add(new ExcelVO("진행상태", "process", "center"));

    	model.addAttribute("excelTitle", excelTitle);
    	model.addAttribute("excelSearchInfoList", excelSearchInfoList);
    	model.addAttribute("excelInfoList", excelInfoList);
    	model.addAttribute("excelDataList", limitInfoList);

        return "excelDownloadView";
    }

	/**
	 * 한도요청을 조회한다.
	 * @param officesItemVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/limitRequest.do")
	public String selectLimitRequest(@ModelAttribute LimitRequestVO requestVO, ModelMap model) throws Exception {
		// 품목점 조회
		LimitRequestVO resultVO = limitInfoService.selectLimitRequest(requestVO);

		model.addAttribute("resultVO", resultVO);

//		BYR_LIMIT_VIEW(resultVO);
		
		return "admin/limitRequestPopup";
	}

    /**
     * 블록체인 대리점 한도 조회
     * @param input stringified JSON object
     * @return output
     */
    public void BYR_LIMIT_VIEW(LimitRequestVO requestVO) {

        Interface bcInterface = null;
        try {
            bcInterface = new Interface();
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println(String.format("Method: %s, Input data: %s\n", "BYR_LIMIT_VIEW", requestVO.getCompanyName() + "의 한도"));
        JSONObject result = new JSONObject();
        result.put("LIMIT_CONTRACT_NO", "1234567890");
        result.put("AMOUNT", requestVO.getSalesLimit());
        result.put("REMAINING_LIMIT", requestVO.getRemLimit());
        result.put("OVER_LIMIT", requestVO.getOverLimit());
        result.put("GUAR_AMOUNT", requestVO.getGuaranteePrice());
        result.put("GUAR_OVER_AMOUNT", requestVO.getGuaranteeOver());
        result.put("SET_AMOUNT", requestVO.getReqLimit());
        result.put("SET_DATE", requestVO.getRegDate());
        result.put("OFF_DATE", "20191126");
        result.put("STATUS", "1");
        result.put("ERROR_MSG", "");
        
        result.put("BYR_LIMIT_NO", requestVO.getBusinessNo());
        result.put("BYR_STATUS", "1");
              
        System.out.println(String.format("Method: %s, Output data: %s\n", "BYR_LIMIT_VIEW", result.toString()));
        String output = bcInterface.BYR_LIMIT_VIEW(result.toString());
        System.out.println(String.format("Output: %s\n", output.toString()));
        //return helper.queryChaincode(client, channel, "byrlimit", "BYR_LIMIT_VIEW", input);
    }

	 @RequestMapping(value = "/admin/upload.do")
	 public void doUploadAttach(@RequestParam(value="ajaxfile", required=false) MultipartFile file
			 , @RequestParam("attchFileId") String attchFileId ,HttpServletRequest request, HttpServletResponse response) throws Exception {

		 final Map<String, MultipartFile> files = new HashMap<String, MultipartFile>();
		 files.put("ajaxfile", file);
		 List<FileVO> result = fileUtil.parseFileInf(files, "CDF_", 0, attchFileId, "");
		 attchFileId = fileMngService.insertFileInfs(result);

		 // 업로드 파일 정보 셋팅
		 Map<String, Object> mapResult = new HashMap<String, Object>();
		 mapResult.put("attchFileId" , attchFileId);
		 mapResult.put("oriFileNm" , file.getOriginalFilename());
		 mapResult.put("fileSize" , file.getSize());
		 mapResult.put("fileSn" , result.get(0).getFileSn());
		 mapResult.put("content_type" , file.getContentType());
	   
		 // 한글 처리를 위한 response 설정
		 response.setContentType("text/plain;charset=UTF-8");
		 response.setCharacterEncoding("UTF-8");
		 response.setHeader("Cache-Control", "no-chche");
	 
		 // 업로드 결과 전송
		 // AJAX 관련 변수 선언
		 PrintWriter outWriter=null; 
	
		 Gson gson = new Gson();
		 outWriter = response.getWriter();
		 outWriter.print(gson.toJson(mapResult));
		 outWriter.flush();
	}

	 /**
	 * 한도요청을 등록한다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/insertLimitRequest.json", method = RequestMethod.POST)
	@ResponseBody
	public String InsertLimitRequestJson(@ModelAttribute("limitRequestVO") LimitRequestVO limitRequestVO) throws Exception {

		limitInfoService.insertLimitRequest(limitRequestVO);
				
		return "Success";
	}

    /**
	 * 승인을 위한 대리점 한도요청을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 LimitInfoVO
	 * @param model
	 * @return "limitApprovalList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/limitApprovalList.do")
	public String selectLimitApprovalList(@ModelAttribute("searchVO") LimitInfoVO searchVO, ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() == null) return "redirect:/login.do";
		LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		if(user == null || !"ANHI".contains(user.getMembClass())) return "redirect:/login.do";
		
		// 날짜 정보
		String fromDate = searchVO.getSearchFromDate();
		String toDate = searchVO.getSearchToDate();

		if (fromDate == null || "".equals(fromDate) || toDate == null || "".equals(toDate)) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
			Calendar calendar = Calendar.getInstance();
			searchVO.setSearchToDate(dateFormat.format(calendar.getTime()));
			calendar.add(calendar.MONTH, -1);
			searchVO.setSearchFromDate(dateFormat.format(calendar.getTime()));
		}

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

		List<?> limitInfoList = limitInfoService.selectLimitApprovalList(searchVO);
		model.addAttribute("resultList", limitInfoList);

		int totCnt = limitInfoService.selectLimitApprovalListTotCnt(searchVO);
		model.addAttribute("totCnt", totCnt);
		
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("userClass", user.getMembClass());

		return "admin/limitApprovalList";
	}

	/**
	 * 승인을 위한 한도요청을 조회한다.
	 * @param officesItemVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/limitApproval.do")
	public String selectLimitApproval(@ModelAttribute LimitRequestVO requestVO, ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() == null) return "redirect:/login.do";
		LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		if(user == null || !"ANHI".contains(user.getMembClass())) return "redirect:/login.do";

		// 한도요청 조회
		LimitRequestVO resultVO = limitInfoService.selectLimitRequest(requestVO);

		model.addAttribute("resultVO", resultVO);

		String returnStr = "";
		switch(user.getMembClass().charAt(0)){
			case 'A': case 'N': returnStr = "admin/limitApprovalPopup"; break;
			case 'H': returnStr = "admin/limitApprovalHCIManPopup"; break;
			case 'I': returnStr = "admin/limitApprovalHCIBossPopup"; break;		
		}
		return returnStr;
	}

	/**
	 * 대리점을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "buyerList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/buyerList.do")
	public String selectBuyerList(@ModelAttribute("searchVO") LimitInfoVO searchVO, ModelMap model) throws Exception {

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

		List<?> limitInfoList = limitInfoService.selectLimitInfoList(searchVO);
		model.addAttribute("resultList", limitInfoList);

		int totCnt = limitInfoService.selectLimitInfoListTotCnt(searchVO);
		model.addAttribute("totCnt", totCnt);
		
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "admin/buyerList";
	}

	/**
	 * 대리점 한도요청내역을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "limitHistory"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/limitHistory.do")
	public String selectLimitHistory(@ModelAttribute("searchVO") MemberVO searchVO, ModelMap model) throws Exception {

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

		List<?> limitHistoryList = limitInfoService.selectLimitHistoryList(searchVO);
		model.addAttribute("resultList", limitHistoryList);

		int totCnt = limitInfoService.selectLimitHistoryListTotCnt(searchVO);
		
		model.addAttribute("totCnt", totCnt);
		
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "admin/limitHistory";
	}
}
