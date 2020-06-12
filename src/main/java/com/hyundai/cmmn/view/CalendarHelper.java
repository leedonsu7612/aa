package com.hyundai.cmmn.view;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CalendarHelper {

    private int year;			/** 연도 */
    private int month;			/** 월 */
    private int day;			/** 일 */
    private int week;			/** 요일 */
    private int hour;			/** 시간 */
    private int minute;			/** 분 */
    private int second;			/** 초 */
    private int	millsecond;

	static int KORFLAG = 0;		/** 한글 */
	static int ENGFLAG = 1;		/** 영문 */

    private String firstDayFull="";         //인수로 받은 날짜가 속한 주의 첫일의 문자열
	private String lastDayFull="";          //인수로 받은 n주후의 날짜가 속한 주의 마지막일의 문자열

    Calendar todate;
    DecimalFormat dFormat = new DecimalFormat("00");

    /**
     * 기본생성자. 시스템의 현재일자로 객체를 생성한다.
     */
    public CalendarHelper() {
        this.todate = Calendar.getInstance();
        initialize();
    }

    public void initialize() {
        this.year = this.todate.get(Calendar.YEAR);
        this.month = this.todate.get(Calendar.MONTH) + 1;
        this.day = this.todate.get(Calendar.DATE);
        this.week = this.todate.get(Calendar.DAY_OF_WEEK);
        this.hour = this.todate.get(Calendar.HOUR_OF_DAY);
        this.minute = this.todate.get(Calendar.MINUTE);
        this.second = this.todate.get(Calendar.SECOND);
        this.millsecond = this.todate.get(Calendar.MILLISECOND);
    }

    /**
     * 현재 시스템의 시간을 반환한다.
     * return int   현재 시스템의 시간
     */
    public int getHour() {
        return this.hour;
    }

    /**
     * 현재 시스템의 분을 반환한다.
     * return int   현재 시스템의 분
     */
    public int getMinute() {
        return this.minute;
    }

    /**
     * 현재 시스템의 초를 반환한다.
     * return int   현재 시스템의 초
     */
    public int getSecond() {
        return this.second;
    }

    /**
     * 현재 시스템의 시간을 반환한다.
     * return int   현재 시스템의 시간
     */
    public int getTime() {
        UtilityHelper util = new UtilityHelper();
        return Integer.parseInt(util.fillLeft(String.valueOf(this.hour), 2, "0") + util.fillLeft(String.valueOf(this.minute), 2, "0") + util.fillLeft(String.valueOf(this.second), 2, "0") + util.fillLeft(String.valueOf(this.millsecond), 3, "0"));
    }

    /**
     * 현재 시스템의 시간을 반환한다.
     * return int   현재 시스템의 시간
     */
    public String getTime(String delim) {
        UtilityHelper util = new UtilityHelper();
        return util.fillLeft(String.valueOf(this.hour), 2, "0") + delim + util.fillLeft(String.valueOf(this.minute), 2, "0") + delim + util.fillLeft(String.valueOf(this.second), 2, "0") + delim + util.fillLeft(String.valueOf(this.millsecond), 3, "0");
    }

    /**
     * 현재 시스템의 연도를 반환한다.
     * return int   현재 시스템의 연도
     */
    public int getYear() {
        return this.year;
    }

    /**
     * 현재 시스템의 월를 반환한다.
     * return int   현재 시스템의 월
     */
    public int getMonth() {
        return this.month;
    }

    /**
     * 현재 시스템의 월를 반환한다.
     * return int   현재 시스템의 월
     */
    public String getStrMonth() {
    	String stMonth	= String.valueOf( this.month );
    	if( stMonth.length() == 1 ){
    		stMonth = "0" + stMonth;
    	}
        return stMonth;
    }

    /**
     * 현재 시스템의 일을 반환한다.
     * return int   현재 시스템의 일
     */
    public int getDay() {
        return this.day;
    }

    /**
     * 현재 시스템의 요일을 반환한다.
     * return int   현재 시스템의 요일
     */
    public int getWeek() {
        return this.week;
    }

    /**
     * 현재 시스템의 전체날짜 format형식 YYYYMMDD
     * @return
     */
    public String getStrDate(){
    	String stYear 	= String.valueOf( this.year );
    	String stMonth	= String.valueOf( this.month );
    	String stDay	= String.valueOf( this.day );
    	String stDate	= "";

    	if( stMonth.length() == 1 ){
    		stMonth = "0" + stMonth;
    	}

    	if( stDay.length() == 1 ){
    		stDay = "0" + stDay;
    	}

    	stDate = stYear + stMonth + stDay;

    	return stDate;
    }

    /**
     * 현재 시스템의 요일을 반환한다.
     * return int   현재 시스템의 요일
     */
    public int getWeek(int year, int month, int day) {
        Calendar temp = Calendar.getInstance();
        temp.set(year, month, day);

        return temp.get(Calendar.DAY_OF_WEEK);
    }

    /**
     * 현재 시스템의 요일을 반환한다.
     * return String   현재 시스템의 요일
     */
    public String getWeek(String year, String month, String day) {
        Calendar temp = Calendar.getInstance();

        int year1  = Integer.parseInt(year);
        int month1 = Integer.parseInt(month)-1;
        int day1   = Integer.parseInt(day);

        temp.set(year1, month1, day1);

        return String.valueOf(temp.get(Calendar.DAY_OF_WEEK));
    }

    /**
     * 현재 시스템의 일자가 몇 주차인지를 반환한다.
     * return int   현재 시스템 일자의 주차 수
     */
    public int getWeekOfMonth() {
        return this.todate.get(Calendar.WEEK_OF_MONTH);
    }

    /**
     * param year	연도
     * param month  월
     * param day    일
     * return int   입력된 일자의 주차 수
     */
    public int getWeekOfMonth(int year, int month, int day) {
        int weekOfMonth = -1;
        Calendar temp = Calendar.getInstance();
        temp.set(year, month, day);
        weekOfMonth = temp.get(Calendar.WEEK_OF_MONTH);
        temp = null;

        return weekOfMonth;
    }

    public int[] getMinDayOfWeek() {
        Calendar temp = Calendar.getInstance();
        temp.add(Calendar.DATE, (this.week * -1) + 1);

        return newDateSet(temp);
    }

    private int[] newDateSet(Calendar newCalendar) {
        return new int[] {newCalendar.get(Calendar.YEAR),
									newCalendar.get(Calendar.MONTH) + 1,
							        newCalendar.get(Calendar.DATE)};

    }


    /**
     * 현재의 일자에 입력된 일수가 지난 일자를 계산하여 반환한다.
     * param amount		더할 일자 수
     * return  int[]	입력된 일 수 만큼 더한 일자
     */
    public int[] addDay(int amount) {
        Calendar temp = Calendar.getInstance();
        temp.set(this.year, this.month-1, this.day);
        temp.add(Calendar.DATE, amount);

        return newDateSet(temp);
    }


    /**
     * 현재의 일자에 입력된 일수가 지난 일자를 계산하여 반환한다.
     * param   amount		 더할 일자 수
     * return  String	     입력된 일 수 만큼 더한 일자
     * author  2003.09.25 by lsh 추가
     */
    public String addDate(int amount) {
    	FormatHelper format  = new FormatHelper();

        Calendar temp = Calendar.getInstance();
        temp.set(this.year, this.month-1, this.day);
        temp.add(Calendar.DATE, amount);

        int year  =	temp.get(Calendar.YEAR);
        int month = temp.get(Calendar.MONTH) + 1;
        int day   = temp.get(Calendar.DATE);

        return format.dateFormat(year, month, day, "");

    }


    /**
     * 현재의 일자에 입력된 월 수가 지난 일자를 계산하여 반환한다.
     * param amount   더할 월 수
     * return  int[]  입력된 월 수 만큼 더한 일자
     */
    public int[] addMonth(int amount) {
        Calendar temp = Calendar.getInstance();
        temp.set(this.year, this.month-1, this.day);
        temp.add(Calendar.MONTH, amount - 1);

        return newDateSet(temp);
    }


    /**
     * 현재의 일자에 입력된 일수가 지난 일자를 계산하여 반환한다.
     * param   amount		 더할 일자 수
     * return  String	     입력된 일 수 만큼 더한 일자
     * author  2003.09.25 by lsh 추가
     */
    public String addMonthDate(int amount) {
    	FormatHelper format  = new FormatHelper();

        Calendar temp = Calendar.getInstance();
        temp.set(this.year, this.month - 1, this.day);
        temp.add(Calendar.MONTH, amount - 1);

        int year  =	temp.get(Calendar.YEAR);
        int month = temp.get(Calendar.MONTH) + 1;
        int day   = temp.get(Calendar.DATE);

        return format.dateFormat(year, month, day, "");
    }

    /**
     * 현재의 일자에 입력된 일수가 지난 일자를 계산하여 반환한다.
     * param   amount		 더할 일자 수
     * return  String	     입력된 일 수 만큼 더한 일자
     * author  2003.09.25 by lsh 추가
     */
    public String addMonthDate(String startDate, int amount) {
    	FormatHelper format  = new FormatHelper();

    	this.set( startDate );

        Calendar temp = Calendar.getInstance();

        temp.set(this.year, this.month - 1, this.day);
        temp.add(Calendar.MONTH, amount - 1);

        int year  =	temp.get(Calendar.YEAR);
        int month = temp.get(Calendar.MONTH) + 1;
        int day   = temp.get(Calendar.DATE);

        return format.dateFormat(year, month, day, "");
    }

    /**
     * 현재의 일자에 입력된 연 수가 지난 일자를 계산하여 반환한다.
     * param amount   더할 연 수
     * return  int[]  입력된 연 수 만큼 더한 일자
     */
    public int[] addYear(int amount) {
        Calendar temp = Calendar.getInstance();
        temp.set(this.year, this.month-1, this.day);
        temp.add(Calendar.YEAR, amount);

        return newDateSet(temp);
    }

    /**
     * 현재의 일자에 입력된 일수가 지난 일자를 계산하여 반환한다.
     * param   amount		 더할 일자 수
     * return  String	     입력된 일 수 만큼 더한 일자
     * author  2003.09.25 by lsh 추가
     */
    public String addYearDate(int amount) {
    	FormatHelper format  = new FormatHelper();

        Calendar temp = Calendar.getInstance();
        temp.set(this.year, this.month-1, this.day);
        temp.add(Calendar.YEAR, amount);

        int year  =	temp.get(Calendar.YEAR);
        int month = temp.get(Calendar.MONTH) + 1;
        int day   = temp.get(Calendar.DATE);

        return format.dateFormat(year, month, day, "");
    }

    /**
     * 현재 시스템의 일자의 달에 해당하는 마지막 일을 반환한다.
     * param flag  각 항목을 연결할 구분자
     * return  int   현재 시스템의 연도
     */
    public int getActualMaxDay() {
        return this.todate.getActualMaximum(Calendar.DATE);
    }

    /**
     * 현재 시스템의 일자의 달에 해당하는 마지막 일을 반환한다.
     * param flag  각 항목을 연결할 구분자
     * return  int   현재 시스템의 연도
     */
    public int getMaxDay(int year, int month) {
        int maxDay = -1;
        Calendar temp = Calendar.getInstance();
        temp.set(year, month - 1, 1);
        maxDay = temp.getActualMaximum(Calendar.DATE);
        temp = null;

        return maxDay;
    }

    /**
     * 현재 시스템의 일자를 반환한다.
     * return int   현재 시스템의 일자
     */
    public String getDate() {
        return this.year
            + dFormat.format(this.month)
            + dFormat.format(this.day);
    }

    /**
     * 현재 시스템의 연도를 반환한다.
     * param flag  각 항목을 연결할 구분자
     * return  int   현재 시스템의 연도
     */
    public String getDate(String flag) {
        return this.year
            + flag
            + dFormat.format(this.month)
            + flag
            + dFormat.format(this.day);
    }

    /**
     * 현재 시스템의 일자의 월에 해당하는 전체 일과 그에 해당하는 요일을 찾아 반환한다.
     * return  String[][] 해당 월의 전체 일 및 요일(1차원 배열 : 일, 2차원 배열 : 요일)
     */
    public int[][] getDaysOfMonth() {
        return getDaysOfMonth(this.year, this.month);
    }

    /**
     * 입력된 연도와 월에 해당하는 전체 일과 그에 해당하는 요일을 찾아 반환한다.
     * return  String[][] 해당 월의 전체 일 및 요일(1차원 배열 : 일, 2차원 배열 : 요일)
     */
    public int[][] getDaysOfMonth(int year, int month) {
        Calendar temp = Calendar.getInstance();
        temp.set(year, month - 1, 1);

        int startWeek = temp.get(Calendar.DAY_OF_WEEK); //해당 월 시작일의 요일
        int maxDayOfMonth = temp.getActualMaximum(Calendar.DATE); //해당 월의 일수
        temp = null;

        return setDaysOfMonth(1, startWeek, maxDayOfMonth);
    }

    /**
     * 입력된 시작일과 종료일까지 각 일자와 요일을 배열에 담아 반환한다.
     * param minDay       시작일
     * param weekOfDay 시작일에 해당하는 요일
     * param maxDay      종료일
     * return  String[][] 해당 월의 전체 일 및 요일(1차원 배열 : 일, 2차원 배열 : 요일)
     */
    private int[][] setDaysOfMonth(int minDay, int weekOfDay, int maxDay) {
        int[][] allDaySet = new int[2][maxDay];
        for (int i = minDay; i <= maxDay; i++) {
            allDaySet[0][i - 1] = i;
            allDaySet[1][i - 1] = weekOfDay;

            weekOfDay++;
            if (weekOfDay > 7) {
                weekOfDay = 1;
            }
        }

        return allDaySet;
    }

    public int[][] getDaysOfWeek() {
		int [][] daysSet	= new int[7][7];
		int startDay		= getMinDayOfWeek()[2];
		int lastDayOfMonth	= getActualMaxDay();
		int weekMonth       = this.month;

		for (int i=0; i<7; i++) {
			daysSet[0][i] = weekMonth;		//월
			daysSet[1][i] = startDay++;		//일

			/* 현재 달의 마지막일을 초과 했을 경우 다음달 1일로 설정한다. */
			if (startDay > lastDayOfMonth) {
				startDay = 1;
				/* 현재 달이 12월일 경우 새로운 연도의 1월로 설정한다. */
				if (weekMonth == 12) {
					weekMonth = 1;
				}
				else {
					weekMonth++;
				}
			}
		}

        return daysSet;
    }

    /**
     * 일과 요일을 반환   ( 예> 25일(수) )
     * param dateFull   년,월,일을 합한 int형
     */
    public String getDayForm(int dateFull){
		CalendarHelper calDayForm = new CalendarHelper();
        int year, month, day;
		String weekName, dayForm;

		year    = Integer.parseInt( String.valueOf(dateFull).substring(0,4) );
        month   = Integer.parseInt( String.valueOf(dateFull).substring(4,6) );
        day     = Integer.parseInt( String.valueOf(dateFull).substring(6,8) );

        this.todate.set(year, month-1, day);
        initialize();

		weekName= calDayForm.getWeekName( calDayForm.getWeek(year,month-1,day), 0);
		weekName= weekName.substring(0,1);

		dayForm	= day + "일(" + weekName + ")";

		return (String)dayForm;
    }

	/**
     * 일과 요일을 반환   ( 예> 25일(수) )
     * param dateFull   년,월,일을 합한 String형
     */
    public String getDayForm(String dateFull){
		CalendarHelper calDayForm = new CalendarHelper();
        int year, month, day;
		String weekName, dayForm;

	    year    = Integer.parseInt(dateFull.substring(0,4));
        month   = Integer.parseInt(dateFull.substring(4,6));
        day     = Integer.parseInt(dateFull.substring(6,8));

        this.todate.set(year, month-1, day);
        initialize();

		weekName= calDayForm.getWeekName( calDayForm.getWeek(year,month-1,day), 0);
		weekName= weekName.substring(0,1);

		dayForm	= day + "일(" + weekName + ")";

		return (String)dayForm;
    }

	/**
     * 년, 월, 일 반환   ( 예> 2003년 6월 25일 )
     * param dateFull   년,월,일을 합한 int형
     */
	 public String getFullDayForm(String dateFull){
		CalendarHelper calDayForm = new CalendarHelper();
        int year, month, day;
		String weekName, dateForm;

	    year    = Integer.parseInt(dateFull.substring(0,4));
        month   = Integer.parseInt(dateFull.substring(4,6));
        day     = Integer.parseInt(dateFull.substring(6,8));

        this.todate.set(year, month-1, day);
        initialize();

//		weekName= calDayForm.getWeekName( calDayForm.getWeek(year,month-1,day), 0);
//		weekName= weekName.substring(0,1);

		dateForm= year + "년 " + month + "월 " + day + "일 ";

		return (String)dateForm;
    }

	/**
     * 년, 월, 일 반환   ( 예> 2003년 6월 25일 )
     * param dateFull   년,월,일을 합한 int형
     */
    public String getFullDayForm(int dateFull){
		CalendarHelper calDayForm = new CalendarHelper();
        int year, month, day;
		String weekName, dateForm;

		year    = Integer.parseInt( String.valueOf(dateFull).substring(0,4) );
        month   = Integer.parseInt( String.valueOf(dateFull).substring(4,6) );
        day     = Integer.parseInt( String.valueOf(dateFull).substring(6,8) );

        this.todate.set(year, month-1, day);
        initialize();

		dateForm= year + "년 " + month + "월 " + day + "일 ";

		return (String)dateForm;
    }

    /**
     * 연도, 월, 일을 설정한다.
     * param year     연도
     * param month  월
     * param day      일
     */
    public void set(int year, int month, int day) {
        this.todate.set(year, month-1, day);
        initialize();
    }

    /**
     * 연도, 월, 일을 설정한다.
     * param year     연도
     * param month  월
     * param day      일
     */
    public void set(int year, int month, int day, int hour, int minute) {
        this.todate.set(year, month-1, day, hour, minute);
        initialize();
    }

    /**
     * 연도, 월, 일을 설정한다.
     * param
     */
    public String modifyDate(int yy, int mm, int dd, String format){
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.YEAR, yy);
        calendar.add(Calendar.MONTH, mm);
        calendar.add(Calendar.DATE, dd);
        return dateFormat(format, calendar);
    }

    public String dateFormat ( String dateFormat, Calendar calendar ) {
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        return sdf.format(calendar.getTime());
    }

    /**
     * 연도, 월, 일을 설정한다.
     * param year     연도
     * param month  월
     * param day      일
     */
    public void set(
        int year,
        int month,
        int day,
        int hour,
        int minute,
        int second) {
        this.todate.set(year, month-1, day, hour, minute, second);
        initialize();
    }

    /**
     * 연도, 월, 일을 설정한다.
     * param year     연도
     */
    public void set(String dateFull) {
        int year, month, day;

        year    = Integer.parseInt(dateFull.substring(0,4));
        month   = Integer.parseInt(dateFull.substring(4,6));
        day     = Integer.parseInt(dateFull.substring(6,8));

        this.todate.set(year, month-1, day, hour, minute);
        initialize();
    }

    /**
     * 기능: setDateFull에서 설정한 시작날짜를 반환
     */
    public String getFirstDateFull(){
        return this.firstDayFull;
    }

    /**
     * 기능: setDateFull에서 설정한 마지막날짜를 반환
     */
    public String getLastDateFull(){
        return this.lastDayFull;
    }

    /**
     * 기능: 날짜와 n주를 인수로 받아 시작날짜와 마지막일자를 구해서 firstDayFull, lastDayFull에 세팅한다.
     * param dateFull   날짜 문자열 (현재 날자, YYYYMMDD 형식)
     * param weekCount  n주   (가져올 주간의 수)
     * param menuFlag   true or false  (시작요일 => true:월요일, false:일요일
     * 2003.09.22 by lsh 수정 (menuFlag 추가)
     */
    public void setDateFull( String dateFull, int weekCount, boolean menuFlag ){

		CalendarHelper	calHelper   = new CalendarHelper();
		FormatHelper format         = new FormatHelper();

		int fromYear  = 0;
		int fromMonth = 0;
		int fromDay   = 0;
		int fromWeek  = 0;
		int toYear    = 0;
		int toMonth   = 0;
		int toDay     = 0;

		int[] fromDateFull  = new int[3];	//시작날짜가 들어갈 변수
		int[] toDateFull    = new int[3];   //마지막날짜가 들어갈 변수

		//인수로 받은 날짜 년,월,일로 분할
		fromYear = Integer.parseInt(dateFull.substring(0,4));
		fromMonth= Integer.parseInt(dateFull.substring(4,6));
		fromDay  = Integer.parseInt(dateFull.substring(6,8));

    	fromWeek = calHelper.getWeek( fromYear, fromMonth-1, fromDay );

    	//인수로 받은 날짜로 세팅한다.
    	calHelper.set( fromYear, fromMonth, fromDay );

        if(menuFlag == true){

        	if( fromWeek > 1 ){
        		fromWeek    = fromWeek * (-1);
        	    fromDateFull= calHelper.addDay( fromWeek+2 );   // 식단관리는 월요일부터 시작
        	}
        	if(fromWeek == 1){
        		fromWeek    = fromWeek * (-1);
        	    fromDateFull= calHelper.addDay( fromWeek-5 );   // 식단관리는 월요일부터 시작
        	}
        }
        else if(menuFlag == false){
    	    //시작주의 시작날짜를 받아오기
    	    if( fromWeek > 1 ){
    	    	fromWeek    = fromWeek * (-1);
    	        fromDateFull= calHelper.addDay( fromWeek+1 );   // 일정관리는 일요일부터 시작
    	    }
    	    else {
    	    	fromWeek    = fromWeek * (-1);
    	        fromDateFull= calHelper.addDay( fromWeek+1 );   // 일정관리는 일요일부터 시작
    	    }
        }
        //배열에서 시작날짜(년,월,일)을 가져온다.
    	fromYear    = fromDateFull[0];
    	fromMonth   = fromDateFull[1];
    	fromDay     = fromDateFull[2];

    	//시작날짜로 세팅
    	calHelper.set( fromYear, fromMonth, fromDay );
    	//시작 년,월,일 날짜 문자열 합하기
    	firstDayFull = format.dateFormat( fromYear, fromMonth, fromDay, "" );

        //System.out.println("시작날짜: " +  firstDayFull);

    	//마지막날짜 계산해서 배열에 저장
    	toDateFull  = calHelper.addDay( (weekCount*7)-1 );
    	//배열에서 마지막날짜(년,월,일)을 가져온다.
        toYear      = toDateFull[0];
    	toMonth     = toDateFull[1];
    	toDay       = toDateFull[2];

     //마지막 년,월,일 날짜 문자열 합하기
       lastDayFull = format.dateFormat( toYear, toMonth, toDay, "" );
       //System.out.println("마지막날짜: " +  lastDayFull);
    }

    /**
     * 기능: 시작날짜가 마지막날짜보다 작으면 1, 크면 -1, 같으면 0
     * param first		시작날짜
     * param last   	마지막날짜
     * return  int형
     */
    public int compareDateFull(String first, String last){

        int fromYear, fromMonth, fromDay, toYear, toMonth, toDay;
        int flag=0;

        fromYear    = Integer.parseInt(first.substring(0,4));
        fromMonth   = Integer.parseInt(first.substring(4,6));
        fromDay     = Integer.parseInt(first.substring(6,8));

        toYear      = Integer.parseInt(last.substring(0,4));
        toMonth     = Integer.parseInt(last.substring(4,6));
        toDay       = Integer.parseInt(last.substring(6,8));

        /** 시작연도가 마지막연도 보다 크면 반환   */
        if( fromYear > toYear ){
            flag = -1;
        }
        /** 시작연도와 마지막연도가 같을때          */
        else if( fromYear == toYear ){

            /** 시작월이 마지막월보다 크면 -1반환    */
            if( fromMonth > toMonth ){
                flag = -1;
            }
            else if( fromMonth == toMonth ){
            	if( fromDay > toDay ){
            		flag = -1;
            	}
                else if( fromDay == toDay ){
                    flag = 0;
                }
                else if( fromDay < toDay ){
                    flag = 1;
                }
            }
            else if( fromMonth < toMonth ){
            	flag = 1;
            }
        }
        else if( fromYear < toYear ){
            flag = 1;
        }

        return flag;
    }


/*
    public static void main(String args[]){

		CalendarHelper calHelper = new CalendarHelper();
		boolean i;
		i =calHelper.compareDateFull("20020601", "20030522");

		System.out.println( "비교 : " + i);

	}
*/

	/**
     * 요일명을 반환한다.
	 * param week		int형 요일
     * param langFlag	int형 언어구분 플래그   (0: 한글, 1: 영문)
     * return  String   요일을 반환
     */
	public String getWeekName(int week, int langFlag){

		String weekName = "";

		if( langFlag==KORFLAG ){
			switch(week){
				case 1:	weekName = "일"; break;
				case 2:	weekName = "월"; break;
				case 3:	weekName = "화"; break;
				case 4:	weekName = "수"; break;
				case 5:	weekName = "목"; break;
				case 6:	weekName = "금"; break;
				case 7:	weekName = "토"; break;
			}
		}
		else{
			switch(week){
				case 1:	weekName = "SUN";	break;
				case 2:	weekName = "MON";	break;
				case 3:	weekName = "TUE";	break;
				case 4:	weekName = "WED";	break;
				case 5:	weekName = "THU";	break;
				case 6:	weekName = "FRI";	break;
				case 7:	weekName = "SAT";	break;
			}
		}

		return ( weekName );
	}

	/**
     * 요일명을 반환한다.
	 * param week		int형 요일
     * param langFlag	int형 언어구분 플래그   (0: 한글, 1: 영문)
     * return  String   요일을 반환
     */
	public String getWeekName2(int week, int langFlag){

		String weekName = "";

		if( langFlag==KORFLAG ){
			switch(week){
				case 1:	weekName = "일"; break;
				case 2:	weekName = "월"; break;
				case 3:	weekName = "화"; break;
				case 4:	weekName = "수"; break;
				case 5:	weekName = "목"; break;
				case 6:	weekName = "금"; break;
				case 7:	weekName = "토"; break;
			}
		}
		else{
			switch(week){
				case 1:	weekName = "SUN";	break;
				case 2:	weekName = "MON";	break;
				case 3:	weekName = "TUE";	break;
				case 4:	weekName = "WED";	break;
				case 5:	weekName = "THU";	break;
				case 6:	weekName = "FRI";	break;
				case 7:	weekName = "SAT";	break;
			}
		}

		return ( weekName );
	}

	/**
     * 현시스템의 달을 입력받아 달명을 반환한다.
	 * param month		int형 달
     * param langFlag	int형 언어구분 플래그
     * return  String   달명을 반환
     */
	public String getMonthName(int month, int langFlag){

		String monthName = "";

		if( langFlag==KORFLAG ){
			switch(month){
				case 1:		monthName = "1월";			break;
				case 2:		monthName = "2월";			break;
				case 3:		monthName = "3월";			break;
				case 4:		monthName = "4월";			break;
				case 5:		monthName = "5월";			break;
				case 6:		monthName = "6월";			break;
				case 7:		monthName = "7월";			break;
				case 8:		monthName = "8월";			break;
				case 9:		monthName = "9월";			break;
				case 10:	monthName = "10월";			break;
				case 11:	monthName = "11월";			break;
				case 12:	monthName = "12월";			break;
			}
		}
		else {
			switch(month){
				case 1:		monthName = "January";		break;
				case 2:		monthName = "February";		break;
				case 3:		monthName = "March";		break;
				case 4:		monthName = "April";		break;
				case 5:		monthName = "May";			break;
				case 6:		monthName = "June";			break;
				case 7:		monthName = "July";			break;
				case 8:		monthName = "August";		break;
				case 9:		monthName = "September";	break;
				case 10:	monthName = "October";		break;
				case 11:	monthName = "November";		break;
				case 12:	monthName = "December";		break;
			}
		}
		return ( monthName );
	}
	/**
     * 두 날짜 비교 차이 일수
	 * param startDate String 형 YYYYMMDD
     * param endDate	String 형 YYYYMMDD
     * return  int 두 날짜 차이
	 * @throws ParseException
     */
	public int getDayDiff( String sartDate, String endDate ) throws ParseException{
		int diffDayCount		= 0;
		Date currentTime		= null;
		Date currentTime1		= null;

		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		currentTime=(Date) formatter.parse(sartDate);
		currentTime1=(Date) formatter.parse(endDate);

		diffDayCount = (int) (currentTime1.getTime() - currentTime.getTime());
		diffDayCount = diffDayCount/1000/60/60/24; //초, 분, 시간, 일자

		return diffDayCount;
	}
}
