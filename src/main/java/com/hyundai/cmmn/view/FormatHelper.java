package com.hyundai.cmmn.view;

import java.math.BigDecimal;
import java.text.DecimalFormat;

import org.apache.log4j.Logger;

/**
 * @author mist
 *
 */
public class FormatHelper {

	private static final Logger LOG = Logger.getLogger(StaticUtil.class.getName());

    UtilityHelper util = new UtilityHelper();

	/**
    * 연도, 월, 일을 flag로 연결하여 반환한다.
    * @param   year    복사할 파일의 위치와 이름
    * @param   month   복사되어질 파일의 위치와 이름
    * @param   day     동일 파일이 존재할 경우 Overwrite 여부 체크
    * @param   flag    원본 파일의 삭제 여부
    * @return  String  날자
    */
    public String dateFormat(int year, int month, int day, String flag) {
		String newFormat = "";
		//try {
    		if(flag != null) {
		        newFormat = util.fillLeft(String.valueOf(year),  4, "0") + flag
		                  + util.fillLeft(String.valueOf(month), 2, "0") + flag
		                  + util.fillLeft(String.valueOf(day),   2, "0");
    		}
        //}
        //catch(Exception e) {
        //    e.printStackTrace();
        //}

		return newFormat;
    }


	/**
    * 연도, 월, 일을 flag로 연결하여 반환한다.
    * @param   year    복사할 파일의 위치와 이름
    * @param   month   복사되어질 파일의 위치와 이름
    * @param   day     동일 파일이 존재할 경우 Overwrite 여부 체크
    * @param   flag    원본 파일의 삭제 여부
    * @return  String  날자
    */
    public String dateFormat(String year, String month, String day, String flag) {
		String newFormat = "";
		//try {
    		if(year!=null && month!=null && day!=null) {
				if(flag != null) {
			        newFormat = util.fillLeft(year, 4, "0") + flag
			                  + util.fillLeft(month, 2, "0") + flag
				              + util.fillLeft(day, 2, "0");
    			}
			}
        //}
        //catch(Exception e) {
        //    e.printStackTrace();
        //}

		return newFormat;
    }

	/**
     * 연도, 월을 flag로 연결하여 반환한다.
     * @param   year    복사할 파일의 위치와 이름
     * @param   month   복사되어질 파일의 위치와 이름
     * @param   day     동일 파일이 존재할 경우 Overwrite 여부 체크
     * @param   flag    원본 파일의 삭제 여부
     * @return  String  날자
     */
     public String dateFormat(String year, String month, String flag) {
 		String newFormat = "";
     		if(year!=null && month!=null) {
 				if(flag != null) {
 			        newFormat = util.fillLeft(year, 4, "0") + flag
 			                  + util.fillLeft(month, 2, "0");
     			}
 			}


 		return newFormat;
     }


	/**
    * 연도, 월, 일을 flag로 연결하여 반환한다.
    * @param   dateFull    날자(YYYYMMDD 형식)
    * @param   flag        문자열 연결자("." => YYYY.MM.DD)
    * @return  String      flag로 연결된 문자열
    */
    public String dateFormat(String dateFull) {
		String newFormat = "";
		String flag = ".";

        if(dateFull != null && !dateFull.equals("") && dateFull.length() > 7 && flag != null) {
    		dateFull = dateFull.trim();
    		int len  = dateFull.length();
    		if(len >= 8) {
				newFormat = dateFormat(dateFull.substring(0, 4), dateFull.substring(4, 6), dateFull.substring(6, 8), flag);
			}
    		else if(len >= 6) {
				newFormat = dateFormat(dateFull.substring(0, 4), dateFull.substring(4, 6), dateFull.substring(6, len), flag);
			}
    		else if(len >= 4) {
				newFormat = dateFormat(dateFull.substring(0, 4), dateFull.substring(4, len), "", flag);
			}
    		else {
				newFormat = dateFormat(dateFull.substring(0, len), "", "", flag);
			}
	    }

		return newFormat;
    }



	/**
    * 연도, 월, 일을 flag로 연결하여 반환한다.
    * @param   dateFull    날자(YYYYMMDD 형식)
    * @param   flag        문자열 연결자("." => YYYY.MM.DD)
    * @return  String      flag로 연결된 문자열
    */
    public String dateFormat(String dateFull, String flag) {
		String newFormat = "";
        if(dateFull != null && !dateFull.equals("") && flag != null) {
    		dateFull = dateFull.trim();
    		int len  = dateFull.length();
    		if(len >= 8) {
				newFormat = dateFormat(dateFull.substring(0, 4), dateFull.substring(4, 6), dateFull.substring(6, 8), flag);
			}
    		else if(len > 6) {
				newFormat = dateFormat(dateFull.substring(0, 4), dateFull.substring(4, 6), dateFull.substring(6, len), flag);
			}
    		else if(len == 6) {
				newFormat = dateFormat(dateFull.substring(0, 4), dateFull.substring(4, 6), flag);
			}
    		else if(len >= 4) {
				newFormat = dateFormat(dateFull.substring(0, 4), dateFull.substring(4, len), "", flag);
			}
    		else {
				newFormat = dateFormat(dateFull.substring(0, len), "", "", flag);
			}
	    }

		return newFormat;
    }


	/**
    * 연도, 월, 일을 flag로 연결하여 반환한다.
    * @param   dateFull    날자(YYYYMMDD 형식)
    * @param   flag        문자열 연결자("-" => YYYY-MM-DD)
    * @return  String      flag로 연결된 문자열
    */
    public String dateFormatDash(String dateFull) {
		String newFormat = "";
		String flag = "-";

		if(dateFull != null && !dateFull.equals("") && flag != null) {
			dateFull = dateFull.trim();
    		int len  = dateFull.length();
    		if(len >= 8) {
				newFormat = dateFormat(dateFull.substring(0, 4), dateFull.substring(4, 6), dateFull.substring(6, 8), flag);
			}
    		else if(len > 6) {
				newFormat = dateFormat(dateFull.substring(0, 4), dateFull.substring(4, 6), dateFull.substring(6, len), flag);
			}
    		else if(len == 6) {
				newFormat = dateFormat(dateFull.substring(0, 4), dateFull.substring(4, 6), flag);
			}
    		else if(len >= 4) {
				newFormat = dateFormat(dateFull.substring(0, 4), dateFull.substring(4, len), "", flag);
			}
    		else {
				newFormat = dateFormat(dateFull.substring(0, len), "", "", flag);
			}
	    }

		return newFormat;
    }


	/**
    * 입력된 날자 문자열을 분리하여 연도, 월, 일을 String[]에 담아 반환한다.
    * @param   dateFull    날자(YYYYMMDD 형식)
    * @return  String[]    날자
    */
    public String[] dateFormatSplit(String dateFull) {
		String[] newFormat = new String[]{"", "", ""};
        if(dateFull != null && dateFull.length() > 0) {
    		dateFull = dateFull.trim();
    		int len  = dateFull.length();
    		if(len >= 8) {
				newFormat[0] = dateFull.substring(0, 4);
				newFormat[1] = dateFull.substring(4, 6);
				newFormat[2] = dateFull.substring(6, 8);
			}
    		else if(len >= 6) {
				newFormat[0] = dateFull.substring(0, 4);
				newFormat[1] = dateFull.substring(4, 6);
				newFormat[2] = dateFull.substring(6, len);
			}
    		else if(len >= 4) {
				newFormat[0] = dateFull.substring(0, 4);
				newFormat[1] = dateFull.substring(4, len);
				newFormat[2] = "";
			}
    		else {
				newFormat[0] = dateFull.substring(0, len);
				newFormat[1] = "";
				newFormat[2] = "";
			}
	    }

		return newFormat;
    }


    /**
	* 기능 : 3개의 문자열로 나뉘어져 있는 전화번호를 "-"으로 연결된 하나의 문자열로 변환하여 반환한다.
	* 입력화면에서 나뉘어져 있는 각각의 전화번호 필드를 DB의 하나의 Column에 넣을때 사용한다.
    * param    str1      지역번호
    * param    str2      국번
    * param    str3      번호
    *@return   String    하나의 문자열로 연결된 문자열
	*/
    public String convTelNumber(String str1, String str2, String str3) {
        String telNumber = "";
        str1 = (str1 == null) ? "" : str1;
        str2 = (str2 == null) ? "" : str2;
        str3 = (str3 == null) ? "" : str3;

        return str1 + "-" + str2 + "-" + str3;
    }

    /**
	* 기능 : 3개의 문자열로 나뉘어져 있는 전화번호를 "-"으로 연결된 하나의 문자열로 변환하여 반환한다.
	* 입력화면에서 나뉘어져 있는 각각의 전화번호 필드를 DB의 하나의 Column에 넣을때 사용한다.
    * param    str1      지역번호
    * param    str2      국번
    * param    str3      번호
    *@return   String[]  전화번호 데이터
	*/
    public String[] convTelNumber(String telNumber) {
        String[] str = new String[]{"", "", ""};
        if(telNumber != null) {
            int index   = 0;
            String temp = "";
            int maxLen  = telNumber.length();
            for(int i=0; i<maxLen; i++) {
                temp = telNumber.substring(i, i+1);
                if("-".equals(temp)) {
                    str[index] += "";
                    index++;
                }
                else {
                    str[index] += temp;
                }
            }
        }

        return str;
    }


    /**
	* 기능 : 우편번호 6자리를 받아 3자리씩 끊어 flag로 구분하여 연결한 문자열로 반환한다.
    * param    zipcode   우편번호(하나의 문자열)
    *@return   String[]  우편번호
	*/
    public String convertZipcode(String zipcode) {
    	String flag = "-";
    	String newZipcode = "";

        if(zipcode != null && zipcode.length() != 0) {
            zipcode = zipcode.trim();
            int len = zipcode.length();
            if(len >= 6) {
                newZipcode = zipcode.substring(0, 3) + flag + zipcode.substring(3, 6);
            }
            else if(len >= 3) {
                newZipcode = zipcode.substring(0, 3) + flag + zipcode.substring(3, len);
            }
            else {
                newZipcode = zipcode.substring(0, len) + flag + "";
            }
        }

        return newZipcode;
    }


    /**
	* 기능 : 우편번호 6자리를 받아 3자리씩 끊어 flag로 구분하여 연결한 문자열로 반환한다.
    * param    zipcode   우편번호(하나의 문자열)
    *@return   String[]  우편번호
	*/
    public String convZipcode(String zipcode, String flag) {
        String newZipcode = "";
        if(zipcode != null && zipcode.length() != 0) {
            zipcode = zipcode.trim();
            int len = zipcode.length();
            if(len >= 6) {
                newZipcode = zipcode.substring(0, 3) + flag + zipcode.substring(3, 6);
            }
            else if(len >= 3) {
                newZipcode = zipcode.substring(0, 3) + flag + zipcode.substring(3, len);
            }
            else {
                newZipcode = zipcode.substring(0, len) + flag + "";
            }
        }

        return newZipcode;
    }


    /**
	* 기능 : 우편번호 6자리를 받아 size가 2인 1차원 배열에 3자리씩 끊어 담아 반환한다.
    * param    zipcode   우편번호(하나의 문자열)
    * param    flag      구분자
    *@return   String[]  우편번호
	*/
    public String[] convZipcode(String zipcode) {
        String[] str = new String[]{"", ""};
        if(zipcode != null && zipcode.length() != 0) {
            zipcode = zipcode.trim();
            int len = zipcode.length();
            if(len >= 6) {
                str[0] = zipcode.substring(0, 3);
                str[1] = zipcode.substring(3, 6);
            }
            else if(len >= 3) {
                str[0] = zipcode.substring(0, 3);
                str[1] = zipcode.substring(3, len);
            }
            else {
                str[0] = zipcode.substring(0, len);
                str[1] = "";
            }
        }

        return str;
    }


    /**
	* 기능 : 주민번호 13자리를 받아 6, 7자리로 각각 끊어 flag로 구분하여 연결한 문자열로 반환한다.
    * param    zipcode   우편번호(하나의 문자열)
    * param    flag      구분자
    *@return   String[]  우편번호
	*/
    public String convRegitNumber(String regitNumber, String flag) {
        String newRegitNuber = "";
        if(regitNumber != null && regitNumber.length() != 0) {
            regitNumber  = regitNumber.trim();
            int len = regitNumber.length();
            if(len >= 13) {
                newRegitNuber = regitNumber.substring(0, 6) + flag + regitNumber.substring(6, 13);
            }
            else if(len >= 6) {
                newRegitNuber = regitNumber.substring(0, 6) + flag + regitNumber.substring(6, len);
            }
            else {
                newRegitNuber = regitNumber.substring(0, len) + flag + "";
            }
        }

        return newRegitNuber;
    }


    /**
	* 기능 : 주민번호 13자리를 받아 6, 7자리로 각각 끊어1차원 배열에 담아 반환한다.
    * param    zipcode   우편번호(하나의 문자열)
    *@return   String[]  우편번호
	*/
    public String[] convRegitNumber(String regitNumber) {
        String[] str = new String[]{"", ""};
        if(regitNumber != null && regitNumber.length() != 0) {
            regitNumber  = regitNumber.trim();
            int len = regitNumber.length();
            if(len >= 13) {
                str[0] = regitNumber.substring(0, 6);
                str[1] = regitNumber.substring(6, 13);
            }
            else if(len >= 6) {
                str[0] = regitNumber.substring(0, 6);
                str[1] = regitNumber.substring(6, len);
            }
            else {
                str[0] = regitNumber.substring(0, len);
                str[1] = "";
            }
        }

        return str;
    }


	/**
	* 기능 : 숫자 3자리 당 콤마(,) 찍어 줌   ex) ###,###,###.#####
    * param    val     문자형 숫자
	* @return  결과값
	*/
    public String numberFormat(String val) {
    	String ls_sign = "";
    	String ls_num01 = "";
    	String ls_num02 = "";
		if (util.nullCheck(val) == false && val.length() > 0) {
			if ((val.substring(0,1)).equals("-")) {
				ls_sign = "-";
				val = val.substring(1,val.length());
			}
			if ((val.indexOf(".")) != -1) {
				if ((val.length()-1) > val.indexOf(".")) ls_num02 = val.substring(val.indexOf("."), val.length());
				if ((val.indexOf(".")) == 0) val   = "0";
				else val   = val.substring(0, val.indexOf("."));
			}
			if ((val.length()) > 0) {
				for (int i = 0; i < val.length(); i++) {
					if (i > 0 && ((val.length()-i) % 3) == 0) ls_num01 += ",";
					ls_num01 += val.charAt(i);
				}
			}
		}
		val = ls_num01 +ls_num02;
		if (val.equals("") || val.equals("0")) return val;
        else return (ls_sign+val);
    }

    public String numberFormat(int val) {
    	return numberFormat(Integer.toString(val));
    }

    /**
     * 파일 사이즈를 입력받아 크기에 맞는 단위로 반환한다. (2009.04.20 윤진모)
     * @param filesize
     * @return
     */
    public String transFilesize(int filesize){
    	String strFilesize;
    	BigDecimal returnData = null;
    	strFilesize = "";

    	if(filesize < 1024){
    		strFilesize = filesize + " Byte";
    	}else if(filesize >= 1024 && filesize < 1024 * 1024){
    		returnData = new BigDecimal((float)filesize / 1024).setScale(2, BigDecimal.ROUND_HALF_UP);
    		strFilesize = returnData + " Kb";
    	}else if(filesize >= 1024 * 1024 && filesize < 1024 * 1024 * 1024){
    		returnData = new BigDecimal((float)filesize / 1024 / 1024).setScale(2, BigDecimal.ROUND_HALF_UP);
    		strFilesize = returnData + " Mb";
    	}else if(filesize >= 1024 * 1024 * 1024){
    		returnData = new BigDecimal((float)filesize / 1024 / 1024 / 1024).setScale(2, BigDecimal.ROUND_HALF_UP);
    		strFilesize = returnData + " Gb";
    	}

    	return strFilesize;

    }

    /**
     * 월 또는 일이 10보다 작으면 숫자 앞에 0을 붙여준다.
     * @param stMonthOrDay
     * @return
     */
    public String monthOrDayFormat( String stMonthOrDay )
    {
    	if( !"".equals(stMonthOrDay) && stMonthOrDay != null )
    	{
    		return monthOrDayFormat( Integer.parseInt(stMonthOrDay) );
    	}
    	else
    	{
    		return "";
    	}
    }

    /**
     * 월 또는 일이 10보다 작으면 숫자 앞에 0을 붙여준다.
     * @param nMonthOrDay
     * @return
     */
    public String monthOrDayFormat( int nMonthOrDay )
    {
    	String stNewMonthOrDay = "";

    	if( nMonthOrDay < 10 )
    	{
    		stNewMonthOrDay = "0" + nMonthOrDay;
    	}
    	else
    	{
    		stNewMonthOrDay = "" + nMonthOrDay;
    	}

    	return stNewMonthOrDay;
    }

    /**
     * source 좌측에 blankChar 문자를 채워서 n자리로 만들어서 리턴
     * @param source
     * @param iLength
     * @param blankChar
     * @return
     */
    public String lpad(String source, int iLength, String blankChar) {
    	int 	iCount		= 0;
    	int 	iStrLength	= 0;
    	String	returnValue	= "";

    	iStrLength = source.length();
    	if(iStrLength >= iLength) {
    		returnValue = source;
    	} else {

    		for(iCount = iStrLength; iCount<=iLength-1; iCount++) {
    			returnValue += blankChar;
    		}
    		returnValue += source;
    	}

    	return returnValue;
    }

    /**
     *  source 좌측에 blankChar 문자를 채워서 n자리로 만들어서   리턴
     * @param nSource
     * @param iLength
     * @param blankChar
     * @return
     */
    public String lpad(int nSource, int iLength, String blankChar) {
    	return this.lpad(Integer.toString(nSource), iLength, blankChar);
    }

    /**
	* 기능 : 원단위 데이터를 백만원단위 데이터로 변경
    * param    zipcode   우편번호(하나의 문자열)
    *@return   String[]  우편번호
	*/
    public String convert1000000(String str) {
    	String newStr = "0";
        try{
	    	if(str != null && !"".equals(str)){

                double change = Double.valueOf(str.trim()).doubleValue();
                change = change / 1000000;
                DecimalFormat decimal = new DecimalFormat("###,###,##0.00");
                newStr = decimal.format(change);

	    	}
        }catch(NumberFormatException e){
        	LOG.error("convert1000000 : " +  e.getCause() + " [NumberFormatException]");
        	newStr = "0";
        }catch(NullPointerException e){
        	LOG.error("convert1000000 : " +  e.getCause() + " [NullPointerException]");
        	newStr = "0";
        }catch(IllegalArgumentException e){
        	LOG.error("convert1000000 : " +  e.getCause() + " [IllegalArgumentException]");
        	newStr = "0";
        }catch(ArithmeticException e){
        	LOG.error("convert1000000 : " +  e.getCause() + " [ArithmeticException]");
        	newStr = "0";
        }

        return newStr;
    }

    /**
	* 기능 : 원단위 데이터를 천원단위 데이터로 변경
    * param    zipcode   우편번호(하나의 문자열)
    *@return   String[]  우편번호
	*/
    public String convert1000(String str) {
    	String newStr = "0";
        try{
	    	if(str != null && !"".equals(str)){

                double change = Double.valueOf(str.trim()).doubleValue();
                change = change / 1000;
                DecimalFormat decimal = new DecimalFormat("###,###,##0.00");
                newStr = decimal.format(change);

	    	}
        }catch(NullPointerException e){
        	LOG.error("convert1000 : " +  e.getCause() + " [NullPointerException]");
        	newStr = "0";
        }catch(IllegalArgumentException e){
        	LOG.error("convert1000 : " +  e.getCause() + " [IllegalArgumentException]");
        	newStr = "0";
        }catch(ArithmeticException e){
        	LOG.error("convert1000 : " +  e.getCause() + " [ArithmeticException]");
        	newStr = "0";
        }

        return newStr;
    }




    /**
     *  str에 format 적용
     * @param str
     * @param format
     * @return
     */
    public String format(String str, int format) {
    	String result = "";

		if (format == DefineHelper.FORMAT_DATE) {
			result = dateFormat(str);
		} else if (format == DefineHelper.FORMAT_COMMA) {
			result = numberFormat(str);
		} else if (format == DefineHelper.FORMAT_ZIP) {
			result = convertZipcode(str);
		} else if (format == DefineHelper.FORMAT_1000000) {
			result = convert1000000(str);
		} else if (format == DefineHelper.FORMAT_DATE_DASH) {
			result = dateFormat(str, "-");
		}else if (format == DefineHelper.FORMAT_1000) {
			result = convert1000(str);
		}else if (format == DefineHelper.FORMAT_1000000P3) {
			result = convert1000000P3(str);
		}

    	return result;
    }

    /**
	* 기능 : 원단위 데이터를 백만원단위 데이터로 변경
    * param
    *@return
	*/
    public String convert1000000P3(String str) {
    	String newStr = "0";
        try{
	    	if(str != null && !"".equals(str)){

                double change = Double.valueOf(str.trim()).doubleValue();
                change = change / 1000;
                change = Math.floor(change);
                change = change * 1000;
                change = change / 1000000;
                DecimalFormat decimal = new DecimalFormat("###,###,##0.000");
                newStr = decimal.format(change);

	    	}
        }catch(NullPointerException e){
        	LOG.error("convert1000000P3 : " +  e.getCause() + " [NullPointerException]");
        	newStr = "0";
        }catch(IllegalArgumentException e){
        	LOG.error("convert1000000P3 : " +  e.getCause() + " [IllegalArgumentException]");
        	newStr = "0";
        }catch(ArithmeticException e){
        	LOG.error("convert1000000P3 : " +  e.getCause() + " [ArithmeticException]");
        	newStr = "0";
        }

        return newStr;
    }

   /**
    * 기능 : 사업자번호 10자리를 받아 6, 7자리로 각각 끊어 flag로 구분하여 연결한 문자열로 반환한다.
    * param    CompanyNo   사업자번호(하나의 문자열)
    * param    flag      구분자
    *@return   String  사업자번호 형식
    */
    public String convCompanyNo(String CompanyNo, String flag) {
        String newCompanyNo = "";
        if(CompanyNo != null && CompanyNo.length() != 0) {
            CompanyNo  = CompanyNo.trim();
            int len = CompanyNo.length();
            if(len >= 10) {
                newCompanyNo = CompanyNo.substring(0, 3) + flag + CompanyNo.substring(3, 5)  + flag + CompanyNo.substring(5, 10);
            }
            else {
                newCompanyNo = CompanyNo.substring(0, len) + "";
            }
        }

        return newCompanyNo;
    }

    /**
     * 기능 : 숫자포맷형식 적용
     * param
     *@return   String
     */
    public static String eRateFormat(String str, String format, int round, String ment){
        String temp 	= "";
        String rtstr	= "";

        if(str == null){
            temp 	= "";
            rtstr	= "";
        }else{
            try{
            	BigDecimal bigd = new BigDecimal(str);
            	BigDecimal b = bigd.setScale(round, java.math.BigDecimal.ROUND_HALF_UP);
            	temp = b.toString();

            	double change = Double.parseDouble(temp);
            	DecimalFormat decimal = new DecimalFormat(format);
            	rtstr = decimal.format(change);
            }catch(NumberFormatException e){
            	LOG.error("eRateFormat : " +  e.getCause() + " [ArithmeticException]");
                return ment;
            }catch(NullPointerException e){
            	LOG.error("eRateFormat : " +  e.getCause() + " [NullPointerException]");
            	return ment;
            }catch(IllegalArgumentException e){
            	LOG.error("eRateFormat : " +  e.getCause() + " [IllegalArgumentException]");
            	return ment;
            }catch(ArithmeticException e){
            	LOG.error("eRateFormat : " +  e.getCause() + " [ArithmeticException]");
                return ment;
            }
        }
        return rtstr;
    }

}
