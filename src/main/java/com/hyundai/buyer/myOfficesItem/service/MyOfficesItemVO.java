package com.hyundai.buyer.myOfficesItem.service;

import java.io.Serializable;
import java.util.List;

/**
 * @Class Name : MyOfficesItemVO.java
 * @Description : Buyer MyOfficesItemVO Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.20   CDF Team    최초생성
 *
 * @author CDF 개발팀
 * @since 2018.11.20
 * @version 1.0
 *
 */

public class MyOfficesItemVO implements Serializable {

	/** serialVersion UID */
	private static final long serialVersionUID = 6664821424692552545L;

	/** 사업자번호 */
	private String businessNo;

	/** 구분 */
	private String membClass;

	/** 거래처 사업자번호 */
	private String itemCode;
	private List<String> itemCodeList;

	/** 등록일 */
	private String regDate;

	/** 삭제여부 */
	private String isDelete;

	/** 거래처 코드 */
	private String MembNo;

	/** 거래처명 */
	private String CompanyName;

	public String getBusinessNo() {
		return businessNo;
	}

	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}

	public String getMembClass() {
		return membClass;
	}

	public void setMembClass(String membClass) {
		this.membClass = membClass;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public List<String> getItemCodeList() {
		return itemCodeList;
	}

	public void setItemCodeList(List<String> itemCodeList) {
		this.itemCodeList = itemCodeList;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

	public String getMembNo() {
		return MembNo;
	}

	public void setMembNo(String membNo) {
		MembNo = membNo;
	}

	public String getCompanyName() {
		return CompanyName;
	}

	public void setCompanyName(String companyName) {
		CompanyName = companyName;
	}

}
