package com.hyundai.buyer.salesBilling.service;

import java.io.Serializable;

/**
 * @Class Name : SalesBillingVO.java
 * @Description : Buyer SalesBillingVO Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.19   CDF Team    최초생성
 *
 * @author CDF 개발팀
 * @since 2018.11.19
 * @version 1.0
 *
 */

public class SalesBillingVO implements Serializable {

	/** serialVersion UID */
	private static final long serialVersionUID = -2964227026487409256L;

	/** 등록일 */
	private String regDate;

	/** 대리점 사업자 번호 */
	private String buyerBizNo;

	/** 품목점 사업자 번호 */
	private String sellerBizNo;

	/** 매입내역 */
	private int salesAmount;

	/** 세금계산서 발행금액 */
	private int taxAmount;

	/** 매출채권 발행금액 */
	private int receivableAmount;

	/** 기타지급 */
	private int extraAmount;

	/** 총지급내역 */
	private int collectAmount;

	/** 적수 */
	private int expirationAvg;

	/** 삭제여부 */
	private String isDelete;

	/** 초과수금 */
	private int overAmount;

	/** 미지급금 */
	private int endAmount;

	/** 상계수금 */
	private int setoff;

	/** 기타지급 승인금액 */
	private int extraAmountOk;

	/** 상계수금 승인금액 */
	private int setoffOk;

	/** 만기일 미지정 지급금액*/
	private int unreceivableAmount;

	/** 세금계산서 미발행 금액 */
	private int noTaxAmount;

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
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

	public int getSalesAmount() {
		return salesAmount;
	}

	public void setSalesAmount(int salesAmount) {
		this.salesAmount = salesAmount;
	}

	public int getTaxAmount() {
		return taxAmount;
	}

	public void setTaxAmount(int taxAmount) {
		this.taxAmount = taxAmount;
	}

	public int getReceivableAmount() {
		return receivableAmount;
	}

	public void setReceivableAmount(int receivableAmount) {
		this.receivableAmount = receivableAmount;
	}

	public int getExtraAmount() {
		return extraAmount;
	}

	public void setExtraAmount(int extraAmount) {
		this.extraAmount = extraAmount;
	}

	public int getCollectAmount() {
		return collectAmount;
	}

	public void setCollectAmount(int collectAmount) {
		this.collectAmount = collectAmount;
	}

	public int getExpirationAvg() {
		return expirationAvg;
	}

	public void setExpirationAvg(int expirationAvg) {
		this.expirationAvg = expirationAvg;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

	public int getOverAmount() {
		return overAmount;
	}

	public void setOverAmount(int overAmount) {
		this.overAmount = overAmount;
	}

	public int getEndAmount() {
		return endAmount;
	}

	public void setEndAmount(int endAmount) {
		this.endAmount = endAmount;
	}

	public int getSetoff() {
		return setoff;
	}

	public void setSetoff(int setoff) {
		this.setoff = setoff;
	}

	public int getExtraAmountOk() {
		return extraAmountOk;
	}

	public void setExtraAmountOk(int extraAmountOk) {
		this.extraAmountOk = extraAmountOk;
	}

	public int getSetoffOk() {
		return setoffOk;
	}

	public void setSetoffOk(int setoffOk) {
		this.setoffOk = setoffOk;
	}

	public int getUnreceivableAmount() {
		return unreceivableAmount;
	}

	public void setUnreceivableAmount(int unreceivableAmount) {
		this.unreceivableAmount = unreceivableAmount;
	}

	public int getNoTaxAmount() {
		return noTaxAmount;
	}

	public void setNoTaxAmount(int noTaxAmount) {
		this.noTaxAmount = noTaxAmount;
	}

}
