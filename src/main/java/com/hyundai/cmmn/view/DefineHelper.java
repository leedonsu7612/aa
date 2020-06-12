package com.hyundai.cmmn.view;

/**
 * 각종 코드 정의
 *
 */
/**
 * @deprecated
 * @author mist
 *
 */
public class DefineHelper {

	// -------------------------------
	// 100 : 포맷 코드 관련
	// -------------------------------
	public static int FORMAT_DATE = 100;			    	//포맷 날짜
	public static int FORMAT_COMMA = 101;			    	//포맷 콤마
	public static int FORMAT_ZIP = 102;			    		//포맷 우편번호
	public static int FORMAT_1000000 = 103;			    	//백만원
	public static int FORMAT_DATE_DASH = 104;			    //포맷 날짜 (-)구분
	public static int FORMAT_1000 = 105;			    	//천원
	public static int FORMAT_1000000P3 = 106;			    	//백만원소수점3자리


    public int getFormatDate() {
    	int result = FORMAT_DATE;

		return result;
    }

    public int getFormatComma() {
    	int result = FORMAT_COMMA;

		return result;
    }

    public int getFormatZip() {
    	int result = FORMAT_ZIP;

		return result;
    }

    public int getFormat1000000() {
    	int result = FORMAT_1000000;

		return result;
    }

    public int getFormat1000() {
    	int result = FORMAT_1000;

		return result;
    }

    public int getFormatDateDash() {
    	int result = FORMAT_DATE_DASH;

		return result;
    }

    public int getFormat1000000P3() {
    	int result = FORMAT_1000000P3;

		return result;
    }
}
