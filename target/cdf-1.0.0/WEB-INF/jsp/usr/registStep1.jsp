<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : registStep1.jsp
  * @Description : 회원가입여부조회 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2018.11.14            최초 생성
  *  2018.11.29            수정
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
<title>회원가입여부조회</title>
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
	//숫자만 일력된다.
	$(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
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
					<li><a href="<c:url value='/usr/registStep1.do'/>">회원가입</a></li>
					<li><a href="<c:url value='/help.do'/>">HELP</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="m2-bg"></div>
	<!-- 상단 끝 -->

<script type="text/javascript">

	$(function()
	{
	    $("#inquiry").click(function()
	    {
	        //validate check
	        if ( $("#businessNo1").val().length < 3 )
	        {
	            $("#bizNumError > .msg-txt").text("첫번째 사업자 번호 3자리를 입력하세요.");
	            $("#bizNumError").css("visibility", "visible");
	            $("#bizNumError").fadeIn("slow");
	            
	            return false;
	        }
	        if ( $("#businessNo2").val().length < 2 )
	        {
	            $("#bizNumError > .msg-txt").text("두번째 사업자번호 2자리를 입력하세요.");
	            $("#bizNumError").css("visibility", "visible");
	            $("#bizNumError").fadeIn("slow"); 
	            
	            return false;
	        }
	        if ( $("#businessNo3").val().length < 5 )
	        {
	            $("#bizNumError > .msg-txt").text("세번째 사업자번호 5자리를 입력하세요.");
	            $("#bizNumError").css("visibility", "visible");
	            $("#bizNumError").fadeIn("slow");
	            
	            return false;
	        }
	        
	        //DATA SETTING
	        $("#user #businessNo").val( $("#businessNo1").val() + $("#businessNo2").val() + $("#businessNo3").val() );   
	        $("#user").submit();
	    });
	    
	    $("#businessNo3").keydown(function(e)
	    {
	        if ( e.keyCode == '13' )
	            $("#inquiry").trigger( "click" );    
	    });
	    
		$("#btn_bizNumErrorOk").click(function(){
	        $("#bizNumError").fadeOut("slow");
	    });
	});
	
	function enterKey(e)
	{
	    if ( e.keyCode == '13' )
	        $("#inquiry").trigger( "click" );
	}

</script>

	<!-- 콘텐츠 시작  -->
	<div id="container" class="login">
		<div id="contents">
			<h2>회원가입</h2>
			<div class="reg-step">
				<ul>
					<li class="step01 active"><p><span>회원가입여부</span></p></li>
					<li class="step02"><p><span>이용약관동의</span></p></li>
					<li class="step03"><p><span>기업정보등록</span></p></li>
					<li class="step04"><p><span>회원가입완료</span></p></li>
				</ul>
			</div>
			<p class="ptext">회원가입여부를 확인하기위해 사업자등록번호 입력 후 조회하기를 클릭해 주십시오.</p>
			<div class="tbl-type05">
				<table summary="">
					<caption>사업자등록번호 조회</caption>
					<colgroup>
						<col width="310" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">사업자등록번호</th>
							<td><input type="text" id="businessNo1" maxlength="3" numberonly="true"/><span>-</span>
								<input type="text" id="businessNo2" maxlength="2" numberonly="true"/><span>-</span>
								<input type="text" id="businessNo3" maxlength="5" onkeyup="enterKey(this)" numberonly="true"/><a href="#" id="inquiry" class="btn-submit">조회하기</a></td>
						</tr>
					</tbody>
				</table>
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
		<a href="#NONE" id="btn_bizNumErrorOk">확인</a>
	</div>
</div>
<form id="user" action="<c:url value='/usr/registStep1Confirm.do'/>" method="post">
    <input id="businessNo" name="businessNo" type="hidden" value=""/>
</form>
</body>
</html>