package com.hyundai.cmmn.service;

import java.io.Serializable;

/**
 * @Class Name : LoginVO.java
 * @Description : Login VO class
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2018.11.14    CDF Team          최초 생성
 *
 *  @author CDF Team
 *  @since 2018.11.14
 *  @version 1.0
 *  @see
 *
 */
public class LoginVO implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = -8274004534207618049L;

	/** 아이디 */
	private String userId;
	/** 비밀번호 */
	private String userPw;
	/** 사업자번호 */
	private String businessNo;
	/** 사용자구분 */
	private String membClass;
	/** 상점명 */
	private String companyName;
	/** 마지막 로그인 날짜 */
	private String lastDate;
	/** 오늘 최초 로그인 여부 */
	private String isFirstLogin;

	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * @return the userPw
	 */
	public String getUserPw() {
		return userPw;
	}

	/**
	 * @param userPw the userPw to set
	 */
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	/**
	 * @return the businessNo
	 */
	public String getBusinessNo() {
		return businessNo;
	}

	/**
	 * @param businessNo the businessNo to set
	 */
	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}

	/**
	 * @return the membClass
	 */
	public String getMembClass() {
		return membClass;
	}

	/**
	 * @param membClass the membClass to set
	 */
	public void setMembClass(String membClass) {
		this.membClass = membClass;
	}

	/**
	 * @return the companyName
	 */
	public String getCompanyName() {
		return companyName;
	}

	/**
	 * @param companyName the companyName to set
	 */
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;

	}

	public String getIsFirstLogin() {
		return isFirstLogin;
	}

	public void setIsFirstLogin(String isFirstLogin) {
		this.isFirstLogin = isFirstLogin;
	}

}
