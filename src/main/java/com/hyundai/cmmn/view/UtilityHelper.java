package com.hyundai.cmmn.view;

import java.util.Date;
import java.util.NoSuchElementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom; 
import java.util.Random;
import java.util.StringTokenizer;
import java.util.Vector;

import org.apache.log4j.Logger;

public class UtilityHelper {

	private static final Logger LOG = Logger.getLogger(UtilityHelper.class.getName());
	/**
	* 기능 : 입력된 Object의 null여부를 체크한다.
    * param    obj      null값을 체크할 Object
	* @return  boolean  입력된 Object가 null 이면 true,
	*                   입력된 Object가 null 이 아니면 false,
	*/
    public boolean nullCheck(Object obj) {
        boolean nullStatus = false;
        if(obj == null) {
             nullStatus = true;
        }
        else {
            nullStatus = false;
        }

        return nullStatus;
    }

	/**
	* 기능 : 입력된 문자열이 null값인지 체크해서 만약 null 값이면 ""를 반환한다.
    * param    str     null값을 체크할 문자열
	* @return  String  null 값이면 빈 space, null값이 아니면 원래 문자열을 반환한다.
	*/
    public String nullToSpace(String str) {
        if(str == null) {
            return "";
        }
        else {
            return str;
        }
    }


	/**
	* 기능 : 입력된 문자열이 0 값인지 체크해서 만약 0 값이면 ""를 반환한다.
    * param    str     0 값을 체크할 문자열
	* @return  String  0 값이면 빈 space, 0 값이 아니면 원래 문자열을 반환한다.
	*/
    public String zeroToSpace(Object instr) {
    	String str = String.valueOf(instr);

    	if(str == null || "0".equals(str)) {
            return "";
        }
        else {
        	return str;
        }
    }


	/**
	* 기능 : 입력된 문자열이 0 값인지 체크해서 만약 0 값이면 ""를 반환한다.
    * param    str     0 값을 체크할 문자열
	* @return  String  0 값이면 빈 space, 0 값이 아니면 원래 문자열을 반환한다.
	*/
    public String zeroToSpace(String str) {
    	if(str == null || "0".equals(str)) {
            return "";
        }
        else {
            return str;
        }
    }


	/**
	* 기능 : 입력된 문자열이 0 값인지 체크해서 만약 0 값이면 ""를 반환한다.
    * param    str     0 값을 체크할 문자열
	* @return  String  0 값이면 빈 space, 0 값이 아니면 원래 문자열을 반환한다.
	*/
    public String zeroToSpace(int str) {
    	if(str == 0) {
            return "";
        }
        else {
            return String.valueOf(str);
        }
    }

    /**
     * 기능 : 입력된 문자열이 null값인지 체크해서 만약 null 값이면 str1(초기값)을 반환한다.
     * @param str
     * @param str1
     * @return
     */
    public String nullToSpace(String str, String str1) {
        if(str == null || str.equals("")) {
            return str1;
        }
        else {
            return str;
        }
    }

    /**
	* 기능 : 입력된 문자열이 null값인지 체크해서 만약 null 값이면 "0"를 반환한다.
    * param    str     null값을 체크할 문자열
	* @return  String  null 값이면 "0" 문자열을, null값이 아니면 원래 문자열을 반환한다.
	*/
    public String nullToZero(String str) {
        if(str == null) {
            return "0";
        }
        else {
            return str;
        }
    }

	/**
	* 기능 : token으로 연결된 문자열을 flag를 기준으로 각각 분해하여 새로운 저장소에 담아 반환한다.
    *        만약 입력되는 파라미터중 null값이 있으면 null을 반환한다.
    * param    str       flag로 연결된 문자열
    * param    token     flag(구분자) 기호
	* @return  String[]  분리된 데이터 셋
	*/
    public String[] tokenToList(String str, String flag) {
        String[] list = null;
        if(str==null || flag==null) {
            System.out.println("[UtilHelper] tokenToList() : [[Warnning]] null값이 입력되었습니다.");
        }
        else
        {
        	if( str.indexOf(flag) != -1 )
        	{
	            StringTokenizer token = new StringTokenizer(str, flag);
	            list = new String[token.countTokens()];
	            for(int i=0; token.hasMoreTokens(); i++) {
	                list[i] = token.nextToken().trim();
	            }
        	}
        	else
        	{
        		list = new String[1];
        		list[0] = str;
        	}
        }

        return list;
    }

	/**
	* 기능 : token으로 연결된 문자열을 flag를 기준으로 각각 분해하여 새로운 저장소에 담아 반환한다.
    *        만약 입력되는 파라미터중 null값이 있으면 null을 반환한다.
    * param    str       flag로 연결된 문자열
    * param    token     flag(구분자) 기호, token이 null이거나 빈 스페이스일 경우 "-"를 기본값으로 한다.
    * param    options   빈 문자열로 분리된 문자열에 대한 처리여부
                         true  : 빈 문자도 하나의 문자열로 처리하여 배열에 담는다.
                         false : 빈 문자는 비어있는데이터로 간주한다.
	* @return  String[]  분리된 데이터 셋
	*/
    public String[] tokenToList(String str, String flag, boolean options) {
        String[] list = null;

        if(flag == null || flag.length() == 0) {
            flag = "-";
        }

        if(str==null) {
            System.out.println("[UtilHelper] tokenToList() : [[Warnning]] null값이 입력되었습니다.");
        }
        else {
            if(options) {
                Vector tempList = new Vector();
                int startIndex = -1;
                int endIndex   = str.indexOf(flag);

                while(endIndex != -1) {
                    tempList.add(str.substring(startIndex+1, endIndex));
                    startIndex = endIndex;
                    endIndex   = str.indexOf(flag, startIndex+1);
                }
                if(str.lastIndexOf(flag) != -1) {
                    tempList.add(str.substring(startIndex+1, str.length()));
                }

                list = new String[tempList.size()];
                for(int i=0; i<list.length; i++) {
                    list[i] = (String)tempList.get(i);
                }
                if(list!=null && list.length>0) {
                    list[list.length-1] = str.substring(startIndex+1, str.length());
                }
            }
            else {
               list = tokenToList(str, flag);
            }
        }

        return list;
    }

	/**
	* 기능 : 문자열이 flag1으로 연결되어 있고, 그렇게 연결된 문자열들이 flag2로 다시 여러개 연결되어 있을 경우
	*        flag2을 기준으로 분리한뒤, flag1으로 다시 각각의 문자열을 분리하여 배열에 담은 뒤
	*        각각의 배열을 벡터에 담아 반환한다.
    *        만약 입력되는 파라미터중 null값이 있으면 null을 반환한다.
    *        예를 들면 tokenToList("20020101,20020201,20020301*1,2,3", "*", ",")
    *        이런 메소드가 호출 되었을 경우
    *        우선 "*"을 기준으로 두개의 문자열로 분리하고, 각각 두개의 문자열을 ","로 분리하여 배열에 담은뒤
    *        벡터에 두개의 배열을 담아 반환한다.
    * param    str       변환할 문자열
    * param    flag1     큰 단위의 구분자
    * param    flag2     작은 단위의 구분자
	* @return  Vector    분리된 데이터 셋
	*/
    public Vector tokenToList(String str, String flag1, String flag2) {
        Vector totalList   = null;
        String[] smallList = null; //첫번째 구분자를 분리하여 담는 배열
        if(str==null || flag1==null || flag2==null) {
            System.out.println("[UtilHelper] tokenToList() : [[Warnning]] null값이 입력되었습니다.");
        }
        else {
            totalList = new Vector();
            smallList = tokenToList(str, flag1);
            for(int i=0; i<smallList.length; i++) {
                totalList.add(tokenToList(smallList[i], flag2));
            }
        }

        return totalList;
    }

	/**
	* 기능 : 리스트 자료구조에 담겨져 있는 문자열을 입력된 flag로 연결하여 하나의 문자열로 반환한다.
    *        만약 입력되는 파라미터중 null값이 있으면 null을 반환한다.
    * param    arr     연결할 문자열이 들어있는 자료구조
	* @return  String  flag로 연결된 새로운 문자열
	*/
    public String listToToken(String[] arr, String flag) {
        String tokenStr = "";
        if(arr==null || flag==null) {
            System.out.println("[UtilHelper] listToToken() : [[Warnning]] Input data is null.");
        }
        else {
            StringBuffer buffer = new StringBuffer();
            for(int i=0; i<arr.length; i++)
                buffer.append((arr[i]==null ? "" : arr[i].trim()) + flag);
            tokenStr = buffer.toString().substring(0, buffer.length()-1);
        }

        return tokenStr;
    }

    /**
    *기능 : Substring String
    *       str에서 min에서 max만큼 추출하기
    *@param  str  string
    *@param  min  int
    *@param  max  int
    *@return  새로운 string
    */
    public String getSubstring(String str, int min, int max)
    {
        String retStr = "";

        if (str == null) return "";
        if (str.equals("")) return "";

        retStr = str.substring(min, max);
        return retStr;
    }

    /**
     *기능 : str을 length 많큼 줄이고 ...붙이기
     *@param  str  string
     *@param  length  int
     *@return  새로운 string
     */
    public String reduceString(String str, int length)
    {
    	String retStr = "";
    	String appender="";

    	if (str == null) return "";
    	if (str.equals("")) return "";

    	if(length>str.length()){
    		length=str.length();
    	}else{
    		appender="...";
    	}

    	retStr = str.substring(0, length)+appender;
    	return retStr;
    }

    /**
    *기능 : Replace String
    *       str에서 rep에 해당하는 String을 tok로 replace
    *@param  str  string
    *@param  rep  string
    *@param  tok  string
    *@return  새로운 string
    */
    public String getReplace(String str, String rep, String tok)
    {
        String retStr = "";

        if (str == null) return "";
        if (str.equals("")) return "";

        for (int i = 0, j = 0; (j = str.indexOf(rep,i)) > -1 ; i = j+rep.length()) {
            retStr += (str.substring(i,j) + tok);
        }
        return (str.indexOf(rep) == -1) ? str : retStr + str.substring(str.lastIndexOf(rep)+rep.length(),str.length());
    }

	/**
	* 기능 : 입력된 문자열에서 특정문자열을 새로운 문자열로 변환하여 반환한다.
	*        문자열 전체에 대해서 검색해서 변환 작업을 실행한다.
    * param    str      변경할 문자열 입력 데이터
    * param    oldChar  변경 대상 문자열행
    * param    newChar  변경할 새로운 문자열
	* @return  String   변환된 문자열
	*/
    public String replace(String str, String oldStr, String newStr) {
        StringBuffer returnStr = new StringBuffer();
        if((str!=null) &&  (oldStr!=null) && (newStr!=null)) {
            int oldStrIndex  = str.indexOf(oldStr);
            int oldStrLength = oldStr.length();

            while(oldStrIndex != -1) {
                returnStr.append(str.substring(0, oldStrIndex) + newStr);
                str = str.substring((oldStrIndex+oldStrLength), str.length());
                oldStrIndex = str.indexOf(oldStr);
            }
            returnStr.append(str);
        }
        else {
            System.out.println("[UtilHelper] replace() : [[Warnning]] Input data is null.");
            returnStr = new StringBuffer((str==null) ? "" : str);
        }

        return returnStr.toString();
    }

    /**
    *기능 : Replace String
    *       str 길이만큼 tok로 replace
    *@param  str  string
    *@param  tok  string
    *@return  새로운 string
    */
    public String getReplaceAll(String str, String tok)
    {
        String retStr = "";

        if (str == null) return "";
        if (str.equals("")) return "";

        for (int i = 0; i < str.length(); i++) {
            retStr += tok;
        }
        return retStr;
    }

	/**
	* 기능 : 입력된 스트링 배열의 각 요소에 flag 기호를 붙인뒤, 배열의 순서대로
	*        하나의 문자열로 연결하여 반환한다.
	*        (문자열을 붙일때 구분자는 ","를 사용한다.)
	*        SQL문의 WHERE 조건 중에서 IN 조건을 사용시 편리하다.
    * param    arr      변경할 스트링 배열
    * param    flag     스트링에 붙일 기호
	* @return  String   하나로 연결된 문자열
	*/
    public String addFlag(String arr[], String flag) {
        String newStr = "";
        if(arr==null || flag==null) {
            System.out.println("[UtilHelper] addFlag() : [[Warnning]] Input data is null.");
        }
        else {
            try {
                for(int i=0; i<arr.length; i++) {
                    newStr += ", " + flag + arr[i] + flag;
                }
            }
            catch(ArrayIndexOutOfBoundsException e) {
            	LOG.error("addFlag : " +  e.getCause() + " [ArrayIndexOutOfBoundsException]");
            	newStr = "";
            }
        }

        return (newStr.length() > 2) ? newStr.substring(2, newStr.length()) : "";
    }

	/**
	* 기능 : 입력된 스트링에 flag 기호를 붙여 반환한다.
	*        SQL문의 WHERE 조건 중에서 IN 조건을 사용시 편리하다.
    * @param    str      변경할 문자열
    * @param    strFlag  문자열의 구분자
    * @param    flag     새로운 스트링에 붙일 기호
	* @return  String    새로 생성된 문자열
	*/
    public String addFlag(String str, String strFlag, String flag) {
        String newStr = "";
        int flaLength = 0;
        if(str==null || strFlag==null || flag==null) {
            System.out.println("[UtilHelper] addFlag() : [[Warnning]] Input data is null.");
        }
        else {
            StringTokenizer token = new StringTokenizer(str, strFlag);
            flaLength = strFlag.length();
            try {
                while (token.hasMoreTokens()) {
                    newStr += (strFlag + flag + token.nextToken() + flag);
                }
            }
            catch(ArrayIndexOutOfBoundsException e) {
            	LOG.error("addFlag : " +  e.getCause() + " [ArrayIndexOutOfBoundsException]");
            	newStr = "";
            }
            catch(NoSuchElementException e) {
            	LOG.error("addFlag : " +  e.getCause() + " [NoSuchElementException]");
                newStr = "";
            }
        }

        return (newStr.length() > flaLength) ? newStr.substring(flaLength, newStr.length()) : "";
    }


	/**
	* 기능 : 입력된 스트링에 flag 기호를 찾아 삭제한 후 문자열을 반환한다.
    * param    str      변경할 문자열
    * param    flag     삭제할 기호
	* @return  String   삭제된 문자열
	*/
    public String removeFlag(String str, String flag) {
        if(str==null || flag==null) {
            System.out.println("[UtilHelper] removeFlag() : [[Warnning]] Input data is null.");
        }
        else {
            try {
                int flagLength = flag.length();
                int findIndex = str.indexOf(flag);
                int fromIndex = 0;
                while(findIndex > -1) {
                    str = str.substring(0, findIndex) + str.substring(findIndex + flagLength, str.length());
                    fromIndex = findIndex;
                    findIndex = str.indexOf(flag, fromIndex);
                }
            }
            catch(StringIndexOutOfBoundsException e) {
            	LOG.error("removeFlag : " +  e.getCause() + " [StringIndexOutOfBoundsException]");
            	str = "";
            }
            catch(IndexOutOfBoundsException e) {
            	LOG.error("removeFlag : " +  e.getCause() + " [IndexOutOfBoundsException]");
                str = "";
            }
        }

        return str;
    }

	/**
	* 기능 : 입력된 문자열의 오른쪽에 index의 길이만큼 문자열을 붙여 반환한다.
    * param    str     문자열
    * param    index   문자열이 붙여진 후 최종 문자열의 길이
    * param    addStr  추가하여 붙일 문자
	* @return  String  추가된 문자열
	*/
    public String fillRigth(String str, int index, String addStr) {
        int gap = 0;
        if ((str != null) && (addStr != null) && (str.length() <= index)) {
            gap = index - str.length();

            for(int i=0 ; i<gap ; i++) {
                str = str + addStr;
            }
        }
        else {
            System.out.println("[UtilHelper] fillRigth() : [[Warnning]] Input data is null.");
        }

        return str;
    }

	/**
	* 기능 : 입력된 문자열의 왼쪽에 index의 길이만큼 문자열을 붙여 반환한다.
    * param    str     문자열
    * param    index   문자열이 붙여진 후 최종 문자열의 길이
    * param    addStr  추가하여 붙일 문자
	* @return  String  추가된 문자열
	*/
    public String fillLeft(String str, int index, String addStr) {
        int gap = 0;
        if ((str!=null) && (addStr!=null) && (str.length()<=index)) {
            gap = index - str.length();

            for(int i=0 ; i<gap ; i++) {
                str = addStr + str;
            }
        }
        else {
            System.out.println("[UtilHelper] fillLeft() : [[Warnning]] Input data is null.");
        }

        return str;
    }

    /**
	* 기능 : 주민등록번호를 이용하여 나이와 성별을 알아낸다.
    * param    registerNum  주민등록번호
    *@return   String[]  배열의 첫번째에는 나이, 두번째에는 성별("1":남자 / "2":여자)이 들어간다.
	*/
    public String[] getPersonalInfo(String registerNum) {
        String[] info = new String[2];
        String   year = "";

        CalendarHelper cal = new CalendarHelper();

        // 현재 연도로부터 뒤의 두자리만 얻어낸다.
        year = String.valueOf(cal.getYear());
        year = year.substring(2, 4);

        if(registerNum.length() == 13) {
            info[0] = registerNum.substring(0,2);
            info[1] = registerNum.substring(6,7);
        }

        // 현재 연도의 뒤의 두자리가 주민등록번호의 앞의 두자리보다 작으면...
        if (Integer.parseInt(year) <= Integer.parseInt(info[0])) {
            year = "1" + year;
        }

        info[0] = String.valueOf(Integer.parseInt(year) - Integer.parseInt(info[0]) + 1);

        return info;
    }

    /**
     * 텍스트의 길이를 체크한다.
     * 한글처리시 자바에서는 유니코드로 처리하기 때문에 byte로 변환하여 체크한다.
     * 2003.10.27. 하정연 추가
     *
     * @param    String    텍스트
     * @param    int       max length byte
     * @return   boolean
     */
    public boolean chkStringLen(String sStr, int iLen) {

        String sTemp = "";
        byte[] bTemp ;
        boolean rtnFlag = false;

        if(sStr==null || sStr.length()==0) {
            rtnFlag = false;
        } else {
            bTemp = sStr.getBytes();

            if( iLen >= bTemp.length ) {
                rtnFlag = true;
            }
        }
        return rtnFlag;
    }


    /**
     * 스트링 문자를 아스키코드값으로 리턴한다.(글자 하나)
     * @param    String
     * @return   String
     */
    public String strToAscCode(String orgStr)
    {
        String codeStr = null;    // 아스키코드값

        if(orgStr==null || orgStr.length()==0) {
            codeStr = "";
        } else {
            codeStr = String.valueOf(orgStr.hashCode()).trim();
        }

        return codeStr;
    }



    /**
	* 기능 :   일반전화 문자열을 분해하여 새로운 저장소에 담아 반환한다.
    * param    str       일반전화 문자열
	* @return  String[]  분리된 데이터 셋
	*/
    public String[] telSplitList(String str) {
        String[] list = new String[3];
        if(str==null) {
            System.out.println("[UtilHelper] tokenToList() : [[Warnning]] null값이 입력되었습니다.");
		} else if(str.length()==0){
			list[0]="";
			list[1]="";
			list[2]="";
		} else if(str.length()==7 || str.length()==8){
			//1588-0000 인경우
			list[0]="";
			list[1]=str.substring(0, str.length()-4);
			list[2]=str.substring(str.length()-4, str.length());
		} else if(str.length()>8){
			if ("080".equals(str.substring(0,3))){
				//080-000-0000	경우
				list[0]=str.substring(0,3);
				list[1]=str.substring(list[0].length(), str.length()-4);
				list[2]=str.substring(str.length()-4, str.length());
			} else if ("0502".equals(str.substring(0,4)) ||
				"0503".equals(str.substring(0,4)) ||
				"0505".equals(str.substring(0,4)) ||
				"0506".equals(str.substring(0,4)) ){
				//0505-0000-0000 등경우
				list[0]=str.substring(0,4);	//앞자리가 무조건 4자리라고봄
				list[1]=str.substring(list[0].length(), str.length()-4);
				list[2]=str.substring(str.length()-4, str.length());
			} else {
				if("02".equals(str.substring(0,2))) {
					// 지역이 서울이면...
					list[0]=str.substring(0,2);

					if( str.length() > 2 ) {
						list[1]=str.substring(list[0].length(), str.length()-4);
						list[2]=str.substring(str.length()-4, str.length());
					} else {
						list[1]="";
						list[2]="";
					}
				} else {
					list[0]=str.substring(0,3);
					if( str.length() > 3 ) {
						list[1]=str.substring(list[0].length(), str.length()-4);
						list[2]=str.substring(str.length()-4, str.length());
					} else {
						list[1]="";
						list[2]="";
					}
				}
			}
        }
        return list;
    }



    /**
	* 기능 :   인자로 받은 일반전화문자를 조합하여 반환
    * param    str     처음 번호
    * param    str     가운데 번호
    * param    str     마지막 번호
	* @return  String  조합된 일반전화 문자열
	*/
    public String telNoSplit(String num1, String num2, String num3) {
        String phone = "";
        if(num1==null || num2==null || num3==null) {
            System.out.println("[UtilHelper] tokenToList() : [[Warnning]] null값이 입력되었습니다.");
		} else if ((num2+num3).length()==0){
			phone = "";
        } else {
            phone = num1+num2+num3;
        }

        return phone;
    }

    /**
	* 기능 :   전화번호를 하이픈붙여서 반환(예021231234 => 02-123-1234 )
    * param    str     -이 없는 전화번호
	* @return  String  조합된 일반전화 문자열
	*/
    public String telNum(String str) {
		String		tel		= "";
		String[]	list	= new String[3];

		if(str==null) {
            System.out.println("[UtilHelper] telNum() : [[Warnning]] null값이 입력되었습니다.");
        }else{
			list	= telSplitList(str);
			if (list[0].equals("") && list[1].equals("") && list[2].equals("")){
				tel		= "";
			}else if (list[0].length()==0){
				tel		= list[1] + "-" + list[2];
			}else{
				tel		= list[0] + "-" + list[1] + "-" + list[2];
			}
		}
        return tel;
    }


    /**
	 * nWidth 만큼 문자를 자른후 나머지는 ...으로 표시한다.
	 * @param str
	 * @param nMaxLength
	 * @return
	 */
	public String strEllipsis( String stTag, String str, int nWidth )
	{
		String returnValue 	= "";
		returnValue = "<" + stTag + " style=\"cursor:hand;overflow:hidden;text-overflow:ellipsis;width:" + Integer.toString(nWidth) + "px;\" title=\"" + str + "\"><nobr>" + str + "</nobr></" + stTag + ">";
		return returnValue;
	}

    /**
	 * nWidth 만큼 문자를 자른후 나머지는 ...으로 표시한다.
	 * @param str
	 * @param nMaxLength
	 * @return
	 */
	public String strEllipsis( String str, int nWidth )
	{
		String returnValue 	= "";
		returnValue = this.strEllipsis("P", str, nWidth);
		return returnValue;
	}

    /**
	 * nWidth 만큼 문자를 자른후 나머지는 ...으로 표시한다.
	 * @param str
	 * @param nMaxLength
	 * @return
	 */
	public String strEllipsisTag(int nWidth )
	{
		String returnValue 	= "";
		returnValue = " style=\"cursor:hand;overflow:hidden;text-overflow:ellipsis;width:" + Integer.toString(nWidth) + "px;\"";
		return returnValue;
	}

    /**
	 * nMaxLength 만큼 문자를 자른후 나머지는 ...으로 표시한다.
	 * @param str
	 * @param nMaxLength
	 * @return
	 */
	public String strDot( String str, int nMaxLength )
	{
		String stTemp 	= "";

		int nStrLen = str.length();
		int nTemp	= 0;
		int nCount	= 0;

		for( int nTi = 0; nTi < nStrLen; nTi++ )
		{
			nTemp = (int)str.charAt(nTi);

			if( nTemp > 128 )
			{
				nCount += 2;
			}
			else
			{
				nCount++;
			}

			if( nMaxLength >= nCount )
			{
				stTemp += str.charAt(nTi);
			}
			else
			{
				stTemp += "...";
				break;
			}
		}

		return stTemp;
	}

	/**
	 * A ~ Z 까지 랜덤하게 문자열 생성
	 * @param nMaxLength 문자갯수
	 * @return
	 */
	public String strRandom( int nMaxLength )
	{
		String stPassword = "";
		String stTemp = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

		int STR_MAX_LENGTH = nMaxLength;	// 자릿수
		int nTi = 0;
		try {
			Random numGen = SecureRandom.getInstance("SHA1PRNG");
			for( nTi = 0; nTi < STR_MAX_LENGTH ; nTi++ )
			{
				stPassword +=  stTemp.charAt( numGen.nextInt( stTemp.length() ) );
			}
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			Random ran = new Random();
			ran.setSeed(new Date().getTime());
			for( nTi = 0; nTi < STR_MAX_LENGTH ; nTi++ )
			{
				stPassword +=  stTemp.charAt( ran.nextInt( stTemp.length() ) );
			}
		} 
		

		return stPassword;
	}

	/**
	 * nMaxLength 값보다 작은수의 대한 값 Random하게 추출
	 * @param nMaxLength 문자갯수
	 * @return
	 */
	public int intRandom( int nMaxLength )
	{
		int STR_MAX_LENGTH 	= nMaxLength;	// 자릿수
		int nNumber = 0;
		try {
			Random numGen = SecureRandom.getInstance("SHA1PRNG");
			nNumber = (numGen.nextInt(nMaxLength));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			Random ran = new Random();
			ran.setSeed(new Date().getTime());
			nNumber = ran.nextInt( nMaxLength );
		} 
		return nNumber;
	}

	/**
	 * 숫자여부 판단
	 * @param str
	 * @return
	 */
	public boolean isNumber(String str) {
		boolean returnValue 	= false;
		int		returnInt		= 0;

		try {
			returnInt = Integer.parseInt(str);
			returnValue = true;
		} catch (NumberFormatException e){
			returnValue = false;
		}

		return returnValue;
	}

	/**
	 * String을 int로 변환하는 모듈
	 * @param 문자열
	 * @return
	 */
	public int getIntValue(String str)
    {

        int result = 0;
        java.lang.Integer intVal = null;

        if(str==null || "".equals(str) ){
        	return result;
        }

        intVal = new java.lang.Integer(str);
        result = intVal.parseInt(str);

        return result;
    }
	/**
	 * Strubg  을 duble로 변환하는 모듈
	 * @param str 문자열
	 * @return
	 */
	public double getDubValue(String str)
	{
		double result = 0 ;

        java.lang.Double dubVal = null;

        if(str==null || "".equals(str) ){
        	return result;
        }
    	dubVal = new java.lang.Double(str);
        result = dubVal.parseDouble(str);
        return result;
	}
	/**
	 * int을 String로 변환하는 모듈
	 * @param 숫자
	 * @return
	 */
	public String getStrValue(int nNumber)
    {
		String resultValue	= "";

			resultValue = Integer.toString(nNumber);

		return resultValue;
    }

	/**
	* 기능 : 입력된 도시명을 체크해서 대소문자 구분후 반환한다.
    * param    str     도시명 체크할 문자열
	* @return  String  대소문자 구별후 문자열을 반환한다.
	*/
    public String cNameUpper(String str) {
      int s = str.length();
      String sName = "";
      for(int i=0; i < s; i++){
        if(i == 0 || str.substring(i-1, i).equals(" ")) sName += str.substring(i, i+1).toUpperCase() ;
        else sName += str.substring(i, i+1);
      }
      return sName;
    }

    /**
     * 기능 : 은행 코드로 은행이름 반환 한다.
     * @param bankCode	: 가상계좌  은행코드
     * @return String bankName
     */
	public static String cyberBankName(String bankCode){
		int i = 0 ;
		String bankName  = "";
		String arrBankCode[]={"03","06","20","26","81","11","71"};
		String arrBankName[]={"기업","국민","우리","신한","하나","농협","우체국 "};
		for(i = 0 ; i < arrBankCode.length ; i++){
			if(arrBankCode[i].equals(bankCode) || arrBankCode[i] == bankCode){
				bankName = arrBankName[i];
				break;
			}
		}
		return bankName;
	}
	/**
	 * 기능 : PG 코드별로 수수료 계산하여 반환 한다
	 * @param oriPgCode pg_cde
	 * @param fee		수수료
	 * @param pay		총금액
	 * @return
	 */
	public int feeUnit(String pgCode , double fee , int pay ){
		double resultPay = -1  ;

		pgCode = pgCode.replace("_", "");

		/*
		 * 001 ->1: 무통
		 * 011 ->11: 신용카드
		 * 021 ->21: 실시간계좌이체(백분율)
		 * 022 ->22: 실시간계좌이체(금액)
		 * 032 ->32: 가상계좌
		 * 041 ->41: 휴대폰결제
		 * 051 ->51: 사이버캐쉬
		 */
		switch(Integer.parseInt(pgCode)){
			case 1  : resultPay =  0 ; break ;
			case 11 : resultPay =  pay*(fee/100) ; break ;
			case 21 : resultPay =  pay*(fee/100); break ;
			case 22 : resultPay =  fee ; break ;
			case 32 : resultPay =  fee ; break ;
			case 41 : resultPay =  pay*(fee/100) ; break ;
			case 51 : resultPay =  0 ; break ;
		}
		return (int)resultPay ;
	}

    /**
     * 문자가 제거된 숫자를 반환
     * @param val
     * @return
     */
    public String getIntFilter(String val) {
    	String 	rtnValue	= "";

		if (nullCheck(val) == false && val.length() > 0) {
			for(int iCount=0; iCount<val.length(); iCount++) {
				if(val.charAt(iCount) >= 48 && val.charAt(iCount) <= 57) { rtnValue += val.charAt(iCount); }
			}
		}

		return rtnValue;
    }

}
