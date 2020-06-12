<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="hd" class="agency">
	<h1 id="hd_h1">현대커머셜</h1>

	<div id="skip_to_container">
		<a href="#container">본문내용 바로가기</a>
	</div>

	<div class="head">
		<div class="logo">
			<a href="<c:url value='/buyer/companysBilling/list.do'/>">
				<img src="<c:url value='/images/common/logo.png'/>" alt="현대커머셜 로고" />
			</a>
		</div>

		<div class="tnb">
			<ul>
				<li>
					<a href="javascript:;">${user.companyName }님</a>
				</li>
				<li>
					<a href="<c:url value='/logout.do'/>">로그아웃</a>
				</li>
				<li>
					<a href="<c:url value='/html/buyer_manual_20150901.pdf'/>">HELP</a>
				</li>
			</ul>
		</div>

		<div class="gnb">
			<!-- 대리점 -->
			<c:if test="${user.membClass eq 'B' }">
				<ul>
					<li>
						<a href="<c:url value='/buyer/companysBilling/list.do'/>" <c:if test="${menuId eq '0201_01'}">class="active"</c:if>>지급현황(종합)</a>
					</li>
					<li>
						<a href="<c:url value='/buyer/salesBilling/list.do'/>" <c:if test="${menuId eq '0301_01'}">class="active"</c:if>>지급내역(상세)</a>
					</li>
					<li>
						<a href="<c:url value='/buyer/unauthorized/list.do'/>" <c:if test="${menuId eq '0401_01'}">class="active"</c:if>>기타지급 승인</a>
					</li>
					<li>
						<a href="<c:url value='/buyer/setOff/list.do'/>" <c:if test="${menuId eq '1001_01'}">class="active"</c:if>>상계지급 승인</a>
					</li>
					<li>
						<a href="<c:url value='/buyer/accountReceivable/list.do'/>" <c:if test="${menuId eq '0501_01'}">class="active"</c:if>>채권만기일 지정</a>
					</li>
					<li>
						<a href="<c:url value='/buyer/payment/list.do'/>" <c:if test="${menuId eq '0601_01'}">class="active"</c:if>>결제내역 조회</a>
					</li>
					<li>
						<a href="<c:url value='/buyer/taxBill/list.do'/>" <c:if test="${menuId eq '0701_01'}">class="active"</c:if>>세금계산서 조회</a>
					</li>
				</ul>
			</c:if>
			<!-- 품목점 -->
			<c:if test="${user.membClass eq 'S' }">
				<ul>
					<li>
						<a href="<c:url value='/seller/companysBilling/list.do'/>" <c:if test="${menuId eq '0202_01'}">class="active"</c:if>>수급현황(종합)</a>
					</li>
					<li>
						<a href="<c:url value='/seller/salesBilling/list.do'/>" <c:if test="${menuId eq '0302_01'}">class="active"</c:if>>수금내역(상세)</a>
					</li>
					<li>
						<a href="<c:url value='/seller/changeOrApprove/list.do'/>" <c:if test="${menuId eq '0402_01'}">class="active"</c:if>>채권만기일 변경승인</a>
					</li>
					<li>
						<a href="<c:url value='/seller/unauthorized/list.do'/>" <c:if test="${menuId eq '0502_01'}">class="active"</c:if>>기타수금 요청</a>
					</li>
					<li>
						<a href="<c:url value='/seller/taxBill/list.do'/>" <c:if test="${menuId eq '0602_01'}">class="active"</c:if>>세금계산서 발행</a>
					</li>
					<li>
						<a href="<c:url value='/seller/setOff/list.do'/>" <c:if test="${menuId eq '1002_01'}">class="active"</c:if>>상계수금 요청</a>
					</li>
					<li>
						<a href="<c:url value='/seller/loan/list.do'/>" <c:if test="${menuId eq '0702_01'}">class="active"</c:if>>대출 가능 채권 조회</a>
					</li>
					<li>
						<a href="<c:url value='/seller/limit/list.do'/>" <c:if test="${menuId eq '0802_01'}">class="active"</c:if>>거래처 한도조회</a>
					</li>
					<li>
						<a href="<c:url value='/seller/payment/list.do'/>" <c:if test="${menuId eq '0902_01'}">class="active"</c:if>>수금내역조회</a>
					</li>
					<li>
						<a href="<c:url value='/seller/taxBill/statusList.do'/>" <c:if test="${menuId eq '0603_01'}">class="active"</c:if>>세금계산서 진행조회</a>
					</li>
				</ul>
			</c:if>
		</div>
	</div>
</div>

<div id="m2-bg"></div>