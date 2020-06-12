package com.hyundai.admin.guarantee.service;

import com.hyundai.cmmn.service.DefaultVO;

/**
 * @Class Name : SalesSlipVO.java
 * @Description : SalesSlipVO Class
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

public class SalesSlipVO extends DefaultVO {

	/** serialVersion UID */
	private static final long serialVersionUID = 1L;

	/* 구분 */
	private String membClass;
	
	/** 매출전표번호 */
	private String salesSlipNo;

	/** Heims매출전표번호 */
	private String heimsSalesSlipNo;

	/** 품목점 사업자번호 */
	private String sellerBizNo;

	/* 품목점명 */
	private String sellerCoNm;
	
	/** 대리점 사업자번호 */
	private String buyerBizNo;

	/* 대리점명 */
	private String buyerCoNm;
	
	/** 매출일 */
	private String salesDate;

	/** 전표금액 */
	private int supplyValue;

	/** 세금계산서 발행여부 */
	private String useTaxbillYn;

	/** 세금계산서번호 */
	private String taxbillNo;

	/** 매출수분 (0 : 현대, 1 : 기아, 2 : 전체) */
	private String groupType;

	/** 헤임즈 보증초과 금액 */
	private int overInput;

	/** 이니시스 잔여 보증초과 금액 */
	private int overOutput;

	/**
	 * @return the salesSlipNo
	 */
	public String getSalesSlipNo() {
		return salesSlipNo;
	}

	/**
	 * @param salesSlipNo the salesSlipNo to set
	 */
	public void setSalesSlipNo(String salesSlipNo) {
		this.salesSlipNo = salesSlipNo;
	}

	/**
	 * @return the heimsSalesSlipNo
	 */
	public String getHeimsSalesSlipNo() {
		return heimsSalesSlipNo;
	}

	/**
	 * @param heimsSalesSlipNo the heimsSalesSlipNo to set
	 */
	public void setHeimsSalesSlipNo(String heimsSalesSlipNo) {
		this.heimsSalesSlipNo = heimsSalesSlipNo;
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
	 * @return the supplyValue
	 */
	public int getSupplyValue() {
		return supplyValue;
	}

	/**
	 * @param supplyValue the supplyValue to set
	 */
	public void setSupplyValue(int supplyValue) {
		this.supplyValue = supplyValue;
	}

	/**
	 * @return the useTaxbillYn
	 */
	public String getUseTaxbillYn() {
		return useTaxbillYn;
	}

	/**
	 * @param useTaxbillYn the useTaxbillYn to set
	 */
	public void setUseTaxbillYn(String useTaxbillYn) {
		this.useTaxbillYn = useTaxbillYn;
	}

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
	 * @return the overInput
	 */
	public int getOverInput() {
		return overInput;
	}

	/**
	 * @param overInput the overInput to set
	 */
	public void setOverInput(int overInput) {
		this.overInput = overInput;
	}

	/**
	 * @return the overOutput
	 */
	public int getOverOutput() {
		return overOutput;
	}

	/**
	 * @param overOutput the overOutput to set
	 */
	public void setOverOutput(int overOutput) {
		this.overOutput = overOutput;
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
