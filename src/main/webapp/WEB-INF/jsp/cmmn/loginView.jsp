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
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/base.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/layout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/common.css'/>" />
<script src="<c:url value='/js/admin/jquery-3.3.1.min.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script src="<c:url value='/js/admin/common.js'/>"></script>
<!--[if lte IE 8]>
<script type="text/javascript" src="<c:url value='/js/admin/html5.js'/>"></script>
<![endif]-->
<!-- 인증서 -->
<script type="text/javascript" src="<c:url value='/js/customer/TSToolkitObject.js?ver=20170727'/>"></script>
<script type="text/javaScript">
	function fnInit() {
        if ("${message}" != "")
        {
        	$("#b2bLoginValidation > .msg-txt").text("<c:out value='${message}'/>");
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

	$("#alertConfirm").click(function() {
		$("#b2bLoginValidation").fadeOut("slow");
		return false;
	});
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
<div id="mask" style="width: 100%; height: 100%;"></div>
<div id="wrap">
	<!-- 상단 시작 -->
	<div id="hd" class="login">
		<!-- <h1 id="hd_h1">현대커머셜</h1> -->
		<div id="skip_to_container"><a href="#container">본문내용 바로가기</a></div>
		<div class="head">
			<div class="logo">
				<a href="#NONE">
					<%-- <img src="<c:url value='/images/common/logo.png'/>" alt="현대커머셜 로고" /> --%>
				</a>
			</div>
			<div class="tnb">
				<ul>
					<li><a href="#LINK">로그인</a></li>
					<li><a href="<c:url value='/usr/registStep1.do'/>">회원가입</a></li>
					<li><a href="<c:url value='/help.do'/>">HELP</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="m2-bg"></div>
	<!-- 상단 끝 -->

        <script type="text/javascript">
            function loginB2BClick() {
                //사업자번호 임시 체크 로직 필요
                //validate check
                if ( $("#businessNumber1").val().length < 3 )
                {
                	$("#b2bLoginValidation > .msg-txt").text("첫번째 사업자번호 3자리를 입력하세요.");
                    $("#b2bLoginValidation").css("visibility", "visible");
                    $("#b2bLoginValidation").fadeIn("slow");

                    return false;
                }
                if ( $("#businessNumber2").val().length < 2 )
                {
                	$("#b2bLoginValidation > .msg-txt").text("두번째 사업자번호 2자리를 입력하세요.");
                    $("#b2bLoginValidation").css("visibility", "visible");
                    $("#b2bLoginValidation").fadeIn("slow");

                    return false;
                }
                if ( $("#businessNumber3").val().length < 5 )
                {
                	$("#b2bLoginValidation > .msg-txt").text("세번째 사업자번호 5자리를 입력하세요.");
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
	<!-- 콘텐츠 시작  -->
	<div id="container" class="login">
		<div id="contents">
			<div class="login-bx">
				<ul>
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
					<li class="id-login">
						<strong>아이디 로그인</strong>
						<ul>
							<li class="mb-id">
								<label for="userId" class="sound_only">아이디</label>
								<input type="text" id="userId" name="userId" maxlength="20" />
							</li>
							<li class="mb-id">
								<label for="userPw" class="sound_only">비밀번호</label>
								<input type="password" id="userPw" name="userPw" maxlength="20" />
							</li>
							<li class="btn"><a href="#" onclick="loginClick()">로그인</a></li>
						</ul>
						<div class="reg-btn">
							<ul>
								<li><a href="<c:url value='/searchId.do'/>">아이디 찾기</a></li>
								<li><a href="<c:url value='/searchPassword.do'/>">비밀번호 찾기</a></li>
								<li><a href="<c:url value='/usr/registStep1.do'/>"><b>회원가입</b></a></li>
								<%-- <li><a href="<c:url value='/mobis/registStep1.do'/>"><b>모비스 회원가입</b></a></li> --%>
							</ul>
						</div>
					</li>
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
                    <input id="userId" name="userId" type="hidden" value=""/>
					<li class="cert-login">
						<strong>공인인증서 로그인</strong><ul>
							<li class="mb-id">
								<label for="cert-num" class="sound_only">사업자 번호</label>
								<input type="text" name="input18" id="businessNumber1" title="사업자 번호 앞자리" maxlength="3" onkeyup="autoNextFocus( this, 3, 'businessNumber2')"/>
								<input type="text" name="input19" id="businessNumber2" title="사업자 번호 가운데자리" maxlength="2" onkeyup="autoNextFocus( this, 2, 'businessNumber3')"/>
								<input type="text" name="input20" id="businessNumber3" title="사업자 번호 끝자리" maxlength="5" onkeyup="autoNextFocus( this, 5, '')"/>
							</li>
							<li class="btn"><a href="#" id="loginOk" onclick="loginB2BClick()">로그인</a></li>
							<li class="war-txt">※ 사업자번호를 입력하세요</li>
						</ul>
						<div class="reg-btn">
							<ul>
								<li><a href="#">공인인증FAQ</a></li>
								<li><a href="#">공인인증센터</a></li>
							</ul>
						</div>
					</li>
					</form>
				</ul>
			</div>
			<div class="reg-warr">
				<span>회원가입에 관련된 문의는 전화 1566-9321로 연락주시기 바랍니다. </span>
			</div>
        </div><!--// contents -->
    </div><!--// container -->
	<!-- footer -->
	<%-- <c:import url="../inc/footer.jsp" /> --%>
	<!--// footer -->    
</div><!--// wrap -->
<div id="b2bLoginValidation" class="acc2-pop">
	<div class="msg-txt">
		첫번째 사업자 번호 3자리를 입력하세요.
	</div>
	<div class="btn-set2">
		<a href="#NONE" id="alertConfirm">확인</a>
	</div>
</div>
</body>
</html>