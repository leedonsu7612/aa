package com.hyundai.admin.guarantee.service;

import com.hyundai.cmmn.service.DefaultVO;

/**
 * @Class Name : GuaranteeVO.java
 * @Description : GuaranteeVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.26   CDF Team        최초생성
 *
 * @author CDF 개발팀
 * @since 2018.11.26
 * @version 1.0
 *
 */
public class GuaranteeVO extends DefaultVO {

	private static final long serialVersionUID = 1L;

	/* 등록월 */
	private String regDate;

	/* 구분 */
	private String membClass;
	
	/* 대리점사업자번호 */
	private String buyerBizNo;
	
	/* 대리점명 */
	private String buyerCoNm;
	
	/* 품목점사업자번호 */
	private String sellerBizNo;
	
	/* 품목점명 */
	private String sellerCoNm;
	
	/* 거래금액(종합매출액) */
	private int totalSalesAmount;
	
	/* 발행금액(종합세금계산서발행금액) */
	private int totalTaxAmount;
	
	/* 매출채권발행금액 */
	private int totalReceivableAmount;
	
	/* 매출채권결제금액 */
	private int totalCollectAmount;
	
	/* 기타수금승인 */
	private int totalExtraAmountOk;
	
	/* 기타수금요청 */
	private int totalExtraAmount;
	
	/* 상계수금승인 */
	private int totalSetoffOk;
	
	/* 상계수금요청 */
	private int totalSetoff;
	
	/* 초과금액 */
	private int totalOverAmount;
	
	/* 보증금액중 미결제금액 */
	private int unpayAmount;
	
	/* 보증금액중 채권미발행금액 */
	private int unissuedAmount;

	/**
	 * @return the membClass
	 */
	public String getMembClass() {
		return membClass;
	}

	/**
	 * @param membClass the membClass to set
	 */
	public void setMembClass(String membClass) {
		this.membClass = membClass;
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
	 * @return the totalSalesAmount
	 */
	public int getTotalSalesAmount() {
		return totalSalesAmount;
	}

	/**
	 * @param totalSalesAmount the totalSalesAmount to set
	 */
	public void setTotalSalesAmount(int totalSalesAmount) {
		this.totalSalesAmount = totalSalesAmount;
	}

	/**
	 * @return the totalTaxAmount
	 */
	public int getTotalTaxAmount() {
		return totalTaxAmount;
	}

	/**
	 * @param totalTaxAmount the totalTaxAmount to set
	 */
	public void setTotalTaxAmount(int totalTaxAmount) {
		this.totalTaxAmount = totalTaxAmount;
	}

	/**
	 * @return the totalReceivableAmount
	 */
	public int getTotalReceivableAmount() {
		return totalReceivableAmount;
	}

	/**
	 * @param totalReceivableAmount the totalReceivableAmount to set
	 */
	public void setTotalReceivableAmount(int totalReceivableAmount) {
		this.totalReceivableAmount = totalReceivableAmount;
	}

	/**
	 * @return the totalCollectAmount
	 */
	public int getTotalCollectAmount() {
		return totalCollectAmount;
	}

	/**
	 * @param totalCollectAmount the totalCollectAmount to set
	 */
	public void setTotalCollectAmount(int totalCollectAmount) {
		this.totalCollectAmount = totalCollectAmount;
	}

	/**
	 * @return the totalExtraAmountOk
	 */
	public int getTotalExtraAmountOk() {
		return totalExtraAmountOk;
	}

	/**
	 * @param totalExtraAmountOk the totalExtraAmountOk to set
	 */
	public void setTotalExtraAmountOk(int totalExtraAmountOk) {
		this.totalExtraAmountOk = totalExtraAmountOk;
	}

	/**
	 * @return the totalExtraAmount
	 */
	public int getTotalExtraAmount() {
		return totalExtraAmount;
	}

	/**
	 * @param totalExtraAmount the totalExtraAmount to set
	 */
	public void setTotalExtraAmount(int totalExtraAmount) {
		this.totalExtraAmount = totalExtraAmount;
	}

	/**
	 * @return the totalSetoffOk
	 */
	public int getTotalSetoffOk() {
		return totalSetoffOk;
	}

	/**
	 * @param totalSetoffOk the totalSetoffOk to set
	 */
	public void setTotalSetoffOk(int totalSetoffOk) {
		this.totalSetoffOk = totalSetoffOk;
	}

	/**
	 * @return the totalSetoff
	 */
	public int getTotalSetoff() {
		return totalSetoff;
	}

	/**
	 * @param totalSetoff the totalSetoff to set
	 */
	public void setTotalSetoff(int totalSetoff) {
		this.totalSetoff = totalSetoff;
	}

	/**
	 * @return the totalOverAmount
	 */
	public int getTotalOverAmount() {
		return totalOverAmount;
	}

	/**
	 * @param totalOverAmount the totalOverAmount to set
	 */
	public void setTotalOverAmount(int totalOverAmount) {
		this.totalOverAmount = totalOverAmount;
	}

	/**
	 * @return the unpayAmount
	 */
	public int getUnpayAmount() {
		return unpayAmount;
	}

	/**
	 * @param unpayAmount the unpayAmount to set
	 */
	public void setUnpayAmount(int unpayAmount) {
		this.unpayAmount = unpayAmount;
	}

	/**
	 * @return the unissuedAmount
	 */
	public int getUnissuedAmount() {
		return unissuedAmount;
	}

	/**
	 * @param unissuedAmount the unissuedAmount to set
	 */
	public void setUnissuedAmount(int unissuedAmount) {
		this.unissuedAmount = unissuedAmount;
	}

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
	
}
