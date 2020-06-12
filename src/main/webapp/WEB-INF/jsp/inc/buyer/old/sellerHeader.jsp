<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="header">
	<div class="header">
		<h1>
			<a href="<c:url value='/seller/salesBilling/list.do'/>">
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
				<a href="<c:url value='/html/seller_manual_20150901.pdf'/>" target="_blank">HELP</a>
				<!-- <br>
					<div style="font-size: 13px; font-weight: bold; border: 1px solid #44227a; background-color: #FFFFFF; padding: 3px; margin-top: 10px;">
						<a href="<c:url value='/promo/detail.do?typ=0011'/>">
							대리점<br>현금담보 한도증액
						</a>
					</div> -->
			</li>
		</ul>
		<!--// global menu -->

		<!-- seller seller_service_menu -->
		<ul class="seller_service_menu">
			<li class="s_btn">
				<a href="<c:url value='/seller/companysBilling/list.do'/>" menuid="0202_01">수급현황(종합)</a>
			</li>
			<li class="s_btn mb5">
				<a href="<c:url value='/seller/salesBilling/list.do'/>" menuid="0302_01">수금내역(상세)</a>
			</li>
			<li class="s_btn mb5">
				<a href="<c:url value='/seller/unauthorized/list.do'/>" menuid="0502_01">기타수금 요청</a>
			</li>
			<li class="s_btn mb5">
				<a href="<c:url value='/seller/setOff/list.do'/>" menuid="1002_01">상계수금 요청</a>
			</li>
			<li class="s_btn mb5">
				<a href="<c:url value='/seller/accountReceivable/list.do'/>" menuid="0402_01">채권만기일 변경승인</a>
			</li>
			<li class="s_btn mb5">
				<a href="<c:url value='/seller/payment/list.do'/>" menuid="0902_01">수금내역조회</a>
			</li>
			
			<li class="s_btn mb5">
				<a href="<c:url value='/seller/taxBill/statusList.do'/>" menuid="0602_01">세금계산서발행</a>
			</li>
			
			<li class="s_btn mb5">
				<a href="<c:url value='/seller/taxBill/list.do'/>" menuid="0603_01">세금계산서진행조회</a>
			</li>
			
			<li class="s_btn mb5">
				<a href="<c:url value='/seller/loan/list.do'/>" menuid="0702_01">대출 가능 채권 조회</a>
			</li>
			
			<li class="s_btn mb5">
				<a href="<c:url value='/seller/limit/list.do'/>" menuid="0802_01">거래처 한도조회</a>
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

		if (memberClass == 'S') {
			$(".header .service_menu li.s_btn > a[menuId = " + currMenuId + "]").addClass("menu_selected");
		} else {
			$(".header .seller_service_menu li.s_btn > a[menuId = " + currMenuId + "]").addClass("menu_selected");
		}
	});
</script>