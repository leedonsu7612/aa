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
</head>
<body>
<div id="wrap">
	<!-- 상단 시작 -->
	<div id="hd" class="login">
		<h1 id="hd_h1">현대커머셜</h1>
		<div id="skip_to_container"><a href="#container">본문내용 바로가기</a></div>
		<div class="head">
			<div class="logo">
				<a href="<c:url value='/logout.do'/>">
					<img src="<c:url value='/images/common/logo.png'/>" alt="현대커머셜 로고" />
				</a>
			</div>
			<div class="tnb">
				<ul>
					<li><a href="<c:url value='/login.do'/>">로그인</a></li>
					<li><a href="<c:url value='/usr/registStep1.do'/>">회원가입</a></li>
					<li><a href="#">HELP</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="m2-bg"></div>
	<!-- 상단 끝 -->
	<!-- 콘텐츠 시작  -->
	<div id="container" class="login">
		<div id="contents">
			<h2>HELP</h2>
			<p class="ptext">해당 메뉴를 클릭하시면 전체 매뉴얼이 다운로드 됩니다.</p>
			<div class="tbl-type05 mt10">
				<table summary="">
					<caption>메뉴얼 다운로드</caption>
					<colgroup>
						<col width="270" />
						<col width="465" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th>전체 메뉴얼 다운로드</th>
							<td><a href="#">품목지원센터 PDF 다운로드</a></td>
							<td><a href="#">대리점 다운로드 PDF 다운로드</a></td>
						</tr>
					</tbody>
				</table>
			</div>
			<p class="ptext">해당 목차를 클릭하시면 관련 설명이 조회 가능합니다.</p>
			<div class="tbl-type01 basic">
				<table summary="">
					<caption>메뉴얼 다운로드</caption>
					<colgroup>
						<col width="50%" />
						<col width="" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">품목지원센터</th>
							<th scope="col">대리점</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>수금현황 (종합)</td>
							<td>지급현황 (종합)</td>
						</tr>
						<tr>
							<td>수금내역 (상세)</td>
							<td>지급내역 (상세)</td>
						</tr>
						<tr>
							<td>채권만기일 변경 승인</td>
							<td>기타지급 승인</td>
						</tr>
						<tr>
							<td>기타수금 요청</td>
							<td>상계지급 승인</td>
						</tr>
						<tr>
							<td>상계수금 요청</td>
							<td>채권 만기일 지정</td>
						</tr>
						<tr>
							<td>세금계산서 발행</td>
							<td>결제내역 조회</td>
						</tr>
						<tr>
							<td>대출 가능 채권 조회</td>
							<td>세금계산서 조회</td>
						</tr>
						<tr>
							<td>거래처 한도조회</td>
							<td></td>
						</tr>
						<tr>
							<td>수금내역 조회</td>
							<td></td>
						</tr>
						<tr>
							<td>세금계산서 진행 조회</td>
							<td></td>
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
</body>
</html>