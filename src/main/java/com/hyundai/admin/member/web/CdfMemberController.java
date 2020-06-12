package com.hyundai.admin.member.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.hyundai.admin.abnormalDaily.service.AbnormalDailyVO;
import com.hyundai.admin.member.service.CdfMemberService;
import com.hyundai.admin.member.service.MemberVO;
import com.hyundai.cmmn.service.LoginVO;
import com.hyundai.cmmn.view.ExcelVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class CdfMemberController {

	/** CdfMemberService */
	@Resource(name = "memberService")
	private CdfMemberService memberService;

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
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/checkMemberList.do")
	public String selectMemberList(@ModelAttribute("searchVO") MemberVO searchVO, ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() == null) return "redirect:/login.do";
		LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		if(user == null || !"AMNHI".contains(user.getMembClass())) return "redirect:/login.do";
		
		if(searchVO.getMembClass() == null || searchVO.getMembClass().isEmpty()) searchVO.setMembClass("A");
		
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

		return "admin/checkMemberList";
	}

	/**
	 * 상점 목록을 Excel파일로 만든다.
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "excelDownloadView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/downloads/checkMemberList.do")
	public String SelectMemberListExcel(@ModelAttribute("searchVO") MemberVO searchVO, ModelMap model) throws Exception {
		searchVO.setFirstIndex(0);
		searchVO.setRecordCountPerPage(10000000);
		List<?> memberList = memberService.selectMemberList(searchVO);

    	String excelTitle = "상점 목록";

    	// * 조회조건 설정
    	ArrayList<ExcelVO> excelSearchInfoList = new ArrayList<ExcelVO>();

    	//excelSearchInfoList.add(new ExcelVO("기준년도", searchVO.getSearchKey().getFindYear()));

        // * 엑셀 다운로드 설정 : '헤더명', '컬럼명', '셀정렬(left, center, right)', 'ROWSPAN COLUMN', '셀너비'
    	ArrayList<ExcelVO> excelInfoList = new ArrayList<ExcelVO>();
    	excelInfoList.add(new ExcelVO("구분", "membClass", "center"));
    	excelInfoList.add(new ExcelVO("코드", "membNo", "center"));
    	excelInfoList.add(new ExcelVO("상점명", "companyName", "left"));
    	excelInfoList.add(new ExcelVO("대표자명", "ceoName", "center"));
    	excelInfoList.add(new ExcelVO("사업자번호", "businessNo", "center"));
    	excelInfoList.add(new ExcelVO("연체중", "dishonoredType", "center"));

    	model.addAttribute("excelTitle", excelTitle);
    	model.addAttribute("excelSearchInfoList", excelSearchInfoList);
    	model.addAttribute("excelInfoList", excelInfoList);
    	model.addAttribute("excelDataList", memberList);

        return "excelDownloadView";
    }
}
