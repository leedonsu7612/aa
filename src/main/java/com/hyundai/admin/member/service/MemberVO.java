package com.hyundai.admin.member.service;

import com.hyundai.cmmn.service.DefaultVO;

/**
 * @Class Name : MemberVO.java
 * @Description : MemberVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.02   CDF Team        최초생성
 *
 * @author CDF 개발팀
 * @since 2018.11.02
 * @version 1.0
 *
 */
public class MemberVO extends DefaultVO {

	private static final long serialVersionUID = 1L;

	/* 코드 */
	private String membNo;
	
	/* 구분 */
	private String membClass;
	
	/* 상점명 */
	private String companyName;
	
	/* 사업자번호 */
	private String businessNo;
	
	/* 대표자명 */
	private String ceoName;
	
	/* 상점상태 */
	private String comSttsCd;
	
	/* 수정일자 */
	private String lastDate;
	
	/* 연체중 */
	private String dishonoredType;

	/* 등록일자 */
	private String regDate;
	
	/**
	 * @return the membNo
	 */
	public String getMembNo() {
		return membNo;
	}

	/**
	 * @param membNo the membNo to set
	 */
	public void setMembNo(String membNo) {
		this.membNo = membNo;
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
	 * @return the ceoName
	 */
	public String getCeoName() {
		return ceoName;
	}

	/**
	 * @param ceoName the ceoName to set
	 */
	public void setCeoName(String ceoName) {
		this.ceoName = ceoName;
	}

	/**
	 * @return the dishonoredType
	 */
	public String getDishonoredType() {
		return dishonoredType;
	}

	/**
	 * @param dishonoredType the dishonoredType to set
	 */
	public void setDishonoredType(String dishonoredType) {
		this.dishonoredType = dishonoredType;
	}

	/**
	 * @return the comSttsCd
	 */
	public String getComSttsCd() {
		return comSttsCd;
	}

	/**
	 * @param comSttsCd the comSttsCd to set
	 */
	public void setComSttsCd(String comSttsCd) {
		this.comSttsCd = comSttsCd;
	}

	/**
	 * @return the lastDate
	 */
	public String getLastDate() {
		return lastDate;
	}

	/**
	 * @param lastDate the lastDate to set
	 */
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	/**
	 * @return the regDate
	 */
	public String getRegDate() {
		return regDate;
	}

	/**
	 * @param regDate the regDate to set
	 */
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
}
