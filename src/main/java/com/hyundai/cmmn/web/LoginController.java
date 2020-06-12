package com.hyundai.cmmn.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.hyundai.cmmn.EgovMessageSource;
import com.hyundai.cmmn.service.LoginService;
import com.hyundai.cmmn.service.LoginVO;

@Controller
public class LoginController {

	/** EgovLoginService */
	@Resource(name = "loginService")
	private LoginService loginService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

	/**
	 * 로그인 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/login.do")
	public String loginView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		LoginVO user = null;
		if (RequestContextHolder.getRequestAttributes() != null){
			user = (LoginVO)RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		}

		if (user != null && user.getUserId() != null && !user.getUserId().equals("")) {
			String returnURL = "redirect:/admin/checkMemberList.do";
			if(user.getMembClass().equalsIgnoreCase("B")) returnURL = "redirect:/buyer/companysBilling/list.do";
			else if(user.getMembClass().equalsIgnoreCase("S")) returnURL = "redirect:/seller/companysBilling/list.do";
			
			return returnURL;

		} else {
			return "cmmn/loginView";
		}
	}

	/**
	 * 일반(세션) 로그인을 처리한다
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param request - 세션처리를 위한 HttpServletRequest
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
	@RequestMapping(value = "/loginB2BConfirm.do")
	public String actionLogin(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {

		LoginVO resultVO = null;
		if (loginVO.getUserPw() != null && !loginVO.getUserPw().equals("")) {
			// 1. 일반 로그인 처리
			resultVO = loginService.actionLogin(loginVO);
		}else{
			resultVO = loginService.actionSSOLogin(loginVO);
		}

		if (resultVO != null && resultVO.getUserId() != null && !resultVO.getUserId().equals("")) {

			// 2-1. 로그인 정보를 세션에 저장
			request.getSession().setAttribute("loginVO", resultVO);

			String returnURL = "redirect:/admin/checkMemberList.do";
			if(resultVO.getMembClass().equalsIgnoreCase("B")) returnURL = "redirect:/buyer/companysBilling/list.do";
			else if(resultVO.getMembClass().equalsIgnoreCase("S")) returnURL = "redirect:/seller/companysBilling/list.do";
			
			return returnURL;

		} else {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "cmmn/loginView";
		}
	}

	@RequestMapping(value = "/accessCompany.do")
	public String accessCompany(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {
		loginVO.setUserId(loginVO.getBusinessNo());
		LoginVO resultVO = loginService.actionSSOLogin(loginVO);

		if (resultVO != null && resultVO.getUserId() != null && !resultVO.getUserId().equals("")) {

			// 2-1. 로그인 정보를 세션에 저장
			request.getSession().setAttribute("loginVO", resultVO);

			String returnURL = "redirect:/admin/checkMemberList.do";
			if(resultVO.getMembClass().equalsIgnoreCase("B")) returnURL = "redirect:/buyer/companysBilling/list.do";
			else if(resultVO.getMembClass().equalsIgnoreCase("S")) returnURL = "redirect:/seller/companysBilling/list.do";
			
			return returnURL;

		} else {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "cmmn/loginView";
		}
	}

	/**
	 * 인증서 로그인을 처리한다
	 * @param vo - 주민번호가 담긴 LoginVO
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
	@RequestMapping(value = "/actionCrtfctLogin.do")
	public String actionCrtfctLogin(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

		/*
		// 1. GPKI 인증
		GPKIHttpServletResponse gpkiresponse = null;
		GPKIHttpServletRequest gpkirequest = null;
		String dn = "";
		try{
			gpkiresponse = new GPKIHttpServletResponse(response);
		    gpkirequest = new GPKIHttpServletRequest(request);
		    gpkiresponse.setRequest(gpkirequest);
		    X509Certificate cert = null;

		    byte[] signData = null;
		    byte[] privatekey_random = null;
		    String signType = "";
		    String queryString = "";

		    cert = gpkirequest.getSignerCert();
		    dn = cert.getSubjectDN();

		    java.math.BigInteger b = cert.getSerialNumber();
		    b.toString();
		    int message_type =  gpkirequest.getRequestMessageType();
		    if( message_type == gpkirequest.ENCRYPTED_SIGNDATA || message_type == gpkirequest.LOGIN_ENVELOP_SIGN_DATA ||
		        message_type == gpkirequest.ENVELOP_SIGNDATA || message_type == gpkirequest.SIGNED_DATA){
		        signData = gpkirequest.getSignedData();
		        if(privatekey_random != null) {
		            privatekey_random   = gpkirequest.getSignerRValue();
		        }
		        signType = gpkirequest.getSignType();
		    }
		    queryString = gpkirequest.getQueryString();
		}catch(Exception e){
			return "cmm/egovError";
		}

		// 2. 업무사용자 테이블에서 dn값으로 사용자의 ID, PW를 조회하여 이를 일반로그인 형태로 인증하도록 함
		if (dn != null && !dn.equals("")) {

			loginVO.setDn(dn);
			LoginVO resultVO = loginService.actionCrtfctLogin(loginVO);
		    if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("")) {

		    	//스프링 시큐리티패키지를 사용하는지 체크하는 로직
		    	if(EgovComponentChecker.hasComponent("egovAuthorManageService")){
		    		// 3-1. spring security 연동
		            return "redirect:/j_spring_security_check?j_username=" + resultVO.getUserSe() + resultVO.getId() + "&j_password=" + resultVO.getUniqId();

		    	}else{
		    		// 3-2. 로그인 정보를 세션에 저장
		        	request.getSession().setAttribute("loginVO", resultVO);
		    		return "redirect:/admin/checkMemberList.do";
		    	}


		    } else {
		    	model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
		    	return "egovframework/com/uat/uia/EgovLoginUsr";
		    }
		} else {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "egovframework/com/uat/uia/EgovLoginUsr";
		}
		*/
		return "cmmn/loginView";
	}

	/**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/logout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {

		request.getSession().setAttribute("loginVO", null);

		model.addAttribute("message", egovMessageSource.getMessage("info.logout.message"));
		return "cmmn/loginView";
	}

	/**
	 * 아이디를 찾는다.
	 * @param vo - 이름, 이메일주소, 사용자구분이 담긴 LoginVO
	 * @return result - 아이디
	 * @exception Exception
	 */
	@RequestMapping(value = "/searchId.do")
	public String searchId(@ModelAttribute("loginVO") LoginVO loginVO, ModelMap model) throws Exception {
		/*
		if (loginVO == null || loginVO.getCompanyName() == null || loginVO.getCompanyName().equals("") && loginVO.getEmail() == null || loginVO.getEmail().equals("")
				&& loginVO.getUserSe() == null || loginVO.getUserSe().equals("")) {
			return "egovframework/com/cmm/egovError";
		}

		// 1. 아이디 찾기
		loginVO.setName(loginVO.getCompanyName().replaceAll(" ", ""));
		LoginVO resultVO = loginService.searchId(loginVO);

		if (resultVO != null && resultVO.getUserId() != null && !resultVO.getUserId().equals("")) {

			model.addAttribute("resultInfo", "아이디는 " + resultVO.getUserId() + " 입니다.");
			return "egovframework/com/uat/uia/EgovIdPasswordResult";
		} else {
			model.addAttribute("resultInfo", egovMessageSource.getMessage("fail.common.idsearch"));
			return "egovframework/com/uat/uia/EgovIdPasswordResult";
		}*/
		return "cmmn/searchId";
	}

	/**
	 * 비밀번호를 찾는다.
	 * @param vo - 아이디, 이름, 이메일주소, 비밀번호 힌트, 비밀번호 정답, 사용자구분이 담긴 LoginVO
	 * @return result - 임시비밀번호전송결과
	 * @exception Exception
	 */
	@RequestMapping(value = "/searchPassword.do")
	public String searchPassword(@ModelAttribute("loginVO") LoginVO loginVO, ModelMap model) throws Exception {
		/*
		if (loginVO == null || loginVO.getUserId() == null || loginVO.getUserId().equals("") && loginVO.getCompanyName() == null || loginVO.getCompanyName().equals("") && loginVO.getEmail() == null
				|| loginVO.getEmail().equals("") && loginVO.getPasswordHint() == null || loginVO.getPasswordHint().equals("") && loginVO.getPasswordCnsr() == null
				|| loginVO.getPasswordCnsr().equals("") && loginVO.getUserSe() == null || loginVO.getUserSe().equals("")) {
			return "egovframework/com/cmm/egovError";
		}

		// 1. 비밀번호 찾기
		boolean result = loginService.searchPassword(loginVO);

		// 2. 결과 리턴
		if (result) {
			model.addAttribute("resultInfo", "임시 비밀번호를 발송하였습니다.");
			return "egovframework/com/uat/uia/EgovIdPasswordResult";
		} else {
			model.addAttribute("resultInfo", egovMessageSource.getMessage("fail.common.pwsearch"));
			return "egovframework/com/uat/uia/EgovIdPasswordResult";
		}*/
		return "cmmn/searchPassword";
	}

	/**
	 * HELP View.
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/help.do")
	public String helpView(HttpServletRequest request, ModelMap model) throws Exception {

		return "cmmn/help";
	}
}