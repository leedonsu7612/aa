package com.hyundai.buyer.salesBilling.service;

import com.hyundai.admin.member.service.MemberVO;

public class BuyerLimitVO extends MemberVO {

	/** serialVersion UID */
	private static final long serialVersionUID = 3008148070265076665L;

	/** 대상월 */
	private String regDate;

	/** 지급보증한도 */
	private String salesLimit;

	/** 잔여한도 */
	private long remainingLimit;

	/** 초과한도 */
	private long overLimit;

	/** 삭제여부 */
	private String isDelete;

	/** HCI한도 */
	private long hciLimit;

	/** 사업소 */
	private String bizPlace;

	/** 공증금액 */
	private long notarialPrice;

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getSalesLimit() {
		return salesLimit;
	}

	public void setSalesLimit(String salesLimit) {
		this.salesLimit = salesLimit;
	}

	public long getRemainingLimit() {
		return remainingLimit;
	}

	public void setRemainingLimit(long remainingLimit) {
		this.remainingLimit = remainingLimit;
	}

	public long getOverLimit() {
		return overLimit;
	}

	public void setOverLimit(long overLimit) {
		this.overLimit = overLimit;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

	public long getHciLimit() {
		return hciLimit;
	}

	public void setHciLimit(long hciLimit) {
		this.hciLimit = hciLimit;
	}

	public String getBizPlace() {
		return bizPlace;
	}

	public void setBizPlace(String bizPlace) {
		this.bizPlace = bizPlace;
	}

	public long getNotarialPrice() {
		return notarialPrice;
	}

	public void setNotarialPrice(long notarialPrice) {
		this.notarialPrice = notarialPrice;
	}
}
