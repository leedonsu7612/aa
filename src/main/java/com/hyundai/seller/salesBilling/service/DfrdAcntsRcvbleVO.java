package com.hyundai.seller.salesBilling.service;

import com.hyundai.cmmn.service.DefaultVO;

/**
 * @Class Name : SellerDfrdAcntsRcvbleVO.java
 * @Description : seller SellerDfrdAcntsRcvbleVO Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.12.1   CDF Team    최초생성
 *
 * @author CDF 개발팀
 * @since 2018.12.1
 * @version 1.0
 *
 */

public class DfrdAcntsRcvbleVO extends DefaultVO {

	/** serialVersion UID */
	private static final long serialVersionUID = 1L;

	/* 구분 */
	private String membClass;
	
	/** 매출채권번호 */
	private String transactionNo;

	/** 세금계산서번호 */
	private String taxbillNo;

	/** 매출구분 */
	private String groupType;

	/** 대리점 사업자 번호 */
	private String buyerBizNo;

	/** 대리점 상호 */
	private String buyerCoNm;

	/** 품목점 사업자 번호 */
	private String sellerBizNo;

	/** 품목점 상호 */
	private String sellerCoNm;

	/** 매출월 */
	private String salesDate;

	/** 발행일 */
	private String issueDate;

	/** 만기일 */
	private String expirationDate;

	/** 결제일 */
	private String paymentDate;

	/** 진행상태 */
	private String progressFlag;

	/** 채권금액 */
	private int amount;

	/** 적수 */
	private int expirationAvg;

	
	/**
	 * @return the transactionNo
	 */
	public String getTransactionNo() {
		return transactionNo;
	}

	/**
	 * @param transactionNo the transactionNo to set
	 */
	public void setTransactionNo(String transactionNo) {
		this.transactionNo = transactionNo;
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
	 * @return the groupType
	 */
	public String getGroupType() {
		return groupType;
	}

	/**
	 * @param groupType the groupType to set
	 */
	public void setGroupType(String groupType) {
		this.groupType = groupType;
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
	 * @return the issueDate
	 */
	public String getIssueDate() {
		return issueDate;
	}

	/**
	 * @param issueDate the issueDate to set
	 */
	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}

	/**
	 * @return the expirationDate
	 */
	public String getExpirationDate() {
		return expirationDate;
	}

	/**
	 * @param expirationDate the expirationDate to set
	 */
	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}

	/**
	 * @return the paymentDate
	 */
	public String getPaymentDate() {
		return paymentDate;
	}

	/**
	 * @param paymentDate the paymentDate to set
	 */
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	/**
	 * @return the progressFlag
	 */
	public String getProgressFlag() {
		return progressFlag;
	}

	/**
	 * @param progressFlag the progressFlag to set
	 */
	public void setProgressFlag(String progressFlag) {
		this.progressFlag = progressFlag;
	}

	/**
	 * @return the amount
	 */
	public int getAmount() {
		return amount;
	}

	/**
	 * @param amount the amount to set
	 */
	public void setAmount(int amount) {
		this.amount = amount;
	}

	/**
	 * @return the expirationAvg
	 */
	public int getExpirationAvg() {
		return expirationAvg;
	}

	/**
	 * @param expirationAvg the expirationAvg to set
	 */
	public void setExpirationAvg(int expirationAvg) {
		this.expirationAvg = expirationAvg;
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

}
