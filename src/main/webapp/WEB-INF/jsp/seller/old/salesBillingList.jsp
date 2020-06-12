<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	/**
	* @Class Name : salesBillingList.jsp
	* @Description : 지급내역(상세) List 화면
	* @Modification Information
	*
	*   수정일     수정자      수정내용
	*  -------    --------    ---------------------------
	*  2018.11.19  CDF Team    최초 생성
	*
	* author CDF Team
	* since 2018.11.19
	*
	*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>수금내역(상세)</title>
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
<body class="main" style="">
	<div id="mask" style="width: 1453px; height: 480px;"></div>
	<!-- header -->
	<c:import url="../../inc/buyer/old/sellerHeader.jsp" />
	<!--// header -->

	<div id="wrap">
		<div id="container">
			<div id="contents">
				<!-- title -->
				<h2 class="hidden">수금내역(상세)</h2>
				<!-- // title -->
				
				<!-- 검색조건 -->
				<form id="searchForm" class="mt20" action="<c:url value='/seller/salesBilling/list.do'/>" method="post">
					<input type="hidden" name="sellerBizNo" id="sellerBizNo" value="${params.sellerBizNo }" />
					<input type="hidden" name="groupType" id="groupType" value="${params.groupType }" />
					<fieldset>
						<legend>검색폼</legend>
						<table class="tbl_search" summary="">
							<caption>조회</caption>
							<colgroup>
								<col width="130">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">검색조건</th>
									<td col>
										<p>
											<label for="startDate" class="hidden">조회 시작날짜 선택</label><input type="text" name="startDate" id="startDate" class="input ac mr5 EnterKeyDown" style="width: 95px;" value="${params.startDate }">
											<img src="<c:url value='/images/ico/ico_calendar.gif'/>" alt="검색 시작날짜 선택" onclick="dateClick('startDate')">
											~
											<label for="endDate" class="hidden">조회 끝날짜 선택</label><input type="text" name="endDate" id="endDate" class="input ac mr5 EnterKeyDown" style="width: 95px;" value="${params.endDate }">
											<img src="<c:url value='/images/ico/ico_calendar.gif'/>" alt="검색 끝날짜 선택" class="mr15" onclick="dateClick('endDate')">
											<input type="radio" class="mr5" value="2"><a href="javascript:;" id="allRadio" class="mr15 fb">All</a>
											<input type="radio" class="mr5" value="0"><a href="javascript:;" id="hyundaiRadio" class="mr15 fb">현대</a>
											<input type="radio" class="mr5" value="1"><a href="javascript:;" id="kiaRadio" class="mr15 fb">기아</a>
										</p>
										<p class="mt10">
											<label for="searchKeyword" class="hidden">이름 검색</label><input type="text" name="searchKeyword" id="searchKeyword" class="input mr5 businessKeyword" value="${params.searchKeyword }">
											<span class="btn btn_normal">
												<a href="javascript:;" onclick="searchClick('<c:url value='/seller/officesItem/list.do'/>')" style="width: 80px;" class="btn_search_click">찾기</a>
											</span>
											<span class="btn btn_normal">
												<a href="javascript:;" onclick="searchMyItemsClick('<c:url value='/seller/myOfficesItem/list.do'/>','834','600' )" style="width: 80px;">My 거래처</a>
											</span>
											<span class="btn btn_normal">
												<a id="searchButton" href="javascript:;" style="width: 80px;">조회하기</a>
											</span>
										</p>
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</form>
				<br>
				<!-- // 검색조건 -->
				
				<!-- 대리점&품목점 정보 -->
				<h3 class="hidden">품목지원센터 정보</h3>
				<table id="storeInfoTable" class="tbl_view2 mt15 mb15" summary="대리점 상세정보표 입니다.">
					<caption>품목지원센터 상세정보</caption>
					<colgroup>
						<col width="170">
						<col width="320">
						<col width="170">
						<col width="320">
						<col width="170">
						<col width="320">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="tbl_center">품목지원센터</th>
							<th scope="row" class="tbl_center">대표자</th>
							<th scope="row" class="tbl_center">사업자번호</th>
							<th scope="row" class="tbl_center">지급보증한도</th>
							<th scope="row" class="tbl_center">잔여보증금액</th>
							<th class="tbl_center" scope="row">초과금액</th>
						</tr>
						<tr>
							<td class="text_center">${limit.companyName }</td>
							<td class="text_center">${limit.ceoName }</td>
							<td class="text_center">${limit.businessNo }</td>
							<td class="money_right"><fmt:formatNumber value="${limit.salesLimit }" pattern="#,###" /></td>
							<td class="money_right"><fmt:formatNumber value="${limit.remainingLimit }" pattern="#,###" /></td>
							<td class="text_center"><fmt:formatNumber value="${limit.overLimit }" pattern="#,###" /></td>
						</tr>
					</tbody>
				</table>
				<!-- // 대리점&품목점 정보 -->

				<!-- 거래내역 -->
				<h3 class="hidden">품목점 거래내역</h3>
				<table id="transactionTable" class="tbl_view2 mb20" summary="품목점 거래내역 상세정보 입니다.">
					<caption>품목점 거래내역 정보</caption>
					<thead>
						<tr>
							<th class="tbl_center" scope="col">년월</th>
							<th class="tbl_center" id="purchase" scope="col">매출내역</th>
							<th class="tbl_center" scope="col">세금계산서<br>발행금액</th>
							<th class="tbl_center" id="provide" scope="col">총수금내역</th>
							<th class="tbl_center" scope="col">만기일 지정 수금</th>
							<th class="tbl_center" id="etc_provide" scope="col">기타수금</th>
							<th class="tbl_center" id="setoff" scope="col">상계수금</th>
							<th class="tbl_center" id="non-payment" scope="col">미수금</th>
							<th class="tbl_center" scope="col">초과수금</th>
							<th class="tbl_center" id="etc_money01" scope="col">적수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list}">
							<tr>
								<td class="text_center" id="dateTD">-</td>
								<td id="totalSalesAmount" class="money_right">0</td>
								<td class="money_right">0</td>
								<td class="money_right ivory" id="inquiry">0</td>
								<td class="money_right">0</td>
								<td class="money_right">0</td>
								<td class="money_right">0</td>
								<td class="tb_view04 money_right ivory">0</td>
								<td class="money_right">0</td>
								<td id="totalExpirationAvg" class="text_center">0</td>
							</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${list}" varStatus="status">
								<tr>
									<td class="text_center" id="dateTD">${item.regDate }</td>
									<td id="totalSalesAmount" class="money_right"><fmt:formatNumber value="${item.salesAmount }" pattern="#,###" /></td>
									<td class="money_right"><fmt:formatNumber value="${item.taxAmount }" pattern="#,###" /></td>
									<td class="money_right ivory" id="inquiry"><a style="color: red"><fmt:formatNumber value="${item.collectAmount }" pattern="#,###" /></a></td>
									<td class="money_right"><fmt:formatNumber value="${item.receivableAmount }" pattern="#,###" /></td>
									<td class="money_right"><fmt:formatNumber value="${item.extraAmount }" pattern="#,###" /></td>
									<td class="money_right"><fmt:formatNumber value="${item.setoff }" pattern="#,###" /></td>
									<td class="tb_view04 money_right ivory">
										<c:if test="${item.endAmount eq 0 }">
										<fmt:formatNumber value="${item.endAmount }" pattern="#,###" />
										</c:if>
										
										<!-- 미지급금액 -->
										<c:if test="${item.endAmount gt 0 }">
										<a id="unpayPopupTag" style="color: blue">
											<fmt:formatNumber value="${item.endAmount }" pattern="#,###" />
										</a>
										<input type="hidden" id="finalDateUnpayVal" value="0">
										<input type="hidden" id="taxBillUnpayVal" value="0">
										<input type="hidden" id="taxBillPayKVal" value="0">
										<input type="hidden" id="taxBillPayHVal" value="0">
										<input type="hidden" id="paymentHistoryHVal" value="0">
										<input type="hidden" id="paymentHistoryKVal" value="0">
										<input type="hidden" id="overVal" value="0">
										</c:if>
									</td>
									<td class="money_right"><fmt:formatNumber value="${item.overAmount }" pattern="#,###" /></td>
									<td id="totalExpirationAvg" class="text_center"><fmt:formatNumber value="${item.expirationAvg }" pattern="#,###" /></td>
								</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<!-- // 거래내역 -->
				
				<div id="issuePopup" class="pop_wrap alertLayer_popup" style="position: absolute; left: 290px; top: 20px;">
					<dl>
						<dt>
							해당 금액에 대하여 매출채권 생성 페이지로 <br>이동 하시겠습니까?
						</dt>
						<dd>
							<span class="btn btn_normal"><a id="issueOk1" href="javascript:;" style="width: 80px;">승인</a> </span> <span class="btn btn_normal"><a id="issueCancel1" href="javascript:;" style="width: 80px;">취소</a> </span>
						</dd>
					</dl>
				</div>
				
				<!-- 지급내역 현황 조회 -->
				<h3>기간 별 결제내역조회</h3>
				<table id="ariTable" class="tbl_view2 mb10" summary="기간 별 결제내역 현황 조회입니다.">
					<caption>기간 별 결제내역조회</caption>
					<colgroup>
						<col width="7%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
						<col width="16%">
						<col width="15%">
						<col width="7%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th class="tbl_center" scope="col">NO</th>
							<th class="tbl_center" scope="col">발행일</th>
							<th class="tbl_center" scope="col">만기일</th>
							<th class="tbl_center" scope="col">결제일</th>
							<th class="tbl_center" scope="col">금액</th>
							<th class="tbl_center" scope="col">승인번호</th>
							<th class="tbl_center" scope="col">적수</th>
							<th class="tbl_center" scope="col">진행상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="8" class="text_center">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td class="text_center">계</td>
							<td></td>
							<td class="money_right">-</td>
							<td class="text_center">-</td>
							<td class="text_center">-</td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<!-- // 지급내역 현황 조회 -->
				
				<!-- 엑셀 출력 -->
				<p class="ar">
					<span class="btn btn_normal2 mb10"> <a href="javascript:;" onclick="excelExport(1)" style="width: 100px;">엑셀</a>
					</span>
				</p>
				<!-- // 엑셀 출력 -->

				<!-- EXCEL URL -->
				<input type="hidden" id="excelUrl" value="<c:url value='/downloads/buyerSalesBilling.do'/>">
				<!-- //EXCEL URL -->
				
				<!-- 미지급금 클릭시 -->
				<div class="pay_info4">
					<table id="unpayTable" summary="마우스를 올리거나 클릭, 포커스가 올라오면 만기일미지정, 미발행세금계산서 확인이 가능합니다.">
						<caption>만기일미지정, 미발행세금계산서</caption>
						<colgroup>
							<col width="34%">
							<col width="33%">
							<col width="33%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" colspan="2" style="text-align: center;">발행가능 금액</th>
								<th scope="col" rowspan="2" style="text-align: center;">초과금액</th>
							</tr>
							<tr>
								<th scope="col" style="text-align: center;">만기일<br>미지정</th>
								<th scope="col" style="text-align: center;">세금계산서<br>미발행</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<!-- // 미지급금 클릭시 -->

				<!-- 만기일 미지정 금액 클릭 -->
				<form id="unpayItem" action="<c:url value='/seller/accountReceivable/list.do'/>" method="post">
					<input id="finalDateUnpay" name="finalDateUnpay" type="hidden" value="0">
					<input id="date" name="date" type="hidden" value="">
					<input id="taxBillPayK" name="taxBillPayK" type="hidden" value="0">
					<input id="taxBillPayH" name="taxBillPayH" type="hidden" value="0">
					<input id="paymentHistoryH" name="paymentHistoryH" type="hidden" value="0">
					<input id="paymentHistoryK" name="paymentHistoryK" type="hidden" value="0">
					<!-- 추가데이터? 있다면 추가 -->
				</form>
				<!-- // 만기일 미지정 금액 클릭 -->

				<!-- 총지급내역 클릭 -->
				<form id="inquiryForm" action="<c:url value='/seller/salesBilling/list.json'/>" method="post">
					<input id="buyerBizNo" name="buyerBizNo" type="hidden" value="${user.businessNo }">
					<input id="sellerBizNo" name="sellerBizNo" type="hidden" value="${params.sellerBizNo }">
					<input id="salesDate" name="salesDate" type="hidden" value="">
					<input id="groupType" name="groupType" type="hidden" value="${params.groupType }">
				</form>
				<!-- // 총지급내역 클릭 -->

				<!-- 결제대기 클릭 -->
				<input type="hidden" id="detailUrl" value="<c:url value='/seller/salesBilling/detail.do'/>">
				<!-- // 결제대기 클릭 -->

				<!-- 합계적수 가지고있을 변수 -->
				<input type="hidden" id="ExAvg">
				<!-- // 합계적수 가지고있을 변수 -->
				
				<!-- 대리점 공통 -->
				<c:import url="sellerCommon.jsp" />
				<!-- // 대리점 공통 -->
			</div>
			<!-- #contents -->
		</div>
		<!-- // #container -->
	</div>
	<!-- // #wrap -->

	<!-- footer -->
	<c:import url="../../inc/logedfooter.jsp" />
	<!--// footer -->

	<script type="text/javascript">
		var isClicked = false; //첫라인에 추가

		//구매 결제내역서, 결제내역조회 팝업 
		function salesDetailClick(event, taxBillNumber, transactionNumber, paymentDate, expirationDate, amountOfMoney, expirationAvg) {
			var searchDetail = $("#searchDetailPopup");

			//id가 없으면 생성
			if (searchDetail.length <= 0) {
				$('body').append('<div id="searchDetailPopup" class = "pop_wrap layer_popup abc"></div>');
				$('body').append('<div id = "change_popup" class="alertLayer_popup">' + '<dl>' + '<dt>해당 매출에 대하여 변경 처리 하시겠습니까 ?</dt>' + '<dd>' + '<span class="btn btn_normal" id = "salesDetailOk1"><a href="javascript:;" style="width: 80px;">확인</a></span>' + '<span class="btn btn_normal" id = "salesDetailCancel1"><a href="javascript:;" style="width: 80px;">취소</a></span> ' + '</dd></dl></div>');
				$('body').append('<div id = "cancel_popup" class="alertLayer_popup">' + '<dl>' + '<dt>해당 매출에 대하여 취소 처리 하시겠습니까 ?</dt>' + '<dd>' + '<span class="btn btn_normal" id = "salesDetailOk2"><a href="javascript:;" style="width: 80px;">확인</a></span>' + '<span class="btn btn_normal" id = "salesDetailCancel2"><a href="javascript:;" style="width: 80px;">취소</a></span> ' + '</dd></dl></div>');
			} else //id가 있으면 삭제하고 생성
			{
				$('#searchDetailPopup').remove();
				$('#change_popup').remove();
				$('#cancel_popup').remove();

				$('body').append('<div id="searchDetailPopup" class = "pop_wrap layer_popup abc"></div>');
				$('body').append('<div id = "change_popup" class="alertLayer_popup">' + '<dl>' + '<dt>해당 매출에 대하여 변경 처리 하시겠습니까 ?</dt>' + '<dd>' + '<span class="btn btn_normal" id = "salesDetailOk1"><a href="javascript:;" style="width: 80px;">확인</a></span>' + '<span class="btn btn_normal" id = "salesDetailCancel1"><a href="javascript:;" style="width: 80px;">취소</a></span> '

				+ '</dd></dl></div>');
				$('body').append('<div id = "cancel_popup" class="alertLayer_popup">' + '<dl>' + '<dt>해당 매출에 대하여 취소 처리 하시겠습니까 ?</dt>' + '<dd>' + '<span class="btn btn_normal" id = "salesDetailOk2"><a href="javascript:;" style="width: 80px;">확인</a></span>' + '<span class="btn btn_normal" id = "salesDetailCancel2"><a href="javascript:;" style="width: 80px;">취소</a></span> ' + '</dd></dl></div>');
			}

			var dataObject = new Object();

			dataObject.amountOfMoney = amountOfMoney;
			dataObject.expirationDate = expirationDate;
			dataObject.paymentDate = paymentDate;
			dataObject.expirationAvg = expirationAvg;
			dataObject.transactionNumber = transactionNumber;
			dataObject.taxBillNumber = taxBillNumber;

			var jsonData = "jsonData=" + (JSON.stringify(dataObject));
			$("#searchDetailPopup").load($("#detailUrl").val(), jsonData, function(responseText, textStatus, XMLHttpRequest) {
				if (textStatus == "success") {

					if ($("#overExpirationDate").val() == "1") {
						$("#mask").hide();
						$("#ajaxErrorPopup").find("dt").text("만기일이 현재 기준 2영업일 이전의 매출채권은 변경/취소 할 수 없습니다.");
						$("#ajaxErrorPopup").css("visibility", "visible");
						position_cm($("#ajaxErrorPopup")[0]);
						$("#ajaxErrorPopup").fadeIn("show");
						return false;
					}
					//부모창 불투명 처리
					event.preventDefault();
					wrapWindowByMask($("#searchDetailPopup"));

					//레이어 팝업 visible
					$("#searchDetailPopup").css("visibility", "visible");
					$("#searchDetailPopup").fadeIn("slow");
				} else if (textStatus == "error") {
					$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + XMLHttpRequest.status + "\n" + "ERROR : " + XMLHttpRequest.statusText);
					$("#ajaxErrorPopup").css("visibility", "visible");
					$("#ajaxErrorPopup").fadeIn("show");
				}
			});
		}
		function unpayClick() {
			$("#issuePopup").fadeIn("slow");
		}

		//excel
		function excelClick(url) {
			location.href = url;
		}

		var isShowPopup = 0;

		$(function() {
			$(document).mousedown(function(e) {
				if (isShowPopup == 1) {
					$(".pay_info3").fadeOut("show");
					$(".pay_info4").fadeOut("show");

					isShowPopup = 0;
				}
			});

			//잔여한도 클릭 팝업 위치
			$("#storeInfoTable > tbody > tr > td > .tb_view03").click(function(e) {
				isShowPopup = 1;
				//위치셋팅
				$(".pay_info3").css("top", $(this).offset().top - $("#contents").offset().top - 10);
				$(".pay_info3").css("left", $(this).offset().left - $("#contents").offset().left - 250);

				$(".pay_info3").fadeIn("show");
			});

			//미지급금 클릭 팝업 위치
			$("#transactionTable > tbody > tr > .tb_view04 > #unpayPopupTag").click(function(event) {
				isShowPopup = 1;
				var accessLevel = "R";
				//위치셋팅
				$(".pay_info4").css("top", $(this).offset().top - $("#contents").offset().top + 22);
				$(".pay_info4").css("left", $(this).offset().left - $("#contents").offset().left - 140);

				/* 미지급금 테이블 동적생성 */
				//값 셋팅
				var finalDateUnpay = $(this).parent("td").parent("tr").find("#finalDateUnpayVal").val(); //event.delegateTarget.children[1].value;
				var taxBillUnpay = $(this).parent("td").parent("tr").find("#taxBillUnpayVal").val(); //Number( event.delegateTarget.children[2].value );
				var overValue = $(this).parent("td").parent("tr").find("#overVal").val(); //Number( event.delegateTarget.children[2].value );

				var fdu = Number(finalDateUnpay);
				var tbu = Number(taxBillUnpay);
				var overDiff = Number(overValue);
				
				if (overDiff > 0) {
					if (fdu > overDiff) {
						fdu = fdu - overDiff;
						overDiff = 0;
					} else {
						overDiff = overDiff - fdu;
						fdu = 0;
					}

					fdu = fdu < 0 ? 0 : fdu;

					if (tbu > overDiff) {
						tbu = tbu - overDiff;
					} else {
						overDiff = overDiff - tbu;
						tbu = 0;
					}

					tbu = tbu < 0 ? 0 : tbu;

				}
				//dto에 셋팅
				$("#finalDateUnpay").val($(this).parent("td").parent("tr").find("#finalDateUnpayVal").val());
				$("#date").val($(this).parent("td").parent("tr").find("#dateTD").text());
				$("#taxBillPayK").val($(this).parent("td").parent("tr").find("#taxBillPayKVal").val());
				$("#taxBillPayH").val($(this).parent("td").parent("tr").find("#taxBillPayHVal").val());
				$("#paymentHistoryK").val($(this).parent("td").parent("tr").find("#paymentHistoryKVal").val());
				$("#paymentHistoryH").val($(this).parent("td").parent("tr").find("#paymentHistoryHVal").val());

				$("#unpayTable > tbody:last > tr").remove();

				if (Number(fdu) > 0 && accessLevel != "R") {
					$("#unpayTable > tbody:last").append('<tr>' //(콤마),찍힌 스트링 값이 아닌 원본값을 넘겨주기 위해서
							+ '<td  style="text-align:center;"><a href = "#" id = "finalDateUnpayData" onclick = "unpayClick()" > ' + Number(fdu).toLocaleString().split('.')[0] + '</a>' + '</td>' + '<td id = "taxBillUnpayData"  style="text-align:center;">' + Number(tbu).toLocaleString().split('.')[0] + '</td>' + '<td id = "limitOverData">' + Number(overValue).toLocaleString().split('.')[0] + '</td>' + '</tr>');
				} else {
					$("#unpayTable > tbody:last").append('<tr>' //(콤마),찍힌 스트링 값이 아닌 원본값을 넘겨주기 위해서
							+ '<td  style="text-align:center;">' + Number(fdu).toLocaleString().split('.')[0] + '</td>' + '<td id = "taxBillUnpayData"  style="text-align:center;">' + Number(tbu).toLocaleString().split('.')[0] + '</td>' + '<td id = "limitOverData"  style="text-align:center;">' + Number(overValue).toLocaleString().split('.')[0] + '</td>' + '</tr>');
				}

				/*미지급금 테이블 동적생성 */

				$(".pay_info4").fadeIn("show");
			});

			$("#searchButton").click(function(event) {
				//찾기 & My 거래처 데이터 체크
				if ($("#searchForm").toArray()[0][0].value == "") {
					$("#notChoicePopup").css("visibility", "visible");
					$("#notChoicePopup").fadeIn("show");
					return false;
				}

				//달력조회 기간 체크
				var startDate = currentDate($("#startDate").val());
				var endDate = currentDate($("#endDate").val());

				//년도 체크
				if (startDate.getFullYear() == endDate.getFullYear()) {
					var result = Math.abs(startDate.getMonth() - endDate.getMonth());

					if (result < 6) {
						$("#range_alert1").css("visibility", "visible");
						$("#range_alert1").fadeIn("slow");
						return false;
					}
				} else if (startDate.getFullYear() < endDate.getFullYear()) {
					if ((startDate.getFullYear() + 1) != endDate.getFullYear()) {
						$("#range_alert2").css("visibility", "visible");
						$("#range_alert2").fadeIn("slow");
						return false;
					}
					var rangeMonth = 12 - startDate.getMonth();
					var result = rangeMonth + endDate.getMonth();

					if (result < 6) {
						$("#range_alert1").css("visibility", "visible");
						$("#range_alert1").fadeIn("slow");
						return false;
					} else if (result > 12) {
						$("#range_alert2").css("visibility", "visible");
						$("#range_alert2").fadeIn("slow");
						return false;
					}
				} else if (startDate.getFullYear() > endDate.getFullYear()) {
					$("#range_alert3").css("visibility", "visible");
					$("#range_alert3").fadeIn("slow");
					return false;
				}

				$("#searchForm").submit();
			});

			$("#inquiry > a").click(function(e) {
				$("#loadingPopup").css("visibility", "visible");

				var searchDate = $.trim($(this).parents("tr").find("td:first").text());
				var totalSalesAmount = Number(uncomma($.trim($(this).parents("tr").find("#totalSalesAmount").text())));
				var totalExpirationAvg = Number(uncomma($.trim($(this).parents("tr").find("#totalExpirationAvg").text())));
				$("#inquiryForm").find("#salesDate").val(searchDate);

				//합계적수
				$("#ExAvg").val(totalExpirationAvg);

				paymentInquiryAjax();
			});

			$(".popokbtn").click(function() {
				$(".abc").fadeOut("slow");
			});

			//승인
			$("#issueOk1").click(function() {
				$("#issuePopup").fadeOut("show");
				var date = $.trim($("#unpayItem #date").val());
				$("#searchForm #startDate").val(date);
				$("#searchForm").attr("action", $("#unpayItem").attr("action"));
				$("#searchForm").submit();
			});

			//취소
			$("#issueCancel1").click(function() {
				$("#issuePopup").fadeOut("show");
			});
		});

		function paymentInquiryAjax() {
			var ajaxUrl = $("#inquiryForm").attr("action");
//			var jsonData = "jsonData=" + JSON.stringify($('#inquiryForm').serializeObject());
			var jsonData = $('#inquiryForm').serializeObject();

			$.ajax({
				url : ajaxUrl,
				type : "post",
				data : jsonData,
				dataType : "json",
				success : function(data) {
					var get_data = eval(data);
					var total = 0;
					$('#ariTable > tbody:last > tr').remove();
					for (var i = 0; i < get_data.length; i++) {
						$('#ariTable > tbody:last').append('<tr>' + '<td class = "text_center">' + (i+1) + '</td>' + '<td class = "text_center" id = "issueDateTD">' + get_data[i].issueDate + '</td>' + '<td class = "text_center" id = "expirationDateTD">' + get_data[i].expirationDate + '</td>' + '<td class = "text_center" id = "paymentDateTD">' + get_data[i].paymentDate + '</td>' + '<td class = "money_right" id = "amountOfMoneyTD">' + (get_data[i].amount).toLocaleString().split('.')[0] + '</td>' + '<td class = "text_center" id = "transactionNumberTD">' + get_data[i].transactionNo + '<input type = "hidden" id = "taxBillNumberValue" value = "' + get_data[i].taxBillNo + '" >' + '</td>' + '<td class = "text_center" id = "expirationAvgTD">' + get_data[i].expirationAvg + '</td>' + (get_data[i].progressFlag == 1 || get_data[i].progressFlag == 5 ? '<td class="text_center payment_w" id="inquiryClick' + i + '">' + '<a href="javascript:;"'
                                     + 'style="width: 80px;"> ' + getProgressStatus(get_data[i].progressFlag, "B") + '</a>' : '<td class = "text_center">' + getProgressStatus(get_data[i].progressFlag, "B")) + '</td>' + '</tr>');

						total += Number(get_data[i].amount);
						//totalExpirationAvg += (Number(get_data[i].expirationAvg) * get_data[i].amountOfMoney);
						/* 결제대기 클릭 이벤트 */
						$("#inquiryClick" + i + " > a").bind("click", {
							//원본 키값
							taxBillNumber : get_data[i].taxBillNo,
							transactionNumber : get_data[i].transactionNo,
							paymentDate : get_data[i].paymentDate,
							expirationDate : get_data[i].expirationDate,
							amountOfMoney : get_data[i].amount,
							expirationAvg : get_data[i].expirationAvg
						}, function(event) {
							//원본
							//salesDetailClick( event.data.taxBillNumber, event.data.transactionNumber );

							//레이어 테스트 1 ( include or 동적생성 )
							//salesDetailClick( event.data );
							salesDetailClick(event, event.data.taxBillNumber, event.data.transactionNumber, event.data.paymentDate, event.data.expirationDate, event.data.amountOfMoney, event.data.expirationAvg);
						});
					}

					/* 값 셋팅 */
					$('#ariTable > tbody:last').append('<tr>' + '<td></td>' + '<td></td>' + '<td class = "text_center">계</td>' + '<td></td>' + '<td class = "money_right">' + total.toLocaleString().split('.')[0] + '</td>' + '<td class = "text_center">-</td>'
					//+ '<td class = "text_center">' + Math.floor(totalExpirationAvg / totalSalesAmount) + '</td>'
					+ '<td class = "text_center">' + Math.floor($("#ExAvg").val()) + '</td>' + '<td></td>' + '</tr>');

					$("#loadingPopup").css("visibility", "hidden");
				},
				error : function(request, status, error) { //실패
					$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + request.status + "\n" + "ERROR : " + error);
					$("#ajaxErrorPopup").css("visibility", "visible");
					$("#ajaxErrorPopup").fadeIn("show");
				}
			});
		}
	</script>
</body>
</html>