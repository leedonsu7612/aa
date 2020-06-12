package com.hyundai.cmmn.service;

import java.io.Serializable;

/**
 * 세션 VO 클래스
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
 *  2018.11.14    CDF Team          최초 생성 
 *  
 *  </pre>
 */
@SuppressWarnings("serial")
public class SessionVO implements Serializable {
	
	/** 아이디 */
	private String sUserId;
	/** 사업자번호 */
	private String sBusinessNo;
	/** 사용자구분 */
	private String sMembClass;
	
	/**
	 * @return the sUserId
	 */
	public String getsUserId() {
		return sUserId;
	}
	/**
	 * @param sUserId the sUserId to set
	 */
	public void setsUserId(String sUserId) {
		this.sUserId = sUserId;
	}
	/**
	 * @return the sBusinessNo
	 */
	public String getsBusinessNo() {
		return sBusinessNo;
	}
	/**
	 * @param sBusinessNo the sBusinessNo to set
	 */
	public void setsBusinessNo(String sBusinessNo) {
		this.sBusinessNo = sBusinessNo;
	}
	/**
	 * @return the sMembClass
	 */
	public String getsMembClass() {
		return sMembClass;
	}
	/**
	 * @param sMembClass the sMembClass to set
	 */
	public void setsMembClass(String sMembClass) {
		this.sMembClass = sMembClass;
	}
}
