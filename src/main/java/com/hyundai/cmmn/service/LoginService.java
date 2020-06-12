package com.hyundai.cmmn.service;

import com.hyundai.cmmn.service.LoginVO;

/**
 * 일반 로그인, 인증서 로그인을 처리하는 비즈니스 인터페이스 클래스
 * @author CDF Team
 * @since 2018.11.14
 * @version 1.0
 *  
 * <pre>
 * << 개정이력(Modification Information) >>
 * 
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2018.11.14  CDF Team          최초 생성 
 *  </pre>
 */
public interface LoginService {
    /**
     * 2018.11.14
	 * administrator가 대리점이나 품목점으로 들어갈때 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    LoginVO actionSSOLogin(LoginVO vo) throws Exception;

    /**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    LoginVO actionLogin(LoginVO vo) throws Exception;
    
    /**
	 * 인증서 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    LoginVO actionCrtfctLogin(LoginVO vo) throws Exception;
    
    /**
	 * 아이디를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    LoginVO searchId(LoginVO vo) throws Exception;
    
    /**
	 * 비밀번호를 찾는다.
	 * @param vo LoginVO
	 * @return boolean
	 * @exception Exception
	 */
    boolean searchPassword(LoginVO vo) throws Exception;
}
