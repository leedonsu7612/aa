package com.hyundai.buyer.taxBill.service;

import java.io.Serializable;

/**
 * @Class Name : TaxBillVO.java
 * @Description : Buyer TaxBillVO Class
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

public class TaxBillVO implements Serializable {

	/** serialVersion UID */
	private static final long serialVersionUID = 7007215631294491726L;

	/** 세금계산서 번호 */
	private String taxbillNo;

	/** 품목점 코드(회원번호) */
	private String sellerCode;

	/** 품목점 사업자번호 */
	private String sellerBizNo;

	/** 대리점 코드(회원번호) */
	private String buyerCode;

	/** 대리점 사업자번호 */
	private String buyerBizNo;

	/** 매출월 */
	private String salesDate;

	/** 발행일 */
	private String issueDate;

	/** 금액 */
	private long amount;

	/** 진행상태코드 */
	private String progressFlag;

	/** 1기간 매출 합 */
	private long peri001SumMoney;

	/** 2기간 매출 합 */
	private long peri002SumMoney;

	/** 3기간 매출 합 */
	private long peri003SumMoney;

	/** 1기간 매출한도 잔액 */
	private long peri001BalMoney;

	/** 2기간 매출한도 잔액 */
	private long peri002BalMoney;

	/** 3기간 매출한도 잔액 */
	private long peri003BalMoney;

	/** 구분코드(0:현대,1:기아) */
	private String groupType;

	/**  */
	private String publishType;

	/** 삭제여부(Y,N) */
	private String isDelete;

	/** 등록일 */
	private String insertDate;

	/** 품목점 명 */
	private String sellerCompanyName;

	public String getTaxbillNo() {
		return taxbillNo;
	}

	public void setTaxbillNo(String taxbillNo) {
		this.taxbillNo = taxbillNo;
	}

	public String getSellerCode() {
		return sellerCode;
	}

	public void setSellerCode(String sellerCode) {
		this.sellerCode = sellerCode;
	}

	public String getSellerBizNo() {
		return sellerBizNo;
	}

	public void setSellerBizNo(String sellerBizNo) {
		this.sellerBizNo = sellerBizNo;
	}

	public String getBuyerCode() {
		return buyerCode;
	}

	public void setBuyerCode(String buyerCode) {
		this.buyerCode = buyerCode;
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

	public String getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

	public String getProgressFlag() {
		return progressFlag;
	}

	public void setProgressFlag(String progressFlag) {
		this.progressFlag = progressFlag;
	}

	public long getPeri001SumMoney() {
		return peri001SumMoney;
	}

	public void setPeri001SumMoney(long peri001SumMoney) {
		this.peri001SumMoney = peri001SumMoney;
	}

	public long getPeri002SumMoney() {
		return peri002SumMoney;
	}

	public void setPeri002SumMoney(long peri002SumMoney) {
		this.peri002SumMoney = peri002SumMoney;
	}

	public long getPeri003SumMoney() {
		return peri003SumMoney;
	}

	public void setPeri003SumMoney(long peri003SumMoney) {
		this.peri003SumMoney = peri003SumMoney;
	}

	public long getPeri001BalMoney() {
		return peri001BalMoney;
	}

	public void setPeri001BalMoney(long peri001BalMoney) {
		this.peri001BalMoney = peri001BalMoney;
	}

	public long getPeri002BalMoney() {
		return peri002BalMoney;
	}

	public void setPeri002BalMoney(long peri002BalMoney) {
		this.peri002BalMoney = peri002BalMoney;
	}

	public long getPeri003BalMoney() {
		return peri003BalMoney;
	}

	public void setPeri003BalMoney(long peri003BalMoney) {
		this.peri003BalMoney = peri003BalMoney;
	}

	public String getGroupType() {
		return groupType;
	}

	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}

	public String getPublishType() {
		return publishType;
	}

	public void setPublishType(String publishType) {
		this.publishType = publishType;
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

	public String getSellerCompanyName() {
		return sellerCompanyName;
	}

	public void setSellerCompanyName(String sellerCompanyName) {
		this.sellerCompanyName = sellerCompanyName;
	}

}
