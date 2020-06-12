package com.hyundai.cmmn.service.impl;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

import org.springframework.stereotype.Repository;

import com.hyundai.cmmn.service.LoginVO;

/**
 * 일반 로그인, 인증서 로그인을 처리하는 DAO 클래스
 * @author CDF Team
 * @since 2018.11.14
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2018.11.14  CDF Team          최초 생성
 *  </pre>
 */
@Repository("loginMapper")
public class LoginMapper extends EgovAbstractMapper {

	/**
	 * 2018.11.14 administrator가 대리점이나 품목점으로 들어갈때 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO actionSSOLogin(LoginVO vo) throws Exception {
		return (LoginVO) selectOne("actionSSOLogin", vo);
	}

	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO actionLogin(LoginVO vo) throws Exception {
		return (LoginVO) selectOne("actionLogin", vo);
	}

	/**
	 * 인증서 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO actionCrtfctLogin(LoginVO vo) throws Exception {

		return (LoginVO) selectOne("actionCrtfctLogin", vo);
	}

	/**
	 * 아이디를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO searchId(LoginVO vo) throws Exception {

		return (LoginVO) selectOne("searchId", vo);
	}

	/**
	 * 비밀번호를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO searchPassword(LoginVO vo) throws Exception {

		return (LoginVO) selectOne("searchPassword", vo);
	}

	/**
	 * 변경된 비밀번호를 저장한다.
	 * @param vo LoginVO
	 * @exception Exception
	 */
	public void updatePassword(LoginVO vo) throws Exception {
		update("updatePassword", vo);
	}

	/**
	 * 변경된 비밀번호를 저장한다.
	 * @param vo LoginVO
	 * @exception Exception
	 */
	public void updateLogin(LoginVO vo) throws Exception {
		update("updateLogin", vo);
	}

}
