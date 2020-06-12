package com.hyundai.admin.authorization.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.hyundai.admin.authorization.service.AuthorizationService;
import com.hyundai.admin.authorization.service.MemberAuthVO;
import com.hyundai.admin.authorization.service.MenuAuthVO;
import com.hyundai.admin.limitInfo.service.LimitRequestVO;
import com.hyundai.cmmn.service.LoginVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class AuthorizationController {

	/** CdfMemberService */
	@Resource(name = "authorizationService")
	private AuthorizationService authorizationService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * 사용자 설정을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "memberAuthList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/memberAuthList.do")
	public String selectMemberAuthList(@ModelAttribute("searchVO") MemberAuthVO searchVO, ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() == null) return "redirect:/login.do";
		LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		if(user == null || !"AMNHI".contains(user.getMembClass())) return "redirect:/login.do";
		
		if(searchVO.getMembClass() == null || searchVO.getMembClass().isEmpty()) searchVO.setMembClass("B");
		if(searchVO.getArrStr() != null && !searchVO.getArrStr().isEmpty()) authorizationService.deleteMember(searchVO.getArrStr());
		
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

		List<?> unissuedList = authorizationService.selectMemberAuthList(searchVO);
		model.addAttribute("resultList", unissuedList);

		int totCnt = authorizationService.selectMemberAuthListTotCnt(searchVO);
		model.addAttribute("totCnt", totCnt);

		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "admin/memberAuthList";
	}

	/**
	 * 사용자 권한을 조회한다.
	 * @param MemberAuthVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/memberAuthEdit.do")
	public String selectMemberAuthEdit(@ModelAttribute MemberAuthVO requestVO, ModelMap model) throws Exception {
		// 품목점 조회
		MemberAuthVO resultVO = authorizationService.selectMemberAuthEdit(requestVO);

		model.addAttribute("resultVO", resultVO);

		return "admin/memberAuthPopup";
	}

	 /**
	 * 사용자 권한정보를 갱신한다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/updateMemberAuth.json", method = RequestMethod.POST)
	@ResponseBody
	public String UpdateMemberAuthJson(@ModelAttribute("memberAuthVO") MemberAuthVO memberAuthVO) throws Exception {

		authorizationService.updateMemberAuth(memberAuthVO);
				
		return "Success";
	}

	/**
	 * 그룹별 권한 설정을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 MemberVO
	 * @param model
	 * @return "groupAuthList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/admin/groupAuthList.do")
	public String selectGroupAuthList(@ModelAttribute("searchVO") MemberAuthVO searchVO, ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() == null) return "redirect:/login.do";
		LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		if(user == null || !"AMNHI".contains(user.getMembClass())) return "redirect:/login.do";
		
		List<?> groupAuthList = authorizationService.selectGroupAuthList(searchVO.getMembClass());
		model.addAttribute("resultList", groupAuthList);

		return "admin/groupAuthList";
	}

	 /**
	 * 그룹별 권한정보를 갱신한다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/updateGroupAuth.json", method = RequestMethod.POST)
	@ResponseBody
	public String UpdateGroupAuthJson(@RequestParam("membClass") String membClass, @RequestParam("arrStr") String arrStr) throws Exception {

		authorizationService.updateGroupAuth(membClass, arrStr);
				
		return "Success";
	}
}
