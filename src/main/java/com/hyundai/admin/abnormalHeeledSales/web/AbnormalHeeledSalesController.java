package com.hyundai.admin.abnormalHeeledSales.web;

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

import com.hyundai.admin.abnormalHeeledSales.service.AbnormalHeeledSalesService;
import com.hyundai.admin.abnormalHeeledSales.service.AbnormalHeeledSalesVO;
import com.hyundai.cmmn.service.LoginVO;
import com.hyundai.cmmn.view.ExcelVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.fdl.string.EgovStringUtil;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class AbnormalHeeledSalesController {

	/** CdfMemberService */
	@Resource(name = "abnormalHeeledSalesService")
	private AbnormalHeeledSalesService abnormalHeeledSalesService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/**
	 * 매출분포 이상거래 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 AbnormalHeeledSalesVO
	 * @param model
	 * @return "abnormalHeeledSales"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/abnormalHeeledSales.do")
	public String selectAbnormalDailyList(@ModelAttribute("searchVO") AbnormalHeeledSalesVO searchVO, ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() == null) return "redirect:/login.do";
		LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		if(user == null || !"AMNHI".contains(user.getMembClass())) return "redirect:/login.do";
		
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

		List<?> abnormalHeeledSalesList = abnormalHeeledSalesService.selectAbnormalHeeledSalesList(searchVO);
		model.addAttribute("resultList", abnormalHeeledSalesList);

		int totCnt = abnormalHeeledSalesService.selectAbnormalHeeledSalesListTotCnt(searchVO);
		model.addAttribute("totCnt", totCnt);

		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "admin/abnormalHeeledSales";
	}

	/**
	 * 매출분포 이상거래 목록을 Excel파일로 만든다.
	 * @param searchVO - 조회할 정보가 담긴 AbnormalHeeledSalesVO
	 * @param model
	 * @return "excelDownloadView"
	 * @exception Exception
	 */
	@RequestMapping(value = "/downloads/abnormalHeeledSales.do")
	public String AbnormalHeeledSalesExcel(@ModelAttribute("searchVO") AbnormalHeeledSalesVO searchVO, ModelMap model) throws Exception {
		AbnormalHeeledSalesVO vo = new AbnormalHeeledSalesVO();
		vo.setFirstIndex(0);
		vo.setRecordCountPerPage(1000000);
		vo.setSearchKeyword(searchVO.getSearchKeyword());
		List<?> abnormalHeeledSalesList = abnormalHeeledSalesService.selectAbnormalHeeledSalesList(vo);

    	String excelTitle = "매출분포이상거래";

    	// * 조회조건 설정
    	ArrayList<ExcelVO> excelSearchInfoList = new ArrayList<ExcelVO>();

    	//excelSearchInfoList.add(new ExcelVO("기준년도", searchVO.getSearchKey().getFindYear()));

        // * 엑셀 다운로드 설정 : '헤더명', '컬럼명', '셀정렬(left, center, right)', 'ROWSPAN COLUMN', '셀너비'
    	ArrayList<ExcelVO> excelInfoList = new ArrayList<ExcelVO>();
    	excelInfoList.add(new ExcelVO("기준월", "regDate", "center"));
    	excelInfoList.add(new ExcelVO("대리점 상호", "buyerCoNm", "left"));
    	excelInfoList.add(new ExcelVO("대리점 사업자번호", "buyerBizNo", "center"));
    	excelInfoList.add(new ExcelVO("대리점 코드", "buyerMembNo", "center"));
    	excelInfoList.add(new ExcelVO("품목점 상호", "sellerCoNm", "left"));
    	excelInfoList.add(new ExcelVO("품목점 사업자번호", "sellerBizNo", "center"));
    	excelInfoList.add(new ExcelVO("품목점 코드", "sellerMembNo", "center"));
    	excelInfoList.add(new ExcelVO("부여한도", "salesLimit", "right"));
    	excelInfoList.add(new ExcelVO("잔여한도", "remainingLimit", "right"));
    	excelInfoList.add(new ExcelVO("초과한도", "overLimit", "right"));
    	excelInfoList.add(new ExcelVO("전체거래내역", "tradeAmt", "center"));
    	excelInfoList.add(new ExcelVO("이상거래내역", "abnormalAmt", "center"));

    	model.addAttribute("excelTitle", excelTitle);
    	model.addAttribute("excelSearchInfoList", excelSearchInfoList);
    	model.addAttribute("excelInfoList", excelInfoList);
    	model.addAttribute("excelDataList", abnormalHeeledSalesList);

        return "excelDownloadView";
    }
}
