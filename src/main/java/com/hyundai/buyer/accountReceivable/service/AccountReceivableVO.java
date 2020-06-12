package com.hyundai.buyer.accountReceivable.service;

import java.io.Serializable;

/**
 * @Class Name : AccountReceivableVO.java
 * @Description : Buyer AccountReceivableVO Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.28   CDF Team    최초생성
 *
 * @author CDF 개발팀
 * @since 2018.11.28
 * @version 1.0
 *
 */

public class AccountReceivableVO implements Serializable {

	/** serialVersion UID */
	private static final long serialVersionUID = -4094141146181252523L;

	/** 거래번호 */
	private String transactionNo;

	/** 발행일 */
	private String issueDate;

	/** 만기일 */
	private String expirationDate;

	/** 결제일 */
	private String paymentDate;

	/** 발행금액 */
	private int account;

	/** 수금금액 */
	private int collectMoney;

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

	/** 기타수금 요청 여부 */
	private String isExtraAmount;

	/** 최근 등록일 */
	private String maxRegDate;

	/** 대리점 사업자번호 */
	private String buyerBizNo;

	/** 품목점 사업자번호 */
	private String sellerBizNo;

	/** 품목점 명 */
	private String sellerCompanyName;

	/** 매출월 */
	private String salesDate;

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

	public int getAccount() {
		return account;
	}

	public void setAccount(int account) {
		this.account = account;
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

	public String getIsExtraAmount() {
		return isExtraAmount;
	}

	public void setIsExtraAmount(String isExtraAmount) {
		this.isExtraAmount = isExtraAmount;
	}

	public String getMaxRegDate() {
		return maxRegDate;
	}

	public void setMaxRegDate(String maxRegDate) {
		this.maxRegDate = maxRegDate;
	}

	public String getBuyerBizNo() {
		return buyerBizNo;
	}

	public void setBuyerBizNo(String buyerBizNo) {
		this.buyerBizNo = buyerBizNo;
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

	public String getSalesDate() {
		return salesDate;
	}

	public void setSalesDate(String salesDate) {
		this.salesDate = salesDate;
	}

}
