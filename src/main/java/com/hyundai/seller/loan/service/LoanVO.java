package com.hyundai.seller.loan.service;

import java.io.Serializable;

/**
 * @Class Name : SellerLoanVO.java
 * @Description : seller SellerLoanVO Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.12.5   CDF Team    최초생성
 *
 * @author CDF 개발팀
 * @since 2018.12.05
 * @version 1.0
 *
 */

public class LoanVO implements Serializable {

	/** serialVersion UID */
	private static final long serialVersionUID = 1286586185534053691L;

	/** 거래번호 */
	private String transactionNo;

	/** 발행일 */
	private String issueDate;

	/** 만기일 */
	private String expirationDate;

	/** 결제일 */
	private String paymentDate;

	/** 발행금액 */
	private long account;

	/** 수금금액 */
	private long collectMoney;

	/** 진행상태코드 */
	private String progressFlag;

	/** 적수 */
	private int expirationAvg;

	/** 현대/기아구분 */
	private String groupType;

	/** 레코드 삭제여부(Y,N) */
	private String isDelete;

	/** 입력일자 */
	private String insertDate;

	/** 품목점 사업자번호 */
	private String sellerBizNo;

	/** 대리점 사업자번호 */
	private String buyerBizNo;

	/** 대리점명 */
	private String companyName;

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

	public long getAccount() {
		return account;
	}

	public void setAccount(long account) {
		this.account = account;
	}

	public long getCollectMoney() {
		return collectMoney;
	}

	public void setCollectMoney(long collectMoney) {
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

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

}
