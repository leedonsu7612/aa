package com.hyundai.usr.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.hyundai.cmmn.EgovMessageSource;
import com.hyundai.cmmn.service.EgovFileMngService;
import com.hyundai.cmmn.service.EgovFileMngUtil;
import com.hyundai.cmmn.service.FileVO;
import com.hyundai.cmmn.service.LoginVO;
import com.hyundai.usr.service.RegistService;
import com.hyundai.usr.service.RegistVO;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Controller
public class RegistController {

	/** RegistService */
	@Resource(name = "registService")
	private RegistService registService;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	/** ID Generation */
	@Resource(name = "egovBizNoGnrService")
	private EgovIdGnrService egovIdGnrService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/**
	 * 회원가입프로세스 1단계
	 * @param model
	 * @return "registStep1"
	 * @exception Exception
	 */
	@RequestMapping(value = "/usr/registStep1.do")
	public String RegistStep1(ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() != null){
			LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
			if(user != null) return "redirect:/login.do";
		}
		
		model.addAttribute("step", "step1");

		return "usr/registStep1";
	}

	/**
	 * 회원가입프로세스 1단계 확인
	 * @param loginVO - 조회할 정보가 담긴 LoginVO
	 * @param model
	 * @return "registStep1Confirm"
	 * @exception Exception
	 */
	@RequestMapping(value = "/usr/registStep1Confirm.do")
	public String RegistStep1Confirm(@ModelAttribute("loginVO") LoginVO loginVO, ModelMap model) throws Exception {

		if (loginVO == null || loginVO.getBusinessNo() == null || loginVO.getBusinessNo().equals("")){
			return "redirect:/usr/registStep1.do";
		}
		if(registService.isRegistered(loginVO.getBusinessNo())){
//			model.addAttribute("message", egovMessageSource.getMessage("info.regist.msg"));
			model.addAttribute("message", "※ 해당 사업자등록번호는 ["+ loginVO.getBusinessNo() +"] 회원으로 등록되어 있습니다. ");
			return "cmmn/loginView";
		}
		model.addAttribute("step", "step1confirm");

		return "usr/registStep1Confirm";
	}

	/**
	 * 회원가입프로세스 2단계
	 * @param loginVO - 조회할 정보가 담긴 LoginVO
	 * @param model
	 * @return "registStep2"
	 * @exception Exception
	 */
	@RequestMapping(value = "/usr/registStep2.do")
	public String RegistStep2(@ModelAttribute("loginVO") LoginVO loginVO, ModelMap model) throws Exception {

		if (loginVO == null || loginVO.getBusinessNo() == null || loginVO.getBusinessNo().equals("")){
			return "redirect:/usr/registStep1.do";
		}
		model.addAttribute("step", "step2");

		return "usr/registStep2";
	}

	/**
	 * 회원가입프로세스 3단계
	 * @param loginVO - 조회할 정보가 담긴 LoginVO
	 * @param model
	 * @return "registStep3"
	 * @exception Exception
	 */
	@RequestMapping(value = "/usr/registStep3.do")
	public String RegistStep3(@ModelAttribute("loginVO") LoginVO loginVO, ModelMap model) throws Exception {

		if (loginVO == null || loginVO.getBusinessNo() == null || loginVO.getBusinessNo().equals("")){
			return "redirect:/usr/registStep1.do";
		}
		model.addAttribute("step", "step3");

		return "usr/registStep3";
	}

	/**
	 * ID 중복여부를 체크한다.
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/usr/registStep3.json", method=RequestMethod.POST)
	@ResponseBody
	public String registStep3Json(@RequestParam("id") String userId)
			throws Exception {
		String retVal = "0";
		
		if(registService.checkUserId(userId)) retVal = "1";
				
		return retVal;
	}

	/**
	 * 회원가입프로세스 3단계 확인
	 * @param loginVO - 조회할 정보가 담긴 LoginVO
	 * @param model
	 * @return "registStep3Confirm"
	 * @exception Exception
	 */
	@RequestMapping(value = "/usr/registStep3Confirm.do")
	public String RegistStep3Confirm(@ModelAttribute("registVO") RegistVO registVO, ModelMap model) throws Exception {

		registService.insertRegist(registVO);
		model.addAttribute("step", "step3confirm");

		return "usr/registStep3Confirm";
	}

	/**
	 * 회원가입프로세스 완료단계
	 * @param model
	 * @return "registComplete"
	 * @exception Exception
	 */
	@RequestMapping(value = "/usr/registComplete.do")
	public String RegistComplete(@ModelAttribute("registVO") RegistVO registVO, ModelMap model) throws Exception {

		registService.insertRegist(registVO);
		model.addAttribute("step", "registComplete");

		return "usr/registComplete";
	}

	/**
	 * 회원정보 수정 페이지
	 * @param loginVO - 조회할 정보가 담긴 LoginVO
	 * @param model
	 * @return "userInfoModify"
	 * @exception Exception
	 */
	@RequestMapping(value = "/usr/userInfoModify.do")
	public String UserInfoModify(@ModelAttribute("registVO") RegistVO registVO, ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() == null) return "redirect:/login.do";
		LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		if(user == null) return "redirect:/login.do";
		
		user.setUserId(user.getUserId());
		registVO = registService.selectRegist(user);
		model.addAttribute("step", "userInfoModify");
		model.addAttribute("registVO", registVO);

		return "usr/userInfoModify";
	}

	/**
	 * 회원정보를 수정한다.
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/usr/userInfoModify.json", method=RequestMethod.POST)
	@ResponseBody
	public String UserInfoModifyJson(RegistVO registVO)
			throws Exception {
		String retVal = "0";
		
		if(registService.updateRegist(registVO)) retVal = "100";
				
		return retVal;
	}

	/**
	 * 모비스 회원가입프로세스 1단계
	 * @param model
	 * @return "registStep1"
	 * @exception Exception
	 */
	@RequestMapping(value = "/mobis/registStep1.do")
	public String MobisRegistStep1(ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() != null){
			LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
			if(user != null) return "redirect:/login.do";
		}
		
		model.addAttribute("step", "step1");

		return "usr/mobisStep1";
	}

	/**
	 * 모비스 회원가입프로세스 2단계
	 * @param model
	 * @return "registStep2"
	 * @exception Exception
	 */
	@RequestMapping(value = "/mobis/registStep2.do")
	public String MobisRegistStep2(ModelMap model) throws Exception {

		if (RequestContextHolder.getRequestAttributes() != null){
			LoginVO user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
			if(user != null) return "redirect:/login.do";
		}
		model.addAttribute("step", "step2");

		return "usr/mobisStep2";
	}

	/**
	 * 회원가입프로세스 완료단계
	 * @param model
	 * @return "registComplete"
	 * @exception Exception
	 */
	@RequestMapping(value = "/mobis/registComplete.do")
	public String MobisRegistComplete(@ModelAttribute("registVO") RegistVO registVO, MultipartHttpServletRequest multiRequest, 
			BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {

		List<FileVO> result = null;
		String atchFileId = "";
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if (!files.isEmpty()) {
			result = fileUtil.parseFileInf(files, "MOBIS_", 0, "", "");
			atchFileId = fileMngService.insertFileInfs(result);
		}
		registVO.setAtchFileId(atchFileId);
		String bizNo = egovIdGnrService.getNextStringId();
		registVO.setBusinessNo(bizNo);
		registService.insertRegist(registVO);
		model.addAttribute("step", "registComplete");

		return "usr/mobisComplete";
	}
}
