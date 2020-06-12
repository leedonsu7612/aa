package com.hyundai.buyer.payment.service;

import java.io.Serializable;

/**
 * @Class Name : PaymentVO.java
 * @Description : Buyer PaymentVO Class
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

public class PaymentVO implements Serializable {

	/** serialVersion UID */
	private static final long serialVersionUID = 8430218497009205291L;

	/** 품목점 상점명 */
	private String sellerCompanyName;

	/** 품목점 사업자번호 */
	private String sellerBizNo;

	/** 품목점 회원번호 */
	private String sellerMembNo;

	/** 매출구분 */
	private String groupType;

	/** 발행일 */
	private String issueDate;

	/** 만기일 */
	private String expirationDate;

	/** 결제일 */
	private String paymentDate;

	/** 금액 */
	private long amount;

	/** 매출채권번호 */
	private String transactionNo;

	/** 세금계산서 번호 */
	private String taxbillNo;

	/** 적수 */
	private int expirationAvg;

	/** 진행상태(1:미발행,0:발행완료) */
	private String sendStatus;

	public String getSellerCompanyName() {
		return sellerCompanyName;
	}

	public void setSellerCompanyName(String sellerCompanyName) {
		this.sellerCompanyName = sellerCompanyName;
	}

	public String getSellerBizNo() {
		return sellerBizNo;
	}

	public void setSellerBizNo(String sellerBizNo) {
		this.sellerBizNo = sellerBizNo;
	}

	public String getSellerMembNo() {
		return sellerMembNo;
	}

	public void setSellerMembNo(String sellerMembNo) {
		this.sellerMembNo = sellerMembNo;
	}

	public String getGroupType() {
		return groupType;
	}

	public void setGroupType(String groupType) {
		this.groupType = groupType;
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

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
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

	public int getExpirationAvg() {
		return expirationAvg;
	}

	public void setExpirationAvg(int expirationAvg) {
		this.expirationAvg = expirationAvg;
	}

	public String getSendStatus() {
		return sendStatus;
	}

	public void setSendStatus(String sendStatus) {
		this.sendStatus = sendStatus;
	}

}
