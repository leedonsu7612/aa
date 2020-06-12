<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : searchPassword.jsp
  * @Description : 비밀번호찾기 화면
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
<title>비밀번호찾기</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/base.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/layout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/common.css'/>" />
<script src="<c:url value='/js/admin/jquery-3.3.1.min.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script src="<c:url value='/js/admin/common.js'/>"></script>
<!--[if lte IE 8]>
<script type="text/javascript" src="<c:url value='/js/admin/html5.js'/>"></script>
<![endif]-->
<script language="JavaScript">
	var SetTime = 3 * 60;		// 최초 설정 시간(기본 : 초)

	function msg_time() {	// 1초씩 카운트
		m = pad(Math.floor(SetTime / 60),2) + ":" + pad((SetTime % 60),2);	// 남은 시간 계산
		var msg = "인증유효 남은시간 " + m;
		$("#remTime").text(msg);
		SetTime--;					// 1초씩 감소

		if (SetTime < 0) {			// 시간이 종료 되었으면..
			clearInterval(tid);		// 타이머 해제
			alert("3분이 지났습니다.");
		}
	}

	function TimerStart(){
		tid = setInterval('msg_time()',1000)
	};
</script>
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
			<h2>비밀번호 찾기</h2>
			<p class="ptext">※본인명의 휴대폰의 통신사를 선택하고 약관에 동의한 후 휴대폰번호를 입력하세요.</p>
			<div class="tbl-type05 reg-tbl">
				<table summary="">
					<caption>개인정보 입력</caption>
					<colgroup>
						<col width="270" />
						<col />
						<col width="270" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">이름</th>
							<td><input type="text" class="wx230" /></td>
							<th scope="row">생년월일</th>
							<td>
								<input type="radio" id="rad_01" /><label for="rad_01"><span></span>남자</label>
								<input type="radio" id="rad_02" /><label for="rad_02"><span></span>여자</label>
							</td>
						</tr>
						<tr>
							<th scope="row">성별</th>
							<td><input type="text" class="wx230" /></td>
							<th scope="row">통신사</th>
							<td>
								<input type="radio" id="rad_03" /><label for="rad_03"><span></span>SKT</label>
								<input type="radio" id="rad_04" /><label for="rad_04"><span></span>KT</label>
								<input type="radio" id="rad_05" /><label for="rad_05"><span></span>LG U+</label>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="agr-bx2">
				<dl>
					<dt><strong>휴대폰인증 약관 동의</strong></dt>
					<dd><input type="checkbox" id="chk-all" /><label for="chk-all"><span></span><b>전체 동의하기</b></label></dd>
				</dl>
				<p class="agr-p mt25">개인정보 수집/이용 동의</p>
				<textarea>
1 장 총칙

제1조 (목적)
이 약관은 (주)케이지이니시스(이하 "회사"라 한다.)가 인터넷을 통해 운영하는 Market Place(이하 " 매출채권 팩토링 서비스 "이라 한다)의 이용조건, 절차, 기타 필요한 사항을 규정함을 
목적으로 한다.

제2조 (약관의 효력 및 변경)
① 이 약관의 내용은 매출채권 팩토링 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력이 발생한다.
② 회사는 필요한 경우 이 약관을 변경할 수 있으며, 약관이 변경되는 경우에는 그 시행일의 최소한 7일전에 1항과 같은 방법으로 공시한다.
				</textarea>
				<dl class="mt5">
					<dt>개인정보 수입/이용 내용을 이해하고 동의하십니까?</dt>
					<dd><input type="checkbox" id="chk-01" /><label for="chk-01"><span></span>예, 동의합니다</label></dd>
				</dl>
				<dl>
					<dt class="agr-p">고유식별번호 처리 동의</dt>
					<dd><input type="checkbox" id="chk-02" /><label for="chk-02"><span></span>예, 동의합니다</label></dd>
				</dl>
				<dl>
					<dt class="agr-p">통신사 이용약관 동의</dt>
					<dd><input type="checkbox" id="chk-03" /><label for="chk-03"><span></span>예, 동의합니다</label></dd>
				</dl>
			</div>
			<div class="tbl-type05 reg-tbl">
				<table summary="">
					<caption>휴대폰 인증</caption>
					<colgroup>
						<col width="270" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">휴대폰 번호</th>
							<td>
								<div class="select-bx wx70">
									<label for="hp">010</label>
									<select id="hp">
										<option>010</option>
									</select>
								</div>
								<input type="text" class="wx70 ml5 mr5" />
								<input type="text" class="wx70" />
								<a href="#" class="btn-submit">인증번호 발송</a>
								<span>*각종 통지를 위해 사용 됩니다.</span>
							</td>
						</tr>
						<tr>
							<th scope="row">인증번호 입력</th>
							<td><input type="text" class="wx230" />
								<a href="#" class="btn-submit">인증번호 확인</a>
								<span>인증유효 남은시간 03:00</span>
							</td>
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
<div id="popup" class="popup04 hx280" style="display:none;">
	<div class="tbl-type02 change-pw">
		<table summary="">
			<caption>비밀번호 변경</caption>
			<colgroup>
				<col width="170" />
				<col />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">비밀번호</th>
					<td><input type="password" /></td>
				</tr>
				<tr>
					<th scope="row">비밀번호 확인</th>
					<td><input type="password" /></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btn-set">
		<a href="#">변경</a>
	</div>
	<a href="#" class="btn-close">닫기</a>
</div>
</body>
</html>