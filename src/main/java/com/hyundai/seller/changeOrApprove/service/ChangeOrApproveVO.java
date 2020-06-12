package com.hyundai.seller.changeOrApprove.service;

import java.io.Serializable;

/**
 * @Class Name : SellerChangeOrApproveVO.java
 * @Description : seller SellerChangeOrApproveVO Class
 * @Modification Information
 * @
 * @  수정일        수정자       수정내용
 * @ -----------   ----------   -------------------------------
 * @  2018.12.1     CDF Team     최초생성
 *
 * @author CDF 개발팀
 * @since 2018.12.1
 * @version 1.0
 *
 */

public class ChangeOrApproveVO implements Serializable {

	/** serialVersion UID */
	private static final long serialVersionUID = 5134245519198518536L;

	/** 거래번호 */
	private String transactionNo;

	/** 발행일 */
	private String issueDate;

	/** 변경전 만기일 */
	private String beforeExpiDate;

	/** 결제일 */
	private String paymentDate;

	/** 발행금액 */
	private int account;

	/** 수금금액 */
	private int collectMoney;

	/** 진행상태코드 (0: 결제완료, 1: 결제대기, 3: 대출실행, 4: 변경요청, 5: 변경완료, 6: 취소요청, 7: 취소완료) */
	private String progressFlag;

	/** 적수 */
	private int expirationAvg;

	/** 현대/기아구분 */
	private String groupType;

	/** 레코드 삭제여부(Y,N) */
	private String isDelete;

	/** 입력일자 */
	private String insertDate;

	/** 대리점 사업자번호 */
	private String buyerBizNo;

	/** 품목점 사업자번호 */
	private String sellerBizNo;

	/** 대리점명 */
	private String buyerCompanyName;

	/** 변경후 만기일 */
	private String afterExpiDate;

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

	public String getBeforeExpiDate() {
		return beforeExpiDate;
	}

	public void setBeforeExpiDate(String beforeExpiDate) {
		this.beforeExpiDate = beforeExpiDate;
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

	public String getBuyerCompanyName() {
		return buyerCompanyName;
	}

	public void setBuyerCompanyName(String buyerCompanyName) {
		this.buyerCompanyName = buyerCompanyName;
	}

	public String getAfterExpiDate() {
		return afterExpiDate;
	}

	public void setAfterExpiDate(String afterExpiDate) {
		this.afterExpiDate = afterExpiDate;
	}

}
