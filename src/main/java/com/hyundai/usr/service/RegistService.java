package com.hyundai.usr.service;

import com.hyundai.cmmn.service.LoginVO;

/**
 * 회원가입 프로세스를 처리하는 비즈니스 인터페이스 클래스
 * @author CDF Team
 * @since 2018.11.16
 * @version 1.0
 *  
 * <pre>
 * << 개정이력(Modification Information) >>
 * 
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2018.11.16  CDF Team          최초 생성 
 *  </pre>
 */
public interface RegistService {

    /**
	 * 입력한 사업자번호가 회원으로 등록되어 있는지 db에서 조회한다.
	 * @param String
	 * @return boolean
	 * @exception Exception
	 */
    boolean isRegistered(String businessNo) throws Exception;

    /**
	 * 입력한 아이디가 회원으로 등록되어 있는지 db에서 조회한다.
	 * @param String
	 * @return boolean
	 * @exception Exception
	 */
    boolean checkUserId(String userId) throws Exception;

    /**
	 * 새로운 회원을 db에 등록한다.
	 * @param vo RegistVO
	 * @return void
	 * @exception Exception
	 */
    void insertRegist(RegistVO vo) throws Exception;

    /**
	 * 회원정보를 수정한 내용을 db에 등록한다.
	 * @param vo RegistVO
	 * @return void
	 * @exception Exception
	 */
    boolean updateRegist(RegistVO vo) throws Exception;

    /**
	 * 회원정보를 DB로부터 읽어온다.
	 * @param vo LoginVO
	 * @return RegistVO
	 * @exception Exception
	 */
    RegistVO selectRegist(LoginVO vo) throws Exception;
}
