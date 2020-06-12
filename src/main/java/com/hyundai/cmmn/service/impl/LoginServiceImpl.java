package com.hyundai.cmmn.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.cmmn.EgovFileScrty;
import com.hyundai.cmmn.service.LoginService;
import com.hyundai.cmmn.service.LoginVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("loginService")
public class LoginServiceImpl extends EgovAbstractServiceImpl implements LoginService {

	private static final Logger LOGGER = LoggerFactory.getLogger(LoginServiceImpl.class);

	@Resource(name="loginMapper")
	private LoginMapper loginDAO;

    /**
     * 2018.11.14
	 * administrator가 대리점이나 품목점으로 들어갈때 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	@Override
	public LoginVO actionSSOLogin(LoginVO vo) throws Exception {
		LoginVO loginVO = loginDAO.actionSSOLogin(vo);

		// 3. 결과를 리턴한다.
		if (loginVO != null && !loginVO.getUserId().equals("") && !loginVO.getUserPw().equals("")) {
			// 마지막 로그인 날짜를 수정한다.
			Calendar calendar = Calendar.getInstance();
			DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			String today = dateFormat.format(calendar.getTime());
			String lastDate = loginVO.getLastDate();

			if (lastDate == null || !today.equals(lastDate)) {
				loginDAO.updateLogin(loginVO);
				// 오늘 최초 로그인 true
				loginVO.setIsFirstLogin("Y");
			} else {
				// 오늘 최초 로그인 false
				loginVO.setIsFirstLogin("N");
			}

			return loginVO;
		} else {
			loginVO = new LoginVO();
		}

		return loginVO;
	}

    @Override
	public LoginVO actionLogin(LoginVO vo) throws Exception {
    	// 1. 입력한 비밀번호를 암호화한다.
//		String enpassword = EgovFileScrty.encryptPassword(vo.getUserPw(), vo.getUserId());
//    	vo.setUserPw(enpassword);

    	// 2. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
    	LoginVO loginVO = loginDAO.actionLogin(vo);

    	// 3. 결과를 리턴한다.
    	if (loginVO != null && !loginVO.getUserId().equals("") && !loginVO.getUserPw().equals("")) {
    		return loginVO;
    	} else {
    		loginVO = new LoginVO();
    	}

    	return loginVO;
	}

	@Override
	public LoginVO actionCrtfctLogin(LoginVO vo) throws Exception {
    	// 1. DN값으로 ID, PW를 조회한다.
    	LoginVO loginVO = loginDAO.actionCrtfctLogin(vo);

    	// 3. 결과를 리턴한다.
    	if (loginVO != null && !loginVO.getUserId().equals("") && !loginVO.getUserPw().equals("")) {
    		return loginVO;
    	} else {
    		loginVO = new LoginVO();
    	}

    	return loginVO;
	}

	@Override
	public LoginVO searchId(LoginVO vo) throws Exception {
    	// 1. 이름, 이메일주소가 DB와 일치하는 사용자 ID를 조회한다.
    	LoginVO loginVO = loginDAO.searchId(vo);

    	// 2. 결과를 리턴한다.
    	if (loginVO != null && !loginVO.getUserId().equals("")) {
    		return loginVO;
    	} else {
    		loginVO = new LoginVO();
    	}

    	return loginVO;
	}

	@Override
	public boolean searchPassword(LoginVO vo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
