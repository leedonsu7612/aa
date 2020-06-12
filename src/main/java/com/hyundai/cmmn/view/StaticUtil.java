package com.hyundai.cmmn.view;

import gnu.regexp.RE;
import gnu.regexp.REException;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.Calendar;
import java.util.Collection;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;



/**
 * @author mist
 *
 */
public class StaticUtil {

    public static String HTML_TEXT = "1";

    public static String TEXT = "2";

    public static String HTML = "3";

    private static int DayOfMonth[] = {31,28,31,30,31,30,31,31,30,31,30,31};	// 양력 월별 일수
	private static int LunarDataNumberDay[] = {29,30,58,59,59,60}; 			//인덱스 숫자의 합

	private static final Logger LOG = Logger.getLogger(StaticUtil.class.getName());

	//  1 : 작(29일), 2 : 큰(30일), 3 : 작작(윤달 - 29일,29일), 4 : 작큰(윤달 - 29일,30일), 5 : 큰작(윤달 - 30일,29일), 6 : 큰큰(윤달 - 30일,30일)

	private static int LunarData[][] = {
/* 1900 ~ 1910 까지*/
		{1,2,1,1,2,1,2,5,2,2,1,2,384},
		{1,2,1,1,2,1,2,1,2,2,2,1,354},{2,1,2,1,1,2,1,2,1,2,2,2,355},
		{1,2,1,2,1,3,2,1,1,2,2,1,383},{2,2,1,2,1,1,2,1,1,2,2,1,354},
		{2,2,1,2,2,1,1,2,1,2,1,2,355},{1,2,2,4,1,2,1,2,1,2,1,2,384},
		{1,2,1,2,1,2,2,1,2,1,2,1,354},{2,1,1,2,2,1,2,1,2,2,1,2,355},
		{1,5,1,2,1,2,1,2,2,2,1,2,384},{1,2,1,1,2,1,2,1,2,2,2,1,354},
/* 1911 ~ 1920 까지*/
		{2,1,2,1,1,5,1,2,2,1,2,2,384},{2,1,2,1,1,2,1,1,2,2,1,2,354},
		{2,2,1,2,1,1,2,1,1,2,1,2,354},{2,2,1,2,5,1,2,1,2,1,1,2,384},
		{2,1,2,2,1,2,1,2,1,2,1,2,355},{1,2,1,2,1,2,2,1,2,1,2,1,354},
		{2,3,2,1,2,2,1,2,2,1,2,1,384},{2,1,1,2,1,2,1,2,2,2,1,2,355},
		{1,2,1,1,2,1,5,2,2,1,2,2,384},{1,2,1,1,2,1,1,2,2,1,2,2,354},
/* 1921 ~ 1930 까지*/
		{2,1,2,1,1,2,1,1,2,1,2,2,354},{2,1,2,2,3,2,1,1,2,1,2,2,384},
		{1,2,2,1,2,1,2,1,2,1,1,2,354},{2,1,2,1,2,2,1,2,1,2,1,1,354},
		{2,1,2,5,2,1,2,2,1,2,1,2,385},{1,1,2,1,2,1,2,2,1,2,2,1,354},
		{2,1,1,2,1,2,1,2,2,1,2,2,355},{1,5,1,2,1,1,2,2,1,2,2,2,384},
		{1,2,1,1,2,1,1,2,1,2,2,2,354},{1,2,2,1,1,5,1,2,1,2,2,1,383},
/* 1931 ~ 1940 까지*/
		{2,2,2,1,1,2,1,1,2,1,2,1,354},{2,2,2,1,2,1,2,1,1,2,1,2,355},
		{1,2,2,1,6,1,2,1,2,1,1,2,384},{1,2,1,2,2,1,2,2,1,2,1,2,355},
		{1,1,2,1,2,1,2,2,1,2,2,1,354},{2,1,4,1,2,1,2,1,2,2,2,1,384},
		{2,1,1,2,1,1,2,1,2,2,2,1,354},{2,2,1,1,2,1,4,1,2,2,2,1,384},
		{2,2,1,1,2,1,1,2,1,2,1,2,354},{2,2,1,2,1,2,1,1,2,1,2,1,354},
/* 1941 ~ 1950 까지*/
		{2,2,1,2,2,4,1,1,2,1,2,1,384},{2,1,2,2,1,2,2,1,2,1,1,2,355},
		{1,2,1,2,1,2,2,1,2,2,1,2,355},{1,1,2,4,1,2,1,2,2,1,2,2,384},
		{1,1,2,1,1,2,1,2,2,2,1,2,354},{2,1,1,2,1,1,2,1,2,2,1,2,354},
		{2,5,1,2,1,1,2,1,2,1,2,2,384},{2,1,2,1,2,1,1,2,1,2,1,2,354},
		{2,2,1,2,1,2,3,2,1,2,1,2,384},{2,1,2,2,1,2,1,1,2,1,2,1,354},
/* 1951 ~ 1960 까지*/
		{2,1,2,2,1,2,1,2,1,2,1,2,355},{1,2,1,2,4,2,1,2,1,2,1,2,384},
		{1,2,1,1,2,2,1,2,2,1,2,2,355},{1,1,2,1,1,2,1,2,2,1,2,2,354},
		{2,1,4,1,1,2,1,2,1,2,2,2,384},{1,2,1,2,1,1,2,1,2,1,2,2,354},
		{2,1,2,1,2,1,1,5,2,1,2,2,384},{1,2,2,1,2,1,1,2,1,2,1,2,354},
		{1,2,2,1,2,1,2,1,2,1,2,1,354},{2,1,2,1,2,5,2,1,2,1,2,1,384},
/* 1961 ~ 1970 까지*/
		{2,1,2,1,2,1,2,2,1,2,1,2,355},{1,2,1,1,2,1,2,2,1,2,2,1,354},
		{2,1,2,3,2,1,2,1,2,2,2,1,384},{2,1,2,1,1,2,1,2,1,2,2,2,355},
		{1,2,1,2,1,1,2,1,1,2,2,1,353},{2,2,5,2,1,1,2,1,1,2,2,1,384},
		{2,2,1,2,2,1,1,2,1,2,1,2,355},{1,2,2,1,2,1,5,2,1,2,1,2,384},
		{1,2,1,2,1,2,2,1,2,1,2,1,354},{2,1,1,2,2,1,2,1,2,2,1,2,355},
/* 1971 ~ 1980 까지*/
		{1,2,1,1,5,2,1,2,2,2,1,2,384},{1,2,1,1,2,1,2,1,2,2,2,1,354},
		{2,1,2,1,1,2,1,1,2,2,2,1,354},{2,2,1,5,1,2,1,1,2,2,1,2,384},
		{2,2,1,2,1,1,2,1,1,2,1,2,354},{2,2,1,2,1,2,1,5,2,1,1,2,384},
		{2,1,2,2,1,2,1,2,1,2,1,1,354},{2,2,1,2,1,2,2,1,2,1,2,1,355},
		{2,1,1,2,1,6,1,2,2,1,2,1,384},{2,1,1,2,1,2,1,2,2,1,2,2,355},
/* 1981 ~ 1990 까지*/
		{1,2,1,1,2,1,1,2,2,1,2,2,354},{2,1,2,3,2,1,1,2,2,1,2,2,384},
		{2,1,2,1,1,2,1,1,2,1,2,2,354},{2,1,2,2,1,1,2,1,1,5,2,2,384},
		{1,2,2,1,2,1,2,1,1,2,1,2,354},{1,2,2,1,2,2,1,2,1,2,1,1,354},
		{2,1,2,2,1,5,2,2,1,2,1,2,385},{1,1,2,1,2,1,2,2,1,2,2,1,354},
		{2,1,1,2,1,1,2,2,1,2,2,2,355},{1,2,1,1,5,1,2,1,2,2,2,2,384},
/* 1991 ~ 2000 까지*/
		{1,2,1,1,2,1,1,2,1,2,2,2,354},{1,2,2,1,1,2,1,1,2,1,2,2,354},
		{1,2,5,2,1,2,1,1,2,1,2,1,383},{2,2,2,1,2,1,2,1,1,2,1,2,355},
		{1,2,2,1,2,2,1,5,2,1,1,2,384},{1,2,1,2,2,1,2,1,2,2,1,2,355},
		{1,1,2,1,2,1,2,2,1,2,2,1,354},{2,1,1,2,3,2,2,1,2,2,2,1,384},
		{2,1,1,2,1,1,2,1,2,2,2,1,354},{2,2,1,1,2,1,1,2,1,2,2,1,354},
/* 2001 ~ 2010 까지*/
		{2,2,2,3,2,1,1,2,1,2,1,2,384},{2,2,1,2,1,2,1,1,2,1,2,1,354},
		{2,2,1,2,2,1,2,1,1,2,1,2,355},{1,5,2,2,1,2,1,2,1,2,1,2,384},
		{1,2,1,2,1,2,2,1,2,2,1,1,354},{2,1,2,1,2,1,5,2,2,1,2,2,385},
		{1,1,2,1,1,2,1,2,2,2,1,2,354},{2,1,1,2,1,1,2,1,2,2,1,2,354},
		{2,2,1,1,5,1,2,1,2,1,2,2,384},{2,1,2,1,2,1,1,2,1,2,1,2,354},
/* 2011 ~ 2020 까지*/
		{2,1,2,2,1,2,1,1,2,1,2,1,354},{2,1,6,2,1,2,1,1,2,1,2,1,384},
		{2,1,2,2,1,2,1,2,1,2,1,2,355},{1,2,1,2,1,2,1,2,5,2,1,2,384},
		{1,2,1,1,2,1,2,2,2,1,2,2,355},{1,1,2,1,1,2,1,2,2,1,2,2,354},
		{2,1,1,2,3,2,1,2,1,2,2,2,384},{1,2,1,2,1,1,2,1,2,1,2,2,354},
		{2,1,2,1,2,1,1,2,1,2,1,2,354},{2,1,2,5,2,1,1,2,1,2,1,2,384},
/* 2021 ~ 2030 까지*/
		{1,2,2,1,2,1,2,1,2,1,2,1,354},{2,1,2,1,2,2,1,2,1,2,1,2,355},
		{1,5,2,1,2,1,2,2,1,2,1,2,384},{1,2,1,1,2,1,2,2,1,2,2,1,354},
		{2,1,2,1,1,5,2,1,2,2,2,1,384},{2,1,2,1,1,2,1,2,1,2,2,2,355},
		{1,2,1,2,1,1,2,1,1,2,2,2,354},{1,2,2,1,5,1,2,1,1,2,2,1,383},
		{2,2,1,2,2,1,1,2,1,1,2,2,355},{1,2,1,2,2,1,2,1,2,1,2,1,354},
/* 2031 ~ 2040 까지*/
		{2,1,5,2,1,2,2,1,2,1,2,1,384},{2,1,1,2,1,2,2,1,2,2,1,2,355},
		{1,2,1,1,2,1,5,2,2,2,1,2,384},{1,2,1,1,2,1,2,1,2,2,2,1,354},
		{2,1,2,1,1,2,1,1,2,2,1,2,354},{2,2,1,2,1,4,1,1,2,1,2,2,384},
		{2,2,1,2,1,1,2,1,1,2,1,2,354},{2,2,1,2,1,2,1,2,1,1,2,1,354},
		{2,2,1,2,5,2,1,2,1,2,1,1,384},{2,1,2,2,1,2,2,1,2,1,2,1,355},
/* 2041 ~ 2050 까지*/
		{2,1,1,2,1,2,2,1,2,2,1,2,355},{1,5,1,2,1,2,1,2,2,1,2,2,384},
		{1,2,1,1,2,1,1,2,2,1,2,2,354},{2,1,2,1,1,2,3,2,1,2,2,2,384},
		{2,1,2,1,1,2,1,1,2,1,2,2,354},{2,1,2,2,1,1,2,1,1,2,1,2,354},
		{2,1,2,2,4,1,2,1,1,2,1,2,384},{1,2,2,1,2,2,1,2,1,1,1,1,353},
		{2,1,2,1,2,2,1,2,2,1,2,1,355},{2,1,4,1,2,1,2,2,1,2,2,1,384}
	};



    /**
     * 한글로 인코딩 8859_1 -> KSC5601
     * @param str
     * @return String
     */
    public static String toKorean(String str) {
        if (str == null)
            return null;
        try {
        	str = new String(str.getBytes("8859_1"), "KSC5601");
	    } catch (UnsupportedEncodingException e) {
	    	LOG.error("StaticUtil.toKorean : " +  e.getCause() + " [UnsupportedEncodingException]");
		}
        return str;
    }

    /**
     * 한글을 디코딩 EUC_KR -> 8859_1
     * @param str
     * @return String
     */
    public static String toDecodeKorean(String str) {
        if (str == null)
            return "";
        try {
			str = new String(str.getBytes("EUC_KR"), "8859_1");
		} catch (UnsupportedEncodingException e) {
			LOG.error("StaticUtil.toDecodeKorean : " +  e.getCause() + " [UnsupportedEncodingException]");
		}
        return str;
    }

	/**
	 * kscToAsc (KSC5601 -> 8859_1)
	 * @param value
	 * @return String String
	 * @throws
	*/
    public static String kscToAsc(String value) {
        try {
            String strRet = new String(value.getBytes("utf-8"), "8859_1");
            return strRet;
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            LOG.error("StaticUtil.kscToAsc : " +  e.getCause() + " [UnsupportedEncodingException]");
            return null;
        }
    }

    /**
     * 캐랙터셋 변경 Custom locale -> ISO-8859_1
     * @param str
     * @return String
     */
    public static String unchangeCharacterSet(String str) {
        if (str == null)
            return null;
        try {
			str = new String(str.getBytes("StaticUtil.getLocale()"), "8859_1");
		} catch (UnsupportedEncodingException e) {
			LOG.error("StaticUtil.unchangeCharacterSet : " +  e.getCause() + " [UnsupportedEncodingException]");
		}
        return str;
    }

    /**
     * UTF-8 디코딩
     * @param str
     * @return String
     */
    public static String toUtf8(String str){
    	if(str == null)
    		return null;
		try {
			str = URLDecoder.decode(str, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			LOG.error("StaticUtil.toUtf8 : " +  e.getCause() + " [UnsupportedEncodingException]");
		}
    	return str;
    }

    /**
     * null이면 &nbsp; 로 바꾼다.
     * @param str
     * @return String
     */
    public static String nullToSpace(String str) {
        if (str == null) {
            return " &nbsp;";
        } else {
            return str;
        }
    }

    /**
     * null이면 "" 로 바꾼다.
     * @param str
     * @return String
     */
    public static String nullToBlank(String str) {
        if (str == null) {
            return "";
        } else {
            return str;
        }
    }

    /**
     * CSV 용 text 로 바꾼다.
     * @param str
     * @return String
     */
    public static String ConvertCSV(String str) {
    	String result = "";
    	result = StaticUtil.nullToBlank(str);
    	result = StaticUtil.strReplace("\n", "", result);
    	result = StaticUtil.strReplace("\r", "", result);
    	result = StaticUtil.strReplace(",", "", result);
    	result = StaticUtil.strReplace("\"", "", result);
    	result = StaticUtil.strReplace("'", "", result);
    	result = StaticUtil.strReplaceLF("", result);

        return result;
    }

    /**
	* 기능 : 입력된 문자열이 null값인지 체크해서 만약 null 값이면 "0"를 반환한다.
    * param    str     null값을 체크할 문자열
	* @return String  String  null 값이면 "0" 문자열을, null값이 아니면 원래 문자열을 반환한다.
	*/
    public static String nullToZero(String str) {
        if(str == null) {
            return "0";
        }
        else {
            return str;
        }
    }

    /**
     * null이면 strdef 로 바꾼다.
     * @param str, strdef
     * @return String
     */
    public static String nullToDefault(String str, String strdef) {
        if (str == null || "".equals(str)) {
            return strdef;
        } else {
            return str;
        }
    }

    /**
     * null이면 strdef 로 바꾼다.
     * @param str, strdef
     * @return String
     */
    public static String nullToDefault(Object str, String strdef) {
        if (str == null) {
            return strdef;
        } else {
            return "" + str;
        }
    }

    /**
     * null을 스트링 'null'으로 바꾼다
     * @param str
     * @return String
     */
    public static String nullToNull(String str) {
        if (str == null) {
            return "null";
        } else {
            return str;
        }
    }

    /**
     * 스페이스('')를 &nbsp; 로 바꾼다
     * @param str
     * @return String
     */
    public static String spaceToNbsp(String str) {
        if (str == null) {
            return "&nbsp;";
        } else {
        	if(str.equals("")) return "&nbsp;";
            return StaticUtil.strReplace(" ", "&nbsp;", str);
        }
    }

    /**
     * &nbsp; 를 스페이스('') 로 바꾼다
     * @param str
     * @return String
     */
    public static String nbspToSpace(String str) {
        if (str == null) {
            return null;
        } else {
            return StaticUtil.strReplace("&nbsp;", " ", str);
        }
    }

    /**
     * \n을 <br>
     * 태그로 치환
     */
    public static String nl2br(String str) {
        RE re = null;
        try {
            str = nullToSpace(str);
            re = new RE("\n");
        } catch (REException e) {
            e.getCause();
        }
        return re.substituteAll(str, "\n<br>");
    }

    /**
     * \n\n 를 "" 로 바꾼다
     * @param str
     * @return String
     */
    public static String doubleNl2Blank(String str) {
        String ret = strReplace("\n\n", "", str);
        return ret;
    }

    /**
     * \n을 <br>
     * 태그로 치환
     */
    public static String nl2brWap(String str) {
        RE re = null;
        try {
            str = nullToSpace(str);
            re = new RE("\n");
        } catch (REException e) {
            e.getCause();
        }
        return re.substituteAll(str, "\n<br/>");
    }

    /**
     * Returns a string with HTML special characters replaced by their entity
     * equivalents.
     *
     * @param str
     *            the string to escape
     * @return String a new string without HTML special characters
     */
    public static String escapeHTML(String str) {
        if (str == null || str.length() == 0)
            return "";

        StringBuffer buf = new StringBuffer();
        int len = str.length();
        for (int i = 0; i < len; ++i) {
            char c = str.charAt(i);
            switch (c) {
            case '&':
                buf.append("&amp;");
                break;
            case '<':
                buf.append("&lt;");
                break;
            case '>':
                buf.append("&gt;");
                break;
            case '"':
                buf.append("&quot;");
                break;
            //				case '\'' :
            //					buf.append("&apos;");
            //					break;
            default:
                buf.append(c);
                break;
            }
        }
        return buf.toString();
    }

    /**
     * Returns a string with XML special characters replaced by their entity
     * equivalents.
     *
     * @param str
     *            the string to escape
     * @return String a new string without XML special characters
     */
    public static String escapeXML(String str) {
        return escapeHTML(str);
    }

    /**
     * Returns a string with XML entities replaced by their normal characters.
     *
     * @param str
     *            the string to un-escape
     * @return String a new normal string
     */
    public static String unescapeXML(String str) {
        if (str == null || str.length() == 0)
            return "";

        StringBuffer buf = new StringBuffer();
        int len = str.length();
        for (int i = 0; i < len; ++i) {
            char c = str.charAt(i);
            if (c == '&') {
                int pos = str.indexOf(";", i);
                if (pos == -1) { // Really evil
                    buf.append('&');
                } else if (str.charAt(i + 1) == '#') {
                    int val = Integer.parseInt(str.substring(i + 2, pos), 16);
                    buf.append((char) val);
                    i = pos;
                } else {
                    String substr = str.substring(i, pos + 1);
                    if (substr.equals("&amp;"))
                        buf.append('&');
                    else if (substr.equals("&lt;"))
                        buf.append('<');
                    else if (substr.equals("&gt;"))
                        buf.append('>');
                    else if (substr.equals("&quot;"))
                        buf.append('"');
                    else if (substr.equals("&apos;"))
                        buf.append('\'');
                    else if (substr.equals("&nbsp;"))
                        buf.append(' ');
                    else
                        // ????
                        buf.append(substr);
                    i = pos;
                }
            } else {
                buf.append(c);
            }
        }
        return buf.toString();
    }


    /**
     * 일부태그허용
     * chaeminji
     */
    public static String tagallowhtml(String html) {
        if (html == null)
            return null;
        String text = unescapeXML(html);


        if(text.indexOf("<font color")==-1){
        	 text = eregReplace("((<)\\<\\/?(font)[^\\>]*\\>>)", "<font>", text);
        }else{
        	text = eregReplace("((<)\\<\\/?(font color=)*\\)", "<font color=", text);

        }
        text = eregReplace("((</)\\<\\/?(font)[^\\>]*\\>>)", "</font>", text);
        text = eregReplace("((<|</)\\<\\/?(br|BR)[^\\>]*\\>>)", "\n", text);
        text = eregReplace("((<|</)\\<\\/?(b|B)[^\\>]*\\>>)", "\n", text);
       //text = eregReplace("<[^>]*>", "", text);
        text = eregReplace("(  |\t|\t\n\t| \n|\n |\n\n)", "", text);



        text = eregReplace("(\\/?(javascript|vbscript)*\\)+","//",text);
        text = eregReplace("(\\/?(.location|location|onload=|.cookie|alert|window|.open|onmouse|onkey|onclick|view|-source)*\\)+","//",text); //자바스크립트 실행방지

        //text = eregReplace("("+javascript+")+","$1//",text);
       	//text = eregReplace("(\""+fore_location+"|"+fore_location2+"\\|"+onload+"=|\\"+cookie+"\\("+window+"\""+open+"\\("+onmouse+"\\"+source+"\\)","//",text);

        return text;
    }

    /**
     * 태그 완전 막음
     */
    public static String htmlToText(String html) {
        if (html == null)
            return null;
        String text = unescapeXML(html);

        text = eregReplace("((<|</)\\<\\/?(br|BR)[^\\>]*\\>>)", "\n", text);
        text = eregReplace("<[^>]*>", "", text);
        text = eregReplace("(  |\t|\t\n\t| \n|\n |\n\n)", "", text);

        return text;
    }

    /**
     * MD5 인코딩
     * @param pattern, replacement, string
     * @return String
     */
    public static String eregReplace(String pattern, String replacement, String string) {
        if (pattern == null)
            return string;
        if (string == null)
            return string;
        RE re = null;
        try {
            re = new RE(pattern);
            return re.substituteAll(string, replacement);
        } catch (REException e) {
            return string;
        }
    }

    /**
     * 텍스트를 태그로 변환
     * @param txt, htmlFg
     * @return String
     */
    public static String convertText(String txt, String htmlFg) {
        if (htmlFg == null)
            return txt;
        // HTML+TXT
        if (htmlFg.equals("1")) {
            return nl2br(spaceToNbsp(txt));

            // TXT
        } else if (htmlFg.equals("2")) {
            return nl2br(spaceToNbsp(escapeHTML(txt)));

            // HTML
        } else {
            return txt;
        }
    }

    /**
     * 숫자 staNum부터 endNum까지 SELECT OPTION태그 만들기
     *
     * @param startNum -
     *            시작 숫자
     * @param endNum -
     *            종료 숫자
     * @return String OPTION태그 스트링
     */
    public static String renderOptions(int staNum, int endNum) {
        return renderOptions(staNum, endNum, -9999997);
    }

    /**
     * 숫자 staNum부터 endNum까지 SELECT OPTION태그 만들기
     *
     * @param startNum -
     *            시작 숫자
     * @param endNum -
     *            종료 숫자
     * @param selectNum -
     *            현재 선택된 숫자, selected가 표시 될 숫자
     * @return String OPTION태그 스트링
     */
    public static String renderOptions(int staNum, int endNum, int selectNum) {
        StringBuffer options = new StringBuffer();
        DecimalFormat df = new DecimalFormat("00");
        for (int i = staNum; i <= endNum; i++) {
            if (i == selectNum) {
                options.append("<option value='" + df.format(i)
                        + "' selected> " + i + " </option>\n");
            } else {
                options.append("<option value='" + df.format(i) + "'> " + i
                        + " </option>\n");
            }
        }
        return options.toString();
    }

    /**
     * ResultSet으로 부터 SELECT BOX의 OPTION HTML을 만들어낸다. ResultSet은 text, value 구조
     *
     * @param rs -
     *            ResultSet
     * @param selectedValue -
     *            현재 선택된 option의 vaule이다.
     * @return String SELECT의 OPTION태그들
     */
    public static String renderOptionsByRs(ResultSet rs, String selectedValue)
            throws Exception {
        return selectBoxFromRS(rs, selectedValue);
    }

    /**
     * ResultSet으로 부터 SELECT BOX의 OPTION HTML을 만들어낸다. ResultSet은 text, value 구조
     *
     * @param rs -
     *            ResultSet
     * @return String SELECT의 OPTION태그들
     */
    public static String renderOptionsByRs(ResultSet rs) throws Exception {
        return selectBoxFromRS(rs);
    }

    /**
     * @deprecated
     */
    public static String selectBoxFromRS(ResultSet rs, String selectedValue)
            throws Exception {
        String szName, szValue, szOptions = "";

        while (rs.next()) {
            szName = rs.getString(2);
            try {
                szValue = rs.getString(1);
            } catch (SQLException e) {
                szValue = szName;
            }
            szOptions += "<OPTION value='" + szValue + "' ";
            if (selectedValue != null && selectedValue.equals(szValue)) {
                szOptions += "selected";
            }
            szOptions += ">" + szName + "</OPTION>\n";
        }
        return szOptions;
    }

    /**
     * @deprecated
     */
    public static String selectBoxFromRS(ResultSet rs) throws Exception {
        return selectBoxFromRS(rs, null);
    }

    /**
     * 숫자만으로 된 폰번호를 123-456-7890 형태로
     * @param phn
     * @return String
     */
    public static String phnFormat(String phn) {
        if (phn == null)
            return null;
        phn = StaticUtil.getVaildPhn(phn);
        if (phn == null)
            return "";
        if (phn.length() < 10) {
            return phn;
        }
        String phn1 = "";
        String phn2 = "";
        String phn3 = "";
        phn1 = phn.substring(0, 3);
        phn2 = phn.substring(3, phn.length() - 4);
        phn3 = phn.substring(phn.length() - 4, phn.length());
        return phn1 + "-" + phn2 + "-" + phn3;
    }

    /**
     * DTTM형식의 날짜를 human readable하게 변환한다. Type : dt -> return Y : 2001 -> 2001
     * YM : 200101 -> 2001/01 YMD : 20020101 -> 2001/01/01 YMDHI : 200101010101 ->
     * 2001/01/01 01:01 YMDHIS : 20010101010101 -> 2001/01/01 01:01:01
     *
     * @param dt -
     *            DTTM
     * @param type -
     *            변환할 Type이다.
     * @return String human readable한 일시
     */
    public static String dtFormat(String dt, String type) {
        if (dt == null)
            return null;
        String dtFormat = dt;
            if (type.equals("Y")) {
                dtFormat = dt.substring(0, 4);
            } else if (type.equals("M")) {
                dtFormat = dt.substring(4, 6);
            } else if (type.equals("D")) {
                dtFormat = dt.substring(6, 8);
            } else if (type.equals("H")) {
                dtFormat = dt.substring(8, 10);
            } else if (type.equals("I")) {
                dtFormat = dt.substring(10, 12);
            } else if (type.equals("S")) {
                dtFormat = dt.substring(12, 14);
            } else if (type.equals("YM")) {
                dtFormat = dt.substring(0, 4) + "/" + dt.substring(4, 6);
            } else if (type.equals("YMD")) {
                dtFormat = dt.substring(0, 4) + "/" + dt.substring(4, 6) + "/"
                        + dt.substring(6, 8);
            } else if (type.equals("YMDHI")) {
                dtFormat = dt.substring(0, 4) + "/" + dt.substring(4, 6) + "/"
                        + dt.substring(6, 8) + " " + dt.substring(8, 10) + ":"
                        + dt.substring(10, 12);
            } else if (type.equals("YMDH")) {
                dtFormat = dt.substring(0, 4) + "/" + dt.substring(4, 6) + "/"
                        + dt.substring(6, 8) + " " + dt.substring(8, 10);
            } else if (type.equals("YMDHIS")) {
                dtFormat = dt.substring(0, 4) + "/" + dt.substring(4, 6) + "/"
                        + dt.substring(6, 8) + " " + dt.substring(8, 10) + ":"
                        + dt.substring(10, 12) + ":" + dt.substring(12, 14);
            } else if (type.equals("MD")) {
                dtFormat = dt.substring(4, 6) + "/" + dt.substring(6, 8);
            } else {
                dtFormat = dt;
            }
        return dtFormat;
    }

    /**
     * DTTM형식의 날짜를 human readable하게 변환한다. Type : dt -> return Y : 2001 -> 2001
     * YM : 200101 -> 2001/01 YMD : 20020101 -> 2001/01/01 YMDHI : 200101010101 ->
     * 2001/01/01 01:01 YMDHIS : 20010101010101 -> 2001/01/01 01:01:01
     *
     * @param dt -
     *            DTTM
     * @param type -
     *            변환할 Type이다.
     * @return String human readable한 일시
     */
    public static String dtFormat2(String dt, String type, String delimiter) {
        if (dt == null)
            return null;
        String dtFormat = dt;
            if (type.equals("Y")) {
                dtFormat = dt.substring(0, 4);
            } else if (type.equals("M")) {
                dtFormat = dt.substring(4, 6);
            } else if (type.equals("D")) {
                dtFormat = dt.substring(6, 8);
            } else if (type.equals("H")) {
                dtFormat = dt.substring(8, 10);
            } else if (type.equals("I")) {
                dtFormat = dt.substring(10, 12);
            } else if (type.equals("S")) {
                dtFormat = dt.substring(12, 14);
            } else if (type.equals("YM")) {
                dtFormat = dt.substring(0, 4) + delimiter + dt.substring(4, 6);
            } else if (type.equals("YMD")) {
                dtFormat = dt.substring(0, 4) + delimiter + dt.substring(4, 6) + delimiter
                        + dt.substring(6, 8);
            } else if (type.equals("YMDHI")) {
                dtFormat = dt.substring(0, 4) + delimiter + dt.substring(4, 6) + delimiter
                        + dt.substring(6, 8) + " " + dt.substring(8, 10) + ":"
                        + dt.substring(10, 12);
            } else if (type.equals("YMDH")) {
                dtFormat = dt.substring(0, 4) + delimiter + dt.substring(4, 6) + delimiter
                        + dt.substring(6, 8) + " " + dt.substring(8, 10);
            } else if (type.equals("YMDHIS")) {
                dtFormat = dt.substring(0, 4) + delimiter + dt.substring(4, 6) + delimiter
                        + dt.substring(6, 8) + " " + dt.substring(8, 10) + ":"
                        + dt.substring(10, 12) + ":" + dt.substring(12, 14);
            } else if (type.equals("MD")) {
                dtFormat = dt.substring(4, 6) + delimiter + dt.substring(6, 8);
            } else {
                dtFormat = dt;
            }
        return dtFormat;
    }

    /**
     * DTTM형식의 날짜를 human readable하게 변환한다. Type : dt -> return Y : 2001 -> 2001년
     * YM : 200101 -> 2001년 01월 YMD : 20020101 -> 2001년 01월 01일  YMDHI : 200101010101 ->
     * 2001년 01월 01일 01시 01분  YMDHIS : 20010101010101 -> 2001년 01월 01일 01시 01분 01초
     * 2007/05/28 염봉걸 추가
     * @param dt - DTTM
     * @param type - 변환할 Type이다.
     * @return String human readable한 일시
     */
    public static String dtKorFormat(String dt, String type) {
        if (dt == null)
            return null;
        String dtFormat = dt;
            if (type.equals("Y")) {
                dtFormat = dt.substring(0, 4);
            } else if (type.equals("YM")) {
                dtFormat = dt.substring(0, 4) + "년 " + dt.substring(4, 6);
            } else if (type.equals("YMD")) {
                dtFormat = dt.substring(0, 4) + "년 " + dt.substring(4, 6) + "월 "
                        + dt.substring(6, 8) + "일 ";
            } else if (type.equals("YMDH")) {
                dtFormat = dt.substring(0, 4) + "년 " + dt.substring(4, 6) + "월 "
                        + dt.substring(6, 8) + "일 " + dt.substring(8, 10) + "시 ";
            } else if (type.equals("YMDHI")) {
                dtFormat = dt.substring(0, 4) + "년 " + dt.substring(4, 6) + "월 "
                        + dt.substring(6, 8) + "일 " + dt.substring(8, 10) + "시 "
                        + dt.substring(10, 12) + "분 ";
            } else if (type.equals("YMDHIS")) {
                dtFormat = dt.substring(0, 4) + "년 " + dt.substring(4, 6) + "월 "
                        + dt.substring(6, 8) + "일 " + dt.substring(8, 10) + "시 "
                        + dt.substring(10, 12) + "초" + dt.substring(12, 14);
            } else {
                dtFormat = dt;
            }
        return dtFormat;
    }

    /**
     * DTTM형식의 날짜를 human readable하게 변환한다. dt의 길이로 type을 자동 설정한다.
     * @param dt
     * @return String
     */
    public static String dtFormat(String dt) {
        if (dt == null)
            return null;
        if (dt.length() == 4) {
            return dtFormat(dt, "Y");
        } else if (dt.length() == 6) {
            return dtFormat(dt, "YM");
        } else if (dt.length() == 8) {
            return dtFormat(dt, "YMD");
        } else if (dt.length() == 10) {
            return dtFormat(dt, "YMDH");
        } else if (dt.length() == 12) {
            return dtFormat(dt, "YMDHI");
        } else if (dt.length() == 14) {
            return dtFormat(dt, "YMDHIS");
        }
        return dt;
    }

    /**
     * 123123형식의 우편번호를 123-123으로 변환한다.
     * @param zipCd
     * @return String
     */
    public static String zipCdFormat(String zipCd) {
        String result = "";
            if (zipCd.length() == 6) {
                result = zipCd.substring(0, 3) + "-" + zipCd.substring(3, 6);
            }
        return result;
    }

    /**
     * fullS스트링에서 pattern를 replace로 바꾼다. 스트링 치환메소드
     *
     * @param pattern -
     *            치환 할 스트링
     * @param replace -
     *            치환 될 스트링
     * @param str -
     *            전체 스트링
     * @return String 치환 작업이 된 스트링
     */
    public static String strReplace(String pattern, String replace, String str) {
        if (replace == null)
            replace = "";
        if (str == null)
            return str;
        int i = 0;
        int j = 0;
        int k = pattern.length();
        StringBuffer stringbuffer = null;
        String s3 = str;
        while ((j = str.indexOf(pattern, i)) >= 0) {
            if (stringbuffer == null)
                stringbuffer = new StringBuffer(str.length() * 2);
            stringbuffer.append(str.substring(i, j));
            stringbuffer.append(replace);
            i = j + k;
        }

        if (i != 0) {
            stringbuffer.append(str.substring(i));
            s3 = stringbuffer.toString();
        }
        return s3;
    }

    /**
	 * CR을 replace로 바꾼다.
	 *
	 *@param java.lang.String
	 *@return java.lang.String
	 */
	public static String strReplaceLF(String replace, String str) {
		if(str == null || str.length() == 0)
			return str;

		int c = 10;
		char cc = (char)c;

		StringTokenizer st = new StringTokenizer(str, String.valueOf(cc), false);
		String res = "";
		while(st.hasMoreTokens()) {
			res += st.nextToken() + replace;

		}
		return res;
	}


	/**
     * fullString이 null이면 스트링 'null'로 변환, 아니면 newString으로 변환
     * @param fullString, oldString, newString
     * @return String
     */
    public static String strReplaceNNull(String fullString, String oldString, String newString) {
        if (isEmpty(fullString))
            fullString = "null";
        return strReplace(oldString, newString, fullString);
    }

    /**
     * 치환 메소드. fullString oldString 날려버린다.
     * @param oldString, fullString
     * @return String
     */
    public static String strReplace(String oldString, String fullString) {
        return strReplace(oldString, "", fullString);
    }

    /**
     * 페이지 로딩이 시작될때 호출하면 페이지가 처리되는 동안 wait화면을 보여준다. 이 메소드를 사용한 후 flush()를 호출한다.
     * @param msg
     * @return String
     */
    public static String loadingBegin(String msg) {
        if (msg.equals(null))
            msg = "데이터 처리 하고 있습니다.<BR> 잠시만 기다려 주십시요..";
        String result = "<table width='100%' height='100%' border='0' cellspacing='0' cellpadding='0' id='waiting' style='position:absolute; visibility:visible;'>"
                + "<tr>"
                + "<td align='center'>"
                + "<table border='0' cellspacing='0' cellpadding='10'>"
                + "<tr>"
                + "<td style='font-size:9pt; background:#EEEEEE;' align='center'>"
                + msg
                + "</td>"
                + "</tr>"
                + "</table>"
                + "</td>"
                + "</tr>"
                + "</table>"
                + "<script language='Javascript'>"
                + "waiting.style.left=0;"
                + "waiting.style.width=document.body.offsetWidth - 23;"
                + "waiting.style.visibility='visible'" + "</script>";
        return result;
    }

    /**
     * 페이지 로딩이 시작될때 호출하면 페이지가 처리되는 동안 wait화면을 보여준다.
     * @param msg, out
     * @return
     */
    public static void loadingBegin(String msg, ServletOutputStream out) throws Exception {
        out.print(loadingBegin(msg));
        out.flush();
    }

    /**
     * 로딩이 끝나면 호출한다.
     * @param out
     * @return
     */
    public static void loadingEnd(ServletOutputStream out)
            throws Exception {
        String result = "<script language='Javascript'>waiting.style.visibility='hidden'</script>";
        out.print(result);
        out.flush();
    }

    /**
     * 로딩이 끝나면 호출한다. 이 메소드를 사용한 후 flush()를 호출한다.
     * @param
     * @return String
	 * @throws Exception
     */
    public static String loadingEnd() throws Exception {
        return "<script language='Javascript'>waiting.style.visibility='hidden'</script>";
    }

    /**
     * 아레오 SMS전송 결과 rslt_val을 한글명으로 바꾼다.
     * @param rslt_val
     * @return String
     */
    public static String rsltToMsg(String rslt_val) {
        if (rslt_val == null)
            rslt_val = "";
        rslt_val = rslt_val.trim();
        if (rslt_val.equals("-100")) {
            return "성공";
        } else if (rslt_val.equals("99")) {
            return "전송중";
        } else if (rslt_val.equals("97")) {
            return "실패";
        } else if (rslt_val.equals("2")) {
            return "미등록";
        } else {
            return "모름";
        }
    }

    /**
     * StringOutOfBoundExcetion없이 byte단위로 한글 안깨지게 스트링을 자른다.
     * @param str, maxLength
     * @return String
     */
    public static String subString(String str, int maxLength) {
        return subString(str, maxLength, "");
    }

    /**
     * StringOutOfBoundExcetion없이 byte단위로 한글 안깨지게 스트링을 자른 후 suffix 추가
     * @param str, maxLength, suffix
     * @return String
     */
    public static String subString(String str, int maxLength, String suffix) {
        return subString(str, maxLength, suffix, true);
    }

    /**
     * StringOutOfBoundExcetion없이 byte단위로 한글 안깨지게 스트링을 자른 후 suffix 추가
     * @param str, maxLength, suffix, isHtml
     * @return String
     */
    public static String subString(String str, int maxLength, String suffix, boolean isHtml) {
        boolean openTag = false;
        if (StaticUtil.isEmpty(str) || str.getBytes().length <= maxLength)
            return str;

        int i = 0;
        StringBuffer resultStrSb = new StringBuffer();
        ;
        String allStr = str;
        String imsiStr = allStr.substring(0, 1);
        while (i < maxLength && allStr.length() > 1) {
            if (isHtml) {
                if (imsiStr.equals("<"))
                    openTag = true;
                if (imsiStr.equals(">"))
                    openTag = false;
            }
            byte[] ar = imsiStr.getBytes();

            if (!openTag)
                i += ar.length;

            resultStrSb.append(imsiStr);
            allStr = allStr.substring(1);
            if (allStr.length() == 1) {
                imsiStr = allStr;
            } else if (allStr.length() > 1) {
                imsiStr = allStr.substring(0, 1);
            }
        }

        return resultStrSb.append(suffix).toString();
    }

    /**
     * vm 단에서 쓰기 위해서 정의
     * @param str, startLength, endLength
     * @return String
     */
    public static String subString(String str, int startLength, int endLength) {
    	if(str == null) 	return "";

        return str.substring(startLength, endLength);
    }

    /**
     * '-', ' '가 포함된 핸드폰번호를 숫자로만 바꾼다. 숫자, '-', ' ' 이외의 문자가 들어있으면 null을 리턴
     * @param b
     * @return String
     */
    public static String getVaildPhn(String b) {
        String result;
        if (b == null || b.equals(""))
            return "";
        else
            b = b.trim();
        StringBuffer sf = new StringBuffer("");

        for (int i = 0; i < b.length(); i++) {
            if (b.charAt(i) == '-' || b.charAt(i) == ' ') {
                // do noting
            } else if (b.charAt(i) < '0' || b.charAt(i) > '9') {
                return null;
            } else {
                sf.append(b.charAt(i));
            }
        }
        if (sf.length() > 15)
            result = sf.substring(1, 15);
        else
            result = sf.toString();
        return result;
    }

    /**
     * URL, ServletOutputStream out
     * @param URL, out
     * @return
	 * @throws Exception
     */
    public static void metaRedirect(String URL, ServletOutputStream out) throws Exception {
    	out.print("<html>");
        out.print("<meta http-equiv='Refresh' content='0; URL=" + URL + "'>");
        out.print("</html>");
        out.flush();
    }

    /**
     * num에 DecimalFormat를 적용한다. DecimalFormat은 Java API문서 참고
     * @param num, format
     * @return String
     */
    public static String format(int num, String format) {
        return (new DecimalFormat(format)).format(num);
    }

    /**
     * num에 DecimalFormat를 적용한다. DecimalFormat은 Java API문서 참고
     * @param num, format
     * @return String
     */
    public static String format(double num, String format) {
        return (new DecimalFormat(format)).format(num);
    }

    /**
     * num에 DecimalFormat를 적용한다. DecimalFormat은 Java API문서 참고
     * @param num, format
     * @return String
     */
    public static String format(long num, String format) {
        return (new DecimalFormat(format)).format(num);
    }

    /**
     * num에 DecimalFormat를 적용한다. DecimalFormat은 Java API문서 참고
     * @param str, format
     * @return String
     */
    public static String format(String str, String format) {
        if (isEmpty(str))
            str = "0";
        return (new DecimalFormat(format)).format(Double.parseDouble(str));
    }

    /**
     * 3자리마다 ','를 찍는 통화포맷으로 바꾼다.
     * @param money
     * @return String
     */
    public static String formatMoney(int money) {
        return format(money, "#,##0");
    }

    /**
     * 3자리마다 ','를 찍는 통화포맷으로 바꾼다.
     * @param money
     * @return String
     */
    public static String formatMoney(String money) {
        return format(money, "#,##0");
    }

    /**
     * 스트링이 빈스트링이나 null이면 true
     * @param str
     * @return boolean
     */
    public static boolean isEmpty(String str) {
        if (str == null || str.trim().equals(""))
            return true;
        else
            return false;
    }

    /**
     * Calendar를 DTTM(YYYYMMDDHIS) 형식으로 변환한다.
     * @param cal
     * @return String
     */
    public static String calToDttm(Calendar cal) {
        return StaticUtil.format(cal.get(Calendar.YEAR), "0000")
                + StaticUtil.format(cal.get(Calendar.MONTH) + 1, "00")
                + StaticUtil.format(cal.get(Calendar.DAY_OF_MONTH), "00")
                + StaticUtil.format(cal.get(Calendar.HOUR_OF_DAY), "00")
                + StaticUtil.format(cal.get(Calendar.MINUTE), "00")
                + StaticUtil.format(cal.get(Calendar.SECOND), "00");
    }

    /**
     * DTTM(YYYYMMDDHIS) 형식을 Calendar로 변환한다.
     * @param dttm
     * @return Calendar
     */
    public static Calendar dttmToCal(String dttm) {
        Calendar cal = Calendar.getInstance();
        cal.set(getYearByDttm(dttm), getMonthByDttm(dttm) - 1,
                getDayByDttm(dttm), getHourByDttm(dttm), getMinByDttm(dttm),
                getSecByDttm(dttm));
        return cal;
    }

    /**
     * 현재시간을 DTTM형식으로 return
     * @param
     * @return String
     */
    public static String getNowDttm() {
        return calToDttm(Calendar.getInstance());
    }

    /**
     * 현재시간을 DTTM(YYYYMMDD) 형식으로 변환한다.
     * @param
     * @return String
     */
    public static String getNowYMD() {
    	return calToYMD(Calendar.getInstance());
    }

    /**
     * Calendar를 DTTM(YYYYMMDD) 형식으로 변환한다.
     * @param cal
     * @return String
     */
    public static String calToYMD(Calendar cal) {
        return StaticUtil.format(cal.get(Calendar.YEAR), "0000")
                + StaticUtil.format(cal.get(Calendar.MONTH) + 1, "00")
                + StaticUtil.format(cal.get(Calendar.DAY_OF_MONTH), "00");
    }

    /**
     * 현재시간을 YYYYMMDD형식으로 return
     * @param
     * @return String
     */
    public static String getNowDate() {
        Calendar cal = Calendar.getInstance();
        return StaticUtil.format(cal.get(Calendar.YEAR), "0000")
        + StaticUtil.format(cal.get(Calendar.MONTH) + 1, "00")
        + StaticUtil.format(cal.get(Calendar.DAY_OF_MONTH), "00");
    }

    /**
     * 현재시간에서 얼마 전,후의 시간을 YYYYMMDD형식으로 return
     * @param amount
     * @return String
     */
    public static String getNowDateAdd(int amount) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, amount);
        return StaticUtil.format(cal.get(Calendar.YEAR), "0000")
        + StaticUtil.format(cal.get(Calendar.MONTH) + 1, "00")
        + StaticUtil.format(cal.get(Calendar.DAY_OF_MONTH), "00");
    }

    /**
     * 현재시간에서 얼마 전,후의 월을 YYYYMM형식으로 return
     * @param amount
     * @return String
     */
    public static String getNowMonthAdd(int amount) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, amount);
        return StaticUtil.format(cal.get(Calendar.YEAR), "0000")
        + StaticUtil.format(cal.get(Calendar.MONTH) + 1, "00");
    }

    /**
     * 입력된 일자에 일 입력 값에 따른 추가 계산하여 반환한다.
     * param strDate	일자
     * param amount		계산할 일자수
     * return  int[]	입력된 일 수 만큼 더한 일자
     */
    public static String getMonthAdd(String strDate, int amount ) {
    	FormatHelper formatutil = new FormatHelper();
        int newYear  = Integer.parseInt(strDate.substring(0,4));
        int newMonth = Integer.parseInt(strDate.substring(4,6));
        int newDay   = Integer.parseInt(strDate.substring(6,8));

        String newDate = newYear + "-" + newMonth + "-" + newDay;

        Calendar temp = Calendar.getInstance();

        temp.set(newYear, newMonth - 1, newDay);
        temp.add(Calendar.MONTH, amount);

        int nYear	= temp.get(Calendar.YEAR);
        int nMonth	= temp.get(Calendar.MONTH) + 1;
        //int nDay	= temp.get(Calendar.DAY_OF_MONTH);
        newDate = 	String.valueOf(nYear) + String.valueOf(formatutil.monthOrDayFormat(nMonth));

        return newDate;
    }

   /**
     * 현재시간에서 얼마 전,후의 시간을 DTTM형식으로 리턴 Date Arithmetic function. Adds the
     * specified (signed) amount of time to the given time field, based on the
     * calendar's rules. For example, to subtract 5 days from the current time
     * of the calendar, you can achieve it by calling:
     * getNowDttmAdd(Calendar.DATE, -5); // 5일전
     *
     * @param field -
     *            the time field.
     * @param amount -
     *            the amount of date or time to be added to the field.
     * @return String DTTM형식의 일시
     */
    public static String getNowDttmAdd(int field, int amount) {
        Calendar cal = Calendar.getInstance();
        cal.add(field, amount);
        return calToDttm(cal);
    }

    /**
     * dttm 날짜에 amount를 추가한 DTTM(YYYYMMDDHIS) 형식으로 변환한다.
     * @param dttm, field, amount
     * @return String
     */
    public static String getDttmAdd(String dttm, int field, int amount) {
        Calendar cal = dttmToCal(dttm);
        cal.add(field, amount);
        return calToDttm(cal);
    }

    /**
     * JDBC 접속정보를 이용 Connection을 얻는다.
     *
     * @param dbDriver -
     *            JDBC Driver 클래스 이름
     * @param dbUrl -
     *            JDBC URL
     * @param dbUser -
     *            DB User
     * @param dbPass -
     *            DB Pass
     * @param dbName -
     *            DB Name (for setCatalog())
     * @return String JDBC Connection
     */
    public static Connection getConnect(String dbDriver, String dbUrl,
            String dbUser, String dbPass, String dbName) throws Exception {
        Connection conn = null;
        try{
            Class.forName(dbDriver);
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
            conn.setCatalog(dbName);   
        }
        catch (ClassNotFoundException e) {
        	conn = null;
        }
        catch (SQLException e) {
        	if(conn != null)
        		conn.close();
        	conn = null;
        }
        return conn;
    }

    /**
     * 아레오에서 사용하는 20자리의 메시지ID를 딴다.
     * @param
     * @return String
     */
    //public static String getMsgId() {
    //  Random rand = new Random();
    //    return StaticUtil.getNowDttm() + StaticUtil.format(rand.nextInt(999999), "000000");
    //}

    /**
     * DTTM형식의 일부(YYYY or YYYYMM등)의 스트링을 YYYYMMDDHIS(ex:20020101010101)로 바꾼다.
     *
     * @param dttm -
     *            DTTM스트링
     * @param isBegin -
     *            시작인가? 끝인가? 즉 true이면 끝을 00000000로 채우고 false이면 99991231로 채운다.
     * @return String Full DTTM스트링
     */
    public static String toFullDt(String dttm, boolean isBegin) {
        if (dttm == null || dttm.length() == 0)
            return isBegin ? "00000000" : "99991231";
        else if (dttm.length() == 6)
            return isBegin ? dttm + "01" : dttm + "31";
        else if (dttm.length() == 4)
            return isBegin ? dttm + "0101" : dttm + "1231";
        else
            return dttm;
    }

    /**
     * Throwable or Exception을 통해 StackTrace스트링을 얻는다.
     * @param e
     * @return String
     */
    public static String getStackTraceAsString(Throwable e) {
        if (e == null)
            return "Exception is null";
        ByteArrayOutputStream ostr = new ByteArrayOutputStream();
//        e.printStackTrace(new PrintStream(ostr));
        return ostr.toString();
    }

    /**
     * Throwable or Exception을 통해 StackTrace HTML(\n->을 얻는다.
     * @param e
     * @return String
     */
    public static String getStackTraceAsHTML(Throwable e) {
        return (StaticUtil.strReplace("\n", "<BR>", getStackTraceAsString(e)));
    }

    /**
     * 공백제거
     * @param str
     * @return String
     */
    public static String trim(String str) {

        return str.trim();
    }

    /**
     * 스트링의 인덱스 문자 구분을 얻는다. 인덱스 문자값은 소스를 참고한다.
     * @param str
     * @return String
     */
    public static String getIdxCharKr(String str) {
        if (str == null || str.length() < 1)
            return "17";
        return getIdxCharKr(str.charAt(0));
    }

    /**
     * char의 인덱스 문자 구분을 얻는다. 인덱스 문자값은 소스를 참고한다.
     * @param chr
     * @return String
     */
    public static String getIdxCharKr(char chr) {
        String result;
        int krCode = (chr - 0xac00) / (21 * 28);
        if (krCode == 0 || krCode == 1)
            result = "01"; // "ㄱ"
        else if (krCode == 2)
            result = "02"; // "ㄴ"
        else if (krCode == 3 || krCode == 4)
            result = "03"; // "ㄷ"
        else if (krCode == 5)
            result = "04"; // "ㄹ"
        else if (krCode == 6)
            result = "05"; // "ㅁ"
        else if (krCode == 7 || krCode == 8)
            result = "06"; //  "ㅂ"
        else if (krCode == 9 || krCode == 10)
            result = "07"; // "ㅅ"
        else if (krCode == 11)
            result = "08"; // "ㅇ"
        else if (krCode == 12 || krCode == 13)
            result = "09"; // "ㅈ"
        else if (krCode == 14)
            result = "10"; // "ㅊ"
        else if (krCode == 15)
            result = "11"; // "ㅋ"
        else if (krCode == 16)
            result = "12"; // "ㅌ"
        else if (krCode == 17)
            result = "13"; // "ㅍ"
        else if (krCode == 18)
            result = "14"; // "ㅎ"
        else if (chr >= 49 && chr <= 57)
            result = "15"; // "0-9"
        else if ((chr >= 97 && chr <= 122) || (chr >= 65 && chr <= 90))
            result = "16"; // "a-Z"
        else
            result = "17"; // "기타"
        return result;
    }

    /**
     * String array를 Sting Collection으로 변환한다.
     * @param array
     * @return Collection
     */
    public static Collection arrayToCollection(String[] array) {
        Collection col = new ArrayList();
        if (array == null)
            return col;
        for (int i = 0; array.length > i; i++)
            col.add(array[i]);
        return col;
    }

    /**
     * Sting Collection을 String array으로 변환한다.
     * @param col
     * @return String[]
     */
    public static String[] collectionToArray(Collection col) {
        String[] array = new String[col.size()];
        Iterator it = col.iterator();
        for (int i = 0; array.length > i; i++)
            array[i] = (String) it.next();
        return array;
    }

    /**
     * 유효한 Email인지 검사한다. null도 false이다.
     * @param email
     * @return boolean
     */
    public static boolean isValidEmail(String email) {
        // check an "@" somewhere after the 1st character
        return (email.indexOf("@") > 0);
    }

    /**
     * 유효한 날짜인지 검사한다.
     * @param dt
     * @return boolean
     */
    public static boolean isValidDt(String dt) {
        return isEmpty(dt) || (isNumber(dt) && dt.length() == 8);
    }

    /**
     * 유효한 날짜시간인지 검사한다.
     * @param dttm
     * @return boolean
     */
    public static boolean isValidDttm(String dttm) {
        return isEmpty(dttm) || (isNumber(dttm) && dttm.length() == 14);
    }

    /**
     * under bar(_)로 표기된 변수명등을 낙타표기법으로 바꾼다. ex) USR_ID -> usrId)
     * @param columnName
     * @return String
     */
    public static String toCamel(String columnName) {
        if (columnName == null)
            return null;
        String token;
        if (columnName.equals(columnName.toUpperCase()))
            columnName = columnName.toLowerCase();
        StringTokenizer tokenizer = new StringTokenizer(columnName, "_");
        StringBuffer result = new StringBuffer();
        while (tokenizer.hasMoreTokens()) {
            result.append(toHeadUpperCase(tokenizer.nextToken()));
        }

        return result.toString();
    }

    /**
     * 스트링의 첫번째 글자를 소문자로 바꾼다.
     * @param str
     * @return String
     */
    public static String toHeadLowerCase(String str) {
        if (str == null)
            return null;
        return Character.toLowerCase(str.charAt(0))
                + str.substring(1, str.length());
    }

    /**
     * 스트링의 첫번째 글자를 대문자로 바꾼다.
     * @param str
     * @return String
     */
    public static String toHeadUpperCase(String str) {
        if (str == null)
            return null;
        if (str.length() == 0)
            return str;
        return Character.toUpperCase(str.charAt(0))
                + str.substring(1, str.length());
    }

    /**
     * 스트링의 글자를 대문자로 바꾼다.
     * @param str
     * @return String
     */
    public static String toUpperCase(String str) {
        if (str == null)
            return null;
        if (str.length() == 0)
            return str;
        return str.toUpperCase();
    }

    /**
     * 스트링의 글자를 소문자로 바꾼다.
     * @param str
     * @return String
     */
    public static String toLowerCase(String str) {
        if (str == null)
            return null;
        return str.toLowerCase();
    }

    /**
     * 두개로 나누어진 우편번호를 합친다. ex) 123, 123 -> 123123
     * @param zipCd1, zipCd2
     * @return String
     */
    public static String getZipCd(String zipCd1, String zipCd2) {
        if (!(StaticUtil.isEmpty(zipCd1) && StaticUtil.isEmpty(zipCd1)))
            return zipCd1 + zipCd2;
        else
            return null;
    }

    /**
     * 세개로 나누어진 전화번호를 합친다. ex) 02, 1234, 1234 -> 02-1234-1234
     * @param tel1, tel2, tel3
     * @return String
     */
    public static String getTel(String tel1, String tel2, String tel3) {
        if (!(StaticUtil.isEmpty(tel1) && StaticUtil.isEmpty(tel2) && StaticUtil.isEmpty(tel3)))
            return tel1 + "-" + tel2 + "-" + tel3;
        else
            return "";
    }

    /**
     * 년월일 만들기
     * @param year, month, day, leapMonth
     * @return String
     */
    public static String myDate(int year, int month, int day, int leapMonth){
		String returnVal = "";

		returnVal = Integer.toString(year);
		if(month < 10 ){
			returnVal += "0" + Integer.toString(month);
		}else{
			returnVal += Integer.toString(month);
		}

		if(day < 10){
			returnVal += "0" + Integer.toString(day);
		}else{
			returnVal += Integer.toString(day);
		}

		return returnVal;
	}

    /**
     * 세개로 나우어진 년월일을 합친다. ex) 2002, 1, 29 -> 20020129
     * @param y, m, d
     * @return String
     */
    public static String getDt(int y, int m, int d) {
        return StaticUtil.format(y, "0000") + StaticUtil.format(m, "00")
                + StaticUtil.format(d, "00");
    }

    /**
     * 세개로 나우어진 년월일을 합친다. ex) 2002, 1, 29 -> 20020129
     * @param y, m, d
     * @return String
     */
    public static String getDt(String y, String m, String d) {
        if (!(StaticUtil.isEmpty(y) && StaticUtil.isEmpty(m) && StaticUtil.isEmpty(d)))
            return StaticUtil.format(y, "0000") + StaticUtil.format(m, "00")
                    + StaticUtil.format(d, "00");
        else
            return "";
    }

    /**
     * 세개로 나우어진 년월일시분을 합친다. ex) 2002, 1, 29, 1, 1 -> 200201290101
     * @param y, m, d, i
     * @return String
     */
    public static String getDttm(int y, int m, int d, int h, int i) {
    	return StaticUtil.format(y, "0000")
    	     + StaticUtil.format(m, "00")
             + StaticUtil.format(d, "00")
             + StaticUtil.format(h, "00")
             + StaticUtil.format(i, "00");
    }

    /**
     * 세개로 나우어진 년월일시분초를 합친다. ex) 2002, 1, 29, 1, 1, 1 -> 20020129010101
     * @param y, m, d, h, i, s
     * @return String
     */
    public static String getDttm(String y, String m, String d, String h,
            String i, String s) {
        if (!(StaticUtil.isEmpty(y) && StaticUtil.isEmpty(m) && StaticUtil.isEmpty(d)))
            return StaticUtil.format(y, "0000") + StaticUtil.format(m, "00")
                    + StaticUtil.format(d, "00") + StaticUtil.format(h, "00")
                    + StaticUtil.format(i, "00") + StaticUtil.format(s, "00");
        else
            return "";
    }

    /**
     * DTTM의 연도를 리턴한다.
     * @param dttm
     * @return int
     */
    public static int getYearByDttm(String dttm) {
        int result = 0;
            result = Integer.parseInt(dttm.substring(0, 4));
        return result;
    }

    /**
     * DTTM의 월을 리턴한다.
     * @param dttm
     * @return int
     */
    public static int getMonthByDttm(String dttm) {
        int result = 0;
            result = Integer.parseInt(dttm.substring(4, 6));
        return result;
    }

    /**
     * DTTM의 일자를 리턴한다.
     * @param dttm
     * @return int
     */
    public static int getDayByDttm(String dttm) {
        int result = 0;
            result = Integer.parseInt(dttm.substring(6, 8));
        return result;
    }

    /**
     * DTTM의 시간를 리턴한다.
     * @param dttm
     * @return String
     */
    public static int getHourByDttm(String dttm) {
        int result = 0;
            result = Integer.parseInt(dttm.substring(8, 10));
        return result;
    }

    /**
     * DTTM의 분를 리턴한다.
     * @param dttm
     * @return String
     */
    public static int getMinByDttm(String dttm) {
        int result = 0;
            result = Integer.parseInt(dttm.substring(10, 12));
        return result;
    }

    /**
     * DTTM의 초를 리턴한다.
     * @param dttm
     * @return String
     */
    public static int getSecByDttm(String dttm) {
        int result = 0;
            result = Integer.parseInt(dttm.substring(12, 14));
        return result;
    }

    /**
     * 6자리 우편번호의 앞자리를 리턴한다.
     * @param zipCd
     * @return String
     */
    public static String getZipCd1(String zipCd) {
        String result = "";
            result = zipCd.substring(0, 3);
        return result;
    }

    /**
     * 6자리 우편번호의 뒷자리를 리턴한다.
     * @param zipCd
     * @return String
     */
    public static String getZipCd2(String zipCd) {
        String result = "";
            result = zipCd.substring(3, 6);
        return result;
    }

    /**
     * 하이픈(-)으로 분리된 전화번호의 첫번째 자리를 리턴한다.
     * @param tel
     * @return String
     */
    public static String getTel1(String tel) {
        String result = "";
        tel = getDashedTel(tel);
        int firstIdx = tel.indexOf("-");
        result = tel.substring(0, firstIdx);
        return result;
    }

    /**
     * 하이픈(-)으로 분리된 전화번호의 두번째 자리를 리턴한다.
     * @param tel
     * @return String
     */
    public static String getTel2(String tel) {
        String result = "";
        tel = getDashedTel(tel);
        int firstIdx = tel.indexOf("-");
        int lastIdx = tel.lastIndexOf("-");
        result = tel.substring(firstIdx + 1, lastIdx);
        return result;
    }

    /**
     * 하이픈(-)으로 분리된 전화번호의 세번째 자리를 리턴한다.
     * @param tel
     * @return String
     */
    public static String getTel3(String tel) {
        String result = "";
        tel = getDashedTel(tel);
        int lastIdx = tel.lastIndexOf("-");
        result = tel.substring(lastIdx + 1, tel.length());
        return result;
    }

    /**
     * 전화번호 국번
     * @param
     * @return String[]
     */
    private static String[] DDD = { "02", "031", "033", "032", "042", "043",
            "041", "053", "054", "055", "052", "051", "063", "061", "062",
            "064", "011", "012", "013", "014", "015", "016", "017", "018",
            "019", "010", "060", "080"};

    /**
     * 숫자로 만 된 전화번호를 하이픈(-)으로 분리된 전화번호 바꾼다.
     * @param tel
     * @return String
     */
    public static String getDashedTel(String tel) {
        if (tel == null || tel.length() < 4)
            return tel;
        if (tel.indexOf("ALL") != -1)
            tel = strReplace("ALL", tel);
        if (tel.indexOf("-") != -1)
            return tel;
        tel = tel.trim();
        for (int i = 0; DDD.length > i; i++) {
            if (tel.startsWith(DDD[i]) && tel.length() >= DDD[i].length() + 4) {
                return tel.substring(0, DDD[i].length()) + "-"
                        + tel.substring(DDD[i].length(), tel.length() - 4)
                        + "-" + tel.substring(tel.length() - 4, tel.length());
            } else if (tel.startsWith(DDD[i])) {
                return tel.substring(0, DDD[i].length()) + "-"
                        + tel.substring(DDD[i].length(), tel.length());
            }
        }
        if (tel.length() > 8) {
            return tel.substring(0, tel.length() - 8) + "-"
                    + tel.substring(tel.length() - 8, tel.length() - 4) + "-"
                    + tel.substring(tel.length() - 4, tel.length());
        } else if (tel.length() > 4) {
            return tel.substring(0, tel.length() - 4) + "-"
                    + tel.substring(tel.length() - 4, tel.length());
        } else {
            return tel;
        }
    }

    /**
     * 숫자로 만 된 전화번호를 하이픈(-)으로 분리된 전화번호 바꾼다.
     * @param tel
     * @return String
     */
    public static String getDashedTel2(String tel) {
        if (tel == null || tel.length() < 4)
            return tel;
        if (tel.indexOf("ALL") != -1)
            tel = strReplace("ALL", tel);
        if (tel.indexOf("-") != -1)
            return tel;
        tel = tel.trim();
        for (int i = 0; DDD.length > i; i++) {
            if (tel.startsWith(DDD[i]) && tel.length() >= DDD[i].length() + 4) {
                return tel.substring(0, DDD[i].length()) + "-"
                        + tel.substring(DDD[i].length(), tel.length() - 4)
                        + "-" + tel.substring(tel.length() - 4, tel.length());
            } else if (tel.startsWith(DDD[i])) {
                return tel.substring(0, DDD[i].length()) + "-"
                        + tel.substring(DDD[i].length(), tel.length());
            }
        }

        return tel;
    }

    /**
     * 스트링이 숫자만 포함하고 있는지 확인
     * @param str
     * @return boolean
     */
    public static boolean isNumber(String str) {
        try {
            Integer.parseInt(str);
        } catch (NumberFormatException e) {
            return false;
        }
        return true;
    }

    /**
     * sqlTpye를 javaType의 스트링이름으로 변환한다.
     * @param sqlType, size
     * @return String
     */
    public static String toJavaType(int sqlType, int size) {
        if ((sqlType == Types.VARCHAR || sqlType == Types.CHAR) && size == 1) {
            return "String";
        } else if (sqlType == Types.VARCHAR || sqlType == Types.CHAR) {
            return "String";
        } else if (sqlType == Types.BIGINT || sqlType == Types.INTEGER
                || sqlType == Types.SMALLINT || sqlType == Types.TINYINT
                || sqlType == Types.NUMERIC) {
            return "int";
        } else if (sqlType == Types.REAL || sqlType == Types.FLOAT
                || sqlType == Types.DECIMAL) {
            return "float";
        } else if (sqlType == Types.TIME) {
            return "Time";
        } else if (sqlType == Types.TIMESTAMP) {
            return "TimeStamp";
        } else if (sqlType == Types.DATE) {
            return "Date";
        } else {
            return "String";
        }
    }

    /**
     * delim으로 구분 된 스트링의 index번째 값을 리턴한다.
     * @param str, delim, index
     * @return String
     */
    public static String getSeparatedString(String str, String delim, int index) {
        int startIndex = 0;
        int endIndex = 0;

        if (StaticUtil.isEmpty(str)) {
            return str;
        }

        for (int i = 0; i < index; i++) {
            startIndex = endIndex;
            if (i != 0)
                startIndex = startIndex + delim.length();
            if (startIndex == -1 || startIndex > str.length())
                startIndex = str.length();

            endIndex = str.indexOf(delim, startIndex + 1);
            if (endIndex == -1 || startIndex > str.length())
                endIndex = str.length();
        }

        return str.substring(startIndex, endIndex);
    }

    /**
     * delim으로 구분 된 스트링의 첫번째 값을 리턴한다.
     * @param str, delim
     * @return String
     */
    public static String getFirstString(String str, String delim) {
        if (str.indexOf(delim) == -1)
            return str;
        return str.substring(0, str.indexOf(delim));
    }

    /**
     * delim으로 구분 된 스트링의 첫번째 값을 리턴한다.
     * @param str, delim
     * @return String
     */
    public static String getSecondString(String str, String delim) {
        if (str.indexOf(delim) == -1)
            return str;
        return str.substring(str.indexOf(delim) + 1, str.length());
    }

    /**
     * '_'으로 구분 된 스트링의 첫번째 값을 리턴한다.
     * @param str
     * @return String
     */
    public static String getFirstString(String str) {
        return getFirstString(str, "_");
    }

    /**
     * 현재 연도
     * @param
     * @return int
     */
    public static int getYear() {
        return Calendar.getInstance().get(Calendar.YEAR);
    }

    /**
     * 현재 월
     * @param
     * @return int
     */
    public static int getMonth() {
        return Calendar.getInstance().get(Calendar.MONTH) + 1;
    }

    /**
     * 현재 일
     * @param
     * @return int
     */
    public static int getDay() {
        return Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
    }

    /**
     * 현재 시
     * @param
     * @return int
     */
    public static int getHour() {
        return Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
    }

    /**
     * 현재 분
     * @param
     * @return int
     */
    public static int getMinute() {
        return Calendar.getInstance().get(Calendar.MINUTE);
    }

    /**
     * 현재 초
     * @param
     * @return int
     */
    public static int getSecond() {
        return Calendar.getInstance().get(Calendar.SECOND);
    }

    public static String getDtByHuman(String humanDt){
        String delim = null;
        String dt = null;
        if (humanDt == null)
            return null;
        humanDt = humanDt.trim();
        if (humanDt.indexOf('/') >= 0)
            delim = "/";
        else if (humanDt.indexOf('-') >= 0)
            delim = "/";
        else if (humanDt.indexOf(' ') >= 0)
            delim = " ";
        else
            return humanDt;
        try {
            StringTokenizer st = new StringTokenizer(humanDt, delim);
            int year = Integer.parseInt(st.nextToken().trim());
            if (year < 30) {
                year += 2000;
            } else if (year < 100) {
                year += 1900;
            }
            int month = Integer.parseInt(st.nextToken().trim());
            int day = Integer.parseInt(st.nextToken().trim());
            dt = StaticUtil.getDt(year, month, day);
        } catch (NumberFormatException e){
        	LOG.error("getDtByHuman : " +  e.getCause() + " [NumberFormatException]");
        	return humanDt;
        } catch (NullPointerException e) {
        	LOG.error("getDtByHuman : " +  e.getCause() + " [NullPointerException]");
            return humanDt;
        }
        return dt;
    }

    /**
     * 양력, 음력 확인
     * @param lunStr
     * @return String
     */
    public static String getLunGbByHuman(String lunStr) {
        if (lunStr == null)
            return null;
        lunStr = lunStr.trim();
        if (lunStr.startsWith("음"))
            return "2";
        else
            return "1";
    }

    /**
     * 숫자로 만 된 사업자등록번호를 하이픈(-)으로 분리된 사업자등록번호로 바꾼다.
     * @param no
     * @return String
     */
    public static String getDashedCmpNo(String no) {
        if (no == null || no.length() < 10)
            return no;
        else {
            return no.substring(0, no.length() - 7) + "-"
                    + no.substring(no.length() - 7, no.length() - 5) + "-"
                    + no.substring(no.length() - 5, no.length());
        }
    }

    /**
     * 숫자로 만 된 법인등록번호를 하이픈(-)으로 분리된 법인등록번호로 바꾼다.(주민번호도 가능)
     * @param no
     * @return String
     */
    public static String getDashedCopNo(String no) {
        if (no == null || no.length() < 13)
            return no;
        else {
            return no.substring(0, no.length() - 7) + "-"
                    + no.substring(no.length() - 7, no.length());
        }
    }

    /**
     * 숫자로 만 된 주민등록번호를 하이픈(-)으로 분리되고 "*"로 숨긴 스트링으로 변경
     * @param no
     * @return String
     */
    public static String getDashedRegNo(String no) {
        if (no == null || no.length() < 13)
            return no;
        else {
            return no.substring(0, no.length() - 7) + " - "
                    + "*******";
        }
    }

    /**
     * 인자로 넘어온 값을 바이트로 변환
     * @param str
     * @return String
     */
   public static byte[] toByteArray(short foo) {
        return toByteArray(foo, new byte[2]);
    }

   /**
    * 인자로 넘어온 값을 바이트로 변환
    * @param foo
    * @return String
    */
    public static byte[] toByteArray(int foo) {
        return toByteArray(foo, new byte[4]);
    }

    /**
     * 인자로 넘어온 값을 바이트로 변환
     * @param foo
     * @return String
     */
    public static byte[] toByteArray(long foo) {
        return toByteArray(foo, new byte[8]);
    }

    /**
     * 인자로 넘어온 값을 바이트로 변환
     * @param foo, array
     * @return byte[]
     */
    private static byte[] toByteArray(long foo, byte[] array) {
        for (int iInd = 0; iInd < array.length; ++iInd) {
            array[iInd] = (byte) ((foo >> (iInd * 8)) % 0xFF);

        }
        return array;
    }

    /**
     * 바이트를 Long 형식으로 변환
     * @param in, start, length
     * @return long
     */
    public static long byteArrayToLong(byte[] in, int start, int length) {
        long value = 0;

        for (int i = start; i < (start + length); i++) {
            // move each byte (length-pos-1)*8 bits to the left and add them
            value += (long) ((in[i] & 0xff) << ((length - i + start - 1) * 8));
        }

        return value;
    }

    /**
     * Long 타입을 int로 변환
     * @param str
     * @return byte[]
     */
    public static byte[] longToIntBytes(long a) {
        byte returnByteArray[] = new byte[4];
        returnByteArray[0] = (byte) (int) ((a & 0xffffffffff000000L) >> 24);
        returnByteArray[1] = (byte) (int) ((a & 0xff0000L) >> 16);
        returnByteArray[2] = (byte) (int) ((a & 65280L) >> 8);
        returnByteArray[3] = (byte) (int) (a & 255L);
        return returnByteArray;
    }

    /**
     * 주민번호로 나이 추출
     * @param resiNo
     * @return int
     */
    public static int getAgeByResiNo(String resiNo) {
        String yearGb;
        String resiYearPre = "19";
        int age;
        if (resiNo == null || resiNo.length() < 13)
            return -1;

        yearGb = resiNo.substring(6, 7);
        if (yearGb.equals("-"))
            yearGb = resiNo.substring(7, 8);
        if (yearGb.equals("3") || yearGb.equals("4"))
            resiYearPre = "20";

        age = getYear()
                - Integer.parseInt(resiYearPre + resiNo.substring(0, 2)) + 1;
        return age;
    }

    /**
     * 원하는 곳에서 줄 넣기(\n)
     * @param strLine, iMaxWidth, cNewLine
     * @return String
     */
    public static String breakLine(String strLine, int iMaxWidth, char cNewLine) {
        StringBuffer strbufReturn = new StringBuffer();
        int iIndex;
        for (; strLine.length() > 0; strLine = strLine.substring(iIndex + 1)) {
            iIndex = iMaxWidth;
            if (strLine.length() <= iMaxWidth) {
                strbufReturn.append(strLine);
                break;
            }
            for (char charCurrent = strLine.charAt(iIndex); !Character
                    .isWhitespace(charCurrent)
                    && iIndex > 0; charCurrent = strLine.charAt(iIndex))
                iIndex--;

            if (iIndex == 0) {
                int iBreakPoint = iMaxWidth;
                strbufReturn.append(strLine.substring(0, iBreakPoint));
                strbufReturn.append(cNewLine);
                strbufReturn.append(strLine.substring(iBreakPoint));
                return strbufReturn.toString();
            }
            strbufReturn.append(strLine.substring(0, iIndex) + cNewLine);
        }

        return strbufReturn.toString();
    }

    /**
     * URL 인코딩
     * @param url
     * @return String
     */
    public static String URLEncode(String url) {
        return url == null ? null : URLEncoder.encode(url); //, getLocale());
    }

    /**
     * URL 디코딩
     * @param url
     * @return String
     */
    public static String URLDecode(String url) {
        return url == null ? null : URLDecoder.decode(url); //, getLocale());
    }



    /**
     * 구분자로 자른 List 반환
     * @param string, spliter
     * @return List
     */
    public static List splitString(String string, String spliter) {
        if (string == null || spliter == null)
            return null;
        List splitList = new ArrayList();
        StringTokenizer toSt = new StringTokenizer(string, spliter);
        while (toSt.hasMoreTokens()) {
            splitList.add(toSt.nextToken());
        }
        return splitList;
    }

    /**
     * 구분자로 자른 스트링 반환
     * @param string, spliter, flag
     * @return String
     */
    public static String splitStringBySpliter(String string, String spliter, String flag) {
         if (string == null || spliter == null)
             return "";
         String retStr = "";
         int intIdx = string.indexOf(spliter);
         if("f".equals(flag))
         	retStr = string.substring(0, intIdx);
         else
         	retStr = string.substring(intIdx+1, string.length());

         return retStr;
     }

    /**
     * 주민번호체크
     * @param reg
     * @return boolean
     */
    public static boolean checkRegNo(String reg) {
        String reg1 = "", reg2 = "";
        // 길이가 맞지 않으면 return false
        if (reg.length() != 13) {
            return false;
        } else {
            reg1 = reg.substring(0, 6);
            reg2 = reg.substring(6, reg.length());
            int digit = 0;

            // 숫자가 아니면 return false
            for (int i = 0; i < reg1.length(); i++) {
                char str_dig = reg1.charAt(i);
                if (str_dig < '0' || str_dig > '9') {
                    return false;
                }
            }

            for (int i = 0; i < reg2.length(); i++) {
                char str_dig = reg2.charAt(i);
                if (str_dig < '0' || str_dig > '9') {
                    return false;
                }
            }

            if (reg1.charAt(2) > '1') {
                return false;
            } else if (reg1.charAt(4) > '3') {
                return false;
            } else if (reg2.charAt(0) == '0' || reg2.charAt(0) > '4') {
                return false;
            }

            int check_digit = 0;
            int b7 = 0;

            for (int i = 0; i < reg1.length(); i++) {
                int a = Integer.parseInt(reg1.substring(i, i + 1));
                check_digit += (a * (i + 2));
            }

            for (int i = 0; i < 2; i++) {
                int b = Integer.parseInt(reg2.substring(i, i + 1));
                check_digit += (b * (i + 8));
            }

            for (int i = 2; i < reg2.length() - 1; i++) {
                int b = Integer.parseInt(reg2.substring(i, i + 1));
                check_digit += (b * i);
            }

            b7 = Integer.parseInt(reg2.substring(6, 7));

            check_digit = (check_digit % 11);
            check_digit = 11 - check_digit;
            check_digit = (check_digit % 10);

            if (check_digit != b7) {
                return false;
            } else {
                return true;
            }
        }
    }

    /**
     * 페이지에 따른 substring
     * @param inStr, iCutSize, iCurPage
     * @return String
     */
    public static String getSplitString(String inStr, int iCutSize, int iCurPage) {
        if (inStr == null)
            return "";
        String result = inStr;
        int iStrLength = result.length();
        if (iStrLength > (iCutSize * iCurPage)) {
            result = result.substring((iCutSize * (iCurPage - 1)), iCutSize
                    * iCurPage);
        } else {
            result = result.substring(iCutSize * (iCurPage - 1), result
                    .length());
        }

        return result;
    }

    /**
     * URL 인코딩 Unicode
     * @param str
     * @return String
     */
    public static String URLEncodeUnicode(String str) {
        StringBuffer resultSb = new StringBuffer();
        for (int i = 0; str.length() > i; i++) {
            int intVal = (int) str.charAt(i);
            intVal = intVal & 0xFFFF;
            String strVal = Integer.toHexString(intVal);
            resultSb.append("%u");
            for (int j = 4 - strVal.length(); j > 0; j--)
                resultSb.append('0');
            resultSb.append(strVal);
        }
        return resultSb.toString();
    }

    static BitSet dontNeedEncoding;

    static final int caseDiff = ('a' - 'A');

    static String dfltEncName = null;


    /**
     * URLEncoder.encode copy from JDK 1.4
     */
    public static String URLEncode(String s, String enc)
            throws UnsupportedEncodingException {

        boolean needToChange = false;
        boolean wroteUnencodedChar = false;
        int maxBytesPerChar = 10; // rather arbitrary limit, but safe for now
        StringBuffer out = new StringBuffer(s.length());
        ByteArrayOutputStream buf = new ByteArrayOutputStream(maxBytesPerChar);

        OutputStreamWriter writer = new OutputStreamWriter(buf, enc);

        for (int i = 0; i < s.length(); i++) {
            int c = (int) s.charAt(i);
            //System.out.println("Examining character: " + c);
            if (dontNeedEncoding.get(c)) {
                if (c == ' ') {
                    c = '+';
                    needToChange = true;
                }
                //System.out.println("Storing: " + c);
                out.append((char) c);
                wroteUnencodedChar = true;
            } else {
                // convert to external encoding before hex conversion
                try {
                    if (wroteUnencodedChar) { // Fix for 4407610
                        writer = new OutputStreamWriter(buf, enc);
                        wroteUnencodedChar = false;
                    }
                    writer.write(c);
                    /*
                     * If this character represents the start of a Unicode
                     * surrogate pair, then pass in two characters. It's not
                     * clear what should be done if a bytes reserved in the
                     * surrogate pairs range occurs outside of a legal surrogate
                     * pair. For now, just treat it as if it were any other
                     * character.
                     */
                    if (c >= 0xD800 && c <= 0xDBFF) {
                        /*
                         * System.out.println(Integer.toHexString(c) + " is high
                         * surrogate");
                         */
                        if ((i + 1) < s.length()) {
                            int d = (int) s.charAt(i + 1);
                            /*
                             * System.out.println("\tExamining " +
                             * Integer.toHexString(d));
                             */
                            if (d >= 0xDC00 && d <= 0xDFFF) {
                                /*
                                 * System.out.println("\t" +
                                 * Integer.toHexString(d) + " is low
                                 * surrogate");
                                 */
                                writer.write(d);
                                i++;
                            }
                        }
                    }
                    writer.flush();
                } catch (IOException e) {
                    buf.reset();
                    continue;
                }
                byte[] ba = buf.toByteArray();
                for (int j = 0; j < ba.length; j++) {
                    out.append('%');
                    char ch = Character.forDigit((ba[j] >> 4) & 0xF, 16);
                    // converting to use uppercase letter as part of
                    // the hex value if ch is a letter.
                    if (Character.isLetter(ch)) {
                        ch -= caseDiff;
                    }
                    out.append(ch);
                    ch = Character.forDigit(ba[j] & 0xF, 16);
                    if (Character.isLetter(ch)) {
                        ch -= caseDiff;
                    }
                    out.append(ch);
                }
                buf.reset();
                needToChange = true;
            }
        }

        return (needToChange ? out.toString() : s);
    }

    /**
     * filePath에서 파일명 가져오기
     * @param filePath
     * @return String
     */
    public static String getFileName(String filePath) {
        String fileName;
        int separatorIndex = filePath.indexOf("/");
        if (separatorIndex == -1)
            separatorIndex = filePath.indexOf("\\");
        if (separatorIndex == -1)
            fileName = filePath;
        else
            fileName = filePath.substring(separatorIndex + 1);
        return fileName;
    }

    /**
     * InputStream을 끝까지 읽어 String으로 리턴한다.
     * @param in
     * @return String
     * @throws IOException
     */
    public static String inputStreamToString(InputStream in) throws IOException {
        if (in == null)
            return null;

        BufferedReader reader = new BufferedReader(new InputStreamReader(in));
        try {
            return readerToString(reader);
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                	LOG.error("inputStreamToString : " +  e.getCause() + " [IOException]");
                }
            }

            if (reader != null) {
                try {
                	reader.close();
                } catch (IOException e) {
                	LOG.error("inputStreamToString : " +  e.getCause() + " [IOException]");
                }
            }
        }
    }

    /**
     * Reader를 끝까지 읽어 String으로 리턴한다.
     * @param rd
     * @return String
     */
    public static String readerToString(Reader rd) throws IOException {
        final int BUFFER_LENGTH = 1024;

        if (rd == null)
            return null;

        StringBuffer resultSb = new StringBuffer();
        try {
            char[] buf = new char[1024];
            int readcnt;
            while ((readcnt = rd.read(buf, 0, 1024)) != -1) {
                resultSb.append(buf, 0, readcnt);
                if (readcnt < BUFFER_LENGTH)
                    break;
            }
        } finally {
            if (rd != null) {
                try {
                    rd.close();
                } catch (IOException e) {
                	LOG.error("readerToString : " +  e.getCause() + " [IOException]");
                }
            }
        }

        return resultSb.toString();
    }

    /**
     * sql 컬럼 타입인지 확인
     * @param columnType
     * @return boolean
     */
    public static boolean isBinarySqlType(int columnType) {
        return columnType == Types.BLOB || columnType == Types.CLOB
                || columnType == Types.LONGVARCHAR
                || columnType == Types.BINARY || columnType == Types.VARBINARY
                || columnType == Types.LONGVARBINARY
                || columnType == Types.LONGVARCHAR;
    }

    /**
     * 주민번호로 나이 추출
     * @param reg_no1, reg_no2
     * @return String
     */
    public static int getAgeByRegiNo(String reg_no1, String reg_no2){
    	int age = 0;
    	int iYear = 0;
    	int iMonth = 0;
    	int iDay = 0;

        if (reg_no1 == null || reg_no1.length() < 6)
             return 0;

        if (reg_no2 == null || reg_no2.length() < 1)
            return 0;

        int yearGb = Integer.parseInt(reg_no2.substring(0, 1));

        if (yearGb == 1 || yearGb == 2|| yearGb == 5|| yearGb == 6)
        	iYear = 1900 + Integer.parseInt(reg_no1.substring(0, 2));
        else
        	iYear = 2000 + Integer.parseInt(reg_no1.substring(0, 2));

        iMonth = Integer.parseInt(reg_no1.substring(2, 4));
        iDay = Integer.parseInt(reg_no1.substring(4, 6));


        GregorianCalendar birthdate = new GregorianCalendar(iYear, iMonth-1, iDay);
        GregorianCalendar today = new GregorianCalendar();

        age = today.get(Calendar.YEAR) - birthdate.get(Calendar.YEAR);
        int m = today.get(Calendar.MONTH) - birthdate.get(Calendar.MONTH);
        int d = today.get(Calendar.DATE) - birthdate.get(Calendar.DATE);

        if(m < 0) age--;
        else if(m == 0 && d<0) age--;

    	return age;
    }

    /**
     * 암호화
     * @param str
     * @return String
     */
    public static String encryptString(String str) {

		if (str != null && !str.equals("")) {			/* 값이 넘어 온 경우		*/
			char[] char_str = new char[str.length()];

			for (int i = 0; i < str.length(); i++) {
				char_str[i] = str.charAt(i);
			}

			char[] encrypted = new char[str.length()];

			for (int i=0; i < str.length(); i++) {

				encrypted[i] = (char)(char_str[i]  - str.length() + (i + 1) + 32);

			}

			return new String(encrypted);
		} else {					/* 값이 없을 경우 		*/
			return "";
		}
	}

    /**
     * 복호화
     * @param str
     * @return String
     */
	public static String decryptString(String str) {
		if (str != null && !str.equals("")) {		/* 값이 있을 경우 		*/
			char[] char_str = new char[str.length()];

			for (int i = 0; i < str.length(); i++) {
				char_str[i] = str.charAt(i);
			}

			char[] decrypted = new char[str.length()];

			for (int i=0; i < str.length(); i++) {
		 		decrypted[i] = (char)(char_str[i] + str.length() - (i + 1) - 32);
			}

			return new String(decrypted);
		} else {									/* 값이 없을 경우 		*/
			return "";
		}

	}

    /**
     * 문자열 끝자리를 "..."으로 표시한다.
     * @param str, limit
     * @return String
     */
	public static String splitHead(Object str, int limit) {
		if (str == null) return "";
		if (limit < 4) return "" + str;

		String temp = "" + str;
		int len = temp.length();
		int cnt=0, index=0;

		while (index < len && cnt < limit)
		{
			if (temp.charAt(index++) < 256) // 1바이트 문자라면...
				cnt++;     // 길이 1 증가
			else // 2바이트 문자라면...
				cnt += 2;  // 길이 2 증가
		}

		if (index < len)
			temp = temp.substring(0, index) + "...";

		return temp;
	}


    /**
     * 문자열 끝자리를 전달받은 특수문자로 표시한다.
     * @param str, ch, len
     * @return String
     */
	public static String changeEndChar(String str, String ch, int len) {
		int strLength = str.length();
		int cnt=0, index=0;
		String retStr = "";
		String retChStr = "";

		if ( str == null || len >= strLength )
			return str;

		while ( index < strLength && cnt < strLength-len )
		{
			if ( str.charAt(index++) < 256 ) // 1바이트 문자라면...
				cnt++;     // 길이 1 증가
			else // 2바이트 문자라면...
				cnt += 2;  // 길이 2 증가
		}

		if ( index < strLength ) {
			for (int i=0; i<len; i++)
				retChStr += ch;
			retStr = str.substring(0, index) + retChStr;
		} else {
			retStr = str;
		}

		return retStr;
	}

    /**
     * 음력의 총날짜수를 돌려준다. 만약 돌려줄수 없는 날이라면 0을 돌려준다
     * @param Year, Month, Day, Leap
     * @return long
     */
	public static long countLunarDay(int Year, int Month, int Day, boolean Leap)
	{
		long AllCount 		= 0;
		long ResultValue 	= 0;
		int i = 0;
		Year -= 1900;
		AllCount += countSolarDay(1900,1,30);

		if (Year >= 0) {
			for(i=0;i<=Year-1;i++) {
				AllCount += LunarData[i][12];
			}
			for (i=0;i<=Month-2;i++) {
				AllCount += LunarDataNumberDay[LunarData[Year][i]-1];
			}
			if (!Leap) {
				AllCount += Day;
			} else {
				if (LunarData[Year][Month-1]==1 || LunarData[Year][Month-1]==2) {
					AllCount += Day;
				} else if (LunarData[Year][Month-1]==3 || LunarData[Year][Month-1]==4) {
					AllCount += Day+29;
				} else if (LunarData[Year][Month-1]==5 || LunarData[Year][Month-1]==6) {
					AllCount += Day+30;
				}
			}
			ResultValue = AllCount;
		} else {
			ResultValue = 0;
		}
		return ResultValue;
	}

    /**
     * 양력의 총 날짜수를 돌려준다
     * @param Year, Month, Day
     * @return long
     */
	public static long countSolarDay(int Year, int Month, int Day)
	{
		int i, j 		= 0;
		long AllCount 	= 366;
		for (i = 1 ; i <= Year - 1; i++) {
			if (checkYunYear(i)) {
				AllCount += 366;
			} else {
				AllCount += 365;
			}
		}
		for (j=1;j<=Month-1;j++) {
			if (j==2) {
				if (checkYunYear(Year)) {
					AllCount += 29;
				} else {
					AllCount += DayOfMonth[j-1];
				}
			} else {
				AllCount += DayOfMonth[j-1];
			}
		}
		AllCount += Day;
		return AllCount;
	}

    /**
     * 해당 연도가 윤년인지 여부를 체크한다.
     * @param Year
     * @return boolean
     */
	public static boolean checkYunYear (int Year)
	{
	    if (((Year%4)==0) && ((Year%100!=0) || (Year%400==0))) {
        	return true;
		} else {
			return false;
		}
	}

    /**
     * 음력일자 계산
     * @param AllCountDay
     * @return String
     */
	public static String countToDateForLunar(long AllCountDay)
	{
		long AllCount = 0;
		int Year,Month,Day = 0;
		// {LDNC : Lunar Data Number Count}
		boolean RepeatStop;
		boolean LeapValue;
		boolean Leap;
		String dateOfLunar = "";

		Year = 0;
		Month = 1;
		Day = 0;
		LeapValue = false;
		RepeatStop = false;

		AllCount = AllCountDay;
		AllCount -= countSolarDay(1900,1,30);

	    do {
			if (AllCount > LunarData[Year][12]) {
				AllCount -= LunarData[Year][12];
				Year += 1;							// 년 계산
			} else {
				if (AllCount > LunarDataNumberDay[LunarData[Year][Month-1]-1]) {
	           		//월계산
					AllCount-=LunarDataNumberDay[LunarData[Year][Month-1]-1];
					Month += 1;
				} else {
					if (LunarData[Year][Month-1]==1 || LunarData[Year][Month-1]==2) {
						Day = Integer.parseInt(Long.toString(AllCount));
					} else if (LunarData[Year][Month-1]==3 || LunarData[Year][Month-1]==4) {
						if (AllCount <= 29) {
							Day = Integer.parseInt(Long.toString(AllCount));
						} else {
							Day = Integer.parseInt(Long.toString(AllCount))-29;
							LeapValue = true;
						}
					} else if (LunarData[Year][Month-1]==5 || LunarData[Year][Month-1]==6) {
						if (AllCount <= 30) {
							Day = Integer.parseInt(Long.toString(AllCount));
						} else {
							Day = Integer.parseInt(Long.toString(AllCount))-30;
							LeapValue = true;
						}
					}
					RepeatStop = true;
				}
			}
		} while (!RepeatStop);

		NumberFormat nf 	= NumberFormat.getNumberInstance();
		nf.setMinimumIntegerDigits(2);

		Leap = LeapValue;

		String returnLunar = Long.toString(Year+1900) + nf.format(Integer.parseInt(Long.toString(Month))) +  nf.format(Integer.parseInt(Long.toString(Day)));
		return returnLunar;
	}

    /**
     * 양력일자 계산
     * @param AllCountDay
     * @return String
     */
	public static String countToDateForSolar(long AllCountDay)
	{
		int					Year,Month = 0;
		boolean 			YearRepeatStop,MonthRepeatStop;
		YearRepeatStop 		= false;
		MonthRepeatStop 	= false;
		Year 				= 0;
		Month 				= 1;
		do
		{
		   if (checkYunYear(Year)) {
				if (AllCountDay > 366) {
					AllCountDay-=366;
					Year+=1;
				} else {
					YearRepeatStop = true;
				}
			} else {
				if (AllCountDay > 365) {
					AllCountDay-=365;
					Year += 1;
				} else {
					YearRepeatStop = true;
				}
			}
		} while (!YearRepeatStop);

		do
		{
           if (Month == 2) {
				if (checkYunYear(Year)) {
					if (AllCountDay > 29) {
						AllCountDay-=29;
						Month+=1;
					} else {
						MonthRepeatStop = true;
					}
				} else {
					if (AllCountDay > 28){
						AllCountDay-=28;
						Month+=1;
					} else {
						MonthRepeatStop = true;
					}
				}
			} else {
				if (AllCountDay > DayOfMonth[Month-1]) {
					AllCountDay-=DayOfMonth[Month-1];
					Month+=1;
				} else {
					MonthRepeatStop = true;
				}
			}
		} while (!MonthRepeatStop);

		NumberFormat nf 	= NumberFormat.getNumberInstance();
		nf.setMinimumIntegerDigits(2);

		String returnLunar = Long.toString(Year) + nf.format(Integer.parseInt(Long.toString(Month))) + nf.format(Integer.parseInt(Long.toString(AllCountDay)));
		return returnLunar;
	}

    /**
     * 엑셀 다운할수 있게 header, contentType 을 세팅해 준다
     * @param res, filename
     * @return String
     */
	public static void excelDown(HttpServletResponse res, String filename)
	{
		res.setHeader("Pragma", "no-cache;");
		res.setHeader("Expires", "-1;");
		res.setHeader("Content-Transfer-Encoding", "binary;");
		res.setContentType("application/vnd.ms-excel; charset=euc-kr");
		res.setHeader("Content-Disposition", "attachment;filename=" + filename);

	}

	/**
	 * delimeter로 구분된 문자열의 배열만들기
	 * @param source
	 * @return String[]
	 */
	public static String[] makeToken2Array(String source)
	{
		// Default delimeter = "!"
		return makeToken2Array(source,"!");
	}

	/**
	 * delimeter로 구분된 문자열의 배열만들기
	 * @param source, delimiter
	 * @return String[]
	 */
	public static String[] makeToken2Array(String source, String delimiter)
	{
		java.util.StringTokenizer oStringTokenizer= new java.util.StringTokenizer(source, delimiter);
		String[] result=new String[oStringTokenizer.countTokens()];
		for(int j=0;j<result.length;j++)
		{
			result[j]=oStringTokenizer.nextToken();
		}
		return result;
	}

	/**
	 * IF 날짜 차이가 1시간을 넘어가면 NULL을 RETURN<b>
	 * ELSE 날짜 차이를 "mm:ss" 형식으로 RETURN
	 * return days between two date strings with format as "mm:ss".
	 * @param String from 	date string
	 * @param String to		date string
	 * @param format
	 * @return String String "mm:ss"
	 * @throws java.text.ParseException
	 */
	public static String dateGap(String from, String to, String format)
	throws java.text.ParseException {

		java.text.DecimalFormat twoDf = new java.text.DecimalFormat("00");
		long duration = secondBetween(from, to, format);

		int day = (int) (duration/(60*60*24));
		duration = duration%(60*60*24);
		if (day > 0) return null;

		int hour = (int) (duration/(60*60));
		duration = duration%(60*60);
		if (hour > 0) return null;

		int minute = (int) (duration/60);
		duration = duration%60;

		int second = (int) duration;
		String dateGap = String.valueOf(twoDf.format(minute))+
		":"+String.valueOf(twoDf.format(second));

		return dateGap;
	}

    /**
     * 두 시간 사이의 분 구하기
     * @param from, to, format
     * @return long
     * @throws ParseException
     */
	public static long secondBetween(String from, String to, String format)
	throws java.text.ParseException {

	java.util.Date d1 = check(from, format);
	java.util.Date d2 = check(to, format);

	long duration = d2.getTime() - d1.getTime();

	return (long) (duration / (1000));
	// seconds in 1 second
	}

    /**
     * 인자로 넘어온 값이 날짜가 맞는지 확인후 Date 타입으로 리턴
     * @param s
     * @return Date
     * @throws ParseException
     */
	public static java.util.Date check(String s) throws java.text.ParseException {
		return check(s, "yyyyMMdd");
	}

	/**
	 * check date string validation with an user defined format.
	 * @param s date string you want to check.
	 * @param format string representation of the date format. For example, "yyyy-MM-dd".
	 * @return String date java.util.Date
     * @throws ParseException
	 */
	public static java.util.Date check(String s, String format)
		throws java.text.ParseException {
		if (s == null)
			throw new java.text.ParseException(
				"date string to check is null",
				0);
		if (format == null)
			throw new java.text.ParseException(
				"format string to check date is null",
				0);

		java.text.SimpleDateFormat formatter =
			new java.text.SimpleDateFormat(format, java.util.Locale.KOREA);
		java.util.Date date = null;
		try {
			date = formatter.parse(s);
		} catch (java.text.ParseException e) {
			/*
			throw new java.text.ParseException(
				e.getMessage() + " with format \"" + format + "\"",
				e.getErrorOffset()
			);
			*/
			throw new java.text.ParseException(
				" wrong date:\"" + s + "\" with format \"" + format + "\"",
				0);
		}

		if (!formatter.format(date).equals(s))
			throw new java.text.ParseException(
				"Out of bound date:\""
					+ s
					+ "\" with format \""
					+ format
					+ "\"",
				0);
		return date;
	}

    /**
     * '#,###.##' 형식으로 금액 포맷 맞추기
     * @param num
     * @return String
     */
	public static String rateFormat(float num) {
		String pattern = "#,###.##";
		DecimalFormat dformat = new DecimalFormat(pattern);

		return dformat.format(num);
	}


	/**
	 * 숫자로 변환
	 * @param val
	 * @return int
	 */
	public static int toNumber(String val) {
		int returnValue = 0;
		return Integer.parseInt(val);
	}

	/**
	 * 문자로 변환
	 * @param val
	 * @return String
	 */
	public static String toString(int val) {
		int returnValue = 0;
		return String.valueOf(val);
	}

    /**
	 * filePath에서 파일명 추출
     * @param filePath
     * @return String
     */
    public static String getLeftFileName(String filePath) {
        String 	fileName;
        int 	separatorIndex;

        separatorIndex = filePath.lastIndexOf("/");
        if (separatorIndex == -1)
            separatorIndex = filePath.lastIndexOf("\\");

        if (separatorIndex == -1){
            fileName = filePath;
        } else {
            fileName = filePath.substring(separatorIndex + 1);
        }

        return fileName;
    }

    /**
	 * 정렬 기준 바꾸기
     * @param mode
     * @return String
     */
    public static String reverseMode(String mode) {
        String 	rtnVal = "";

        if("ASC".equals(mode)){
        	rtnVal = "DESC";
        }else if("DESC".equals(mode)){
        	rtnVal = "ASC";
        }

        return rtnVal;
    }

    /**
   * 문자 비교
   * @param dif1
   * @param dif2
   * @return
   */
	public static boolean getDiffYn(Object dif1, Object dif2) {
	     boolean rtnVal = false;

	      String differ1 =  (String)dif1.toString();

	      String differ2 =  (String)dif2.toString();

	     if(differ1.equals(differ2)){
	          rtnVal  = true;
	     }
	     return rtnVal;
	}


}
