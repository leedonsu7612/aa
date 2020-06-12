package com.hyundai.seller.setOff.service;

import java.io.Serializable;

/**
 * @Class Name : SellerSetOffVO.java
 * @Description : seller SellerSetOffVO Class
 * @Modification Information
 * @
 * @  수정일      수정자       수정내용
 * @ ---------   ----------   -------------------------------
 * @ 2018.12.1   CDF Team     최초생성
 *
 * @author CDF 개발팀
 * @since 2018.12.1
 * @version 1.0
 *
 */

public class SetOffVO implements Serializable {

	/** serialVersion UID */
	private static final long serialVersionUID = 4875027205133516186L;

	/** 매출월 */
	private String salesDate;

	/** 발행일자 */
	private String issueDate;

	/** 만기일자 */
	private String expirationDate;

	/** 매출 구분 */
	private String groupType;

	/** 삭제여부 */
	private String isDelete;

	/** 품목점 사업자번호 */
	private String sellerBizNo;

	/** 대리점 사업자번호 */
	private String buyerBizNo;

	/** 기타수금 요청가능금액 */
	private long amountRequestable;

	/** 기타수금 요청금액 */
	private long amountRequested;

	/** 대리점명 */
	private String buyerCompanyName;

	/** 거래번호 */
	private String transactionNo;

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

	/** 등록일 */
	private String insertDate;

	public String getRegDate() {
		return salesDate;
	}

	public void setRegDate(String salesDate) {
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

	public long getAmountRequestable() {
		return amountRequestable;
	}

	public void setAmountRequestable(long amountRequestable) {
		this.amountRequestable = amountRequestable;
	}

	public long getAmountRequested() {
		return amountRequested;
	}

	public void setAmountRequested(long amountRequested) {
		this.amountRequested = amountRequested;
	}

	public String getCompanyName() {
		return buyerCompanyName;
	}

	public void setCompanyName(String buyerCompanyName) {
		this.buyerCompanyName = buyerCompanyName;
	}

	public String getSalesDate() {
		return salesDate;
	}

	public void setSalesDate(String salesDate) {
		this.salesDate = salesDate;
	}

	public String getBuyerCompanyName() {
		return buyerCompanyName;
	}

	public void setBuyerCompanyName(String buyerCompanyName) {
		this.buyerCompanyName = buyerCompanyName;
	}

	public String getTransactionNo() {
		return transactionNo;
	}

	public void setTransactionNo(String transactionNo) {
		this.transactionNo = transactionNo;
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

	public String getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}

}
