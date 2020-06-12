<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : mobisStep1.jsp
  * @Description : 이용약관동의 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2018.12.24            최초 생성
  *
  * author CDF Team
  * since 2018.12.24
  *
  */
%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>이용약관동의</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/base.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/layout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/common.css'/>" />
<script src="<c:url value='/js/admin/jquery-3.3.1.min.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script src="<c:url value='/js/admin/common.js'/>"></script>
<!--[if lte IE 8]>
<script type="text/javascript" src="<c:url value='/js/admin/html5.js'/>"></script>
<![endif]-->
<script type="text/javascript">

	$(function()
	{
	    $("#nextStep").click(function()
	    {
	        //validate check
	        if ( $("#agree1").prop( "checked" ) == false )
	        {
	            $("#bizNumError > .msg-txt").text("이용약관동의에 체크해 주십시오.");
	            $("#bizNumError").css("visibility", "visible");
	            $("#bizNumError").fadeIn("slow");
	            
	            return false;
	        }
	        if ( $("#agree2").prop( "checked" ) == false )
	        {
	            $("#bizNumError > .msg-txt").text("제3자 제공현황에 동의에 체크해 주십시오.");
	            $("#bizNumError").css("visibility", "visible");
	            $("#bizNumError").fadeIn("slow");
	            
	            return false;
	        }
	        
	        //DATA SETTING
	        $("#user").submit();
	    });
	    
	    $("#btn_bizNumError").click(function()
	    {
	        $("#bizNumError").fadeOut("slow");
	    });
	});

</script>
</head>
<body>
<div id="mask"></div>
<div id="wrap">
	<!-- 상단 시작 -->
	<div id="hd" class="login">
		<h1 id="hd_h1">현대커머셜</h1>
		<div id="skip_to_container"><a href="#container">본문내용 바로가기</a></div>
		<div class="head">
			<div class="logo">
				<a href="#NONE">
					<img src="<c:url value='/images/common/logo.png'/>" alt="현대커머셜 로고" />
				</a>
			</div>
			<div class="tnb">
				<ul>
					<li><a href="<c:url value='/login.do'/>">로그인</a></li>
					<li><a href="<c:url value='/mobis/registStep1.do'/>">회원가입</a></li>
					<li><a href="<c:url value='/help.do'/>">HELP</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="m2-bg"></div>
	<!-- 상단 끝 -->

	<!-- 콘텐츠 시작  -->
	<div id="container" class="login">
		<div id="contents">
			<h2>회원가입</h2>
			<div class="reg-step reg-step2">
				<ul>
					<li class="step02 active"><p><span>이용약관동의</span></p></li>
					<li class="step03"><p><span>기업정보등록</span></p></li>
					<li class="step04"><p><span>회원가입완료</span></p></li>
				</ul>
			</div>
			<div class="agr-bx">
				<strong>이용약관</strong>
				<textarea>
1 장 총칙

제1조 (목적)
이 약관은 (주)케이지이니시스(이하 "회사"라 한다.)가 인터넷을 통해 운영하는 Market Place(이하 " 매출채권 팩토링 서비스 "이라 한다)의 이용조건, 절차, 기타 필요한 사항을 규정함을 
목적으로 한다.

제2조 (약관의 효력 및 변경)
① 이 약관의 내용은 매출채권 팩토링 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력이 발생한다.
② 회사는 필요한 경우 이 약관을 변경할 수 있으며, 약관이 변경되는 경우에는 그 시행일의 최소한 7일전에 1항과 같은 방법으로 공시한다.
				</textarea>
				<p><input type="checkbox" id="agree1" /><label for="agree1"><span></span>이용약관에 동의합니다.</label></p>
			</div>
			<div class="agr-bx">
				<strong>제3자 제공현황</strong>
				<textarea>
1 장 총칙

제1조 (목적)
이 약관은 (주)케이지이니시스(이하 "회사"라 한다.)가 인터넷을 통해 운영하는 Market Place(이하 " 매출채권 팩토링 서비스 "이라 한다)의 이용조건, 절차, 기타 필요한 사항을 규정함을 
목적으로 한다.

제2조 (약관의 효력 및 변경)
① 이 약관의 내용은 매출채권 팩토링 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력이 발생한다.
② 회사는 필요한 경우 이 약관을 변경할 수 있으며, 약관이 변경되는 경우에는 그 시행일의 최소한 7일전에 1항과 같은 방법으로 공시한다.
				</textarea>
				<p><input type="checkbox" id="agree2" /><label for="agree2"><span></span>제3자 제공현황에 동의합니다.</label></p>
			</div>
			<div class="btn-set mt50">
				<a href="#" id="nextStep">다음단계로</a>
			</div>
        </div><!--// contents -->
    </div><!--// container -->
	<!-- footer -->
	<c:import url="../inc/footer.jsp" />
	<!--// footer -->    
</div><!--// wrap -->
<div id="bizNumError" class="acc2-pop">
	<div class="msg-txt">
		첫번째 사업자 번호 3자리를 입력하세요.
	</div>
	<div class="btn-set2">
		<a href="#NONE" id="btn_bizNumError">승인</a>
	</div>
</div>
<form id="user" action="<c:url value='/mobis/registStep2.do'/>" method="post">
</form>
</body>
</html>