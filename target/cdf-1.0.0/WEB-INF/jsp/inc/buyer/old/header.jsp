<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="header">
	<div class="header">
		<h1>
			<a href="<c:url value='/buyer/salesBilling/list.do'/>">
				<img src="<c:url value='/images/common/h1_logo.jpg'/>" alt="모비스 팩토링">
			</a>
		</h1>

		<!-- global menu -->
		<ul class="global_menu">
			<li class="on">
				<a href="<c:url value='/logout.do'/>">
					<span style="display: inline-block; max-width: 165px;">${user.companyName }님</span> 로그아웃
				</a>
			</li>
			<li class="last">
				<a href="<c:url value='/html/buyer_manual_20150901.pdf'/>" target="_blank">HELP</a>
				<!-- <br>
					<div style="font-size: 13px; font-weight: bold; border: 1px solid #44227a; background-color: #FFFFFF; padding: 3px; margin-top: 10px;">
						<a href="<c:url value='/promo/detail.do?typ=0011'/>">
							대리점<br>현금담보 한도증액
						</a>
					</div> -->
			</li>
		</ul>
		<!--// global menu -->

		<!-- buyer service menu -->
		<ul class="service_menu">
			<li class="s_btn">
				<a href="<c:url value='/buyer/companysBilling/list.do'/>" menuid="0201_01">지급현황(종합)</a>
			</li>
			<li class="s_btn mb5">
				<a href="<c:url value='/buyer/salesBilling/list.do'/>" menuid="0301_01">지급내역(상세)</a>
			</li>
			<li class="s_btn mb5">
				<a href="<c:url value='/buyer/unauthorized/list.do'/>" menuid="0401_01">기타지급 승인</a>
			</li>
			<li class="s_btn mb5">
				<a href="<c:url value='/buyer/setOff/list.do'/>" menuid="1001_01">상계지급 승인</a>
			</li>
			<li class="s_btn mb5">
				<a href="<c:url value='/buyer/accountReceivable/list.do'/>" menuid="0501_01">채권만기일 지정</a>
			</li>
			<li class="s_btn mb5">
				<a href="<c:url value='/buyer/payment/list.do'/>" menuid="0601_01">결제내역조회</a>
			</li>
			<li class="s_btn mb5">
				<a href="<c:url value='/buyer/taxBill/list.do'/>" menuid="0701_01">세금계산서조회</a>
			</li>
		</ul>
		<!--// service_menu -->
	</div>
</div>
<script type="text/javascript">
	$(function() {
		//closeAlartPopup($("#loadingPopup"));

		$("#seller_service_menu > a").click(function() {
			showAlartPopup($("#loadingPopup"));
		});

		$("#service_menu > a").click(function() {
			showAlartPopup($("#loadingPopup"));
		});

		var currMenuId = '${menuId}';
		var memberClass = '${user.membClass}';

		if (memberClass == 'B') {
			$(".header .service_menu li.s_btn > a[menuId = " + currMenuId + "]").addClass("menu_selected");
		} else {
			$(".header .seller_service_menu li.s_btn > a[menuId = " + currMenuId + "]").addClass("menu_selected");
		}
	});
</script>