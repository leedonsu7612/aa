package com.hyundai.seller.taxBill.service;

import java.io.Serializable;

/**
 * @Class Name : SellerTaxBillVO.java
 * @Description : seller SellerTaxBillVO Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.12.1   CDF Team    최초생성
 *
 * @author CDF 개발팀
 * @since 2018.12.1
 * @version 1.0
 *
 */

public class TaxBillVO implements Serializable {

	/** serialVersion UID */
	private static final long serialVersionUID = 4762815328547047007L;

	/** 매출전표 번호 */
	private String salesSlipNo;

	/**  */
	private String heimsSalesSlipNo;

	/** 품목점 코드(회원번호) */
	private String sellerCode;

	/** 대리점 코드(회원번호) */
	private String buyerCode;

	/** 매출일 */
	private String salesDate;

	/** 공급가액 */
	private long supplyValue;

	/** 세액 */
	private long taxAmount;

	/** 세금계산서 포함여부 */
	private String useTaxbillYn;

	/** 세금계산서 번호 */
	private String taxbillNo;

	/** 품목점 사업자번호 */
	private String sellerBizNo;

	/** 대리점 사업자번호 */
	private String buyerBizNo;

	/** 구분코드(0:현대,1:기아) */
	private String groupType;

	/** 삭제여부(Y,N) */
	private String isDelete;

	/** 헤임즈에서 보내온 전표 상태값 */
	private String heimsStatus;

	/** 헤임즈 보증초과 금액 */
	private long overInput;

	/** 보증초과 잔여금액 */
	private long overOutput;

	/** 마이너스 매출전표 합계 */
	private long minusVal;

	/** 보증초과 시작 */
	private long overBase;

	/** 대리점명 */
	private String buyerCompanyName;

	/** 최소 매출일 */
	private String minSalesDate;

	/** 최대 매출일 */
	private String maxSalesDate;

	/** 증표 합계 */
	private long salesSlipSum;

	/** 증표 건수 */
	private int salesSlipCnt;

	public String getSalesSlipNo() {
		return salesSlipNo;
	}

	public void setSalesSlipNo(String salesSlipNo) {
		this.salesSlipNo = salesSlipNo;
	}

	public String getHeimsSalesSlipNo() {
		return heimsSalesSlipNo;
	}

	public void setHeimsSalesSlipNo(String heimsSalesSlipNo) {
		this.heimsSalesSlipNo = heimsSalesSlipNo;
	}

	public String getSellerCode() {
		return sellerCode;
	}

	public void setSellerCode(String sellerCode) {
		this.sellerCode = sellerCode;
	}

	public String getBuyerCode() {
		return buyerCode;
	}

	public void setBuyerCode(String buyerCode) {
		this.buyerCode = buyerCode;
	}

	public String getSalesDate() {
		return salesDate;
	}

	public void setSalesDate(String salesDate) {
		this.salesDate = salesDate;
	}

	public long getSupplyValue() {
		return supplyValue;
	}

	public void setSupplyValue(long supplyValue) {
		this.supplyValue = supplyValue;
	}

	public long getTaxAmount() {
		return taxAmount;
	}

	public void setTaxAmount(long taxAmount) {
		this.taxAmount = taxAmount;
	}

	public String getUseTaxbillYn() {
		return useTaxbillYn;
	}

	public void setUseTaxbillYn(String useTaxbillYn) {
		this.useTaxbillYn = useTaxbillYn;
	}

	public String getTaxbillNo() {
		return taxbillNo;
	}

	public void setTaxbillNo(String taxbillNo) {
		this.taxbillNo = taxbillNo;
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

	public String getHeimsStatus() {
		return heimsStatus;
	}

	public void setHeimsStatus(String heimsStatus) {
		this.heimsStatus = heimsStatus;
	}

	public long getOverInput() {
		return overInput;
	}

	public void setOverInput(long overInput) {
		this.overInput = overInput;
	}

	public long getOverOutput() {
		return overOutput;
	}

	public void setOverOutput(long overOutput) {
		this.overOutput = overOutput;
	}

	public long getMinusVal() {
		return minusVal;
	}

	public void setMinusVal(long minusVal) {
		this.minusVal = minusVal;
	}

	public long getOverBase() {
		return overBase;
	}

	public void setOverBase(long overBase) {
		this.overBase = overBase;
	}

	public String getBuyerCompanyName() {
		return buyerCompanyName;
	}

	public void setBuyerCompanyName(String buyerCompanyName) {
		this.buyerCompanyName = buyerCompanyName;
	}

	public String getMinSalesDate() {
		return minSalesDate;
	}

	public void setMinSalesDate(String minSalesDate) {
		this.minSalesDate = minSalesDate;
	}

	public String getMaxSalesDate() {
		return maxSalesDate;
	}

	public void setMaxSalesDate(String maxSalesDate) {
		this.maxSalesDate = maxSalesDate;
	}

	public long getSalesSlipSum() {
		return salesSlipSum;
	}

	public void setSalesSlipSum(long salesSlipSum) {
		this.salesSlipSum = salesSlipSum;
	}

	public int getSalesSlipCnt() {
		return salesSlipCnt;
	}

	public void setSalesSlipCnt(int salesSlipCnt) {
		this.salesSlipCnt = salesSlipCnt;
	}

}
