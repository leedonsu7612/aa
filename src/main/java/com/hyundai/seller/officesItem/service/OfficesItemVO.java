package com.hyundai.seller.officesItem.service;

import java.io.Serializable;

/**
 * @Class Name : SellerOfficesItemVO.java
 * @Description : seller OfficesItemVO Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.30   CDF Team    최초생성
 *
 * @author CDF 개발팀
 * @since 2018.11.30
 * @version 1.0
 *
 */

public class OfficesItemVO implements Serializable {

	/** serialVersion UID */
	private static final long serialVersionUID = -3024931055579021828L;

	/** 검색어 */
	private String searchKeyword;

	/** 품목점명 */
	private String companyName;

	/** 품목점 코드 */
	private String membNo;

	/** 사업자번호 */
	private String businessNo;

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getMembNo() {
		return membNo;
	}

	public void setMembNo(String membNo) {
		this.membNo = membNo;
	}

	public String getBusinessNo() {
		return businessNo;
	}

	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}

}
