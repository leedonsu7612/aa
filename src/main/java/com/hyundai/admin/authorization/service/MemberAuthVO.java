package com.hyundai.admin.authorization.service;

import com.hyundai.cmmn.service.DefaultVO;

/**
 * @Class Name : MemberAuthVO.java
 * @Description : MemberAuthVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.12.20   CDF Team        최초생성
 *
 * @author CDF 개발팀
 * @since 2018.12.20
 * @version 1.0
 *
 */
public class MemberAuthVO extends DefaultVO {

	private static final long serialVersionUID = 1L;

	/* ID */
	private String userId;

	/* password */
	private String userPw;

	/* userSeqNo */
	private String userSeqNo;

	/* 상호 */
	private String companyName;

	/* 사용여부 */
	private String isDelete;

	/* 등록일 */
	private String regDate;

	/* 구분 */
	private String membClass;
	
	/* 첨부파일ID */
	private String attchFileId;

	/* SMS발신여부 */
	private String sendSMS = "N";

	/* 문자배열 */
	private String arrStr;

	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * @return the userPw
	 */
	public String getUserPw() {
		return userPw;
	}

	/**
	 * @param userPw the userPw to set
	 */
	public void setUserPw(String userPw) {
		this.userPw = userPw;
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
	 * @return the isDelete
	 */
	public String getIsDelete() {
		return isDelete;
	}

	/**
	 * @param isDelete the isDelete to set
	 */
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
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
	 * @return the userSeqNo
	 */
	public String getUserSeqNo() {
		return userSeqNo;
	}

	/**
	 * @param userSeqNo the userSeqNo to set
	 */
	public void setUserSeqNo(String userSeqNo) {
		this.userSeqNo = userSeqNo;
	}

	/**
	 * @return the sendSMS
	 */
	public String getSendSMS() {
		return sendSMS;
	}

	/**
	 * @param sendSMS the sendSMS to set
	 */
	public void setSendSMS(String sendSMS) {
		this.sendSMS = sendSMS;
	}

	/**
	 * @return the arrStr
	 */
	public String getArrStr() {
		return arrStr;
	}

	/**
	 * @param arrStr the arrStr to set
	 */
	public void setArrStr(String arrStr) {
		this.arrStr = arrStr;
	}

}
