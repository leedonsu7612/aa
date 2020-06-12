<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : userInfoModify.jsp
  * @Description : 회원정보수정 화면
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
<title>회원정보수정
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
    
    var currMenuId = '0000_06';
    var memberClass = 'A';
    
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
    //주소, 전화번호, 팩스번호 셋팅을 위한 function
    init();
    
    //최종 확인 버튼
    $("#registOk").click(function()
    {
        var pwHiddenCheck1 = $("#PWCheckString").css( "visibility" );
        var pwHiddenCheck2 = $("#PWNoticeString").css( "visibility" );
        
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
        // PW
        $("#userInformation #userPw").val( $("#userRegistPW").val() );
        
        //대표자명
        $("#userInformation #ceoName").val( $("#ceoName").val() );
        //회사명
        $("#userInformation #companyName").val( $("#companyName").val() );
        //전화번호
        $("#userInformation #companyPhone").val( $("#companyPhoneFirst").val() + $("#companyPhoneSecond").val() + $("#companyPhoneThird").val() );
        //팩스번호
        $("#userInformation #companyFax").val( $("#companyFaxFirst").val() + $("#companyFaxSecond").val() + $("#companyFaxThird").val() );
        
        $("#userInformation #companyMobile").val( $("#companyMobileFirst").val() + $("#companyMobileSecond").val() + $("#companyMobileThird").val() );
        //업태
        $("#userInformation #companyStatus").val( $("#companyStatus").val() );
        //업종
        $("#userInformation #companyItem").val( $("#companyItem").val() );
        //배송지
        var companyAddress = $("#zipCodeFirst").val() + "-" + $("#zipCodeSecond").val() + " " + $("#addressFirst").val() + "[" + $("#addressSecond").val() + "]";
        //test 주소 입력
        $("#userInformation #companyAddress").val( companyAddress );
        //e-mail
        $("#userInformation #officesName").val( $("#eMail1").val() + "@" + $("#eMail2").val() );
        
        //$("#userInformation").submit();
        var url = "<c:url value='/usr/userInfoModify.json'/>";
        $.ajax({
           url :  url,
           type : "post",
           dataType : "json",
           data : $("#userInformation").serialize(),
           success : function( resultCode )
           {
               if ( resultCode == "100" )
               {
                   $("#userInfoCompletePopup").css("visibility", "visible");
                   $("#userInfoCompletePopup").fadeIn("slow");
               }
               else 
               {
                   $("#joinFormError").find("dt").text("회원정보를 수정할 수 없습니다.");
                   $("#joinFormError").css("visibility", "visible");
                   $("#joinFormError").fadeIn("slow");    
               }
               
           },
           error : function( request, status, error )
           {
               $("#joinFormError").find("dt").text("<통신 실패>" + "\n" + "CODE : "+request.status + "\n" + "ERROR : "+error);
               $("#joinFormError").css("visibility", "visible");
               $("#joinFormError").fadeIn("slow");
           }
        });
    });
    
    //비밀번호 입력
    $("#userRegistPW").keyup(function()
    {
         var userPW = $("#userRegistPW").val();
         var isPWCheckFlag = false;
         
         for(var i = 0 ; i < userPW.length ; i++)
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
    
    $("#btn_joinErrorOk").click(function()
    {
        $("#joinFormError").fadeOut("slow");
    });
    
    //modifyOk
    $("#modifyOk").click(function()
    {
        $("#mask").hide();  
        
        $("#userInfoCompletePopup").fadeOut("slow");
        return false;
    });
});

function changeEvent()
{
    $("#eMail2").val( $("#eMailSelect").val() );
}

function init()
{
    if ( $("#userInformation #ceoName").val() != "" )
    {
        //전화번호
        var phoneNumber = new String( $("#userInformation #companyPhone").val() );
        var localPhoneNumber = "";
        var firstPhoneNumber = "";
        var secondPhoneNumber = "";
        
		if(phoneNumber.length > 8){
			localPhoneNumber = phoneNumber.charAt( 1 );
	        if ( localPhoneNumber == "2" )
	            localPhoneNumber = phoneNumber.substring( 0, 2 );
	        else
	            localPhoneNumber = phoneNumber.substring( 0, 3 );
	        
	        firstPhoneNumber = phoneNumber.substring( localPhoneNumber.length, ( phoneNumber.length - 4 ) );
	        secondPhoneNumber = phoneNumber.substring( ( phoneNumber.length - 4 ), phoneNumber.length );
		}
        
        //SETTING
        $("#companyPhoneFirst").val( localPhoneNumber );
        $("#companyPhoneSecond").val( firstPhoneNumber );
        $("#companyPhoneThird").val( secondPhoneNumber );
        
        //팩스번호
        var faxNumber = new String( $("#userInformation #companyFax").val() );
        var localFaxNumber = "";
        var firstFaxNumber = "";
        var secondFaxNumber = "";
        
		if(faxNumber.length > 8){
	        localFaxNumber = faxNumber.charAt( 1 );
	        if ( localFaxNumber == "2" )
	            localFaxNumber = faxNumber.substring( 0, 2 );
	        else
	            localFaxNumber = faxNumber.substring( 0, 3 );
	        
	        firstFaxNumber = faxNumber.substring( localFaxNumber.length, ( faxNumber.length - 4 ) );
	        secondFaxNumber = faxNumber.substring( ( faxNumber.length - 4 ), faxNumber.length );
		}
        
        //SETTING
        $("#companyFaxFirst").val( localFaxNumber );
        $("#companyFaxSecond").val( firstFaxNumber );
        $("#companyFaxThird").val( secondFaxNumber );
        
        
        //휴대폰번호
        var mobileNumber = new String( $("#userInformation #companyMobile").val() );
        
        if ( mobileNumber.length > 10 ) {
        	$("#companyMobileFirst").val( mobileNumber.substring( 0, 3 ) );
        	if ( mobileNumber.length == 10 ) {
                $("#companyMobileSecond").val( mobileNumber.substring( 3, 6 ) );
                $("#companyMobileThird").val( mobileNumber.substring( 6, 10 ) );
        	} else if ( mobileNumber.length == 11 ) {
                $("#companyMobileSecond").val( mobileNumber.substring( 3, 7 ) );
                $("#companyMobileThird").val( mobileNumber.substring( 7, 11 ) );
        	}
        }
        
        //주소
        var companyAddress = new String( $("#userInformation #companyAddress").val() );
        //var destAddress = new String( $("#user #companyAddress").val() );
        var hyphen = companyAddress.substring( 3, 4 );
        
        if ( hyphen != "-" )
        {
            $("#addressFirst").val( companyAddress );
        }
        else
        {
            var zipCodeFirst = companyAddress.substring( 0, 3 );
            
            var zipCodeSecond = companyAddress.substring( 4, 7 );
            var searchChar = companyAddress.indexOf('[');
            var firstAddress = companyAddress.substring( 8, searchChar );
            var secondAddress = companyAddress.substring( searchChar + 1, companyAddress.length - 1 );
            
            //
            $("#zipCodeFirst").val( zipCodeFirst );
            $("#zipCodeSecond").val( zipCodeSecond );
            $("#addressFirst").val( firstAddress );
            $("#addressSecond").val( secondAddress );
        }
        
        //e-mail
        if ( $("#userInformation #officesName").val() != null && $("#userInformation #officesName").val() != "" )
        {
            var email = new String( $("#userInformation #officesName").val() );
            var benchmark = email.split( "@" );
            
            //SETTING
            $("#eMail1").val( benchmark[0] );
            $("#eMail2").val( benchmark[1] );
            $("#eMailSelect").val( benchmark[1] );
        }
        
        //경고 ( 특수문자 )문구 숨기기
        $("#PWNoticeString").css( "visibility", "hidden" );
        $("h2").css( "visibility", "hidden" );
        $("#approveNoticePopup").remove();
    } 
}

function noticeRemove()
{
    $("#PWNoticeString").css( "visibility", "hidden" );
}

</script>

<!-- step -->
<!-- <ul class="step4_wrap on3 mb20">
    <li class="first">
        <p class="tit">회원가입여부</p>
    </li>
    <li>
        <p class="tit">이용약관동의</p>
    </li>
    <li class="on">
        <p class="tit">기업정보수정</p>
    </li>
    <li>
        <p class="tit">회원가입완료</p>
    </li>
</ul> -->
<!--// step -->

<h3>기본정보 수정</h3>
<table id = "basicInfoTable" summary="" class="tbl_regist_view2 mb15 mt15">
    <caption>기본정보 입력</caption>
    <colgroup>
        <col width="170" />
        <col width="320" />
        <col width="170" />
        <col width="320" />
    </colgroup>
    <tbody>
        <tr>
            <th scope="row">아이디</th>
            <td><div class = "desc"><c:out value='${registVO.userId}'/></div></td>
            <th scope="row">사업자번호</th>
            <td><div class = "desc"><c:out value='${registVO.businessNo}'/></div></td>
        </tr>
        <tr>
            <th scope="row">비밀번호</th>
            <td>
                <input type="password" style="width:140px;" name="userRegistPW" id="userRegistPW" class="input" maxlength="20" onfocus="noticeRemove()" value = "<c:out value='${registVO.userPw}'/>"/>
            </td>
            <td colspan="3">
                <div id = "PWNoticeString" style="color: red;">공백, 특수문자 [ ] / \ ' . , "는 제외하고 입력해 주세요.</div>
            </td>
        </tr>
        <tr>
            <th scope="row">비밀번호확인</th>
            <td>
                <input type="password" style="width:140px;" name="input17" id="userRegistPWConfirm" class="input" maxlength="20" value = "<c:out value='${registVO.userPw}'/>"/>
            </td>
            <td colspan="3">
                <div id = "PWCheckString" style="color: red; visibility: hidden;">비밀번호가 일치하지 않습니다.</div>
            </td>
        </tr>
    </tbody>
</table>

<h3>개인정보 수정</h3>
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
            
                
                    <div class = "desc">
                    <c:choose>
						<c:when test="${registVO.companyGbn eq 'C'}">법인사업자</c:when>
						<c:when test="${registVO.companyGbn eq 'B'}">개인사업자</c:when>
					 </c:choose>
					</div>
                
                
            
        </td>
        <th scope="row">거래처형태</th>
        <td>
            
                
                
                    <div class = "desc">
                    <c:choose>
						<c:when test="${registVO.membClass eq 'S'}">품목점</c:when>
						<c:when test="${registVO.membClass eq 'B'}">대리점</c:when>
					 </c:choose>
                    </div>
                
            
        </td>
    </tr>
    <tr>
        <th scope="row">대표자명</th>
        <td><input type="text" style="width:140px;" title="" name="input17" id="ceoName" class="input" maxlength="8" value = "<c:out value='${registVO.ceoName}'/>"/></td>
        <th scope="row">회사명</th>
        <td><input type="text" style="width:140px;" title="" name="input17" id="companyName" class="input" maxlength="10" value = "<c:out value='${registVO.companyName}'/>"/></td>
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
        <td><input id = "companyStatus" type="text" style="width:140px;" title="" name="input17" class="input" value = "<c:out value='${registVO.companyStatus}'/>"/></td>
        <th scope="row">업종</th>
        <td><input id = "companyItem" type="text" style="width:140px;" title="" name="input17" class="input" value = "<c:out value='${registVO.companyItem}'/>"/></td>
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
                    <input id = "addressSecond" type="text" style="width:400px;" title="" name="input17" class="input mr5"  />
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
            <input id = "eMail1" type="text" style="width:140px;" title="" name="input18" class="input" /> @
            <input id = "eMail2" type="text" style="width:80px;" title="" name="input18" class="input" />
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
    <span class="btn btn_normal2"><a href="#" id = "registOk" style="width:70px;">수정</a></span>
</div>

<div id="joinFormError" class="alert_popup" style="visibility: hidden">
    <dl>
        <dt>첫번째 사업자 번호 3자리를 입력하세요.</dt>
        <dd>
            <span class="btn btn_normal"><a id="btn_joinErrorOk" href="#" style="width:80px;">확인</a></span>
        </dd>
    </dl>
</div>

<div id="userInfoCompletePopup" class="alert_popup" style="visibility: hidden">
    <dl>
        <dt>회원정보 수정완료.</dt>
        <dd>
            <span class="btn btn_normal"><a id="modifyOk" href="#" style="width:80px;">확인</a></span>
        </dd>
    </dl>
</div>

<!-- jsonUrl -->
<form id="userInformation" action="<c:url value='/usr/userInfoModify.do'/>" method="post">
    <input id="businessNo" name="businessNo" type="hidden" value="<c:out value='${registVO.businessNo}'/>"/>
    <input id="companyGbn" name="companyGbn" type="hidden" value="<c:out value='${registVO.companyGbn}'/>"/>
    <input id="membClass" name="membClass" type="hidden" value="<c:out value='${registVO.membClass}'/>"/>
    <input id="ceoName" name="ceoName" type="hidden" value="<c:out value='${registVO.ceoName}'/>"/>
    <input id="companyName" name="companyName" type="hidden" value="<c:out value='${registVO.companyName}'/>"/>
    <input id="companyPhone" name="companyPhone" type="hidden" value="<c:out value='${registVO.companyPhone}'/>"/>
    <input id="companyMobile" name="companyMobile" type="hidden" value="<c:out value='${registVO.companyMobile}'/>"/>
    <input id="companyFax" name="companyFax" type="hidden" value="<c:out value='${registVO.companyFax}'/>"/>
    <input id="companyStatus" name="companyStatus" type="hidden" value="<c:out value='${registVO.companyStatus}'/>"/>
    <input id="companyItem" name="companyItem" type="hidden" value="<c:out value='${registVO.companyItem}'/>"/>
    <input id="companyAddress" name="companyAddress" type="hidden" value="<c:out value='${registVO.companyAddress}'/>"/>
    <input id="officesName" name="officesName" type="hidden" value="<c:out value='${registVO.officesName}'/>"/>
    <input id="userId" name="userId" type="hidden" value="<c:out value='${registVO.userId}'/>"/>
    <input id="userPw" name="userPw" type="hidden" value="<c:out value='${registVO.userPw}'/>"/>
    <input id="userSeqNo" name="userSeqNo" type="hidden" value="<c:out value='${registVO.userSeqNo}'/>"/>
</form>
<form name="certCallForm" id="certCallForm" method="post">
	<input type="hidden" name="corpNum" value="9999999999" >
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

