/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.hyundai.usr.service.impl;

import org.springframework.stereotype.Repository;

import com.hyundai.cmmn.service.LoginVO;
import com.hyundai.usr.service.RegistVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * 회원가입 프로세스에 관한 데이터처리 매퍼 클래스
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
@Repository("registMapper")
public class RegistMapper extends EgovAbstractMapper {

	/**
	 * 회원정보를 DB로부터 읽어온다.
	 * @param vo LoginVO
	 * @return RegistVO
	 * @exception Exception
	 */
	public RegistVO selectRegist(LoginVO vo){
		return (RegistVO)selectOne("selectRegist",vo);
	}

	/**
	 * 새 맴버를 회원정보에 집어넣는다
	 * @param vo - RegistVO
	 * @return void형
	 * @exception Exception
	 */
	public void insertUser(RegistVO vo){
		insert("insertUser", vo);
	}

	public void insertRegist(RegistVO vo){
		insert("insertRegist", vo);
	}

	/**
	 * 회원정보를 수정한다.
	 * @param vo - 수정할 정보가 담긴 RegistVO
	 * @return void형
	 * @exception Exception
	 */
	public void updateUser(RegistVO vo){
		update("updateUser", vo);
	}

	public void updateRegist(RegistVO vo){
		update("updateRegist", vo);
	}

}
