<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	/**
	* @Class Name : accountReceivableList.jsp
	* @Description : 대리점 채권만기일 지정 List 화면
	* @Modification Information
	*
	*   수정일     수정자      수정내용
	*  -------    --------    ---------------------------
	*  2018.11.28  CDF Team    최초 생성
	*
	* author CDF Team
	* since 2018.11.28
	*
	*/
%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="nowDate"><fmt:formatDate value="${now}" pattern="yyyy.MM.dd"/></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>채권만기일 지정</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/popup.css'/>">
	<!--[if lte IE 7]>
	<script type="text/javascript" src="<c:url value='/js/json2.js'/>" ></script>
	<![endif]-->
	<script type="text/javascript" src="<c:url value='/js/jquery-1.10.2.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery-ui.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery.easing.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery.bxslider.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/select.js'/>"></script>
</head>
<body class="main">
	<div id="mask" style="width: 1453px; height: 480px;"></div>

	<!-- header -->
	<c:import url="../../inc/buyer/old/header.jsp" />
	<!--// header -->

	<div id="wrap">
		<div id="container">
			<div id="contents">
				<!-- title -->
				<h2 class="hidden">채권만기일 지정</h2>
				<!-- // title -->

				<!-- 검색조건 -->
				<form name="searchForm" method="post" id="searchForm" class="mt20" action="<c:url value='/buyer/accountReceivable/list2.do'/>">
					<input type="hidden" name="sellerBizNo" id="sellerBizNo" value="${params.sellerBizNo }" />
					<input type="hidden" name="groupType" id="groupType" value="${params.groupType }" />
					<fieldset>
						<legend>검색폼</legend>
						<table class="tbl_search" summary="">
							<caption>조회</caption>
							<colgroup>
								<col width="130" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">검색조건</th>
									<td>
										<p>
											<label for="searchDate" class="hidden">조회 시작날짜 선택</label><input type="text" name="searchDate" id="searchDate" class="input ac mr5 EnterKeyDown" style="width: 95px;" value="${params.searchDate }" />
											<img onclick="dateClick('searchDate')" src="<c:url value='/images/ico/ico_calendar.gif'/>" alt="검색 시작날짜 선택" />
											<input type="radio" class="mr5 ml5" value="2" checked="checked" /><a href="javascript:;" id="allRadio" class="mr15 fb">All</a>
											<input type="radio" class="mr5" value="0" /><a href="javascript:;" id="hyundaiRadio" class="mr15 fb">현대</a>
											<input type="radio" class="mr5" value="1" /><a href="javascript:;" id="kiaRadio" class="mr15 fb">기아</a>
										</p>
										<p class="mt10">
										<input id="searchKeyword" name="searchKeyword" value="${params.searchKeyword }" placeholder="상호 선택" class="input mr15 businessKeyword" type="text" readonly="readonly" ondragenter="return false" ondragover="return false" ondrop="return false;">
											<span class="btn btn_normal">
												<a href="javascript:;" onclick="searchClick('<c:url value='/buyer/officesItem/list.do'/>')" style="width: 80px;" class="btn_search_click">찾기</a>
											</span> <span class="btn btn_normal">
												<a href="javascript:;" onclick="searchMyItemsClick('<c:url value='/buyer/myOfficesItem/list.do'/>','834','600')" style="width: 80px;">My 거래처</a>
											</span> <span class="btn btn_normal">
												<a id="searchButton" href="javascript:;" style="width: 80px;">조회하기</a>
											</span>
										</p>
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</form>
				<!-- // 검색조건 -->

				<br />
				<br />

				<!-- 업체별 지급현황 -->
				<h3 class="hidden">매출채권 생성</h3>
				<h3>해당월 ( ${params.searchDate } ) 매출의 기산일은 ${params.valueDate } 이며, 적수 65일의 만기일은 ${params.expirationDate }입니다.</h3>

				<div id="unspecified">
					<!-- 컨텐츠 입력 -->
					<c:if test="${params.groupType ne '1'}">
					<h3 class="ptxt">현대</h3>
					<table border="1" class="tbl3 tbl5 mb15" summary="승인 확인을 위한 거래내역 확인 내용입니다.">
						<caption>발행금액, 만기일, 적수, 발행일 확인</caption>
						<colgroup>
							<col width="20%">
							<col width="25%">
							<col width="25%">
							<col width="25%">
							<col width="5%">
						</colgroup>
						<thead>
							<tr>
								<th scope="row">발행일</th>
								<th scope="row">발행가능금액</th>
								<th scope="row">발행금액</th>
								<th scope="row">만기일</th>
								<th scope="row" style="color: #f7f7f7;">적수</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty listH }">
								<tr>
									<td colspan="5" class="text_center">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
								</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${listH }" varStatus="status" begin="0" end="4">
									<tr>
										<td>
											<label class="hidden" for="hdStartDate${status.count }"></label>
											<label style="width: 120px; text-align: center;" id="hdStartDate${status.count }" name="hdStartDate${status.count }">${item.issueDate }</label>
										</td>
										<td id="hdFinalDateUnpay" class="hdFinalDateUnpay" finalDateUnpay="${item.account }" isExtraAmount="${item.isExtraAmount }"><fmt:formatNumber value="${item.account }" pattern="#,###" /></td>
										<td>
											<label class="hidden" for="hdAmountOfMoney${status.count }"></label>
											<input type="text" style="width: 120px; text-align: right" id="hdAmountOfMoney${status.count }" name="hdAmountOfMoney${status.count }" class="input hdAmountOfMoney rightClick" period1Use="0" period2Use="0" period3Use="0" />
										</td>
										<td>
											<label class="hidden" for="hdExpirationDate${status.count }"></label>
											<input class="input popEndDate rightClick" type="text" style="width: 120px; text-align: center;" id="hdExpirationDate${status.count }" name="hdExpirationDate${status.count }" />
										</td>
										<td id="hdExpirationAvg${status.count }" style="color: white;">
											<label class="hidden" for="hdExpirationAvg${status.count }"></label>
											0
										</td>
									</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					</c:if>

					<c:if test="${params.groupType ne '0'}">
					<h3 class="ptxt">기아</h3>
					<table border="1" class="tbl3 tbl5 mb15" summary="승인 확인을 위한 거래내역 확인 내용입니다.">
						<caption>발행금액, 만기일, 적수, 발행일 확인</caption>
						<colgroup>
							<col width="20%">
							<col width="25%">
							<col width="25%">
							<col width="25%">
							<col width="5%">
						</colgroup>
						<thead>
							<tr>
								<th scope="row">발행일</th>
								<th scope="row">발행가능금액</th>
								<th scope="row">발행금액</th>
								<th scope="row">만기일</th>
								<th scope="row" style="color: #f7f7f7;">적수</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty listH }">
								<tr>
									<td colspan="5" class="text_center">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
								</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${listK }" varStatus="status" begin="0" end="4">
									<tr>
										<td>
											<label class="hidden" for="kiaStartDate${status.count }"></label>
											<label style="width: 120px; text-align: center;" id="kiaStartDate${status.count }" name="kiaStartDate${status.count }">${item.issueDate }</label>
										</td>
										<td id="kiaFinalDateUnpay" class="kiaFinalDateUnpay" finalDateUnpay="${item.account }" isExtraAmount="${item.isExtraAmount }"><fmt:formatNumber value="${item.account }" pattern="#,###" /></td>
										<td>
											<label class="hidden" for="kiaAmountOfMoney${status.count }"></label>
											<input type="text" style="width: 120px; text-align: right" id="kiaAmountOfMoney${status.count }" name="kiaAmountOfMoney${status.count }" class="input kiaAmountOfMoney rightClick" period1Sum="0" period2Sum="0" period3Sum="0" />
										</td>
										<td>
											<label class="hidden" for="kiaExpirationDate${status.count }"></label>
											<input class="input popEndDate rightClick" type="text" style="width: 120px; text-align: center;" id="kiaExpirationDate${status.count }" name="kiaExpirationDate${status.count }" />
										</td>
										<td id="kiaExpirationAvg${status.count }" style="color: white;">
											<label class="hidden" for="kiaExpirationAvg${status.count }"></label>
											0
										</td>
									</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					</c:if>

					<div class="btn_group ac mb15">
						<span class="btn btn_popup btn_popup3">
							<a id="noPub" onclick="javascript:return false;">발행이 불가능합니다.</a>
						</span>
					</div>

					<div class="btn_group ac mb15">
						<span class="btn btn_popup btn_popup3">
							<a id="issueOk1" onclick="javascript:return false;">발행</a>
						</span>
					</div>
				</div>

				<!-- 기타지급 알림 -->
				<div id="alertExtraPopup" class="alertLayer_popup">
					<dl>
						<dt>
							기타 지급 요청이 있습니다. <br> 기타 지급 요청 금액만큼 발행가능 금액이 차감되므로 먼저 처리해 주시기 바랍니다.
						</dt>
						<dd>
							<span class="btn btn_normal">
								<a class="noPrice_issueOk" href="#" style="width: 80px;">확인</a>
							</span>
						</dd>
					</dl>
				</div>
				<!-- // 기타지급 알림 -->

				<!-- 연체 경고 -->
				<div id="alertDishonoredPopup1" class="alertLayer_popup">
					<dl>
						<dt>
							연체 중에는 연체 시작일 이후 매출에 대하여<br> 매출채권 발행이 제한됩니다.
						</dt>
						<dd>
							<span class="btn btn_normal">
								<a class="noPrice_issueOk" href="#" style="width: 80px;">확인</a>
							</span>
						</dd>
					</dl>
				</div>
				<!-- // 연체 경고 -->

				<!-- 부도 경고 -->
				<div id="alertDishonoredPopup2" class="alertLayer_popup">
					<dl>
						<dt>
							부도 중에는 연체 시작일 이후 매출에 대하여<br> 매출채권 발행이 제한됩니다.
						</dt>
						<dd>
							<span class="btn btn_normal">
								<a class="noPrice_issueOk" href="#" style="width: 80px;">확인</a>
							</span>
						</dd>
					</dl>
				</div>
				<!-- // 부도 경고 -->

				<!-- 금액, 만기일을 입력 안했을 경우 뜨는 팝업 -->
				<div id="noInput_issuePopup" class="alertLayer_popup">
					<dl>
						<dt>금액을 입력하세요</dt>
						<dd>
							<span class="btn btn_normal">
								<a class="noPrice_issueOk" href="#" style="width: 80px;">확인</a>
							</span>
						</dd>
					</dl>
				</div>
				<!-- // 금액, 만기일을 입력 안했을 경우 뜨는 팝업 -->

				<div id="issuePopup" class="alertLayer_popup">
					<dl>
						<dt>해당 내역을 발행승인 하시겠습니까?</dt>
						<dd>
							<span class="btn btn_normal" onclick="issueCancel2()">
								<a id="issueCancel2" href="#" style="width: 80px;">취소</a>
							</span>
							<span class="btn btn_normal" onclick="issueOk2()">
								<a id="issueOk2" href="#" style="width: 80px;">승인</a>
							</span>
						</dd>
					</dl>
				</div>

				<div id="exp_popup" class="alertLayer_popup">
					<dl>
						<dt>적수일자가 월별 지정가능 최대 만기일 65일을 초과하였습니다. 만기일을 다시 설정해 주세요.</dt>
						<dd>
							<span class="btn btn_normal" onclick="expOk2()">
								<a id="expOk2" href="#" style="width: 80px;">확인</a>
							</span>
						</dd>
					</dl>
				</div>

				<div id="exp_popup2" class="alertLayer_popup">
					<dl>
						<dt>적수일자가 개별 지정가능 최대 만기일 180일을 초과하였습니다. 만기일을 다시 설정해 주세요.</dt>
						<dd>
							<span class="btn btn_normal" onclick="expOk2()">
								<a id="expOk2" href="#" style="width: 80px;">확인</a>
							</span>
						</dd>
					</dl>
				</div>

				<!-- 매출채권-->
				<input type="hidden" id="unpayJson" value="<c:url value='/buyer/salesBilling/unspecified.json'/>">
				<input type="hidden" id="itemShopCode" value="">
				<input type="hidden" id="salesDate" value="${params.searchDate }">

				<!-- 그룹별 세금계산서 발행가능금액 -->
				<input type="hidden" id="hdPeriod1Bal" value="${taxBillH.peri001BalMoney }">
				<input type="hidden" id="hdPeriod2Bal" value="${taxBillH.peri002BalMoney }">
				<input type="hidden" id="hdPeriod3Bal" value="${taxBillH.peri003BalMoney }">
				<input type="hidden" id="kiaPeriod1Bal" value="${taxBillK.peri001BalMoney }">
				<input type="hidden" id="kiaPeriod2Bal" value="${taxBillK.peri002BalMoney }">
				<input type="hidden" id="kiaPeriod3Bal" value="${taxBillK.peri003BalMoney }">

				<!-- 한도정보 -->
				<input type="hidden" id="salesLimit" value="">
				<input type="hidden" id="remainingLimit" remainingLimit="" value="">
				<input type="hidden" id="overLimit" value="">

				<!-- 연체/부도 여부 -->
				<input type="hidden" id="dishoneredCode" value="NNNN">

				<!-- 초과수금 금액 -->
				<input type="hidden" id="totalOverPayment" value="0">

				<!-- 인증서체크 -->
				<input type="hidden" id="certificateUrl" value="<c:url value='/certificateCheck.json'/>">

				<!-- 대리점 공통 -->
				<c:import url="buyerCommon.jsp" />
				<!-- // 대리점 공통 -->
			</div>
			<!-- // #contents -->
		</div>
		<!-- // #container -->
	</div>
	<!-- // #wrap -->

	<!-- footer -->
	<c:import url="../../inc/logedfooter.jsp" />
	<!--// footer -->

	<!-- 인증서 -->
	<script type="text/javascript" src="<c:url value='/js/customer/TSToolkitObject.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/customer/TSToolkitConfig.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/global.js?ver=1.1'/>"></script>
	<script type="text/javascript">
		var isClicked = false;
		var isKeyProcess = false;
		var isMouseProcess = false;

		$(function() {
			/*************** 부품 B2B론 알림 팝업 ***************/
			var overPaymentPopup = $("#overPaymentPopup");
			var url = "<c:url value='/buyer/overpay/list.do'/>";

			$(document).keydown(function(e) {
				if (isClicked) {
					if (e.which === 116) {
						if (typeof event == "object") {
							event.keyCode = 0;
						}
						alert("매출채권 발행중입니다. 잠시만 기다려주세요.");
						return false;
					} else if (e.which === 82 && e.ctrlKey) {
						alert("매출채권 발행중입니다. 잠시만 기다려주세요.");
						return false;
					}
				}
			});

			//pb2bln_
			//id가 없으면 생성
			if (overPaymentPopup.length <= 0) {
				$('body').append('<div id="overPaymentPopup" class = "pop_wrap layer_popup" style="width: 665px; overFlow : hidden;"></div>');
			} else { //id가 있으면 삭제하고 생성
				$('#overPaymentPopup').remove();
				$('body').append('<div id="overPaymentPopup" class = "pop_wrap layer_popup" style="width: 665px; overFlow : hidden;"></div>');
			}

			//초과수금 체크
			if (Number($("#totalOverPayment").val()) > 0) {
				$("#overPaymentPopup").load(url, "ovarpayment", function(responseText, textStatus, XMLHttpRequest) {
					if (textStatus == "success") {
						var overPayment = $("#overPaymentPopup #overPayment");
						if (overPayment.length > 0) {
							//부모창 불투명 처리
							//event.preventDefault();
							wrapWindowByMask($("#overPaymentPopup"));

							$("#overPaymentPopup").css("visibility", "visible");
							$("#overPaymentPopup").fadeIn("slow");
						}
					} else if (textStatus == "error") {
						$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + XMLHttpRequest.status + "\n" + "ERROR : " + XMLHttpRequest.statusText);
						$("#ajaxErrorPopup").css("visibility", "visible");
						$("#ajaxErrorPopup").fadeIn("show");
					}
				});
				$("#overpay_popup").fadeIn("slow");
			}

			//업체별 지급내역 현황 조회
			$("#searchButton").click(function(e) {
				//찾기 & My 거래처 데이터 체크
				if ($("#searchForm").toArray()[0][0].value == "") {
					$("#notChoicePopup").css("visibility", "visible");
					$("#notChoicePopup").fadeIn("show");
					return false;
				}

				$("#searchForm").submit();
			});

			$(".popokbtn").click(function() {
				$(".abc").fadeOut("slow");
				return false;
			});

			//승인
			$("#issueOk1").click(function() {
				$('html, body').animate({
					scrollTop: 0
				}, 0); //화면 위로 이동

				var tempHtml = $("#issuePopup").html();
				$("#issuePopup").remove();
				$('body').append('<div id="issuePopup" class="alertLayer_popup">' + tempHtml + '</div>');
				wrapWindowByMask($("#issuePopup"));
				position_cm($("#issuePopup"));
				$("#issuePopup").fadeIn("slow"); //정상 발행
			});

			// 취소
			$("#issueCancel1").click(function() {
				//불투명 처리 해제
				$("#mask").hide();
				$("#unspecifiedPopup").fadeOut("slow");

				return false;
			});

			//noPrice_issueOk
			$(".noPrice_issueOk").click(function() {
				$(".alertLayer_popup").fadeOut("slow");

				return false;
			});

			//close 버튼
			$("div > #closePopup").click(function() {
				//불투명 처리 해제
				$("#mask").hide();
				$("#unspecifiedPopup").fadeOut("slow");

				return false;
			});

			var isLeftRight = false;
			$("input").keydown(function(event) {
				if (isMouseProcess) {
					return false;
				}

				isKeyProcess = true;

				if (event.which == 46) {
					//$(this).keyup();
					return;
				}

				if (event.which == 37) {
					isLeftRight = true;
					//$(this).keyup();
					return;
				}

				if (event.which == 39) {
					isLeftRight = true;
					//$(this).keyup();
					return;
				}

				//탭처리
				if (event.which == 9) {
					var name = "";
					var idx = "";
					var groupName = "";

					if ($(this).attr("id").length == 18) {
						name = $(this).attr("id").substr(0, 17);
						idx = Number($(this).attr("id").substr(17, 1));
						groupName = "kia";
					} else if ($(this).attr("id").length == 17) {
						name = $(this).attr("id").substr(0, 16);
						idx = Number($(this).attr("id").substr(16, 1));

						if (name == "hdExpirationDate")
							groupName = "hd";
						else
							groupName = "kia";
					} else if ($(this).attr("id").length == 16) {
						name = $(this).attr("id").substr(0, 15);
						idx = Number($(this).attr("id").substr(15, 1));
						groupName = "hd";
					}

					if (name == "kiaAmountOfMoney" || name == "hdAmountOfMoney") {
						$("#" + groupName + "ExpirationDate" + (idx).toString()).blur();
						$("#" + groupName + "ExpirationDate" + (idx).toString()).click();
						//$("#" + groupName + "ExpirationDate" + (idx).toString()).select();
						$(this).keyup();
						return;
					} else if (name == "kiaExpirationDate" || name == "hdExpirationDate") {
						if (idx == 5) {
							groupName = (groupName == "hd" ? "kia" : "hd");
							$("#" + groupName + "AmountOfMoney1").blur();
							$("#" + groupName + "AmountOfMoney1").click();
							$(this).keyup();
							return;
						}
						$("#" + groupName + "AmountOfMoney" + (idx + 1).toString()).blur();
						$("#" + groupName + "AmountOfMoney" + (idx + 1).toString()).click();
						//$("#" + groupName + "AmountOfMoney" + (idx + 1).toString()).select();
						$(this).keyup();
						return;
					}
				}

				//쉬프트키 방지
				if (event.shiftKey) {
					event.shiftKey = false;
					event.which = 0;
				}

				//컨트롤키 막기
				if (event.ctrlKey) {
					event.ctrlKey = false;
					event.which = 0;
				}

				//엔터키 처리
				if (event.which == 13) {
					var name = "";
					var idx = "";
					var groupName = "";

					if ($(this).attr("id").length == 18) {
						name = $(this).attr("id").substr(0, 17);
						idx = Number($(this).attr("id").substr(17, 1));
						groupName = "kia";
					} else if ($(this).attr("id").length == 17) {
						name = $(this).attr("id").substr(0, 16);
						idx = Number($(this).attr("id").substr(16, 1));

						if (name == "hdExpirationDate")
							groupName = "hd";
						else
							groupName = "kia";
					} else if ($(this).attr("id").length == 16) {
						name = $(this).attr("id").substr(0, 15);
						idx = Number($(this).attr("id").substr(15, 1));
						groupName = "hd";
					}
					//idx = (idx == 5 ? 0 : idx);

					if (name == "kiaAmountOfMoney" || name == "hdAmountOfMoney") {
						//$("#" + groupName + "ExpirationDate" + (idx).toString()).blur();
						$("#" + groupName + "ExpirationDate" + (idx).toString()).click();
						$("#" + groupName + "ExpirationDate" + (idx).toString()).select();
						$(this).keyup();
						return;
					} else if (name == "hdExpirationDate" || name == "kiaExpirationDate") {
						if (idx == 5) {
							groupName = (groupName == "hd" ? "kia" : "hd");
							$("#" + groupName + "AmountOfMoney1").click();
							$("#" + groupName + "AmountOfMoney1").select();
							$(this).keyup();
							return;
						}

						if ($("#" + name + (idx).toString()).val() != null && $("#" + name + (idx).toString()).val() != "") {
							if ($("#" + groupName + "AmountOfMoney" + (idx + 1).toString()) != "" && $("#" + groupName + "AmountOfMoney" + (idx + 1).toString()) != "0") {
								/* $("#" + groupName + "AmountOfMoney" + (idx + 1).toString()).click();
								$("#" + groupName + "AmountOfMoney" + (idx + 1).toString()).select(); */
							}
						} else {
							//$("#" + groupName + "ExpirationAvg" + (idx).toString()).text("0");
						}

						$("#" + groupName + "AmountOfMoney" + (idx + 1).toString()).click();
						$("#" + groupName + "AmountOfMoney" + (idx + 1).toString()).select();
						$(this).keyup();
						return;
					}

					$(this).keyup();
					return;
				}

				if (event.which && ((event.which > 47 && event.which < 58) || (event.which > 95 && event.which < 106) || event.which == 8)) {
					//alert('숫자임!');
					if (event.which == 8) {
						if ($(this).val() == "0") {
							$(this).val("");
						}
					}
				} else {
					//alert('숫자아님!');
					//event.preventDefault();
					return false;
				}

				if (event.which != 8 && event.which != 37 && event.which != 39) {
					var name = "";
					var idx = 0;
					var groupName = "";
					if ($(this).attr("id").length == 18) {
						name = $(this).attr("id").substr(0, 17);
						idx = Number($(this).attr("id").substr(17, 1));
						groupName = "kia";
					} else if ($(this).attr("id").length == 17) {
						name = $(this).attr("id").substr(0, 16);
						idx = Number($(this).attr("id").substr(16, 1));

						if (name == "hdExpirationDate")
							groupName = "hd";
						else
							groupName = "kia";
					}

					if (name == "hdExpirationDate" || name == "kiaExpirationDate") {
						var textInputLength = getTextLength($(this).val());

						if (textInputLength == 10) {
							return false;
						}
						if (textInputLength == 4 || textInputLength == 7) {
							$(this).val($(this).val() + ".");
						}
					}
				}
			});

			$("input").keyup(function() {
				if (isMouseProcess)
					return false;
				if (isLeftRight) {
					isLeftRight = false;
					isKeyProcess = false;
					return false;
				}

				amountValueCheck(this);
				isKeyProcess = false;
			});

			function amountValueCheck(obj) {
				var name = "";
				var idx = "";
				var objId = "#" + obj.id;
				if ($(objId).attr("id").length == 17) {
					name = $(objId).attr("id").substr(0, 16);
					idx = $(objId).attr("id").substr(16, 1);
				} else if ($(objId).attr("id").length == 16) {
					name = $(objId).attr("id").substr(0, 15);
					idx = $(objId).attr("id").substr(15, 1);
				}
				//만기일 input창일경우
				if ($(objId).attr("id").length == 18) {
					name = $(objId).attr("id").substr(0, 17);
					idx = $(objId).attr("id").substr(17, 1);
				} else if ($(objId).attr("id").length == 17) {
					name = $(objId).attr("id").substr(0, 16);
					idx = $(objId).attr("id").substr(16, 1);
				}

				if (name == "kiaAmountOfMoney" || name == "hdAmountOfMoney") {
					if ($("#" + $(objId).attr("id")).val() == null || $("#" + $(objId).attr("id")).val() == "") {
						return;
					}
					var finalDateUnpay = Number($.trim(($("#" + (name == "kiaAmountOfMoney" ? "kia" : "hd") + "FinalDateUnpay").text()).toString().replace(/,/g, "")));
					var amount = Number(($("#" + $(objId).attr("id")).val()).toString().replace(/,/g, ""));
					// var remainingLimit = Number($("#remainingLimit").val());

					if (amount >= 0) {
						$(objId).val(amount);
					}

					if ((finalDateUnpay - amount) < 0) {
						$(objId).val(0);
					}

					if (amount <= 0) {
						$(objId).val(0);
					}


					if (remainingLimit < 0) {
						$(objId).val(0);
					}

					inputNumberFormat($(objId)[0]);
				}

				//만기일 input창
				if (name == "kiaExpirationDate" || name == "hdExpirationDate") {
					var textInputLength = $(objId).val().length;
					if (textInputLength == 10) {
						if (!datepickerDateCheck($(objId)[0])) {
							return false;
						}
					} else if (textInputLength > 10) {
						return false;
					}

					var nowDate = new Date();
					var finalDateUndate = $(objId).val();
					var lastChar = finalDateUndate.charAt(($(objId).val().length) - 1); //마지막으로 입력된 문자
				}
			}

			//blurEvent
			$("input").blur(function() { //input창에서 다른 곳으로 focus가 변경 될때 실행 된다.
				//키입력중 체크
				if (isKeyProcess) {
					return false;
				}
				isMouseProcess = true;

				var name = "";
				var idx = "";
				var groupName = "";

				if ($(this).attr("id").length == 18) {
					name = $(this).attr("id").substr(0, 17);
					idx = Number($(this).attr("id").substr(17, 1));
					groupName = "kia";
				} else if ($(this).attr("id").length == 17) {
					name = $(this).attr("id").substr(0, 16);
					idx = Number($(this).attr("id").substr(16, 1));

					if (name == "hdExpirationDate")
						groupName = "hd";
					else
						groupName = "kia";
				} else if ($(this).attr("id").length == 16) {
					name = $(this).attr("id").substr(0, 15);
					idx = Number($(this).attr("id").substr(15, 1));
					groupName = "hd";
				}

				if (name == "kiaAmountOfMoney" || name == "hdAmountOfMoney") {
					if ($(this).val() != null) {
						var totalAmount = Number($.trim($("#" + (name == "kiaAmountOfMoney" ? "kia" : "hd") + "FinalDateUnpay").attr("finalDateUnpay").replace(/,/g, "")));
						var useAmount = 0;
						$("." + (name == "kiaAmountOfMoney" ? "kia" : "hd") + "AmountOfMoney").each(function(obj) {
							var amount = 0;
							if ($(this).val() != "")
								amount = Number(($(this).val()).toString().replace(/,/g, ""));

							$("#" + obj.id).text(comma(totalAmount));
							totalAmount = (totalAmount - amount);
							useAmount += amount;
						});

						$("." + (name == "kiaAmountOfMoney" ? "kia" : "hd") + "FinalDateUnpay").each(function() {
							$(this).text((totalAmount).toLocaleString().split('.')[0]);
						});

						//잔여한도
						// $("#remainingLimit").val($("#remainingLimit").attr("remainingLimit") - useAmount);

						//적수계산
						if (($("#" + name + (idx).toString()).val() != "") && ($("#" + groupName + "ExpirationDate" + (idx).toString()).val() != null && $("#" + groupName + "ExpirationDate" + (idx).toString()).val() != "")) {

							checkSingleExpirationDate(this);

							checkExpirationDate(); //만기일 적수 계산

						} else {
							$("#" + groupName + "ExpirationAvg" + (idx).toString()).text("0");
						}
					}
				}

				isMouseProcess = false;
			});

			$("#errorOk01").click(function() {
				$("#expirationErrorPopup").fadeOut("slow");
				return false;
			});

			var dishoneredCode = $.trim($("#dishoneredCode").val());

			if (dishoneredCode.indexOf("Y") != -1) {
				if (dishoneredCode.substring(1, 2) == "Y" || dishoneredCode.substring(3, 4) == "Y") {
					$("#alertDishonoredPopup2").fadeIn("slow");
				} else if (dishoneredCode.substring(0, 1) == "Y" || dishoneredCode.substring(2, 3) == "Y") {
					$("#alertDishonoredPopup1").fadeIn("slow");
				}
			}

			//기타지급 요청 체크
			if ($("#hdFinalDateUnpay").attr("isExtraAmount") == "1") {
				$("#alertExtraPopup").fadeIn("slow");
			}
			if ($("#kiaFinalDateUnpay").attr("isExtraAmount") == "1") {
				$("#alertExtraPopup").fadeIn("slow");
			}
		});

		//만기일 적수 일자 정상유무
		var IsSuccessExpAvg = false;
		var IsSuccessSingleExpAvg = false;

		//만기일 적수 계산 체크
		function checkExpirationDate() {
			var dataObject = new Array(); // 배열 생성
			var arrayCount = 0; // idx
			var isHdParentZero = false; // isHd?
			var isKiaParentZero = false; // isKia?
			for (var i = 1; i <= 5; i++) {
				var hdDataObject = new Object(); // 현대 리스트 한줄한줄 데이타
				var kiaDataObject = new Object(); // 기아 리스트 한줄한줄 데이타

				//여기서 만기일 input창 null인지 공백인지 체크하는 조건식도 추가 할 것
				//금액이 공백이 아니고, flag가 false이고, 만기일input창이 공백 or null이 아니고
				if ((uncomma($("input[name=hdAmountOfMoney" + i + "]").val()) != "0" && isHdParentZero == false) && uncomma($("input[name=hdExpirationDate" + i + "]").val()) != null && uncomma($("input[name=hdExpirationDate" + i + "]").val()) != "") {
					hdDataObject.amountOfMoney = uncomma($("input[name=hdAmountOfMoney" + i + "]").val()); //input창에 있는 금액이 object에  set
					hdDataObject.issueDate = $.trim($("#hdStartDate" + i).text());
					hdDataObject.expirationDate = $("input[name=hdExpirationDate" + i + "]").val();
					hdDataObject.sellerBizNumber = $("input[name=itemShopCode]").val();
					hdDataObject.buyerBizNumber = $("input[name=memberNumber]").val();
					hdDataObject.groupType = "0";
					hdDataObject.expirationAvg = $.trim($("#hdExpirationAvg" + i).text());
					hdDataObject.salesDate = $("#salesDate").val();
				} else {
					isHdParentZero = true;
				}
				//금액이 공백이 아니고, flag가 false이고, 만기일input창이 공백 or null이 아니고
				if ((uncomma($("input[name=kiaAmountOfMoney" + i + "]").val()) != "0" && isKiaParentZero == false) && uncomma($("input[name=kiaExpirationDate" + i + "]").val()) != null && uncomma($("input[name=kiaExpirationDate" + i + "]").val()) != "") {
					kiaDataObject.amountOfMoney = uncomma($("input[name=kiaAmountOfMoney" + i + "]").val());
					kiaDataObject.issueDate = $.trim($("#kiaStartDate" + i).text());
					kiaDataObject.expirationDate = $("input[name=kiaExpirationDate" + i + "]").val();
					kiaDataObject.sellerBizNumber = $("input[name=itemShopCode]").val();
					kiaDataObject.buyerBizNumber = $("input[name=memberNumber]").val();
					kiaDataObject.groupType = "1";
					kiaDataObject.expirationAvg = $.trim($("#kiaExpirationAvg" + i).text());
					kiaDataObject.salesDate = $("#salesDate").val();
				} else {
					isKiaParentZero = true;
				}

				var isKia = true;
				var isHd = true;
				if (kiaDataObject.amountOfMoney == null || kiaDataObject.issueDate == null || kiaDataObject.expirationDate == null || kiaDataObject.amountOfMoney == '' || kiaDataObject.issueDate == '' || kiaDataObject.expirationDate == '') {
					isKia = false;
				}
				if (hdDataObject.amountOfMoney == null || hdDataObject.issueDate == null || hdDataObject.expirationDate == null || hdDataObject.amountOfMoney == '' || hdDataObject.issueDate == '' || hdDataObject.expirationDate == '') {
					isHd = false;
				}

				if ((isKia == true) && (isHd == true)) {
					dataObject[arrayCount++] = hdDataObject;
					dataObject[arrayCount++] = kiaDataObject;
				} else if (isKia == true) {
					dataObject[arrayCount++] = kiaDataObject;
				} else if (isHd == true) {
					dataObject[arrayCount++] = hdDataObject;
				} else {
					//예외처리 팝업필요
					$("#loadingPopup").css("visibility", "hidden");
					$("#issuePopup").fadeOut("slow");

					continue;
				}
			} // end for

			if (dataObject.length == 0) {
				for (var i = 1; i <= 5; i++) {
					$("#hdExpirationAvg" + (i)).text("0");
					$("#kiaExpirationAvg" + (i)).text("0");
				}
				return false;
			}

			var ajaxUrl = "expirationAvg.json";
			var jsonData = "jsonData=" +
				(JSON.stringify(dataObject));
			//+ "&limitData=" + (JSON.stringify(limitData));

			$.ajax({
				url: ajaxUrl,
				type: "post",
				data: jsonData,
				dataType: "json",
				success: function(data) {
					var get_data = eval(data);
					var expAvgH = 0;
					var expAvgK = 0;
					if (get_data.length > 0) {
						for (var i = 1; i <= 5; i++) {
							$("#hdExpirationAvg" + (i)).text("0");
							$("#kiaExpirationAvg" + (i)).text("0");
						}

						for (var i = 0, j = 1, k = 1; i < get_data.length; i++) {
							if (get_data[i].groupType == "0") {
								$("#hdExpirationAvg" + (j++)).text(get_data[i].expirationAvgH);
								expAvgH = Number(get_data[i].expirationAvgH);
							} else if (get_data[i].groupType == "1") {
								$("#kiaExpirationAvg" + (k++)).text(get_data[i].expirationAvgK);
								expAvgK = Number(get_data[i].expirationAvgK);
							}
						}
					}

					$("#loadingPopup").css("visibility", "hidden");

					if (expAvgH > 65 || expAvgK > 65) {
						$("#expitation_popup2").css("visibility", "visible");
						$("#expitation_popup2").fadeIn("show");
						IsSuccessExpAvg = false;
						isClicked = false;

						return false;
					}
					IsSuccessExpAvg = true;
				},

				error: function(request, status, error) {
					isClicked = false;
					$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + request.status + "\n" + "ERROR : " + error);
					$("#ajaxErrorPopup").css("visibility", "visible");
					$("#ajaxErrorPopup").fadeIn("show");
				}
			});

			$("#mask").hide();
			$("#loadingPopup").css("visibility", "hidden");
			$("#issuePopup").fadeOut("slow");
			isClicked = false;

			return false;
		}

		function checkSingleExpirationDate(obj) {
			var name = "";
			var idx = "";
			if (obj.name.length == 17) {
				name = obj.name.substr(0, 16);
				idx = obj.name.substr(16, 1);
			} else if (obj.name.length == 18) {
				name = obj.name.substr(0, 17);
				idx = obj.name.substr(17, 1);
			}

			if (name == "hdExpirationDate" || name == "kiaExpirationDate") {
				var groupName = (name == "hdExpirationDate" ? "hd" : "kia");
				var searchDate = currentDate($("#searchForm #searchDate").val());
				var gisanDate = new Date(searchDate.getFullYear(), (searchDate.getMonth() + 1), 1);

				var period1Bal = Number($("#" + groupName + "Period1Bal").val());
				var period2Bal = Number($("#" + groupName + "Period2Bal").val());
				var period3Bal = Number($("#" + groupName + "Period3Bal").val());

				for (var i = 1; i <= 5; i++) {
					var expAvg = 0;
					var expirationDate = currentDate($("#" + groupName + "ExpirationDate" + i).val());
					expAvg = getDateDiff(expirationDate, gisanDate);
					var amount = Number($.trim($("#" + groupName + "AmountOfMoney" + i).val().replace(/,/g, "")));
					var itemAmount = amount;
					var period1Use = 0;
					var period2Use = 0;
					var period3Use = 0;

					if (expirationDate == null || expirationDate == "" || amount == null || amount == "" || amount == "0") {
						//$("#" + groupName + "ExpirationAvg" + i).text(0);
						continue;
					}



					//1구간 계산
					if (amount > 0) {
						if (period1Bal >= amount) {
							period1Bal -= amount;
							period1Use = (amount * expAvg);
							amount = 0;
						} else {
							period1Use = (period1Bal * expAvg);
							amount -= period1Bal;
							period1Bal = 0;
						}
					}
					//2구간 계산
					if (amount > 0) {
						if (period2Bal >= amount) {
							period2Bal -= amount;
							period2Use = (amount * expAvg);
							amount = 0;
						} else {
							period2Use = (period2Bal * expAvg);
							amount -= period2Bal;
							period2Bal = 0;
						}
					}
					//3구간 계산
					if (amount > 0) {
						if (period3Bal >= amount) {
							period3Bal -= amount;
							period3Use = (amount * expAvg);
							amount = 0;
						} else {
							period3Use = (period3Bal * expAvg);
							amount -= period3Bal;
							period3Bal = 0;
						}
					}
					$("#" + groupName + "AmountOfMoney" + i).attr("period1Use", period1Use);
					$("#" + groupName + "AmountOfMoney" + i).attr("period2Use", period2Use);
					$("#" + groupName + "AmountOfMoney" + i).attr("period3Use", period3Use);



					if (expAvg >= 180) {
						$("#expitation_popup").css("visibility", "visible");
						$("#expitation_popup").fadeIn("show");
						IsSuccessSingleExpAvg = false;
						return false;
					}
					IsSuccessSingleExpAvg = true;
				}
			}

			return false;
		}

		// parsing input data to date form
		function parsingToDate(obj) {
			var name = "";
			var idx = "";

			if (obj.name.length == 17) {
				name = obj.name.substr(0, 16);
				idx = obj.name.substr(16, 1);
			} else if (obj.name.length == 18) {
				name = obj.name.substr(0, 17);
				idx = obj.name.substr(17, 1);
			}

			var inputDate = $("#" + name + idx).val();
			var tempDate = inputDate.replace(/\./gi, ""); // dot 제거

			var strYear = tempDate.substring(0, 4); //년
			var strMonth = tempDate.substring(4, 6); //월
			var strDate = tempDate.substring(6, 8); //일

			var nowDate = new Date();
			var comapareDate = new Date(Number(strYear), Number(strMonth) - 1, Number(strDate));
			var outputDate = nowDate.getFullYear() + "." + (nowDate.getMonth() + 1 < 10 ? ("0" + (nowDate.getMonth() + 1)) : (nowDate.getMonth() + 1)) +
				"." + (nowDate.getDate() < 10 ? "0" + nowDate.getDate() : nowDate.getDate());

			if (tempDate.length > 8) { //8글자가 넘어 오류입력 100% 이므로 현재 날자로 디폴트 입력 하게 함
				$("#" + name + idx).val(outputDate); // input창에 날자 넣음
				$("#expirationErrorPopup dt").text("날짜를 길게 입력 하셨습니다."); //div 내용 변경
				$("#expirationErrorPopup").fadeIn("slow");

				return false;
			} else if (tempDate.length > 0 && tempDate.length < 3) { //2자이하가 입력 됐을 경우 데이에 더한다
				var afterDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate() + Number(tempDate));
				var outputDate = afterDay.getFullYear() + "." + (afterDay.getMonth() < 10 ? ("0" + (afterDay.getMonth())) : (afterDay.getMonth())) +
					"." + (afterDay.getDate() < 10 ? ("0" + afterDay.getDate()) : afterDay.getDate());
				$("#" + name + idx).val(outputDate);
				return false;
			} else if (tempDate.length == 8 && nowDate.getTime() > comapareDate.getTime()) { // 과거를 입력한 경우
				if (Number(strYear) == nowDate.getFullYear() && Number(strMonth) == nowDate.getMonth() + 1 && Number(strDate) == nowDate.getDate()) {

				} else {
					$("#expirationErrorPopup dt").text("만기일을 과거로 지정 하실 수 없습니다."); //div 내용 변경
					$("#expirationErrorPopup").fadeIn("slow");
				}
				$("#" + name + idx).val(outputDate);
				return false;
			} else if (tempDate.length == 8) {
				var parseDate = new Date(Number(strYear), Number(strMonth - 1), Number(strDate));
				var tempStr = parseDate.getFullYear() + "." + (parseDate.getMonth() + 1 < 10 ? ("0" + (parseDate.getMonth() + 1)) : (parseDate.getMonth() + 1)) +
					"." + (parseDate.getDate() < 10 ? "0" + parseDate.getDate() : parseDate.getDate());
				$("#" + name + idx).val(tempStr);
				return false;
			} else { //모르는 에러는 다시 입력
				$("#" + name + idx).val(outputDate);
				$("#expirationErrorPopup dt").text("날짜를 양식에 맞게 다시 입력 해주세요."); //div 내용 변경
				$("#expirationErrorPopup").fadeIn("slow");
			}
		} // end parsingToDate

		//승인 취소
		var issueCancel2 = function() {
			$("#mask").hide();
			$("#issuePopup").fadeOut("slow");
		};
		//승인 확인
		var expOk2 = function() {
			$("#mask").hide();
			$("#exp_popup").fadeOut("slow");
			$("#exp_popup2").fadeOut("slow");
		};

		//발행버튼
		var issueOk2 = function() {
			if (isClicked) {
				return false;
			}
			isClicked = true;

			$("#loadingPopup").css("visibility", "hidden");
			$("#issuePopup").fadeOut("slow");

 			//적수체크
			if (IsSuccessExpAvg == false) {
				//둘다 발행가능 금액이 없을 경우
				if (Number($.trim($("#hdFinalDateUnpay").text())) == 0 && Number($.trim($("#kiaFinalDateUnpay").text())) == 0) {
					$("#mask").hide();
					$("#loadingPopup").css("visibility", "hidden");
					$("#issuePopup").fadeOut("slow");
					$("#expirationErrorPopup dt").text("발행가능 금액이 있는 대리점을 먼저 선택해 주세요.");
					$("#expirationErrorPopup").fadeIn("slow");
					isClicked = false;

					return false;
				}
				//양쪽 다 발행 가능 금액이 있을 경우 걸린다.
				if (Number($.trim($("#hdFinalDateUnpay").text())) != 0 && $("input[name=hdAmountOfMoney1]").val() == "" || $("input[name=hdAmountOfMoney1]").val() == "0") {
					if (Number($.trim($("#kiaFinalDateUnpay").text())) == 0) {
						$("#mask").hide();
						$("#loadingPopup").css("visibility", "hidden");
						$("#issuePopup").fadeOut("slow");
						$("#expirationErrorPopup dt").text("첫 줄에 발행 금액을 입력해주세요.");
						$("#expirationErrorPopup").fadeIn("slow");
						isClicked = false;

						return false;
					}
				} else if (Number($.trim($("#hdFinalDateUnpay").text())) != 0 && ($("input[name=hdExpirationDate1]").val() == null || $("input[name=hdExpirationDate1]").val() == "")) {
					$("#mask").hide();
					$("#loadingPopup").css("visibility", "hidden");
					$("#issuePopup").fadeOut("slow");
					$("#expirationErrorPopup dt").text("만기일 지정이 안된 매출채권이 있습니다.");
					$("#expirationErrorPopup").fadeIn("slow");
					isClicked = false;

					return false;
				}
				if (Number($.trim($("#kiaFinalDateUnpay").text())) != 0 && $("input[name=kiaAmountOfMoney1]").val() == "" || $("input[name=kiaAmountOfMoney1]").val() == "0") {
					if (($("input[name=kiaExpirationDate1]").val() == null || $("input[name=kiaExpirationDate1]").val() == "")) {
						$("#mask").hide();
						$("#loadingPopup").css("visibility", "hidden");
						$("#issuePopup").fadeOut("slow");
						$("#expirationErrorPopup dt").text("첫 줄에 발행 금액을 입력해주세요.");
						$("#expirationErrorPopup").fadeIn("slow");
						isClicked = false;

						return false;
					} else {
						$("#mask").hide();
						$("#loadingPopup").css("visibility", "hidden");
						$("#issuePopup").fadeOut("slow");
						$("#expirationErrorPopup dt").text("금액이 설정되어있지 않은 매출채권이 있습니다.");
						$("#expirationErrorPopup").fadeIn("slow");
						isClicked = false;

						return false;
					}
				} else if (Number($.trim($("#kiaFinalDateUnpay").text())) != 0 && ($("input[name=kiaExpirationDate1]").val() == null || $("input[name=kiaExpirationDate1]").val() == "")) {
					$("#mask").hide();
					$("#loadingPopup").css("visibility", "hidden");
					$("#issuePopup").fadeOut("slow");
					$("#expirationErrorPopup dt").text("만기일 지정이 안된 매출채권이 있습니다.");
					$("#expirationErrorPopup").fadeIn("slow");
					isClicked = false;

					return false;
				}

				isClicked = false;
				var tempHtml = $("#exp_popup").html();
				$("#exp_popup").remove();
				$('body').append('<div id="exp_popup" class="alertLayer_popup">' + tempHtml + '</div>');
				position_cm($("#exp_popup"));
				$("#exp_popup").css("visibility", "visible");
				$("#exp_popup").fadeIn("show");
				IsSuccessExpAvg = false;

				return false;
			}

			if (IsSuccessSingleExpAvg == false) {
				isClicked = false;
				var tempHtml = $("#exp_popup2").html();
				$("#exp_popup2").remove();
				$('body').append('<div id="exp_popup2" class="alertLayer_popup">' + tempHtml + '</div>');
				position_cm($("#exp_popup2"));
				$("#exp_popup2").css("visibility", "visible");
				$("#exp_popup2").fadeIn("show");
				IsSuccessSingleExpAvg = false;

				return false;
			}

			var dataObject = new Array();
			var arrayCount = 0;
			var hdIndexCount = 0;
			var kiaIndexCount = 0;

			var isHdParentZero = false;
			var isKiaParentZero = false;
			var kiaDataIndexList = new Array();
			var hdDataIndexList = new Array();

			for (var i = 1; i <= 5; i++) {
				var hdDataObject = new Object();
				var kiaDataObject = new Object();

				hdDataObject.amountOfMoney = uncomma($("input[name=hdAmountOfMoney" + i + "]").val());
				hdDataObject.issueDate = $.trim($("#hdStartDate" + i).text());
				hdDataObject.expirationDate = $("input[name=hdExpirationDate" + i + "]").val();
				hdDataObject.sellerBizNumber = $("input[name=itemShopCode]").val();
				hdDataObject.buyerBizNumber = $("input[name=memberNumber]").val();
				hdDataObject.groupType = "0";
				hdDataObject.expirationAvg = $.trim($("#hdExpirationAvg" + i).text());
				hdDataObject.salesDate = $("#salesDate").val();

				kiaDataObject.amountOfMoney = uncomma($("input[name=kiaAmountOfMoney" + i + "]").val());
				kiaDataObject.issueDate = $.trim($("#kiaStartDate" + i).text());
				kiaDataObject.expirationDate = $("input[name=kiaExpirationDate" + i + "]").val();
				kiaDataObject.sellerBizNumber = $("input[name=itemShopCode]").val();
				kiaDataObject.buyerBizNumber = $("input[name=memberNumber]").val();
				kiaDataObject.groupType = "1";
				kiaDataObject.expirationAvg = $.trim($("#kiaExpirationAvg" + i).text());
				kiaDataObject.salesDate = $("#salesDate").val();

				var isKia = true; // ???
				var isHd = true; // ???

				// 기아 금액 체크
				if (kiaDataObject.amountOfMoney == null || kiaDataObject.amountOfMoney == "" || kiaDataObject.amountOfMoney == "0" || kiaDataObject.amountOfMoney == "undefined") {
					isKia = false; //기아 금액이 비어있으면 false
				} else {
					if (kiaDataObject.expirationDate == null || kiaDataObject.expirationDate == "") {
						$("#mask").hide();
						$("#loadingPopup").css("visibility", "hidden");
						$("#issuePopup").fadeOut("slow");
						$("#expirationErrorPopup dt").text("만기일 지정이 안된 매출채권이 있습니다.");
						$("#expirationErrorPopup").fadeIn("slow");
						isClicked = false;

						return false;
					}
					if (kiaDataObject.expirationAvg != null && kiaDataObject.expirationAvg != "") {
						var expAvg = Number(kiaDataObject.expirationAvg);
						if (expAvg > 180) {
							$("#mask").hide();
							$("#loadingPopup").css("visibility", "hidden");
							$("#issuePopup").fadeOut("slow");
							$("#expirationErrorPopup dt").text("적수일자가 개별 지정가능 최대 만기일 180일을 초과하였습니다. 만기일을 다시 설정해 주세요.");
							$("#expirationErrorPopup").fadeIn("slow");
							isClicked = false;

							return false;
						}
					}
				}

				// 기아 만기일 체크
				if (kiaDataObject.expirationDate == null || kiaDataObject.expirationDate == "" || kiaDataObject.expirationDate == "undefined") {
					isKia = false; // 만기일 null이면 false
				} else {
					if (kiaDataObject.amountOfMoney == null || kiaDataObject.amountOfMoney == "" || kiaDataObject.amountOfMoney == "0" || kiaDataObject.amountOfMoney == "undefined") {
						$("#mask").hide();
						$("#loadingPopup").css("visibility", "hidden");
						$("#issuePopup").fadeOut("slow");
						$("#expirationErrorPopup dt").text("금액이 설정되어있지 않은 매출채권이 있습니다.");
						$("#expirationErrorPopup").fadeIn("slow");
						isClicked = false;

						return false;
					}
					if (kiaDataObject.expirationAvg != null && kiaDataObject.expirationAvg != "") {
						var expAvg = Number(kiaDataObject.expirationAvg);
						if (expAvg > 180) {
							$("#mask").hide();

							$("#loadingPopup").css("visibility", "hidden");
							$("#issuePopup").fadeOut("slow");
							$("#expirationErrorPopup dt").text("적수일자가 개별 지정가능 최대 만기일 180일을 초과하였습니다. 만기일을 다시 설정해 주세요.");
							$("#expirationErrorPopup").fadeIn("slow");
							isClicked = false;

							return false;
						}
					}
				}
				//기아 43 => true
				if (kiaDataObject.expirationAvg == null || kiaDataObject.expirationAvg == "") {
					isKia = false;
				} else {
					var expAvg = Number(kiaDataObject.expirationAvg);
					if (expAvg > 180)
						iskia = false;
				}

				// 현대 금액 체크
				if (hdDataObject.amountOfMoney == null || hdDataObject.amountOfMoney == "" || hdDataObject.amountOfMoney == "0" || hdDataObject.amountOfMoney == "undefined") {
					isHd = false;
				} else {
					if (hdDataObject.expirationDate == null || hdDataObject.expirationDate == "") {
						$("#mask").hide();
						$("#loadingPopup").css("visibility", "hidden");
						$("#issuePopup").fadeOut("slow");
						$("#expirationErrorPopup dt").text("만기일 지정이 안된 매출채권이 있습니다.");
						$("#expirationErrorPopup").fadeIn("slow");
						isClicked = false;

						return false;
					}
					if (hdDataObject.expirationAvg != null && hdDataObject.expirationAvg != "") {
						var expAvg = Number(hdDataObject.expirationAvg);
						if (expAvg > 180) {
							$("#mask").hide();
							$("#loadingPopup").css("visibility", "hidden");
							$("#issuePopup").fadeOut("slow");
							$("#expirationErrorPopup dt").text("적수일자가 개별 지정가능 최대 만기일 180일을 초과하였습니다. 만기일을 다시 설정해 주세요.");
							$("#expirationErrorPopup").fadeIn("slow");
							isClicked = false;

							return false;
						}
					}
				}
				// 현대 만기일 체크
				if (hdDataObject.expirationDate == null || hdDataObject.expirationDate == "" || hdDataObject.expirationDate == "undefined") {
					isHd = false;
				} else {
					if (hdDataObject.amountOfMoney == null || hdDataObject.amountOfMoney == "" || hdDataObject.amountOfMoney == "0") {
						$("#mask").hide();

						$("#loadingPopup").css("visibility", "hidden");
						$("#issuePopup").fadeOut("slow");
						$("#expirationErrorPopup dt").text("금액이 설정되어있지 않은 매출채권이 있습니다.");
						$("#expirationErrorPopup").fadeIn("slow");
						isClicked = false;

						return false;
					}
					if (hdDataObject.expirationAvg != null && hdDataObject.expirationAvg != "") {
						var expAvg = Number(hdDataObject.expirationAvg);
						if (expAvg > 180) {
							$("#mask").hide();

							$("#loadingPopup").css("visibility", "hidden");
							$("#issuePopup").fadeOut("slow");
							$("#expirationErrorPopup dt").text("적수일자가 개별 지정가능 최대 만기일 180일을 초과하였습니다. 만기일을 다시 설정해 주세요.");
							$("#expirationErrorPopup").fadeIn("slow");
							isClicked = false;

							return false;
						}
					}
				}
				if (hdDataObject.expirationAvg == null || hdDataObject.expirationAvg == "") {
					isHd = false;
				} else {
					var expAvg = Number(hdDataObject.expirationAvg);
					if (expAvg > 180)
						isHd = false;
				}

				if ((isKia == true) && (isHd == true)) {
					kiaDataIndexList[kiaIndexCount++] = i - 1;
					hdDataIndexList[hdIndexCount++] = i - 1;
					dataObject[arrayCount++] = hdDataObject;
					dataObject[arrayCount++] = kiaDataObject;
				} else if (isKia == true) {
					kiaDataIndexList[kiaIndexCount++] = i - 1;
					dataObject[arrayCount++] = kiaDataObject;
				} else if (isHd == true) {
					hdDataIndexList[hdIndexCount++] = i - 1;
					dataObject[arrayCount++] = hdDataObject;
				} else {
					//$("#loadingPopup").css("visibility", "hidden");
					//$("#issuePopup").fadeOut("slow");
					continue;
				}
			}

			if (dataObject.length == 0) {
				for (var i = 1; i <= 5; i++) {
					$("#hdExpirationAvg" + (i)).text("0");
					$("#kiaExpirationAvg" + (i)).text("0");
				}
				$("#loadingPopup").css("visibility", "hidden");
				$("#issuePopup").fadeOut("slow");

				var nonValue = "";
				if ($("#hdAmountOfMoney1").val() == "0") {
					nonValue = "현대";
				}
				if ($("#kiaAmountOfMoney1").val() == "0") {
					nonValue += (nonValue == "현대" ? ", 기아" : "기아");
				}
				$("#mask").hide();
				$("#expirationErrorPopup dt").text("발행할 매출채권을 입력해 주세요. " + nonValue + " 첫번째 입력 금액이 0 입니다.");
				$("#expirationErrorPopup").fadeIn("slow");
				isClicked = false;

				return false;
			}

			for (var i = 0; i < hdDataIndexList.length; i++) {
				//중간에 비는 데이터 검증
				if (hdDataIndexList[i] != i) {
					$("#mask").hide();

					$("#loadingPopup").css("visibility", "hidden");
					$("#issuePopup").fadeOut("slow");
					$("#expirationErrorPopup dt").text("매출채권 정보를 순서대로 입력해주세요.");
					$("#expirationErrorPopup").fadeIn("slow");
					isClicked = false;

					return false;
				}
			}

			for (var i = 0; i < kiaDataIndexList.length; i++) {
				//중간에 비는 데이터 검증
				if (kiaDataIndexList[i] != i) {
					$("#mask").hide();
					$("#loadingPopup").css("visibility", "hidden");
					$("#issuePopup").fadeOut("slow");
					$("#expirationErrorPopup dt").text("매출채권 정보를 순서대로 입력해주세요.");
					$("#expirationErrorPopup").fadeIn("slow");
					isClicked = false;

					return false;
				}
			}

			var ajaxUrl = $("#unpayJson").val();
			var jsonData = "jsonData=" +
				(JSON.stringify(dataObject));
			//+ "&limitData=" + (JSON.stringify(limitData));

			//인증서모듈체크
			if (!HB2BLoanSign(jsonData, "", 0)) {
				$("#mask").hide();
				$("#loadingPopup").css("visibility", "hidden");
				$("#issuePopup").fadeOut("slow");
				isClicked = false;
				return false;
			}

			$.ajax({
				url: ajaxUrl,
				type: "post",
				data: jsonData,
				dataType: "json",
				success: function(data) {
					var get_data = eval(data);

					if (get_data["resultMessage"] == "Success") { //성공
						$("#unspecifiedPopup").fadeOut("slow");

						$("#message_popup").find("dt").text("매출채권이 정상적으로 생성되었습니다.");
						var tempHtml = $("#message_popup").html();
						$("#message_popup").remove();
						$('body').append('<div id="message_popup" class="alertLayer_popup style="visibility: hidden">' + tempHtml + '</div>');

						$("#messageOk").click(function() {
							$(".abc").fadeOut("slow");
							$("#mask").hide();
							$("#searchButton").click();

							return false;
						});

						position_cm($("#message_popup"));

						$("#message_popup").css("visibility", "visible");
						$("#message_popup").fadeIn("show");
						isClicked = false;

					} else { //실패
						$("#unspecifiedPopup").fadeOut("slow");

						if (get_data["resultCode"] == "210") {
							$("#message_popup").find("dt").text("발행 중인 매출채권이 존재 합니다. 5분뒤에 다시 시도 해 주세요.");
						} else {
							$("#message_popup").find("dt").text("일부 매출채권 생성에 실패하였습니다.\r\n건수 : " + get_data["errorMessage"] + "성공");
						}

						var tempHtml = $("#message_popup").html();
						$("#message_popup").remove();
						$('body').append('<div id="message_popup" class="alertLayer_popup style="visibility: hidden">' + tempHtml + '</div>');

						$("#messageOk").click(function() {
							$(".abc").fadeOut("slow");
							$("#mask").hide();
							$("#searchButton").click();

							return false;
						});

						position_cm($("#message_popup"));

						$("#message_popup").css("visibility", "visible");
						$("#message_popup").fadeIn("show");
						isClicked = false;
					}

					$("#loadingPopup").css("visibility", "hidden");
				},

				error: function(request, status, error) {
					$("#loadingPopup").css("visibility", "hidden");

					jQuery("#ajaxErrorPopup").detach().appendTo('body');

					$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + request.status + "\n" + "ERROR : " + error);
					$("#ajaxErrorPopup").css("visibility", "visible");
					$("#ajaxErrorPopup").find(".popokbtn > a").click(function() {
						isClicked = false;
						$("#mask").hide();
						$("#searchButton").click();
					});
					$("#ajaxErrorPopup").show();
					$("#ajaxErrorPopup").css("z-index", 9999);
				}
			});
			showAlartPopup($("#loadingPopup"));
			$("#loadingPopup").css("visibility", "visible");
			$("#loadingPopup").fadeIn("fast");
			$("#issuePopup").fadeOut("slow");
			$("#unpayJson").val("");
			return false;
		};

		$(function() { //페이지 열릴 때 발행 가능 금액이 0이면 readOnly 해준다.
			if (Number($.trim($("#hdFinalDateUnpay").text())) == 0) {
				for (var i = 1; i <= 5; i++) {
					$("#hdExpirationDate" + i).attr("disabled", true);
					$("#hdAmountOfMoney" + i).attr("disabled", true);
				}
			}
			if (Number($.trim($("#kiaFinalDateUnpay").text())) == 0) {
				for (var i = 1; i <= 5; i++) {
					$("#kiaExpirationDate" + i).attr("disabled", true);
					$("#kiaAmountOfMoney" + i).attr("disabled", true);
				}
			}
		});

		//페이지 전체 드래그이동, 우클릭 방지
		//$(document).bind("contextmenu", function(e) { return false; }); //우클릭방지
		$(function() { //드래그 drop 방지
			$("input").attr("ondragenter", "return false");
			$("input").attr("ondragover", "return false");
			$("input").attr("ondrop", "return false;");
		});

		$(function() {
			$('.popEndDate').datepicker('option', 'minDate', $.datepicker.parseDate("yy.mm.dd", "${nowDate}"));
			$("#ui-datepicker-div").hide();
		});
	</script>
</body>
</html>