package com.hyundai.admin.guarantee.service;

import java.io.Serializable;

/**
 * @Class Name : UnissuedVO.java
 * @Description : UnissuedVO Class
 * @Modification Information
 * @
 * @  수정일      수정자       수정내용
 * @ ---------   ----------   -------------------------------
 * @ 2018.11.28   CDF Team     최초생성
 *
 * @author CDF 개발팀
 * @since 2018.11.28
 * @version 1.0
 *
 */

public class UnissuedVO implements Serializable {

	/** serialVersion UID */
	private static final long serialVersionUID = 1L;

	/* 구분 */
	private String membClass;
	
	/** 품목점 사업자번호 */
	private String sellerBizNo;

	/* 품목점명 */
	private String sellerCoNm;
	
	/** 대리점 사업자번호 */
	private String buyerBizNo;

	/* 대리점명 */
	private String buyerCoNm;
	
	/** 매출일 */
	private String salesDate;

	/** 매출액 */
	private int salesAmount;

	/** 세금계산서번호 */
	private String taxbillNo;

	/** 매출채권발행 금액 */
	private int receivableAmount;

	/** 기타수금 금액 */
	private int extraAmount;

	/** 상계수금 금액 */
	private int setoffAmount;

	/** 미발행 금액 */
	private int unissuedAmount;

	/** 강제미발행 금액 */
	private int forceAmount;

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
	 * @return the sellerBizNo
	 */
	public String getSellerBizNo() {
		return sellerBizNo;
	}

	/**
	 * @param sellerBizNo the sellerBizNo to set
	 */
	public void setSellerBizNo(String sellerBizNo) {
		this.sellerBizNo = sellerBizNo;
	}

	/**
	 * @return the sellerCoNm
	 */
	public String getSellerCoNm() {
		return sellerCoNm;
	}

	/**
	 * @param sellerCoNm the sellerCoNm to set
	 */
	public void setSellerCoNm(String sellerCoNm) {
		this.sellerCoNm = sellerCoNm;
	}

	/**
	 * @return the buyerBizNo
	 */
	public String getBuyerBizNo() {
		return buyerBizNo;
	}

	/**
	 * @param buyerBizNo the buyerBizNo to set
	 */
	public void setBuyerBizNo(String buyerBizNo) {
		this.buyerBizNo = buyerBizNo;
	}

	/**
	 * @return the buyerCoNm
	 */
	public String getBuyerCoNm() {
		return buyerCoNm;
	}

	/**
	 * @param buyerCoNm the buyerCoNm to set
	 */
	public void setBuyerCoNm(String buyerCoNm) {
		this.buyerCoNm = buyerCoNm;
	}

	/**
	 * @return the salesDate
	 */
	public String getSalesDate() {
		return salesDate;
	}

	/**
	 * @param salesDate the salesDate to set
	 */
	public void setSalesDate(String salesDate) {
		this.salesDate = salesDate;
	}

	/**
	 * @return the salesAmount
	 */
	public int getSalesAmount() {
		return salesAmount;
	}

	/**
	 * @param salesAmount the salesAmount to set
	 */
	public void setSalesAmount(int salesAmount) {
		this.salesAmount = salesAmount;
	}

	/**
	 * @return the taxbillNo
	 */
	public String getTaxbillNo() {
		return taxbillNo;
	}

	/**
	 * @param taxbillNo the taxbillNo to set
	 */
	public void setTaxbillNo(String taxbillNo) {
		this.taxbillNo = taxbillNo;
	}

	/**
	 * @return the receivableAmount
	 */
	public int getReceivableAmount() {
		return receivableAmount;
	}

	/**
	 * @param receivableAmount the receivableAmount to set
	 */
	public void setReceivableAmount(int receivableAmount) {
		this.receivableAmount = receivableAmount;
	}

	/**
	 * @return the extraAmount
	 */
	public int getExtraAmount() {
		return extraAmount;
	}

	/**
	 * @param extraAmount the extraAmount to set
	 */
	public void setExtraAmount(int extraAmount) {
		this.extraAmount = extraAmount;
	}

	/**
	 * @return the setoffAmount
	 */
	public int getSetoffAmount() {
		return setoffAmount;
	}

	/**
	 * @param setoffAmount the setoffAmount to set
	 */
	public void setSetoffAmount(int setoffAmount) {
		this.setoffAmount = setoffAmount;
	}

	/**
	 * @return the unissuedAmount
	 */
	public int getUnissuedAmount() {
		return unissuedAmount;
	}

	/**
	 * @param unissuedAmount the unissuedAmount to set
	 */
	public void setUnissuedAmount(int unissuedAmount) {
		this.unissuedAmount = unissuedAmount;
	}

	/**
	 * @return the forceAmount
	 */
	public int getForceAmount() {
		return forceAmount;
	}

	/**
	 * @param forceAmount the forceAmount to set
	 */
	public void setForceAmount(int forceAmount) {
		this.forceAmount = forceAmount;
	}


}
