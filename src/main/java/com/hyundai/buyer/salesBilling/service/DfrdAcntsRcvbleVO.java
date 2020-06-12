package com.hyundai.buyer.salesBilling.service;

import com.hyundai.cmmn.service.DefaultVO;

/**
 * @Class Name : DfrdAcntsRcvbleVO.java
 * @Description : Buyer DfrdAcntsRcvbleVO Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.26   CDF Team    최초생성
 *
 * @author CDF 개발팀
 * @since 2018.11.26
 * @version 1.0
 *
 */

public class DfrdAcntsRcvbleVO extends DefaultVO {

	/** serialVersion UID */
	private static final long serialVersionUID = 4055112039242847956L;

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
	private long amount;

	/** 적수 */
	private int expirationAvg;

	public String getMembClass() {
		return membClass;
	}

	public void setMembClass(String membClass) {
		this.membClass = membClass;
	}

	public String getTransactionNo() {
		return transactionNo;
	}

	public void setTransactionNo(String transactionNo) {
		this.transactionNo = transactionNo;
	}

	public String getTaxbillNo() {
		return taxbillNo;
	}

	public void setTaxbillNo(String taxbillNo) {
		this.taxbillNo = taxbillNo;
	}

	public String getGroupType() {
		return groupType;
	}

	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}

	public String getBuyerBizNo() {
		return buyerBizNo;
	}

	public void setBuyerBizNo(String buyerBizNo) {
		this.buyerBizNo = buyerBizNo;
	}

	public String getBuyerCoNm() {
		return buyerCoNm;
	}

	public void setBuyerCoNm(String buyerCoNm) {
		this.buyerCoNm = buyerCoNm;
	}

	public String getSellerBizNo() {
		return sellerBizNo;
	}

	public void setSellerBizNo(String sellerBizNo) {
		this.sellerBizNo = sellerBizNo;
	}

	public String getSellerCoNm() {
		return sellerCoNm;
	}

	public void setSellerCoNm(String sellerCoNm) {
		this.sellerCoNm = sellerCoNm;
	}

	public String getSalesDate() {
		return salesDate;
	}

	public void setSalesDate(String salesDate) {
		this.salesDate = salesDate;
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

	public String getProgressFlag() {
		return progressFlag;
	}

	public void setProgressFlag(String progressFlag) {
		this.progressFlag = progressFlag;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

	public int getExpirationAvg() {
		return expirationAvg;
	}

	public void setExpirationAvg(int expirationAvg) {
		this.expirationAvg = expirationAvg;
	}
}
