package com.hyundai.admin.guarantee.service;

import com.hyundai.cmmn.service.DefaultVO;

/**
 * @Class Name : TaxbillVO.java
 * @Description : TaxbillVO Class
 * @Modification Information
 * @
 * @  수정일      수정자       수정내용
 * @ ---------   ----------   -------------------------------
 * @ 2018.11.28   CDF Team     최초생성
 *
 * @author CDF 개발팀
 * @since 2018.11.28
 * @version 1.0
 *
 */

public class TaxbillVO extends DefaultVO {

	/** serialVersion UID */
	private static final long serialVersionUID = 1L;

	/* 구분 */
	private String membClass;
	
	/** 세금계산서번호 */
	private String taxbillNo;

	/** 품목점 사업자번호 */
	private String sellerBizNo;

	/* 품목점명 */
	private String sellerCoNm;
	
	/** 대리점 사업자번호 */
	private String buyerBizNo;

	/* 대리점명 */
	private String buyerCoNm;
	
	/** 매출월 */
	private String salesDate;

	/** 발행일 */
	private String issueDate;

	/** 금액 */
	private int amount;

	/** 진행상태 코드 */
	private String progressFlag;

	/** 그룹타입 (0 : 현대, 1 : 기아, 2 : 전체) */
	private String groupType;

	/**
	 * @return the taxbillNo
	 */
	public String getTaxbillNo() {
		return taxbillNo;
	}

	/**
	 * @param taxbillNo the taxbillNo to set
	 */
	public void setTaxbillNo(String taxbillNo) {
		this.taxbillNo = taxbillNo;
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
	 * @return the salesDate
	 */
	public String getSalesDate() {
		return salesDate;
	}

	/**
	 * @param salesDate the salesDate to set
	 */
	public void setSalesDate(String salesDate) {
		this.salesDate = salesDate;
	}

	/**
	 * @return the issueDate
	 */
	public String getIssueDate() {
		return issueDate;
	}

	/**
	 * @param issueDate the issueDate to set
	 */
	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}

	/**
	 * @return the amount
	 */
	public int getAmount() {
		return amount;
	}

	/**
	 * @param amount the amount to set
	 */
	public void setAmount(int amount) {
		this.amount = amount;
	}

	/**
	 * @return the progressFlag
	 */
	public String getProgressFlag() {
		return progressFlag;
	}

	/**
	 * @param progressFlag the progressFlag to set
	 */
	public void setProgressFlag(String progressFlag) {
		this.progressFlag = progressFlag;
	}

	/**
	 * @return the groupType
	 */
	public String getGroupType() {
		return groupType;
	}

	/**
	 * @param groupType the groupType to set
	 */
	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}

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


}
