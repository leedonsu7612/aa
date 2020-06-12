package com.hyundai.admin.abnormalDaily.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.hyundai.admin.abnormalDaily.service.AbnormalDailyService;
import com.hyundai.admin.abnormalDaily.service.AbnormalDailyVO;
import com.hyundai.cmmn.service.LoginVO;
import com.hyundai.cmmn.view.ExcelVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class AbnormalDailyController {

	/** abnormalDailyService */
	@Resource(name = "abnormalDailyService")
	private AbnormalDailyService abnormalDailyService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/**
	 * 일자별 이상거래 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "abnormalDaily"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/abnormalDaily.do")
	public String selectAbnormalDailyList(@ModelAttribute("searchVO") AbnormalDailyVO searchVO, ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() == null) return "redirect:/login.do";
		LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		if(user == null || !"AMNHI".contains(user.getMembClass())) return "redirect:/login.do";
		
		String yesterday = searchVO.getRegDate();
		if(searchVO.getRegDate() == null || searchVO.getRegDate().isEmpty()){
			Calendar calendar = Calendar.getInstance();
			DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			calendar.add(calendar.DAY_OF_MONTH, -1);
			yesterday = dateFormat.format(calendar.getTime());
			searchVO.setRegDate(yesterday);
		}
		yesterday = yesterday.substring(0, 4) + "." + yesterday.substring(4, 6) + "." + yesterday.substring(6, 8);
		model.addAttribute("yesterday", yesterday);
				
		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> abnormalDailyList = abnormalDailyService.selectAbnormalDailyList(searchVO);
		model.addAttribute("resultList", abnormalDailyList);

		int totCnt = abnormalDailyService.selectAbnormalDailyListTotCnt(searchVO);
		model.addAttribute("totCnt", totCnt);

		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "admin/abnormalDaily";
	}

	/**
	 * 일자별 이상거래 목록을 Excel파일로 만든다.
	 * @param searchVO - 조회할 정보가 담긴 AbnormalDailyVO
	 * @param model
	 * @return "excelDownloadView"
	 * @exception Exception
	 * 
	 */
	@RequestMapping(value = "/downloads/abnormalDaily.do")
	public String AbnormalDailyExcel(@ModelAttribute("searchVO") AbnormalDailyVO searchVO, ModelMap model) throws Exception {
		AbnormalDailyVO vo = new AbnormalDailyVO();
		vo.setFirstIndex(0);
		vo.setRecordCountPerPage(1000000);
		vo.setRegDate(searchVO.getRegDate());
		List<?> abnormalDailyList = abnormalDailyService.selectAbnormalDailyList(vo);

    	String excelTitle = "일자별 이상거래";

    	// * 조회조건 설정
    	ArrayList<ExcelVO> excelSearchInfoList = new ArrayList<ExcelVO>();

    	//excelSearchInfoList.add(new ExcelVO("기준년도", searchVO.getSearchKey().getFindYear()));

        // * 엑셀 다운로드 설정 : '헤더명', '컬럼명', '셀정렬(left, center, right)', 'ROWSPAN COLUMN', '셀너비'
    	ArrayList<ExcelVO> excelInfoList = new ArrayList<ExcelVO>();
    	excelInfoList.add(new ExcelVO("기준월", "regDate", "center"));
    	excelInfoList.add(new ExcelVO("상호", "companyName", "left"));
    	excelInfoList.add(new ExcelVO("사업자번호", "businessNo", "center"));
    	excelInfoList.add(new ExcelVO("코드", "membNo", "center"));
    	excelInfoList.add(new ExcelVO("부여한도", "salesLimit", "right"));
    	excelInfoList.add(new ExcelVO("잔여한도", "remainingLimit", "right"));
    	excelInfoList.add(new ExcelVO("초과한도", "overLimit", "right"));
    	excelInfoList.add(new ExcelVO("전체거래내역", "tradeAmt", "center"));
    	excelInfoList.add(new ExcelVO("이상거래내역", "abnormalAmt", "center"));

    	model.addAttribute("excelTitle", excelTitle);
    	model.addAttribute("excelSearchInfoList", excelSearchInfoList);
    	model.addAttribute("excelInfoList", excelInfoList);
    	model.addAttribute("excelDataList", abnormalDailyList);

        return "excelDownloadView";
    }
}
