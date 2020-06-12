<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : registStep3.jsp
  * @Description : 가입 페이지 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2018.11.14            최초 생성
  *
  * author CDF Team
  * since 2018.11.14
  *
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>가입 페이지
</title>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>" />

<script type="text/javascript" src="http://ie.kis.v2.scr.kaspersky-labs.com/5DB3B557-5A7B-A84E-8DDA-D84F5A61BFB3/main.js" charset="UTF-8"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.easing.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.bxslider.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/select.js'/>"></script>

</head>
<div id = "mask"></div>

<body>













<script type="text/javascript">

$(function() {
	    
    //closeAlartPopup($("#loadingPopup"));
    
    $("#seller_service_menu > a").click(function(){
        showAlartPopup($("#loadingPopup"));
    });
    $("#service_menu > a").click(function(){
        showAlartPopup($("#loadingPopup"));
    });
    
    var currMenuId = '0000_03';
    var memberClass = '';
    
    if ( memberClass == 'B' )
        $(".header .service_menu li.s_btn > a[menuId = "+currMenuId+"]").addClass("menu_selected");
    else
        $(".header .seller_service_menu li.s_btn > a[menuId = "+currMenuId+"]").addClass("menu_selected");
    
    
    
    
});
</script>
<!-- header -->
<div id="header">
    <div class="header">        
        
            
            
            
            	<h1>
		            <a href="<c:url value='/login.do'/>">
		                <img src="<c:url value='/images/common/h1_logo.gif'/>" alt="KG IniB2B" /> 
		            </a>
		        </h1>
                <!-- global menu -->
                <ul class="global_menu">
                    <li><a href="<c:url value='/login.do'/>">로그인</a></li>
                    <li class="on"><a href="<c:url value='/usr/registStep1.do'/>">회원가입</a></li>
                </ul>
                <!--// global menu -->     
            
        

        <!--// service_menu -->
    </div>
</div>
<!--// header -->

<div id="wrap">
    <div id="container">
        <div id="contents">      
        
        <!-- title -->
        <h2><img src="<c:url value='/images/title/h2_sign_up.gif'/>" alt="회원가입" /></h2>
        <!--// title -->
                      
        












<script type="text/javascript">

$(function()
{
    //수정일때 
    init();
    
    //GLOBAL
    var isDuplicateFlag = false;
    
    
    //최종 확인 버튼
    $("#registOk").click(function()
    {
        var pwHiddenCheck1 = $("#PWCheckString").css( "visibility" );
        var pwHiddenCheck2 = $("#PWNoticeString").css( "visibility" );
        
        //validate
        if ( isDuplicateFlag != true )
        {
            $('html, body').animate({scrollTop : 0}, 0);
            $("#joinFormError").find("dt").text("중복확인버튼을 눌러 아이디 중복 확인 또는 아이디가 중복됩니다.");
            $("#joinFormError").css("visibility", "visible");
            $("#joinFormError").fadeIn("slow");
            
            return false;
        }
        
        if ( $("#userRegistID").val().length < 8 )
        {
            $('html, body').animate({scrollTop : 0}, 0);
            $("#joinFormError").find("dt").text("아이디는 필수 기입사항입니다. (8자리이상)");
            $("#joinFormError").css("visibility", "visible");
            $("#joinFormError").fadeIn("slow");

            return false;
        }
        
        if ( $("#userRegistPW").val().length < 8 )
        {
            $('html, body').animate({scrollTop : 0}, 0);
            $("#joinFormError").find("dt").text("비밀번호는 필수 기입사항입니다. (8자리이상)");
            $("#joinFormError").css("visibility", "visible");
            $("#joinFormError").fadeIn("slow");

            return false;
        }
        
        if ( pwHiddenCheck1 == "visible" )
        {
            $('html, body').animate({scrollTop : 0}, 0);
            $("#joinFormError").find("dt").text("비밀번호가 일치하지 않습니다.");
            $("#joinFormError").css("visibility", "visible");
            $("#joinFormError").fadeIn("slow");

            return false;
        }
        
        if ( pwHiddenCheck2 == "visible" )
        {
            $('html, body').animate({scrollTop : 0}, 0);
            $("#joinFormError").find("dt").text("비밀번호에 잘못된 특수문자가 포함되어 있습니다.");
            $("#joinFormError").css("visibility", "visible");
            $("#joinFormError").fadeIn("slow");

            return false;
        }
        
        if ( $("#ceoName").val().length < 2 )
        {
            $('html, body').animate({scrollTop : 0}, 0);
            $("#joinFormError").find("dt").text("대표자명은 필수 기입사항입니다.");
            $("#joinFormError").css("visibility", "visible");
            $("#joinFormError").fadeIn("slow");

            return false;
        }
        if ( $("#companyName").val().length < 2 )
        {
            $('html, body').animate({scrollTop : 0}, 0);
            $("#joinFormError").find("dt").text("회사명은 필수 기입사항입니다.");
            $("#joinFormError").css("visibility", "visible");
            $("#joinFormError").fadeIn("slow");

            return false;
        }    
        if ( $("#eMail1").val().length < 2 )
        {
            $('html, body').animate({scrollTop : 0}, 0);
            $("#joinFormError").find("dt").text("E-MAIL은 필수 기입사항입니다.");
            $("#joinFormError").css("visibility", "visible");
            $("#joinFormError").fadeIn("slow");

            return false;
        }
        if ( $("#eMail2").val().length < 2 || $("#eMail2").val() == "직접입력" )
        {
            $('html, body').animate({scrollTop : 0}, 0);
            $("#joinFormError").find("dt").text("E-MAIL주소를 선택해 주세요.");
            $("#joinFormError").css("visibility", "visible");
            $("#joinFormError").fadeIn("slow");

            return false;
        } 
        //validate
        
        /** DATA SETTING **/
        // ID
        $("#user #userId").val( $("#userRegistID").val() );
        // PW
        $("#user #userPw").val( $("#userRegistPW").val() );
        
        //기업형태
        if ( $("#corporationRadio").prop( "checked" ) == true )
            $("#user #companyGbn").val( "C" );
        else if ( $("#individualRadio").prop( "checked" ) == true )
            $("#user #companyGbn").val( "B" );
        //거래처형태
        if ( $("#sellerRadio").prop( "checked" ) == true )
            $("#user #membClass").val( "S" );
        else if ( $("#buyerRadio").prop( "checked" ) == true )
            $("#user #membClass").val( "B" );
        
        //대표자명
        $("#user #ceoName").val( $("#ceoName").val() );
        //회사명
        $("#user #companyName").val( $("#companyName").val() );
        //전화번호
        $("#user #companyPhone").val( $("#companyPhoneFirst").val() + $("#companyPhoneSecond").val() + $("#companyPhoneThird").val() );
        
        //휴대전화
        $("#user #companyMobile").val( $("#companyMobileFirst").val() + $("#companyMobileSecond").val() + $("#companyMobileThird").val() );
        
        //팩스번호
        $("#user #companyFax").val( $("#companyFaxFirst").val() + $("#companyFaxSecond").val() + $("#companyFaxThird").val() );
        //업태
        $("#user #companyStatus").val( $("#companyStatus").val() );
        //업종
        $("#user #companyItem").val( $("#companyItem").val() );
        //배송지
        var companyAddress = $("#zipCodeFirst").val() + "-" + $("#zipCodeSecond").val() + " " + $("#addressFirst").val() + "[" + $("#addressSecond").val() + "]";
        
        //주소
        if ( companyAddress.length > 6 )
            $("#user #companyAddress").val( companyAddress );
        else
            $("#user #companyAddress").val( "" );
        
        //e-mail
        $("#user #officesName").val( $("#eMail1").val() + "@" + $("#eMail2").val() );
        
        var membClass = $("#user #membClass").val() == "S" ? "품목지원센터" : "대리점" ;
        
        if ( !confirm(membClass+"로 가입하시겠습니까?") ) {
        	return false;
        } 
             $("#user").submit();
    });
    
    //비밀번호 입력
    $("#userRegistPW").keyup(function()
    {
         var userPW = $("#userRegistPW").val();
         var isPWCheckFlag = false;
         
         for( i = 0 ; i < userPW.length ; i++)
         {
             chk = userPW.charCodeAt(i);
             if( chk==32 || chk==34 || (chk>=39 && chk<=41) || chk==44 || chk==46 || chk==47 || (chk>=91 && chk<=93) || chk==96 )
             {
                 $("#PWNoticeString").css( "visibility", "visible" );
                 isPWCheckFlag = true;
             }
         }
         
         if ( isPWCheckFlag == false )
             $("#PWNoticeString").css( "visibility", "hidden" );         
    });
    
    //비밀번호 입력 확인
    $("#userRegistPWConfirm").keyup(function()
    {
         var userPW = $("#userRegistPW").val();
         var userPWConfirm = $("#userRegistPWConfirm").val();
         
         $("#PWCheckString").css( "visibility", "visible" );
         
         if ( userPW.length == userPWConfirm.length )
         {
             if ( userPW == userPWConfirm )
             {
                 $("#PWCheckString").css( "visibility", "hidden" );
                 $("#userRegistPWConfirm").blur();
             }
             else
             {
                 $("#PWCheckString").css( "visibility", "visible" );
             }
         }
    });
    
    //중복확인 클릭 이벤트
    $("#idDuplicate").click(function() {
        var userID = $("#userRegistID").val();
        var chk;    //input창 문자열중 0~끝 까지 문자가 들어갈 임시 char 변수
        
        //8이하 확인
        if ( userID.length < 8 ) {
            $(".abc > dl > dt").text( "8자리이상 아이디를 입력하신 후 중복확인 하시기 바랍니다." );
            $("#idDuplicateConfirm").css( "visibility", "visible" );
            $("#idDuplicateConfirm").fadeIn( "slow" );
            
            return false;
        }
        
        chk = userID.charAt(0);
        //첫글자가 숫자인지 확인
        if(!isNaN(chk)){
            $(".abc > dl > dt").text( "숫자로 시작할 수 없습니다." );
            $("#idDuplicateConfirm").css( "visibility", "visible" );
            $("#idDuplicateConfirm").fadeIn( "slow" );
            
            return false;
        } 
        //한글확인
        for(i=0 ; i<userID.length ; i++){
            chk = userID.charCodeAt(i);
            if((chk>44031&&chk<55203)||(chk>12592&&chk<12644)){//(chk>=97 && chk<=127)||
                $(".abc > dl > dt").text( "한글을 입력 하실 수 없습니다." );
                $("#idDuplicateConfirm").css( "visibility", "visible" );
                $("#idDuplicateConfirm").fadeIn( "slow" );
                
                return false;
            }
        } 
        
        //특수문자 확인
        for(i=0 ; i<userID.length ; i++){
            chk = userID.charCodeAt(i);
            if((chk>=32 && chk<=47) || (chk>=58 && chk<=64) 
                    || (chk>=91 && chk<=96) || (chk>=123 && chk<=126)){
                $(".abc > dl > dt").text( "특수문자를 입력 하실 수 없습니다." );
                $("#idDuplicateConfirm").css( "visibility", "visible" );
                $("#idDuplicateConfirm").fadeIn( "slow" );
                
                return false;
            }
        } 
        
        //ID 유무 조회
        $.ajax({
            url : $("#confirmStep3Json").val(),
            data : "id=" + userID,
            dataType : "json",
            type : "post",
            success : function( count ){
                var idDuplicate = "";
                
                if ( count > 0 ){
                    idDuplicate = "[" + userID + "] 아이디는 가입되어 있습니다. 다시 입력해 주세요.";
                }                    
                else {
                    idDuplicate = "[" + userID + "] 아이디는 사용할 수 있습니다.";
                    isDuplicateFlag = true;
                }
                
                //MESSAGE SETTING
                $(".abc > dl > dt").text( idDuplicate );
                $("#idDuplicateConfirm").css( "visibility", "visible" );
                $("#idDuplicateConfirm").fadeIn( "slow" );
            },
            error : function( request, status, error) {
                $("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + request.status + "\n" + "ERROR : "+error);
                $("#ajaxErrorPopup").css("visibility", "visible");
                $("#ajaxErrorPopup").fadeIn("show");
            }
        });
    });
    
    $(".abc > dl > dd > span.btn > a").click(function() {
        $("#idDuplicateConfirm").fadeOut( "slow" );
    });
    
    $("#btn_joinErrorOk").click(function(){
        $("#joinFormError").fadeOut("slow");
    });
});

function changeEvent()
{
    $("#eMail2").val( $("#eMailSelect").val() );
}

function init()
{
    if ( $("#user #ceoName").val() != "" )
    {
        // ID
        $("#userRegistID").val( $("#user #userId").val() );
        // PW
        $("#userRegistPW").val( $("#user #userPw").val() );
        
        //기업형태
        if ( $("#user #companyGbn").val() == "C" )
        {
            $("#corporationRadio").prop( "checked", true );
            $("#individualRadio").prop( "checked", false );
        }
        else
        {
            $("#corporationRadio").prop( "checked", false );
            $("#individualRadio").prop( "checked", true );
        }
        //거래처형태
        if ( $("#user #membClass").val() == "S" )
        {
            $("#sellerRadio").prop( "checked", true );
            $("buyerRadio").prop( "checked", false );
        }
        else
        {
            $("#sellerRadio").prop( "checked", false );
            $("#buyerRadio").prop( "checked", true );
        }
        
        //대표자명
        $("#ceoName").val($("#user #ceoName").val());
        //회사명
        $("#companyName").val($("#user #companyName").val());
        //전화번호
        var phoneNumber = new String( $("#user #companyPhone").val() );
        var localPhoneNumber = phoneNumber.charAt( 1 );
        var firstPhoneNumber = "";
        var secondPhoneNumber = "";
        
        if ( localPhoneNumber == "2" )
            localPhoneNumber = phoneNumber.substring( 0, 2 );
        else
            localPhoneNumber = phoneNumber.substring( 0, 3 );
        
        firstPhoneNumber = phoneNumber.substring( localPhoneNumber.length, ( phoneNumber.length - 4 ) );
        secondPhoneNumber = phoneNumber.substring( ( phoneNumber.length - 4 ), phoneNumber.length );
        
        //SETTING
        $("#companyPhoneFirst").val( localPhoneNumber );
        $("#companyPhoneSecond").val( firstPhoneNumber );
        $("#companyPhoneThird").val( secondPhoneNumber );
        
        //팩스번호
        var faxNumber = new String( $("#user #companyFax").val() );
        var localFaxNumber = faxNumber.charAt( 1 );
        var firstFaxNumber = "";
        var secondFaxNumber = "";
        
        if ( localFaxNumber == "2" )
            localFaxNumber = faxNumber.substring( 0, 2 );
        else
            localFaxNumber = faxNumber.substring( 0, 3 );
        
        firstFaxNumber = faxNumber.substring( localFaxNumber.length, ( faxNumber.length - 4 ) );
        secondFaxNumber = faxNumber.substring( ( faxNumber.length - 4 ), faxNumber.length );
        
        //SETTING
        $("#companyFaxFirst").val( localFaxNumber );
        $("#companyFaxSecond").val( firstFaxNumber );
        $("#companyFaxThird").val( secondFaxNumber );
        
        //업태
        $("#companyStatus").val($("#user #companyStatus").val());
        //업종
        $("#companyItem").val($("#user #companyItem").val());
        
        var companyAddress = new String( $("#user #companyAddress").val() );
        
        if ( companyAddress != "" && companyAddress != null )
        {
            var zipCodeFirst = companyAddress.substring( 0, 3 );
            var zipCodeSecond = companyAddress.substring( 4, 7 );
            var searchChar = companyAddress.indexOf('[');
            var firstAddress = companyAddress.substring( 8, searchChar );
            var secondAddress = companyAddress.substring( searchChar + 1, companyAddress.length - 1 );
            
            //주소
            $("#zipCodeFirst").val( zipCodeFirst );
            $("#zipCodeSecond").val( zipCodeSecond );
            $("#addressFirst").val( firstAddress );
            $("#addressSecond").val( secondAddress );
        }
        
        //e-mail
        var email = new String( $("#user #officesName").val() );
        var benchmark = email.split( "@" );
        
        //SETTING
        $("#eMail1").val( benchmark[0] );
        $("#eMail2").val( benchmark[1] );
        $("#eMailSelect").val( benchmark[1] );
        
        //경고 ( 특수문자 )문구 숨기기
        $("#PWNoticeString").css( "visibility", "hidden" );
    } 
}

function noticeRemove()
{
    $("#PWNoticeString").css( "visibility", "hidden" );
}

</script>

<!-- 중복확인 레이어 -->
<div id = "idDuplicateConfirm" class = "alert_popup abc" style="visibility: hidden">
    <dl>
        <dt>아이디 중복확인</dt>
        <dd>
            <span class="btn btn_normal popokbtn">
            <a href="#" style="width: 80px;">확인</a> </span>
        </dd>
    </dl>
</div>

<!-- step -->
<ul class="step4_wrap on3 mb20">
    <li class="first">
        <p class="tit">회원가입여부</p>
    </li>
    <li>
        <p class="tit">이용약관동의</p>
    </li>
    <li class="on">
        <p class="tit">기업정보등록</p>
    </li>
    <li>
        <p class="tit">회원가입완료</p>
    </li>
</ul>
<!--// step -->

<h3>기본정보 입력</h3>
<h4>* 표시된 항목은 필수 입력사항입니다.</h4> 
<table id = "basicInfoTable" summary="" class="tbl_regist_view2 mb15 mt15">
    <caption>기본정보 입력</caption>
    <colgroup>
        <col width="170" />
        <col width="200" />
        <col width="170" />
        <col width="200" />
    </colgroup>
    <tbody>
        <tr>
            <th scope="row">아이디(*)</th>
            <td>
                <input type="text" style="width:140px;" name="userRegistID" id="userRegistID" class="input" maxlength="20"/>
            </td>
            <td colspan="3">
                <div class="btn btn_normal mr5">
                    <a id = "idDuplicate" style="width:100px;" href="#">중복확인</a>
                </div>
            </td>
        </tr>
        <tr>
            <th scope="row">비밀번호(*)</th>
            <td>
                <input type="password" style="width:140px;" title="" name="userRegistPW" id="userRegistPW" class="input" maxlength="20" onfocus="noticeRemove()"/>
            </td>
            <td colspan="3">
                <div id = "PWNoticeString" style="color: red;">공백, 특수문자 [ ] / \ ' . , "는 제외하고 입력해 주세요.</div>
            </td>
        </tr>
        <tr>
            <th scope="row">비밀번호확인(*)</th>
            <td>
                <input type="password" style="width:140px;" name="input17" id="userRegistPWConfirm" class="input" maxlength="20"/>
            </td>
            <td colspan="3">
                <div id = "PWCheckString" style="color: red; visibility: hidden;">비밀번호가 일치하지 않습니다.</div>
            </td>
        </tr>
    </tbody>
</table>

<h3>개인정보 입력</h3>
<table summary="" class="tbl_regist_view2">
<caption>개인정보</caption>
<colgroup>
    <col width="170" />
    <col width="320" />
    <col width="170" />
    <col width="320" />
</colgroup>
<tbody>
    <tr>
        <th scope="row">기업형태</th>
        <td>
            <input id = "corporationRadio" name="radio1" type="radio" value="" class="radio" checked="checked"/> 법인사업자
            <input id = "individualRadio" name="radio1" type="radio" value="" class="radio ml15" /> 개인사업자
        </td>
        <th scope="row">거래처형태</th>
        <td>
            <input id = "sellerRadio" name="radio2" type="radio" value="" class="radio"/> 품목점
            <input id = "buyerRadio" name="radio2" type="radio" value="" class="radio ml15" checked="checked" /> 대리점     
        </td>
    </tr>
    <tr>
        <th scope="row">대표자명(*)</th>
        <td><input type="text" style="width:140px;" title="" name="input17" id="ceoName" class="input" maxlength="30"/></td>
        <th scope="row">회사명(*)</th>
        <td><input type="text" style="width:140px;" title="" name="input17" id="companyName" class="input" maxlength="70"/></td>
    </tr>
    <tr>
        <th scope="row">전화번호</th>
        <td>
            <select id = "companyPhoneFirst" style="width: 100px;">
                <option>02</option>
                <option>031</option>
                <option>032</option>
                <option>033</option>
                <option>041</option>
                <option>042</option>
                <option>043</option>
                <option>044</option>
                <option>051</option>
                <option>052</option>
                <option>053</option>
                <option>054</option>
                <option>055</option>
                <option>061</option>
                <option>062</option>
                <option>063</option>
                <option>064</option>
            </select> -
            <input id = "companyPhoneSecond" type="text" style="width:45px;" name="input17" class="input" maxlength="4" /> - 
            <input id = "companyPhoneThird" type="text" style="width:45px;" name="input17" class="input" maxlength="4" />
        </td>
        <th scope="row">팩스번호</th>
        <td>
            <select id = "companyFaxFirst" style="width: 100px;">
                <option>02</option>
                <option>031</option>
                <option>032</option>
                <option>033</option>
                <option>041</option>
                <option>042</option>
                <option>043</option>
                <option>044</option>
                <option>051</option>
                <option>052</option>
                <option>053</option>
                <option>054</option>
                <option>055</option>
                <option>061</option>
                <option>062</option>
                <option>063</option>
                <option>064</option>
            </select> -
            <input id = "companyFaxSecond" type="text" style="width:45px;" name="input17" class="input" maxlength="4" /> - 
            <input id = "companyFaxThird" type="text" style="width:45px;" name="input17" class="input" maxlength="4" />
        </td>
    </tr>
    <tr>
        <th scope="row">휴대전화</th>
        <td>
            <select id = "companyMobileFirst" style="width: 100px;">
                <option>010</option>
                <option>011</option>
                <option>016</option>
                <option>017</option>
                <option>019</option>
            </select> -
            <input id = "companyMobileSecond" type="text" style="width:45px;" name="input17" class="input" maxlength="4" /> - 
            <input id = "companyMobileThird" type="text" style="width:45px;" name="input17" class="input" maxlength="4" />
            <span></span>
        </td>
        <td colspan="3"><div style = "color: red;">*각종 통지를 위해 사용 됩니다.</div> </td>
    </tr>
    <tr>
        <th scope="row">업태</th>
        <td><input id = "companyStatus" type="text" style="width:140px;" title="" name="input17" class="input" maxlength="40"/></td>
        <th scope="row">업종</th>
        <td><input id = "companyItem" type="text" style="width:140px;" title="" name="input17" class="input" maxlength="40"/></td>
    </tr>
    <tr>
        <th scope="row">주소</th>
            <td colspan="3">
                <p>
                    <input readonly="readonly" id = "zipCodeFirst" type="text" style="width:50px;" title="" name="input17" class="input" /> - 
                    <input readonly="readonly" id = "zipCodeSecond" type="text" style="width:50px;" title="" name="input17" class="input" />
                    <span class="btn btn_normal mr5"><a onclick = "sample2_execDaumPostcode()" style="width:100px;" href="#">우편번호검색</a></span>
                </p>
                <p class="mt10">
                    <input readonly="readonly" id = "addressFirst" type="text" style="width:400px;" title="" name="input17" class="input mr5" />
                </p> 
                <p class="mt10">
                    <input id = "addressSecond" type="text" style="width:400px;" title="" name="input17" class="input mr5"  maxlength="70"/>
                </p>
                <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
                    <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
                    </div>
                    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                    <script>
                        // 우편번호 찾기 화면을 넣을 element
                        var element_layer = document.getElementById('layer');
                    
                        function closeDaumPostcode() {
                            // iframe을 넣은 element를 안보이게 한다.
                            element_layer.style.display = 'none';
                        }
                    
                        function sample2_execDaumPostcode() {
                            new daum.Postcode({
                                oncomplete: function(data) {
                                    // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    
                                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                    var fullAddr = data.roadAddress; // 최종 주소 변수
                                    var extraAddr = ''; // 조합형 주소 변수
                    
                                    // 기본 주소가 도로명 타입일때 조합한다.
                                    // if(data.addressType === 'R'){
                                        //법정동명이 있을 경우 추가한다.
                                        if(data.bname !== ''){
                                            extraAddr += data.bname;
                                        }
                                        // 건물명이 있을 경우 추가한다.
                                        if(data.buildingName !== ''){
                                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                        }
                                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                                        fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                                    // }
                    
                                    // 우편번호와 주소 정보를 해당 필드에 넣는다
                                    document.getElementById('zipCodeFirst').value = data.postcode1;
                                    document.getElementById('zipCodeSecond').value = data.postcode2;
                                    document.getElementById('addressFirst').value = fullAddr;
                    
                                    // iframe을 넣은 element를 안보이게 한다.
                                    // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                                    element_layer.style.display = 'none';
                                },
                                width : '100%',
                                height : '100%'
                            }).embed(element_layer);
                    
                            // iframe을 넣은 element를 보이게 한다.
                            element_layer.style.display = 'block';
                    
                            // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
                            initLayerPosition();
                        }
                    
                        // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
                        // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
                        // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
                        function initLayerPosition(){
                            var width = 300; //우편번호서비스가 들어갈 element의 width
                            var height = 460; //우편번호서비스가 들어갈 element의 height
                            var borderWidth = 5; //샘플에서 사용하는 border의 두께
                    
                            // 위에서 선언한 값들을 실제 element에 넣는다.
                            element_layer.style.width = width + 'px';
                            element_layer.style.height = height + 'px';
                            element_layer.style.border = borderWidth + 'px solid';
                            // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
                            element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
                            element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
                        }
                    </script>
            </td>
    </tr>
    <tr>
        <th scope="row">E-MAIL(*)</th>
        <td colspan="2">
            <input id = "eMail1" type="text" style="width:140px;" title="" name="input18" class="input" maxlength="20"/> @
            <input id = "eMail2" type="text" style="width:80px;" title="" name="input18" class="input" maxlength="20"/>
            <select id = "eMailSelect" onchange="changeEvent()" style="width: 140px;">
                <option>직접입력</option>
                <option>naver.com</option>
                <option>daum.net</option>
                <option>google.com</option>
                <option>nate.com</option>
                <option>yahoo.com</option>
                <option>paran.com</option>
            </select>
        </td>
        <td><div style = "color: red;">* 세금계산서 작성시 e-mail필수</div> </td>
    </tr>
</tbody>
</table>

<div class="ac mt30">
    <span class="btn btn_normal2"><a href="#" id = "registOk" style="width:70px;">확인</a></span>
</div>

<div id="joinFormError" class="alert_popup" style="visibility: hidden">
    <dl>
        <dt>첫번째 사업자 번호 3자리를 입력하세요.</dt>
        <dd>
            <span class="btn btn_normal"><a id="btn_joinErrorOk" href="#" style="width:80px;">확인</a></span>
        </dd>
    </dl>
</div>

<!-- jsonUrl -->

<input type = "hidden" id = "confirmStep3Json" value = "<c:url value='/usr/registStep3.json'/>">


<form id="user" action="<c:url value='/usr/registStep3Confirm.do'/>" method="post">
    <input id="businessNo" name="businessNo" type="hidden" value="<c:out value="${loginVO.businessNo}"/>"/>
    <input id="companyGbn" name="companyGbn" type="hidden" value=""/>
    <input id="membClass" name="membClass" type="hidden" value=""/>
    <input id="ceoName" name="ceoName" type="hidden" value=""/>
    <input id="companyName" name="companyName" type="hidden" value=""/>
    <input id="companyPhone" name="companyPhone" type="hidden" value=""/>
    <input id="companyMobile" name="companyMobile" type="hidden" value=""/>
    <input id="companyFax" name="companyFax" type="hidden" value=""/>
    <input id="companyStatus" name="companyStatus" type="hidden" value=""/>
    <input id="companyItem" name="companyItem" type="hidden" value=""/>
    <input id="companyAddress" name="companyAddress" type="hidden" value=""/>
    <input id="officesName" name="officesName" type="hidden" value=""/>
    <input id="userId" name="userId" type="hidden" value=""/>
    <input id="userPw" name="userPw" type="hidden" value=""/>
</form>



        <br/><br/><br/>
        </div>
    </div>
</div>












<!-- footer -->
<c:import url="../inc/footer.jsp" />
<!--// footer -->
    
            
</body>
</html>

