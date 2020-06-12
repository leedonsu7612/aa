package com.hyundai.seller.companysBilling.service;

import java.io.Serializable;

/**
 * @Class Name : CompanysBillingVO.java
 * @Description : seller CompanysBillingVO Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.15   CDF Team    최초생성
 *
 * @author CDF 개발팀
 * @since 2018.12.03
 * @version 1.0
 *
 */

public class CompanysBillingVO implements Serializable {

	/** serialVersion UID */
	private static final long serialVersionUID = 4074134451524296489L;

	/* 대리점 코드 */
	private String buyerMembNo;

	/** 대리점 사업자 번호 */
	private String buyerBizNo;

	/** 대리점명 */
	private String buyerCompanyName;

	/** 지급 대상(조회월-2 이전) */
	private long salesAmount2;

	/** 지급 대상(조회월-1) */
	private long salesAmount1;

	/** 지급 대상(조회월) */
	private long salesAmount;

	/** 당월지급 */
	private int collectAmount;

	/** 지급율 */
	private float collectAmountRate;

	/** 미지급금 */
	private long endAmount;

	/** 적수 */
	private int expirationAvg;

	public String getBuyerMembNo() {
		return buyerMembNo;
	}

	public void setBuyerMembNo(String buyerMembNo) {
		this.buyerMembNo = buyerMembNo;
	}

	public String getBuyerBizNo() {
		return buyerBizNo;
	}

	public void setBuyerBizNo(String buyerBizNo) {
		this.buyerBizNo = buyerBizNo;
	}

	public String getBuyerCompanyName() {
		return buyerCompanyName;
	}

	public void setBuyerCompanyName(String buyerCompanyName) {
		this.buyerCompanyName = buyerCompanyName;
	}

	public long getSalesAmount2() {
		return salesAmount2;
	}

	public void setSalesAmount2(long salesAmount2) {
		this.salesAmount2 = salesAmount2;
	}

	public long getSalesAmount1() {
		return salesAmount1;
	}

	public void setSalesAmount1(long salesAmount1) {
		this.salesAmount1 = salesAmount1;
	}

	public long getSalesAmount() {
		return salesAmount;
	}

	public void setSalesAmount(long salesAmount) {
		this.salesAmount = salesAmount;
	}

	public int getCollectAmount() {
		return collectAmount;
	}

	public void setCollectAmount(int collectAmount) {
		this.collectAmount = collectAmount;
	}

	public float getCollectAmountRate() {
		return collectAmountRate;
	}

	public void setCollectAmountRate(float collectAmountRate) {
		this.collectAmountRate = collectAmountRate;
	}

	public long getEndAmount() {
		return endAmount;
	}

	public void setEndAmount(long endAmount) {
		this.endAmount = endAmount;
	}

	public int getExpirationAvg() {
		return expirationAvg;
	}

	public void setExpirationAvg(int expirationAvg) {
		this.expirationAvg = expirationAvg;
	}

}
