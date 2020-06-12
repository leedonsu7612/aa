<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : loginView.jsp
  * @Description : 로그인 화면
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>로그인</title>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/popup.css'/>">
<!--[if lte IE 7]>
<script type="text/javascript" src="<c:url value='/js/json2.js'/>" ></script>
<![endif]-->
<script type="text/javascript" src="<c:url value='/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.easing.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.bxslider.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/select.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
<script type="text/x-javascript" src="<c:url value='/validator.js'/>"></script>

<!-- 인증서 -->
<script type="text/javascript" src="<c:url value='/js/customer/TSToolkitObject.js?ver=20170727'/>"></script>
<script type="text/javaScript" language="javascript">
	function fnInit() {
        if ("${message}" != "")
        {
            $("#b2bLoginValidation").find("dt").text("<c:out value='${message}'/>");
            $("#b2bLoginValidation").css("visibility", "visible");
            $("#b2bLoginValidation").fadeIn("slow");

            return false;
        }
	}
</script>
</head>
<body class="main" style="" onLoad="fnInit();">
<object id="TSToolkit" classid="CLSID:55D9860A-AB9C-44A1-BB74-75AF7F805333" codebase="<c:url value='/js/download/TSToolkit.cab#version=2,0,6,4'/>" style="LEFT: 0px; TOP: 0px" width="0" height="0" viewastext=""></object>
<script type="text/javascript" src="<c:url value='/js/customer/TSToolkitConfig.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/global.js?ver=1.1'/>"></script>
<script type="text/javascript">
$(function() {
    if($("#alert_popup1")){
        $("#alert_popup1").css("visibility", "visible");
        $("#alert_popup1").fadeIn("slow");
    }

    if($("#alert_popup2")){
        $("#alert_popup2").css("visibility", "visible");
        $("#alert_popup2").fadeIn("slow");
    }

    if($("#alert_popup3")){
        $("#alert_popup3").css("visibility", "visible");
        $("#alert_popup3").fadeIn("slow");
    }

    $(".btn_normal").click(function(){
       var objId = $(this).parents("div").attr("id");
       $("#" + objId).css("visibility", "hidden");
       $("#" + objId).fadeOut("slow");
    });

    $("#businessNumber3").keydown(function(e)
    {
        if ( e.keyCode == '13' )
            loginB2BClick();
    });

    $("#userPw").keydown(function(e)
    {
        if ( e.keyCode == '13' )
            loginClick();
    });

    if($("#noticePopup").length > 0){
        //$("#noticePopup").css("visibility", "visible");
        //$("#noticePopup").fadeIn("show");
        showAlartPopup($("#noticePopup"));
    }
});

function dualLoginOk(businessNumber, membClass, userSeqNo){
    $("#businessNumber").val(businessNumber);
    $("#membClass").val(membClass);
    $("#userSeqNo").val(userSeqNo);
    $("#accessDualCompany").submit();
}

function autoNextFocus( text1, sendLength, text2 )
{
    $(text1).val($(text1).val().replace(/[^0-9]/gi, ""));

    if ( text2.length > 0 && text1.value.length == sendLength )
        $("#" + text2).focus();
}

//test
function autoLogin(businessNumber){
    $("#businessNumber1").val(businessNumber.substring(0, 3));
    $("#businessNumber2").val(businessNumber.substring(3, 5));
    $("#businessNumber3").val(businessNumber.substring(5, 10));
}
</script>
<div id="mask" style="width: 1485px; height: 643px;"></div>
    <div id="wrap">
        <!-- header -->
        <div id="header">
            <div class="header">
                <h1>
                    <a href="#link"><img src="<c:url value='/images/common/h1_logo.jpg'/>" alt="KG IniB2B"> </a>
                </h1>

                <!-- global menu -->
                <ul class="global_menu">
                    <li class="on"><a href="#link">로그인</a></li>
                    <li><a href="<c:url value='/usr/registStep1.do'/>">회원가입</a></li>
                    <li class="last"><a href="#link">HELP</a></li>
                </ul>

            </div>
        </div>
        <!--// header -->
        <script type="text/javascript">
            function loginB2BClick() {
                //사업자번호 임시 체크 로직 필요
                //validate check
                if ( $("#businessNumber1").val().length < 3 )
                {
                    $("#b2bLoginValidation").find("dt").text("첫번째 사업자번호 3자리를 입력하세요.");
                    $("#b2bLoginValidation").css("visibility", "visible");
                    $("#b2bLoginValidation").fadeIn("slow");

                    return false;
                }
                if ( $("#businessNumber2").val().length < 2 )
                {
                    $("#b2bLoginValidation").find("dt").text("두번째 사업자번호 2자리를 입력하세요.");
                    $("#b2bLoginValidation").css("visibility", "visible");
                    $("#b2bLoginValidation").fadeIn("slow");

                    return false;
                }
                if ( $("#businessNumber3").val().length < 5 )
                {
                    $("#b2bLoginValidation").find("dt").text("세번째 사업자번호 5자리를 입력하세요.");
                    $("#b2bLoginValidation").css("visibility", "visible");
                    $("#b2bLoginValidation").fadeIn("slow");

                    return false;
                }

                var businessNumber = $( "#businessNumber1").val() + $("#businessNumber2").val() + $("#businessNumber3").val();
                $("#userInfo #userId").val(businessNumber);

                //인증서모듈체크
                if(!HB2BLoanSign("login", businessNumber, 1)){
                    return false;
                }

                $("#userInfo").submit();
            }

            $("#userInfo").submit(function(e) {
                form.submit();
            });

            function loginClick() {

            	if ( $("#userPw").val() == '' ) {
            		$("#userPw").focus();
            		return false;
           		}


                $("#loginUser").submit();
            }

            $("#loginUser").submit(function(e) {
                if (!validateLoginUser(this)) {
                    return false;
                } else {
                    form.submit();
                }
                form.submit();
            });
        </script>
        <div id="container">
            <div id="contents">
                
                <div id="b2bLoginValidation" class="alert_popup" style="visibility: hidden; position: absolute; left: 290px; top: 101.5px;">
                    <dl>
                        <dt>첫번째 사업자 번호 3자리를 입력하세요.</dt>
                        <dd>
                            <span class="btn btn_normal"><a id="loginErrOk" href="#" style="width:80px;">승인</a></span>
                        </dd>
                    </dl>
                </div>
                <div class="loginBox ovHid">
                    <!-- container -->
                    <script type="text/javascript"> 
					 var bCancel = false; 

					function validateLoginUser(form) {                                                                   
						if (bCancel) 
					  		return true; 
						else 
					   		return validateRequired(form); 
				   } 

					function required () { 
					 this.aa = new Array("userId", "아이디은(는) 필수 입력값입니다.", new Function ("varName", " return this[varName];"));
					 this.ab = new Array("userPw", "비밀번호은(는) 필수 입력값입니다.", new Function ("varName", " return this[varName];"));
					} 
					</script>
                    <form id="loginUser" name="loginUser" action="<c:url value='/loginB2BConfirm.do'/>" method="post">
                        <!-- 아이디 로그인 -->
                        <div class="login_id mt50">
                            <dl>
                                <dt>아이디 로그인</dt>
                                <dd>
                                    <p class="pb15">
                                        <span class="tit">아이디</span>
                                        <input id="userId" name="userId" title="아이디" style="width:200px;" class="input" type="text" value="" size="20" maxlength="20">
                                    </p>
                                    <p>
                                        <span class="tit">비밀번호</span>
                                        <input id="userPw" name="userPw" title="비밀번호" style="width:200px;" class="input" type="password" value="" size="20" maxlength="20">
                                    </p>
                                </dd>
                                <dd class="lgbtn">
                                    <span class="btn btn_special"><a href="#" onclick="loginClick()">로그인</a>
                                    </span>
                                </dd>
                            </dl>
                            <div class="goto">
                                <span class="fst"><a href="#">아이디
                                        찾기</a> </span> <span><a href="#">비밀번호
                                        찾기</a> </span> <span><a href="<c:url value='/usr/registStep1.do'/>"><strong>회원가입</strong>
                                </a> </span>
                            </div>
                        </div>
                        <!-- //아이디 로그인 -->
                    </form>
                    <script type="text/javascript"> 
						 var bCancel = false; 

						function validateUserInfo(form) {                                                                   
							if (bCancel) 
						  return true; 
							else 
						   return validateRequired(form) && validateMaxLength(form) && validateMinLength(form); 
					   } 

						function required () { 
						 this.aa = new Array("businessNumber", "userInfo.businessNumber은(는) 필수 입력값입니다.", new Function ("varName", "this.minlength='10'; this.maxlength='10';  return this[varName];"));
						} 

						function maxlength () { 
						 this.aa = new Array("businessNumber", "userInfo.businessNumber은(는) 10자 이상 입력할수 없습니다.", new Function ("varName", "this.minlength='10'; this.maxlength='10';  return this[varName];"));
						} 

						function minlength () { 
						 this.aa = new Array("businessNumber", "userInfo.businessNumber은(는) 10자 이상 입력해야 합니다.", new Function ("varName", "this.minlength='10'; this.maxlength='10';  return this[varName];"));
						} 


					</script>
                    <form id="userInfo" name="userInfo" action="<c:url value='/loginB2BConfirm.do'/>" method="post">
                        <input id="userId" name="userId" type="hidden" value="">
                        <!-- 공인인증서 로그인  style = "margin: 0 25% 0 25%; border-left: 0;" -->
                        <div class="login_certify mt50">
                            <dl>
                                <dt>공인인증서 로그인</dt>
                                <dd>
                                    <p class="pb15">
                                        <input type="text" style="width: 55px;" title="" name="input18" id="businessNumber1" class="input" maxlength="3" onkeyup="autoNextFocus( this, 3, 'businessNumber2')"> -
                                        <input type="text" style="width: 30px;" title="" name="input19" id="businessNumber2" class="input" maxlength="2" onkeyup="autoNextFocus( this, 2, 'businessNumber3')"> -
                                        <input type="text" style="width: 55px;" title="" name="input20" id="businessNumber3" class="input" maxlength="5" onkeyup="autoNextFocus( this, 5, '')">
                                    </p>
                                    <p class="note">※ 사업자번호를 입력하세요</p>
                                </dd>
                                <dd class="lgbtn">
                                    <span class="btn btn_special"><a id="loginOk" onclick="loginB2BClick()" href="#">로그인 </a> </span>
                                </dd>
                            </dl>
                            <div class="goto">
                                <span class="fst"><a href="#">공인인증FAQ</a></span> <span><a href="#"><strong>공인인증센터</strong></a> </span>
                            </div>
                        </div>
                        <!-- //공인인증서 로그인 -->
                    </form>
                </div>
                <p class="mt25 lh20 mb50">
                    * 회원가입에 관련된 문의는 전화 <strong>1566-9321</strong>로 연락주시기
                    바랍니다. <br> * KG이니시스는 회원사의 정보를 안전하게 관리하고 있습니다.
                </p>
            </div>
            <!--// contents -->
        </div>
        <!--// container -->

        <!-- footer -->
<c:import url="../inc/footer.jsp" />
		<!--// footer -->
    </div>

    <!-- 인증서체크 -->
    
    <input type="hidden" id="certificateUrl" value="/certificateCheck.json">

	<script type="text/javascript">
		$(function(){
			$(".service_menu li:first-child").mouseover(function() {
				$(".service_menu li:first-child a img").attr("src", $(".service_menu li:first-child a img").attr("src").replace(/(_on.gif|.gif)$/i,"_on.gif"));
			}).on('mouseleave', function() {
				$(".service_menu li:first-child a img").attr("src", $(".service_menu li:first-child a img").attr("src").replace(/(_on.gif|.gif)$/i,".gif"));
			});
		});
	   // if ( notice_getcookie( "notice_20150916" ) != "done" ) {
	   //     window.open("/html/notice_20150916_01.html","notice_20150916","width=642,height=500, resizable=0, scrollbars=no, toolbar=0, status=0, menubar=0, top=0, left=0");
	   // }
	</script>
	<div class="selectbox_option" style="position:absolute;width:148px;display:none;z-index:10"><div class="scroll"></div></div>
</body>
</html>