package com.hyundai.buyer.unauthorized.service;

import java.io.Serializable;

/**
 * @Class Name : UnauthorizedVO.java
 * @Description : Buyer UnauthorizedVO Class
 * @Modification Information
 * @
 * 	@ 수정일 수정자 수정내용
 * 	@ --------- --------- -------------------------------
 * 	@ 2018.11.21 CDF Team 최초생성
 *
 * @author CDF 개발팀
 * @since 2018.11.21
 * @version 1.0
 *
 */

public class UnauthorizedVO implements Serializable {

	/** serialVersion UID */
	private static final long serialVersionUID = 2903559453370243471L;

	/** 거래번호 */
	private String transactionNo;

	/** 발행일 */
	private String issueDate;

	/** 만기일 */
	private String expirationDate;

	/** 지급일 */
	private String paymentDate;

	/** 발행금액 */
	private int amount;

	/** 수금금액 */
	private int collectMoney;

	/** 진행상태 코드 */
	private String progressFlag;

	/** 적수 */
	private int expirationAvg;

	/** 그룹타입 */
	private String groupType;

	/** 삭제여부 */
	private String isDelete;

	/** 등록일 */
	private String insertDate;

	/** 세금계산서 번호 */
	private String taxbillNo;

	/** 품목점 사업자번호 */
	private String sellerBizNo;

	/** 대리점 사업자번호 */
	private String buyerBizNo;

	/** 매출월 */
	private String salesDate;

	/** 품목점 명 */
	private String sellerCompanyName;

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

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

	public String getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}

	public String getTaxbillNo() {
		return taxbillNo;
	}

	public void setTaxbillNo(String taxbillNo) {
		this.taxbillNo = taxbillNo;
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

	public String getSellerCompanyName() {
		return sellerCompanyName;
	}

	public void setSellerCompanyName(String sellerCompanyName) {
		this.sellerCompanyName = sellerCompanyName;
	}

}
