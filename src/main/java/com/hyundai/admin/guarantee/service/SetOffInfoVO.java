package com.hyundai.admin.guarantee.service;

import com.hyundai.cmmn.service.DefaultVO;

/**
 * @Class Name : SetOffInfoVO.java
 * @Description : SetOffInfoVO Class
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

public class SetOffInfoVO extends DefaultVO {

	/** serialVersion UID */
	private static final long serialVersionUID = 1L;

	/* 구분 */
	private String membClass;
	
	/** 상계수금번호 */
	private String transactionNo;

	/** 품목점 사업자번호 */
	private String sellerBizNo;

	/* 품목점명 */
	private String sellerCoNm;
	
	/** 대리점 사업자번호 */
	private String buyerBizNo;

	/* 대리점명 */
	private String buyerCoNm;
	
	/** 매출월 */
	private String salesDate;

	/** 발행일 */
	private String issueDate;

	/** 만기일 */
	private String expirationDate;

	/** 지불일 */
	private String paymentDate;

	/** 금액 */
	private int amount;

	/** 수금금액 */
	private int collectMoney;

	/** 진행상태 코드 (31:상계수금요청, 30:상계수금승인, 39:상계수금취소) */
	private String progressFlag;

	/** 적수 */
	private int expirationAvg;

	/** 그룹타입 (0 : 현대, 1 : 기아, 2 : 전체) */
	private String groupType;

	public String getTransactionNo() {
		return transactionNo;
	}

	public void setTransactionNo(String transactionNo) {
		this.transactionNo = transactionNo;
	}

	public String getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}

	public String getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getCollectMoney() {
		return collectMoney;
	}

	public void setCollectMoney(int collectMoney) {
		this.collectMoney = collectMoney;
	}

	public String getProgressFlag() {
		return progressFlag;
	}

	public void setProgressFlag(String progressFlag) {
		this.progressFlag = progressFlag;
	}

	public int getExpirationAvg() {
		return expirationAvg;
	}

	public void setExpirationAvg(int expirationAvg) {
		this.expirationAvg = expirationAvg;
	}

	public String getGroupType() {
		return groupType;
	}

	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}

	public String getSellerBizNo() {
		return sellerBizNo;
	}

	public void setSellerBizNo(String sellerBizNo) {
		this.sellerBizNo = sellerBizNo;
	}

	public String getBuyerBizNo() {
		return buyerBizNo;
	}

	public void setBuyerBizNo(String buyerBizNo) {
		this.buyerBizNo = buyerBizNo;
	}

	public String getSalesDate() {
		return salesDate;
	}

	public void setSalesDate(String salesDate) {
		this.salesDate = salesDate;
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
