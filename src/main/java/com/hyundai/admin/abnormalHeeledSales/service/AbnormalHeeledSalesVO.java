package com.hyundai.admin.abnormalHeeledSales.service;

import com.hyundai.cmmn.service.DefaultVO;

/**
 * @Class Name : AbnormalHeeledSalesVO.java
 * @Description : AbnormalHeeledSalesVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.22   CDF Team        최초생성
 *
 * @author CDF 개발팀
 * @since 2018.11.22
 * @version 1.0
 *
 */
public class AbnormalHeeledSalesVO extends DefaultVO {

	private static final long serialVersionUID = 1L;

	/* 대상월 */
	private String regDate;

	/* 대리점 상호 */
	private String buyerCoNm;

	/* 대리점 사업자번호 */
	private String buyerBizNo;

	/* 대리점 코드 */
	private String buyerMembNo;

	/* 품목점 상호 */
	private String sellerCoNm;

	/* 품목점 사업자번호 */
	private String sellerBizNo;

	/* 품목점 코드 */
	private String sellerMembNo;

	/* 부여한도 */
	private int salesLimit;

	/* 잔여한도 */
	private int remainingLimit;

	/* 초과한도 */
	private int overLimit;

	/* 거래액 */
	private int tradeAmt;

	/* 이상거래액 */
	private int abnormalAmt;

	/**
	 * @return the regDate
	 */
	public String getRegDate() {
		return regDate;
	}

	/**
	 * @param regDate the regDate to set
	 */
	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
	 * @return the buyerBizNo
	 */
	public String getBuyerBizNo() {
		return buyerBizNo;
	}

	/**
	 * @param buyerBizNo the buyerBizNo to set
	 */
	public void setBuyerBizNo(String buyerBizNo) {
		this.buyerBizNo = buyerBizNo;
	}

	/**
	 * @return the buyerMembNo
	 */
	public String getBuyerMembNo() {
		return buyerMembNo;
	}

	/**
	 * @param buyerMembNo the buyerMembNo to set
	 */
	public void setBuyerMembNo(String buyerMembNo) {
		this.buyerMembNo = buyerMembNo;
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
	 * @return the sellerBizNo
	 */
	public String getSellerBizNo() {
		return sellerBizNo;
	}

	/**
	 * @param sellerBizNo the sellerBizNo to set
	 */
	public void setSellerBizNo(String sellerBizNo) {
		this.sellerBizNo = sellerBizNo;
	}

	/**
	 * @return the sellerMembNo
	 */
	public String getSellerMembNo() {
		return sellerMembNo;
	}

	/**
	 * @param sellerMembNo the sellerMembNo to set
	 */
	public void setSellerMembNo(String sellerMembNo) {
		this.sellerMembNo = sellerMembNo;
	}

	/**
	 * @return the salesLimit
	 */
	public int getSalesLimit() {
		return salesLimit;
	}

	/**
	 * @param salesLimit the salesLimit to set
	 */
	public void setSalesLimit(int salesLimit) {
		this.salesLimit = salesLimit;
	}

	/**
	 * @return the remainingLimit
	 */
	public int getRemainingLimit() {
		return remainingLimit;
	}

	/**
	 * @param remainingLimit the remainingLimit to set
	 */
	public void setRemainingLimit(int remainingLimit) {
		this.remainingLimit = remainingLimit;
	}

	/**
	 * @return the overLimit
	 */
	public int getOverLimit() {
		return overLimit;
	}

	/**
	 * @param overLimit the overLimit to set
	 */
	public void setOverLimit(int overLimit) {
		this.overLimit = overLimit;
	}

	/**
	 * @return the tradeAmt
	 */
	public int getTradeAmt() {
		return tradeAmt;
	}

	/**
	 * @param tradeAmt the tradeAmt to set
	 */
	public void setTradeAmt(int tradeAmt) {
		this.tradeAmt = tradeAmt;
	}

	/**
	 * @return the abnormalAmt
	 */
	public int getAbnormalAmt() {
		return abnormalAmt;
	}

	/**
	 * @param abnormalAmt the abnormalAmt to set
	 */
	public void setAbnormalAmt(int abnormalAmt) {
		this.abnormalAmt = abnormalAmt;
	}


}
