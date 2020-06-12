package com.hyundai.buyer.companysBilling.service;

import java.io.Serializable;

/**
 * @Class Name : CompanysBillingVO.java
 * @Description : Buyer CompanysBillingVO Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.15   CDF Team    최초생성
 *
 * @author CDF 개발팀
 * @since 2018.11.15
 * @version 1.0
 *
 */

public class CompanysBillingVO implements Serializable {

	/** serialVersion UID */
	private static final long serialVersionUID = -191622981990544990L;

	/* 품목점 코드 */
	private String sellerMembNo;

	/** 품목점 사업자 번호 */
	private String sellerBizNo;

	/** 품목점명 */
	private String sellerCompanyName;

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

	public String getSellerMembNo() {
		return sellerMembNo;
	}

	public void setSellerMembNo(String sellerMembNo) {
		this.sellerMembNo = sellerMembNo;
	}

	public String getSellerBizNo() {
		return sellerBizNo;
	}

	public void setSellerBizNo(String sellerBizNo) {
		this.sellerBizNo = sellerBizNo;
	}

	public String getSellerCompanyName() {
		return sellerCompanyName;
	}

	public void setSellerCompanyName(String sellerCompanyName) {
		this.sellerCompanyName = sellerCompanyName;
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

	public void setSalesAmount(int salesAmount) {
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
