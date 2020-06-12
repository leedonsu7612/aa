<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	/**
	* @Class Name : setOffList.jsp
	* @Description : 대리점 상계지급 승인 목록 화면
	* @Modification Information
	*
	*   수정일     수정자      수정내용
	*  -------    --------    ---------------------------
	*  2018.12.1  CDF Team    최초 생성
	*
	* author CDF Team
	* since 2018.12.1
	*
	*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>상계지급 승인요청 조회</title>
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
				<h2 class="hidden">상계지급 승인요청 조회</h2>
				<!-- // title -->

				<!-- 검색조건 -->
				<form id="searchForm" name="searchForm" class="mt20" action="<c:url value='/seller/setOff/list.do'/>" method="post">
					<input type="hidden" name="groupType" id="groupType" value="${params.groupType }" />
					<input type="hidden" name="sellerBizNo" id="businessNo" value="${params.sellerBizNo }" />
					<input type="hidden" name="pageIndex" id="pageIndex" value="${paginationInfo.currentPageNo }" />

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
											<label for="searchKeyword" class="hidden">이름 검색</label><input type="text" name="sellerCompanyName" id="searchKeyword" class="input mr5 businessKeyword" value="${params.sellerCompanyName }" />
											<span class="btn btn_normal">
												<a href="javascript:;" onclick="searchClick('<c:url value='/seller/officesItem/list.do'/>')" style="width: 80px;" class="btn_search_click">찾기</a>
											</span>
											<span class="btn btn_normal">
												<a href="javascript:;" onclick="searchMyItemsClick('<c:url value='/seller/myOfficesItem/list.do'/>','834','600')" style="width: 80px;">My 거래처</a>
											</span>
											<span class="btn btn_normal">
												<a id="searchButton" href="javascript:;" style="width: 80px;">조회하기</a>
											</span>
										</p>
									</td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</form>
				<!-- // 검색조건 -->
				
				<br />
				<br />
				
				<!-- 거래내역 -->
				<h3 class="hidden">상계지급 승인요청 조회</h3>
				<table id="unauthorizedTable" class="tbl_view2 mb10" summary="상계지급 승인요청 조회 상세 현황입니다.">
					<caption>상계지급 승인요청 조회</caption>
					<colgroup>
						<col width="6%" />
						<col width="12%" />
						<col width="16%" />
						<!-- <col width="12%" /> -->
						<col width="12%" />
						<col width="12%" />
						<col width="12%" />
						<col width="18%" />
					</colgroup>
					<thead>
						<tr>
							<th class="tbl_center" scope="col">NO</th>
							<th class="tbl_center" scope="col">발행일자</th>
							<th class="tbl_center" scope="col">만기일자</th>
							<!-- <th class="tbl_center" scope="col">요청가능금액</th> -->
							<th class="tbl_center" scope="col">상계지급금액</th>
							<th class="tbl_center" scope="col">거래처명</th>
							<th class="tbl_center" scope="col">거래구분</th>
							<th class="tbl_center" scope="col">승인</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list}">
							<tr>
								<td colspan="7" class="text_center">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
							</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td id="idx" class="text_center" amountOfMoney="${item.amount }" taxBillNumber="" transactionNumber="${item.transactionNo }">${status.count }</td>
									<td class="text_center">${item.issueDate }</td>
									<td class="text_center">${item.expirationDate }</td>
									<!-- <td class="text_center">20181001</td> -->
									<td class="money_right"><fmt:formatNumber value="${item.amount }" pattern="#,###" /></td>
									<td class="text_center businessName" id="store_name${status.index }" businessNumber="${item.sellerBizNo }">
										<a href="javascript:;" onclick="linkToSalesBilling( '${item.sellerBizNo }' )">
											<c:if test="${item.groupType eq '0' }">(<font color="blue">현대</font>)<br /></c:if>
											<c:if test="${item.groupType eq '1' }">(<font color="red">기아</font>)<br /></c:if>
											${item.sellerCompanyName }
										</a>
									</td>
									<td class="text_center">기타지급</td>
									<td class="btn_normal3 text_center mr5">
										<a href="javascript:;" id="authorizedOk">승인</a>
										<a href="javascript:;" id="authorizedCancel">취소</a>
									</td>
								</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<!-- // 거래내역 -->

				<!-- 페이징 -->
				<div class="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
				</div>
				<!-- // 페이징 -->
				
				<!-- 엑셀 출력 -->
				<p class="ar">
					<span class="btn btn_normal2 mb10"><a href="#" onclick="excelExport(0)" style="width: 100px;">엑셀</a> </span>
				</p>
				<!-- // 엑셀 출력 -->
				
				<!-- EXCEL URL -->
				<input type="hidden" id="excelUrl" value="/downloads/buyerSetOff.do">
				<!-- // EXCEL URL -->
				
				<!-- 상세 페이지 URL -->
				<input id="detailUrl" type="hidden" value="/seller/salesBilling/list.do" />
				<!-- // 상세 페이지 URL -->
				
				<!-- 승인 -->
				<div id='alert_popup1' class="alert_popup">
					<dl>
						<dt>승인처리 하시겠습니까?</dt>
						<dd>
							<span class="btn btn_normal popokbtn"><a id="extraAmountOk" href="#" style="width: 80px;">확인</a></span>
							<span class="btn btn_normal popokbtn"><a id="extraAmountCancel" href="#" style="width: 80px;">취소</a> </span>
						</dd>
					</dl>
				</div>
				
				<form id="insertItem" action="/seller/setOff/approve.json" method="post">
					<input id="taxBillNumber" name="taxBillNumber" type="hidden" value="" />
					<input id="transactionNumber" name="transactionNumber" type="hidden" value="" />
					<input id="amountOfMoney" name="amountOfMoney" type="hidden" value="0" />
				</form>
				<!-- // 승인 -->

				<!-- 취소 -->
				<div id='alert_popup2' class="alert_popup">
					<dl>
						<dt>취소처리 하시겠습니까?</dt>
						<dd>
							<span class="btn btn_normal ok_btn01"><a id="extraAmountRemoveOk" href="#" style="width: 80px;">확인</a></span>
							<span class="btn btn_normal popokbtn"><a id="extraAmountRemoveCancel" href="#" style="width: 80px;">취소</a></span>
						</dd>
					</dl>
				</div>
				
				<form id="extraDeleteItem" action="/seller/setOff/reject.json" method="post">
					<input id="taxBillNumber" name="taxBillNumber" type="hidden" value="" />
					<input id="transactionNumber" name="transactionNumber" type="hidden" value="" />
					<input id="transactionType" name="transactionType" type="hidden" value="" />
				</form>
				<!-- // 취소 -->

				<!-- 인증서체크 -->
				<input type="hidden" id="certificateUrl" value="/certificateCheck.json">
				<!-- // 인증서체크 -->

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

	<!-- 인증서 -->
	<script type="text/javascript" src="<c:url value='/js/customer/TSToolkitObject.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/customer/TSToolkitConfig.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/global.js?ver=1.1'/>"></script>
	<script type="text/javascript">
		var isClicked = false;

		$(function() {
			$("#searchButton").click(function(e) {
				$("#searchForm").submit();
			});

			/* 승인 버튼 클릭시 */
			$("#unauthorizedTable > tbody > tr > td > #authorizedOk").click(function() {
				//이벤트 셋팅 필요
				$("#alert_popup1").css("visibility", "visible");
				$("#insertItem #taxBillNumber").val($(this).parent().parent().find("#idx").attr("taxBillNumber"));
				$("#insertItem #transactionNumber").val($(this).parent().parent().find("#idx").attr("transactionNumber"));
				$("#insertItem #amountOfMoney").val($(this).parent().parent().find("#idx").attr("amountOfMoney"));
				$("#alert_popup1").fadeIn("slow");
			});

			$("#extraAmountOk").click(function() {
				if (isClicked) {
					return false;
				}
				isClicked = true;

				$("#loadingPopup").css("visibility", "visible");
				var ajaxUrl = $("#insertItem").attr("action");
				var jsonData = "jsonData=" + JSON.stringify($("#insertItem").serializeObject());

				//인증서모듈체크
				if (!HB2BLoanSign(jsonData, "", 0)) {
					isClicked = false;
					$("#loadingPopup").css("visibility", "hidden");
					$("#alert_popup1").fadeOut("slow", function() {});
					return false;
				}

				$.ajax({
					url : ajaxUrl,
					type : "post",
					data : jsonData,
					dataType : "json",
					success : function(data) {
						isClicked = false;
						var get_data = eval(data);

						if (get_data["resultMessage"] == "Success") {
							//성공
							$("#searchForm").submit();
						} else {
							$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "ERROR : " + get_data["errorMessage"]);
							$("#ajaxErrorPopup").css("visibility", "visible");
							$("#ajaxErrorPopup").fadeIn("show");
						}
					},
					error : function(request, status, error) { //실패
						var isClicked = false;
						$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + request.status + "\n" + "ERROR : " + error);
						$("#ajaxErrorPopup").css("visibility", "visible");
						$("#ajaxErrorPopup").fadeIn("show");
					}
				});

				$("#transactionType").val("");
				$("#transactionNumber").val("");
				$("#taxBillNumber").val("");
				$("#loadingPopup").css("visibility", "hidden");
				$("#alert_popup1").fadeOut("slow", function() {});
				return false;
			});

			/* 취소 버튼 클릭시*/
			$("#unauthorizedTable > tbody > tr > td > #authorizedCancel").click(function() {
				$("#alert_popup2").css("visibility", "visible");
				$("#extraDeleteItem #taxBillNumber").val($(this).parent().parent().find("#idx").attr("taxBillNumber"));
				$("#extraDeleteItem #transactionNumber").val($(this).parent().parent().find("#idx").attr("transactionNumber"));
				$("#alert_popup2").fadeIn("slow");
				return false;
			});

			$(".popokbtn").click(function() {
				$(".alert_popup1").fadeOut("slow");
				return false;
			});

			$(".popokbtn").click(function() {
				$(".abc").fadeOut("slow");
			});

			//삭제 확인
			$(".ok_btn01").click(function() {
				if (isClicked) {
					return false;
				}
				isClicked = true;
				$("#loadingPopup").css("visibility", "visible");

				var ajaxUrl = $("#extraDeleteItem").attr("action");
				var jsonData = "jsonData=" + JSON.stringify($("#extraDeleteItem").serializeObject());

				$.ajax({
					url : ajaxUrl,
					type : "post",
					data : jsonData,
					dataType : "json",
					success : function(data) {
						var get_data = eval(data);

						if (get_data["resultMessage"] == "Success") { //성공
							$("#searchForm").submit();
						} else {
							$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "ERROR : " + get_data["errorMessage"]);
							$("#ajaxErrorPopup").css("visibility", "visible");
							$("#ajaxErrorPopup").fadeIn("show");
						}
						
						isClicked = false;
					},
					error : function(request, status, error) { //실패
						$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + request.status + "\n" + "ERROR : " + error);
						$("#ajaxErrorPopup").css("visibility", "visible");
						$("#ajaxErrorPopup").fadeIn("show");
						isClicked = false;
					}
				});

				$("#transactionType").val("");
				$("#transactionNumber").val("");
				$("#taxBillNumber").val("");
				$("#loadingPopup").css("visibility", "hidden");
				$("#alert_popup1").fadeOut("slow", function() {});
				return false;
			});
			
			//삭제 취소
			$(".btn_normal").click(function() {
				$("#alert_popup1").fadeOut("slow", function() {});
				$("#alert_popup2").fadeOut("slow", function() {});
				return false;
			});
		});

		//미승인 매출내역조회  페이징
		function pagingAjax() {
			$("#loadingPopup").css("visibility", "visible");
			var ajaxUrl = $("#PagingForm").attr("action");

			$.ajax({
				url : ajaxUrl,
				type : "post",
				data : $("#PagingForm").serialize(),
				dataType : "json",
				success : function(dataMap) {
					var renderHtml = dataMap.renderHtml;
					var get_data = dataMap.ariList;

					$('#unauthorizedTable > tbody:last > tr').remove();
					for (var i = 0; i < get_data.length; i++) {
						$('#unauthorizedTable > tbody:last').append('<tr>' + '<td id="idx" class="text_center" amountOfMoney="' + get_data[i].amountOfMoney + '" + taxBillNumber="' + get_data[i].taxBillNumber + '" transactionNumber="' + get_data[i].transactionNumber + '" >' + get_data[i].number + '</td>' + '<td class="text_center">' + get_data[i].issueDate + '</td>' + '<td class="text_center">' + get_data[i].expirationDate + '</td>' + '<td class="money_right">' + comma(get_data[i].amountOfMoney) + '</td>' + '<td class="text_center">' + '<a href = "#" onclick="linkToSalesBilling( ' + get_data[i].sellerBizNumber + ' )">' + changeGroupAjaxColor(get_data[i].buyerCompanyName) + '</a></td>' + '<td class="text_center" id="tt">상계지급</td>' + '<td class="btn_normal3 text_center mr5">' + '<a href="#" style="width:50px;" id = "authorizedOk' + i + '">승인</a>' + '<a href="#" style="width:50px;" id = "authorizedCancel' + i + '">취소</a>' + '</td>' + '</tr>');

						//승인버튼 바인드 이벤트
						$("#authorizedOk" + i).bind("click", function() {
							$("#alert_popup1").css("visibility", "visible");
							$("#insertItem #taxBillNumber").val($(this).parent().parent().find("#idx").attr("taxBillNumber"));
							$("#insertItem #transactionNumber").val($(this).parent().parent().find("#idx").attr("transactionNumber"));
							$("#insertItem #amountOfMoney").val($(this).parent().parent().find("#idx").attr("amountOfMoney"));
							$("#alert_popup1").fadeIn("slow");
						});

						//취소버튼 바인드 이벤트
						$("#authorizedCancel" + i).bind("click", function() {
							$("#alert_popup2").css("visibility", "visible");
							$("#extraDeleteItem #taxBillNumber").val($(this).parent().parent().find("#idx").attr("taxBillNumber"));
							$("#extraDeleteItem #transactionNumber").val($(this).parent().parent().find("#idx").attr("transactionNumber"));
							$("#alert_popup2").fadeIn("slow");
						});
					}

					//pagenation 동적생성
					$(".paging > #list-pagination").remove();
					$(".paging").append(renderHtml);
					$("#loadingPopup").css("visibility", "hidden");
				},
				error : function(request, status, error) {//실패
					$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + request.status + "\n" + "ERROR : " + error);
					$("#ajaxErrorPopup").css("visibility", "visible");
					$("#ajaxErrorPopup").fadeIn("show");
				}
			});
		}
	</script>
</body>
</html>