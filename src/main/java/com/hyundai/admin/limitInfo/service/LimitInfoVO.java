package com.hyundai.admin.limitInfo.service;

import com.hyundai.admin.member.service.MemberVO;

/**
 * @Class Name : LimitInfoVO.java
 * @Description : LimitInfoVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.12.03   CDF Team        최초생성
 *
 * @author CDF 개발팀
 * @since 2018.12.03
 * @version 1.0
 *
 */
public class LimitInfoVO extends MemberVO {

	private static final long serialVersionUID = 1L;

	/* 사업소 */
	private String bizPlace;

	/* 총거래한도 */
	private int salesLimit;

	/* 모비스거래한도 */
	private int mobisLimit;

	/* HCI 거래한도 */
	private int hciLimit;

	/* 잔여한도 */
	private int remLimit;

	/* 초과한도 */
	private int overLimit;

	/* 보증초과 */
	private int guaranteeOver;

	/* 보증금액 */
	private int guaranteePrice;

	/* 공증금액 */
	private int notarialPrice;

	/* 한도요청ID */
	private String reqId;

	/* 한도요청구분코드 */
	private String lmtReqGbn;

	/* 진행상태코드 */
	private int processNo;
	
	/* 진행상태 */
	private String process;
	
	/* 등록일자 */
	private String regDate;

	/* 휴업/폐업 */
	private String closeDate;

	/* 비고 */
	private String memo;

	/* 양도포함여부 */
	private String rcvAt = "1";

	/* 요청일자 */
	private String reqDate;

	/**
	 * @return the bizPlace
	 */
	public String getBizPlace() {
		return bizPlace;
	}

	/**
	 * @param bizPlace the bizPlace to set
	 */
	public void setBizPlace(String bizPlace) {
		this.bizPlace = bizPlace;
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
	 * @return the mobisLimit
	 */
	public int getMobisLimit() {
		return mobisLimit;
	}

	/**
	 * @param mobisLimit the mobisLimit to set
	 */
	public void setMobisLimit(int mobisLimit) {
		this.mobisLimit = mobisLimit;
	}

	/**
	 * @return the hciLimit
	 */
	public int getHciLimit() {
		return hciLimit;
	}

	/**
	 * @param hciLimit the hciLimit to set
	 */
	public void setHciLimit(int hciLimit) {
		this.hciLimit = hciLimit;
	}

	/**
	 * @return the remLimit
	 */
	public int getRemLimit() {
		return remLimit;
	}

	/**
	 * @param remLimit the remLimit to set
	 */
	public void setRemLimit(int remLimit) {
		this.remLimit = remLimit;
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
	 * @return the guaranteeOver
	 */
	public int getGuaranteeOver() {
		return guaranteeOver;
	}

	/**
	 * @param guaranteeOver the guaranteeOver to set
	 */
	public void setGuaranteeOver(int guaranteeOver) {
		this.guaranteeOver = guaranteeOver;
	}

	/**
	 * @return the guaranteePrice
	 */
	public int getGuaranteePrice() {
		return guaranteePrice;
	}

	/**
	 * @param guaranteePrice the guaranteePrice to set
	 */
	public void setGuaranteePrice(int guaranteePrice) {
		this.guaranteePrice = guaranteePrice;
	}

	/**
	 * @return the notarialPrice
	 */
	public int getNotarialPrice() {
		return notarialPrice;
	}

	/**
	 * @param notarialPrice the notarialPrice to set
	 */
	public void setNotarialPrice(int notarialPrice) {
		this.notarialPrice = notarialPrice;
	}

	/**
	 * @return the reqId
	 */
	public String getReqId() {
		return reqId;
	}

	/**
	 * @param reqId the reqId to set
	 */
	public void setReqId(String reqId) {
		this.reqId = reqId;
	}

	/**
	 * @return the lmtReqGbn
	 */
	public String getLmtReqGbn() {
		return lmtReqGbn;
	}

	/**
	 * @param lmtReqGbn the lmtReqGbn to set
	 */
	public void setLmtReqGbn(String lmtReqGbn) {
		this.lmtReqGbn = lmtReqGbn;
	}

	/**
	 * @return the processNo
	 */
	public int getProcessNo() {
		return processNo;
	}

	/**
	 * @param processNo the processNo to set
	 */
	public void setProcessNo(int processNo) {
		this.processNo = processNo;
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

	/**
	 * @return the closeDate
	 */
	public String getCloseDate() {
		return closeDate;
	}

	/**
	 * @param closeDate the closeDate to set
	 */
	public void setCloseDate(String closeDate) {
		this.closeDate = closeDate;
	}

	/**
	 * @return the memo
	 */
	public String getMemo() {
		return memo;
	}

	/**
	 * @param memo the memo to set
	 */
	public void setMemo(String memo) {
		this.memo = memo;
	}

	/**
	 * @return the process
	 */
	public String getProcess() {
		return process;
	}

	/**
	 * @param process the process to set
	 */
	public void setProcess(String process) {
		this.process = process;
	}

	/**
	 * @return the rcvAt
	 */
	public String getRcvAt() {
		return rcvAt;
	}

	/**
	 * @param rcvAt the rcvAt to set
	 */
	public void setRcvAt(String rcvAt) {
		this.rcvAt = rcvAt;
	}

	/**
	 * @return the reqDate
	 */
	public String getReqDate() {
		return reqDate;
	}

	/**
	 * @param reqDate the reqDate to set
	 */
	public void setReqDate(String reqDate) {
		this.reqDate = reqDate;
	}

}
