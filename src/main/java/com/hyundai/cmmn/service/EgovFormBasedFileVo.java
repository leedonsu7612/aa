package com.hyundai.cmmn.service;

import java.io.Serializable;

/**
 * @Class Name : EgovFormBasedFileVo.java
 * @Description : Form-based File Upload VO
 * @Modification Information
 * 
 *               수정일 수정자 수정내용 ------- -------- ---------------------------
 *               2009.08.26 한성곤 최초 생성
 * 
 * @author 공통컴포넌트 개발팀 한성곤
 * @since 2009.08.26
 * @version 1.0
 * @see Copyright (C) 2008 by MOPAS All right reserved.
 */
@SuppressWarnings("serial")
public class EgovFormBasedFileVo implements Serializable {
	/** 첨부파일 아이디 */
	public String rsrcId = "";
	/** 생성일자 */
	public String creatDt = "";
	/** 파일명 */
	private String fileName = "";
	/** ContextType */
	private String contentType = "";
	/** 하위 디렉토리 지정 */
	private String serverSubPath = "";
	/** 물리적 파일명 */
	private String physicalName = "";
	/** 파일 사이즈 */
	private long size = 0L;
	/** 파일연번 */
	public String fileSn = "";
	/** 이미지 ALT 값 */
	public String imgAlt = "";

	/**
	 * @return the rsrcId
	 */
	public String getRsrcId() {
		return rsrcId;
	}

	/**
	 * @param rsrcId
	 *            the rsrcId to set
	 */
	public void setRsrcId(String rsrcId) {
		this.rsrcId = rsrcId;
	}

	/**
	 * @return the creatDt
	 */
	public String getCreatDt() {
		return creatDt;
	}

	/**
	 * @param creatDt
	 *            the creatDt to set
	 */
	public void setCreatDt(String creatDt) {
		this.creatDt = creatDt;
	}

	/**
	 * @return the fileSn
	 */
	public String getFileSn() {
		return fileSn;
	}

	/**
	 * @param fileSn
	 *            the fileSn to set
	 */
	public void setFileSn(String fileSn) {
		this.fileSn = fileSn;
	}

	/**
	 * @return the imgAlt
	 */
	public String getImgAlt() {
		return imgAlt;
	}

	/**
	 * @param imgAlt
	 *            the imgAlt to set
	 */
	public void setImgAlt(String imgAlt) {
		this.imgAlt = imgAlt;
	}

	/**
	 * fileName attribute를 리턴한다.
	 * 
	 * @return the fileName
	 */
	public String getFileName() {
		return fileName;
	}

	/**
	 * fileName attribute 값을 설정한다.
	 * 
	 * @param fileName
	 *            the fileName to set
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	/**
	 * contentType attribute를 리턴한다.
	 * 
	 * @return the contentType
	 */
	public String getContentType() {
		return contentType;
	}

	/**
	 * contentType attribute 값을 설정한다.
	 * 
	 * @param contentType
	 *            the contentType to set
	 */
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	/**
	 * serverSubPath attribute를 리턴한다.
	 * 
	 * @return the serverSubPath
	 */
	public String getServerSubPath() {
		return serverSubPath;
	}

	/**
	 * serverSubPath attribute 값을 설정한다.
	 * 
	 * @param serverSubPath
	 *            the serverSubPath to set
	 */
	public void setServerSubPath(String serverSubPath) {
		this.serverSubPath = serverSubPath;
	}

	/**
	 * physicalName attribute를 리턴한다.
	 * 
	 * @return the physicalName
	 */
	public String getPhysicalName() {
		return physicalName;
	}

	/**
	 * physicalName attribute 값을 설정한다.
	 * 
	 * @param physicalName
	 *            the physicalName to set
	 */
	public void setPhysicalName(String physicalName) {
		this.physicalName = physicalName;
	}

	/**
	 * size attribute를 리턴한다.
	 * 
	 * @return the size
	 */
	public long getSize() {
		return size;
	}

	/**
	 * size attribute 값을 설정한다.
	 * 
	 * @param size
	 *            the size to set
	 */
	public void setSize(long size) {
		this.size = size;
	}
}
