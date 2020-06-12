<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : registStep1Confirm.jsp
  * @Description : 회원가입여부확인 화면
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
<title>회원가입여부확인</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/base.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/layout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/common.css'/>" />
<script src="<c:url value='/js/admin/jquery-3.3.1.min.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script src="<c:url value='/js/admin/common.js'/>"></script>
<!--[if lte IE 8]>
<script type="text/javascript" src="<c:url value='/js/admin/html5.js'/>"></script>
<![endif]-->
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
	    // - 찍어주기
	    init();
	    
	    $("#userRegist").click(function()
	    {
	        //validate check
	        
	        //DATA SETTING
	        $("#user #businessNo").val( $("#businessNo").val() );   
	        $("#user").submit();
	    });
	});
	
	function init()
	{
	    var businessNo = new String( $("#businessNo").val() );
	    
	    var first = businessNo.substring( 0, 3 );
	    var second = businessNo.substring( 3, 5 );
	    var third = businessNo.substring( 5, 10 );
	    
	    $("#businessNumberEx").val( first + "-" + second + "-" + third );
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
			<p class="ptext">※ 해당 사업자등록번호는 회원으로 등록되어 있지 않습니다.<br/>
				※ 회원가입을 원하시면 아래의 회원가입 버튼을 클릭해 주십시오.
			</p>
			<div class="tbl-type05">
				<table summary="">
					<caption>사업자등록번호 등록</caption>
					<colgroup>
						<col width="310" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">사업자등록번호</th>
							<td><input type="text" class="wx270" id="businessNumberEx" readonly="readonly"/>
							<input type="hidden" id="businessNo" value="<c:out value="${loginVO.businessNo}"/>">
							<a href="#" id="userRegist" class="btn-submit">회원가입</a></td>
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
<form id="user" action="<c:url value='/usr/registStep2.do'/>" method="post">
    <input id="businessNo" name="businessNo" type="hidden" value="<c:out value="${loginVO.businessNo}"/>"/>
</form>
</body>
</html>