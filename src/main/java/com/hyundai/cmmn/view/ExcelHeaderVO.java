/*************************************************************************
 * CLASS 명  	: ExcelHeaderVO
 * 작 업 일  	: 2014.11.28
 * 기    능  	: 엑셀헤더 관리
 * ---------------------------- 변 경 이 력 --------------------------------
 * 번호  작 업 자     작     업   일         변 경 내 용             비고
 * ----  --------  -----------------  -------------------------    --------
 **************************************************************************/
package com.hyundai.cmmn.view;


public class ExcelHeaderVO {

	private String header;
	private int startY;
	private int startX;
	private int endY;
	private int endX;


	/**
	 * 해당텍스트를 엑셀기준 세로1=1 가로A=1로 계산하여 , 세로를 Y,가로를 X로 잡고
	 * (헤더명,시작Y,시작X,종료Y,종료X)점을 머징한다.
	 * @param header
	 * @param startX
	 * @param startY
	 * @param endX
	 * @param endY
	 */
	public ExcelHeaderVO(String header,int startY,int startX,int endY,int endX ){
		this.header = header;
		this.startY = startY;
		this.startX = startX;
		this.endY = endY;
		this.endX = endX;
	}


	public String getHeader() {
		return header;
	}
	public int getStartX() {
		return startX;
	}
	public int getStartY() {
		return startY;
	}
	public int getEndX() {
		return endX;
	}
	public int getEndY() {
		return endY;
	}



}
