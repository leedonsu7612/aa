package com.hyundai.admin.authorization.service;

import java.io.Serializable;

/**
 * @Class Name : MenuAuthVO.java
 * @Description : MenuAuthVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.12.23   CDF Team        최초생성
 *
 * @author CDF Team
 * @since 2018.12.23
 * @version 1.0
 *
 */

public class MenuAuthVO implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private String menuId;
	private String parentId;
	private String menuNm;
	private String authClass;
	private int numOfChildren = 0;
	private String useAt;
	
	/**
	 * @return the menuId
	 */
	public String getMenuId() {
		return menuId;
	}
	
	/**
	 * @param menuId the menuId to set
	 */
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	
	/**
	 * @return the parentId
	 */
	public String getParentId() {
		return parentId;
	}
	
	/**
	 * @param parentId the parentId to set
	 */
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	
	/**
	 * @return the menuNm
	 */
	public String getMenuNm() {
		return menuNm;
	}
	
	/**
	 * @param menuNm the menuNm to set
	 */
	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}
	
	/**
	 * @return the useAt
	 */
	public String getUseAt() {
		return useAt;
	}
	
	/**
	 * @param useAt the useAt to set
	 */
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}

	/**
	 * @return the authClass
	 */
	public String getAuthClass() {
		return authClass;
	}

	/**
	 * @param authClass the authClass to set
	 */
	public void setAuthClass(String authClass) {
		this.authClass = authClass;
	}

	/**
	 * @return the numOfChildren
	 */
	public int getNumOfChildren() {
		return numOfChildren;
	}

	/**
	 * @param numOfChildren the numOfChildren to set
	 */
	public void setNumOfChildren(int numOfChildren) {
		this.numOfChildren = numOfChildren;
	}
	
}
