package com.hyundai.admin.limitInfo.service;

import java.io.Serializable;

/**
 * @Class Name : LimitHistoryVO.java
 * @Description : LimitHistoryVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.12.14   CDF Team        최초생성
 *
 * @author CDF 개발팀
 * @since 2018.12.14
 * @version 1.0
 *
 */
public class LimitHistoryVO implements Serializable {

	private static final long serialVersionUID = 1L;

	/* 요청ID */
	private String reqId;
	
	/* 대리점사업자번호 */
	private String businessNo;
	
	/* 대리점명 */
	private String companyName;
		
	/* 한도요청구분코드(LM01:최초한도설정,LM02:한도증액,LM03:한도감액,LM04:한도이관,LM05:휴업,LM06:폐업) */
	private String lmtReqGbn;
		
	/* 진행상태번호(0:취소,1:요청,2:처리승인대기,3:확인중(이후취소불가),4:승인대기,5:승인취소,6:승인,97:모비스부서장반려,98:HCI사원반려,99:HCI부서장반려,100:완료) */
	private int processNo = 0;
		
	/* 진행상태 */
	private String process;

	/* 요청한도 */
	private int reqLimit = 0;
		
	/* 등록시간 */
	private String regDate;

	/* 총거래한도 */
	private int salesLimit = 0;

	
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

}
