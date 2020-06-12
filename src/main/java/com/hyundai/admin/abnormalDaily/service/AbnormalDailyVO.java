package com.hyundai.admin.abnormalDaily.service;

import com.hyundai.cmmn.service.DefaultVO;

/**
 * @Class Name : AbnormalDailyVO.java
 * @Description : AbnormalDailyVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.20   CDF Team        최초생성
 *
 * @author CDF 개발팀
 * @since 2018.11.20
 * @version 1.0
 *
 */
public class AbnormalDailyVO extends DefaultVO {

	private static final long serialVersionUID = 1L;

	/* 대상월 */
	private String regDate;

	/* 상호 */
	private String companyName;

	/* 사업자번호 */
	private String businessNo;

	/* 코드 */
	private String membNo;

	/* 부여한도 */
	private int salesLimit;

	/* 잔여한도 */
	private int remainingLimit;

	/* 초과한도 */
	private int overLimit;

	/* 거래액 */
	private int tradeAmt;

	/* 이상거래액 */
	private int abnormalAmt;

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
	 * @return the salesLimit
	 */
	public int getSalesLimit() {
		return salesLimit;
	}

	/**
	 * @param salesLimit the salesLimit to set
	 */
	public void setSalesLimit(int salesLimit) {
		this.salesLimit = salesLimit;
	}

	/**
	 * @return the remainingLimit
	 */
	public int getRemainingLimit() {
		return remainingLimit;
	}

	/**
	 * @param remainingLimit the remainingLimit to set
	 */
	public void setRemainingLimit(int remainingLimit) {
		this.remainingLimit = remainingLimit;
	}

	/**
	 * @return the overLimit
	 */
	public int getOverLimit() {
		return overLimit;
	}

	/**
	 * @param overLimit the overLimit to set
	 */
	public void setOverLimit(int overLimit) {
		this.overLimit = overLimit;
	}

	/**
	 * @return the abnormalAmt
	 */
	public int getAbnormalAmt() {
		return abnormalAmt;
	}

	/**
	 * @param abnormalAmt the abnormalAmt to set
	 */
	public void setAbnormalAmt(int abnormalAmt) {
		this.abnormalAmt = abnormalAmt;
	}

	/**
	 * @return the tradeAmt
	 */
	public int getTradeAmt() {
		return tradeAmt;
	}

	/**
	 * @param tradeAmt the tradeAmt to set
	 */
	public void setTradeAmt(int tradeAmt) {
		this.tradeAmt = tradeAmt;
	}


}
