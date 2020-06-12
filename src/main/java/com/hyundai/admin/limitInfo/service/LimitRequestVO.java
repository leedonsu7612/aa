package com.hyundai.admin.limitInfo.service;

import java.io.Serializable;

/**
 * @Class Name : LimitRequestVO.java
 * @Description : LimitRequestVO Class
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
public class LimitRequestVO implements Serializable {

	private static final long serialVersionUID = 1L;

	/* 요청ID */
	private String reqId;
	
	/* 코드 */
	private String membNo;

	/* 대리점사업자번호 */
	private String businessNo;
	
	/* 대리점명 */
	private String companyName;
		
	/* 한도요청구분코드(LM01:최초한도설정,LM02:한도증액,LM03:한도감액,LM04:한도이관,LM05:휴업,LM06:폐업) */
	private String lmtReqGbn;
		
	/* 진행상태번호(0:취소,1:요청,2:처리승인대기,3:확인중(이후취소불가),4:승인대기,5:승인취소,6:승인,97:모비스부서장반려,98:HCI사원반려,99:HCI부서장반려,100:완료) */
	private int processNo = 0;
		
	/* 요청한도 */
	private int reqLimit;
		
	/* 변경후 고정여부 */
	private String fixAt = "Y";

	/* 첨부파일ID */
	private String attchFileId;

	/* 양수 사업자 번호 */
	private String rcvBizNo;

	/* 양수 대리점명 */
	private String rcvCoNm;

	/* 양수 대리점코드 */
	private String rcvMembNo;

	/* 양수대리점 회원가입여부 */
	private String rcvMembYn = "Y";

	/* 변경유형(1:법인전환,2:인수합병) */
	private String rcvType = "1";

	/* 비고 */
	private String memo;

	/* 사업소 */
	private String bizPlace;

	/* 등록시간 */
	private String regDate;

	/* 총거래한도 */
	private int salesLimit;

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
	 * @return the membNo
	 */
	public String getMembNo() {
		return membNo;
	}

	/**
	 * @param membNo the membNo to set
	 */
	public void setMembNo(String membNo) {
		this.membNo = membNo;
	}

	/**
	 * @return the businessNo
	 */
	public String getBusinessNo() {
		return businessNo;
	}

	/**
	 * @param businessNo the businessNo to set
	 */
	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}

	/**
	 * @return the companyName
	 */
	public String getCompanyName() {
		return companyName;
	}

	/**
	 * @param companyName the companyName to set
	 */
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
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
	 * @return the reqLimit
	 */
	public int getReqLimit() {
		return reqLimit;
	}

	/**
	 * @param reqLimit the reqLimit to set
	 */
	public void setReqLimit(int reqLimit) {
		this.reqLimit = reqLimit;
	}

	/**
	 * @return the fixAt
	 */
	public String getFixAt() {
		return fixAt;
	}

	/**
	 * @param fixAt the fixAt to set
	 */
	public void setFixAt(String fixAt) {
		this.fixAt = fixAt;
	}

	/**
	 * @return the attchFileId
	 */
	public String getAttchFileId() {
		return attchFileId;
	}

	/**
	 * @param attchFileId the attchFileId to set
	 */
	public void setAttchFileId(String attchFileId) {
		this.attchFileId = attchFileId;
	}

	/**
	 * @return the rcvBizNo
	 */
	public String getRcvBizNo() {
		return rcvBizNo;
	}

	/**
	 * @param rcvBizNo the rcvBizNo to set
	 */
	public void setRcvBizNo(String rcvBizNo) {
		this.rcvBizNo = rcvBizNo;
	}

	/**
	 * @return the rcvMembYn
	 */
	public String getRcvMembYn() {
		return rcvMembYn;
	}

	/**
	 * @param rcvMembYn the rcvMembYn to set
	 */
	public void setRcvMembYn(String rcvMembYn) {
		this.rcvMembYn = rcvMembYn;
	}

	/**
	 * @return the rcvType
	 */
	public String getRcvType() {
		return rcvType;
	}

	/**
	 * @param rcvType the rcvType to set
	 */
	public void setRcvType(String rcvType) {
		this.rcvType = rcvType;
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
	 * @return the rcvCoNm
	 */
	public String getRcvCoNm() {
		return rcvCoNm;
	}

	/**
	 * @param rcvCoNm the rcvCoNm to set
	 */
	public void setRcvCoNm(String rcvCoNm) {
		this.rcvCoNm = rcvCoNm;
	}

	/**
	 * @return the rcvMembNo
	 */
	public String getRcvMembNo() {
		return rcvMembNo;
	}

	/**
	 * @param rcvMembNo the rcvMembNo to set
	 */
	public void setRcvMembNo(String rcvMembNo) {
		this.rcvMembNo = rcvMembNo;
	}

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

}
