package com.hyundai.buyer.accountReceivable.service;

import java.io.Serializable;

public class ReceivableChangeVO implements Serializable {

	/** serialVersion UID */
	private static final long serialVersionUID = 6147573302359405701L;

	/** 등록일 */
	private String regDatetime;

	/** 초 */
	private String millisec;

	/** 거래번호 */
	private String transactionNo;

	/** 변경전 만기일 */
	private String beforeExpiDate;

	/** 변경후 만기일 */
	private String afterExpiDate;

	/** 진행상태 */
	private String progressFlag;

	/** 적수 */
	private int expirationAvg;

	/** 삭제여부 */
	private String isDelete;

	/** 입력일자 */
	private String insertDate;

	public String getRegDatetime() {
		return regDatetime;
	}

	public void setRegDatetime(String regDatetime) {
		this.regDatetime = regDatetime;
	}

	public String getMillisec() {
		return millisec;
	}

	public void setMillisec(String millisec) {
		this.millisec = millisec;
	}

	public String getTransactionNo() {
		return transactionNo;
	}

	public void setTransactionNo(String transactionNo) {
		this.transactionNo = transactionNo;
	}

	public String getBeforeExpiDate() {
		return beforeExpiDate;
	}

	public void setBeforeExpiDate(String beforeExpiDate) {
		this.beforeExpiDate = beforeExpiDate;
	}

	public String getAfterExpiDate() {
		return afterExpiDate;
	}

	public void setAfterExpiDate(String afterExpiDate) {
		this.afterExpiDate = afterExpiDate;
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

}
