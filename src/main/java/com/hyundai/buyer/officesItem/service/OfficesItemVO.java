package com.hyundai.buyer.officesItem.service;

import java.io.Serializable;

/**
 * @Class Name : OfficesItemVO.java
 * @Description : Buyer OfficesItemVO Class
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

public class OfficesItemVO implements Serializable {

	/** serialVersion UID */
	private static final long serialVersionUID = 6814430774288981255L;

	/** 검색어 */
	private String searchKeyword;

	/** 코드 */
	private String membNo;

	/** 상호명 */
	private String companyName;

	/** 사업자번호 */
	private String businessNo;

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getMembNo() {
		return membNo;
	}

	public void setMembNo(String membNo) {
		this.membNo = membNo;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getBusinessNo() {
		return businessNo;
	}

	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}

}
