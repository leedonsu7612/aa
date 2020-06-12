package com.hyundai.usr.service;

import java.io.Serializable;

/**
 * @Class Name : RegistVO.java
 * @Description : RegistVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.16   CDF Team        최초생성
 *
 * @author CDF Team
 * @since 2018.11.16
 * @version 1.0
 *
 */

public class RegistVO implements Serializable {
	
	private static final long serialVersionUID = 1L;

	/* tb_memb_id_info table */
	private String userSeqNo;
	private String userId;
	private String userPw;
	
	/* tb_memb_info */
	/*  */
	private String membNo;
	/* 사업자번호 */
	private String businessNo;
	/* 거래처 형태(품목점:S, 대리점:B) */
	private String membClass;
	/* 기업형태(법인:C, 개인:B) */
	private String companyGbn;
	/* 회사명 */
	private String companyName;
	/* 회사이메일 */
	private String officesName;
	/* 대표자명 */
	private String ceoName;
	/*  */
	private String lastDate;
	/* 회사주소 */
	private String companyAddress;
	/* 전화 */
	private String companyPhone;
	/* 팩스 */
	private String companyFax;
	/* 업태 */
	private String companyStatus;
	/* 업종 */
	private String companyItem;
	/* 거래은행 */
	private String bankName;
	/* 계좌번호 */
	private String bankAccount;
	/*  */
	private String companyStatusCode;
	/*  */
	private String termsYn;
	/* 모바일번호 */
	private String companyMobile;
	/*  */
	private String notifyYn;
	/*  */
	private String bizMemo;
	/* 등록일 */
	private String regDate;
	/* 첨부파일ID */
	private String atchFileId;
	
	
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
	 * @return the companyGbn
	 */
	public String getCompanyGbn() {
		return companyGbn;
	}
	/**
	 * @param companyGbn the companyGbn to set
	 */
	public void setCompanyGbn(String companyGbn) {
		this.companyGbn = companyGbn;
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
	 * @return the officesName
	 */
	public String getOfficesName() {
		return officesName;
	}
	/**
	 * @param officesName the officesName to set
	 */
	public void setOfficesName(String officesName) {
		this.officesName = officesName;
	}
	/**
	 * @return the ceoName
	 */
	public String getCeoName() {
		return ceoName;
	}
	/**
	 * @param ceoName the ceoName to set
	 */
	public void setCeoName(String ceoName) {
		this.ceoName = ceoName;
	}
	/**
	 * @return the lastDate
	 */
	public String getLastDate() {
		return lastDate;
	}
	/**
	 * @param lastDate the lastDate to set
	 */
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	/**
	 * @return the companyAddress
	 */
	public String getCompanyAddress() {
		return companyAddress;
	}
	/**
	 * @param companyAddress the companyAddress to set
	 */
	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	/**
	 * @return the companyPhone
	 */
	public String getCompanyPhone() {
		return companyPhone;
	}
	/**
	 * @param companyPhone the companyPhone to set
	 */
	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}
	/**
	 * @return the companyFax
	 */
	public String getCompanyFax() {
		return companyFax;
	}
	/**
	 * @param companyFax the companyFax to set
	 */
	public void setCompanyFax(String companyFax) {
		this.companyFax = companyFax;
	}
	/**
	 * @return the companyStatus
	 */
	public String getCompanyStatus() {
		return companyStatus;
	}
	/**
	 * @param companyStatus the companyStatus to set
	 */
	public void setCompanyStatus(String companyStatus) {
		this.companyStatus = companyStatus;
	}
	/**
	 * @return the companyItem
	 */
	public String getCompanyItem() {
		return companyItem;
	}
	/**
	 * @param companyItem the companyItem to set
	 */
	public void setCompanyItem(String companyItem) {
		this.companyItem = companyItem;
	}
	/**
	 * @return the bankName
	 */
	public String getBankName() {
		return bankName;
	}
	/**
	 * @param bankName the bankName to set
	 */
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	/**
	 * @return the bankAccount
	 */
	public String getBankAccount() {
		return bankAccount;
	}
	/**
	 * @param bankAccount the bankAccount to set
	 */
	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}
	/**
	 * @return the companyStatusCode
	 */
	public String getCompanyStatusCode() {
		return companyStatusCode;
	}
	/**
	 * @param companyStatusCode the companyStatusCode to set
	 */
	public void setCompanyStatusCode(String companyStatusCode) {
		this.companyStatusCode = companyStatusCode;
	}
	/**
	 * @return the termsYn
	 */
	public String getTermsYn() {
		return termsYn;
	}
	/**
	 * @param termsYn the termsYn to set
	 */
	public void setTermsYn(String termsYn) {
		this.termsYn = termsYn;
	}
	/**
	 * @return the companyMobile
	 */
	public String getCompanyMobile() {
		return companyMobile;
	}
	/**
	 * @param companyMobile the companyMobile to set
	 */
	public void setCompanyMobile(String companyMobile) {
		this.companyMobile = companyMobile;
	}
	/**
	 * @return the notifyYn
	 */
	public String getNotifyYn() {
		return notifyYn;
	}
	/**
	 * @param notifyYn the notifyYn to set
	 */
	public void setNotifyYn(String notifyYn) {
		this.notifyYn = notifyYn;
	}
	/**
	 * @return the bizMemo
	 */
	public String getBizMemo() {
		return bizMemo;
	}
	/**
	 * @param bizMemo the bizMemo to set
	 */
	public void setBizMemo(String bizMemo) {
		this.bizMemo = bizMemo;
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
	 * @return the atchFileId
	 */
	public String getAtchFileId() {
		return atchFileId;
	}
	/**
	 * @param atchFileId the atchFileId to set
	 */
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}
}
