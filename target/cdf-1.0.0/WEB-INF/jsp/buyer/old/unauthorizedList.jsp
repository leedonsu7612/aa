<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	/**
	* @Class Name : unauthorizedList.jsp
	* @Description : 대리점 기타지급 승인 List 화면
	* @Modification Information
	*
	*   수정일          수정자      수정내용
	*  ------------    --------    ---------------------------
	*   2018.11.21      CDF Team    최초 생성
	*
	* author CDF Team
	* since 2018.11.21
	*
	*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>기타지급 승인요청 조회</title>
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
				<h2 class="hidden">기타지급 승인요청 조회</h2>
				<!-- // title -->

				<!-- 검색조건 -->
				<form name="searchForm" method="post" id="searchForm" class="mt20" action="<c:url value='/buyer/unauthorized/list.do'/>">
					<input type="hidden" name="groupType" id="groupType" value="${params.groupType }" />
					<input type="hidden" name="targetBizNo" id="targetBizNo" value="${params.targetBizNo }" />
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
											<label for="searchKeyword" class="hidden">이름 검색</label><input type="text" name="searchKeyword" id="searchKeyword" class="input mr5 businessKeyword" value="${params.searchKeyword }" />
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

				<!-- 거래내역 -->
				<h3 class="hidden">기타지급 승인요청 조회</h3>
				<table id="resultTable" class="tbl_view2 mb10" summary="기타지급 승인요청 조회 상세 현황입니다.">
					<caption>기타지급 승인요청 조회</caption>
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
							<th class="tbl_center" scope="col">기타지급금액</th>
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
									<td id="idx${status.index }" class="text_center">${status.count }</td>
									<td class="text_center">${item.issueDate }</td>
									<td class="text_center">${item.expirationDate }</td>
									<!-- <td class="text_center">20181001</td> -->
									<td class="money_right"><fmt:formatNumber value="${item.amount }" pattern="#,###" /></td>
									<td class="text_center businessName" id="store_name${status.index }" businessNumber="${item.sellerBizNo }">
										<a href="javascript:;" onclick="linkToSalesBilling( '${item.sellerBizNo }' )">
											<c:if test="${item.groupType eq '0' }"><font color="blue">(현대)</font><br /></c:if>
											<c:if test="${item.groupType eq '1' }"><font color="red">(기아)</font><br /></c:if>
											${item.sellerCompanyName }
										</a>
									</td>
									<td class="text_center">기타지급</td>
									<td class="btn_normal3 text_center mr5" amount="${item.amount }" taxbillNo="${item.taxbillNo }" transactionNo="${item.transactionNo }">
										<a href="javascript:;" class="authorizedBtn authorizedOk" style="width:50px;">승인</a>
										<a href="javascript:;" class="authorizedBtn authorizedCancel" style="width:50px;">취소</a>
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
					<span class="btn btn_normal2 mb10"><a href="javascript:;" onclick="excelExport('${paginationInfo.currentPageNo }')" style="width: 100px;">엑셀</a> </span>
				</p>
				<!-- // 엑셀 출력 -->

				<!-- EXCEL URL -->
				<input type="hidden" id="excelUrl" value="<c:url value='/downloads/buyerUnauthorized.do'/>">
				<!-- // EXCEL URL -->

				<!-- 상세 페이지 URL -->
				<input id="detailUrl" type="hidden" value="<c:url value='/buyer/salesBilling/list.do'/>" />
				<!-- // 상세 페이지 URL -->

				<!-- 인증서체크 -->
				<input type="hidden" id="certificateUrl" value="<c:url value='/certificateCheck.json'/>">
				<!-- // 인증서체크 -->

				<!-- 승인 & 취소 comfirm popup -->
				<div id="alert_popup" class="alert_popup">
					<dl>
						<dt></dt>
						<dd>
							<span class="btn btn_normal"><a href="javascript:;" class="btn_ok" style="width:80px;">확인</a></span>
							<span class="btn btn_normal"><a href="javascript:;" class="btn_cancel" style="width:80px;">취소</a></span>
						</dd>
					</dl>
				</div>

				<form id="updateItem" method="post">
					<input id="taxbillNo" name="taxbillNo" type="hidden" />
					<input id="transactionNo" name="transactionNo" type="hidden" />
					<input id="amount" name="amount" type="hidden" />
					<input id="progressFlag" name="progressFlag" type="hidden" />
				</form>
				<!-- // 승인 & 취소 comfirm popup -->

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
		// 승인 & 취소 폼 초기화
		function initUpdateItem() {
			$("#updateItem").children("input[type=hidden]").each(function(){
				$(this).val("");
			});
		}

		// 승인 & 취소 AJAX
		function authorizedAjax(ajaxUrl, ajaxData) {
			$.ajax({
				url : ajaxUrl,
				type : "post",
				data : ajaxData,
				dataType : "json",
				success : function(data) {
					var get_data = data;

					if (get_data["resultMessage"] == "Success") { //성공
						$("#searchForm").submit();
					} else {
						$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "ERROR : " + get_data["errorMessage"]);
						$("#ajaxErrorPopup").css("visibility", "visible");
						$("#ajaxErrorPopup").fadeIn("show");
					}
				},
				error : function(request, status, error) { //실패
					$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + request.status + "\n" + "ERROR : " + error);
					$("#ajaxErrorPopup").css("visibility", "visible");
					$("#ajaxErrorPopup").fadeIn("show");
				}
			});

			initUpdateItem();
			$("#loadingPopup").css("visibility", "hidden");
		}

		$(function() {
			// 조회하기
			$("#searchButton").click(function(e) {
				$("#searchForm").submit();
			});

			// 승인 & 취소 comfirm popup - show
			$("#resultTable").on("click", ".authorizedBtn", function(){
				var $td = $(this).parent("td");
				$("#taxbillNo").val($td.attr("taxbillNo"));
				$("#transactionNo").val($td.attr("transactionNo"));
				$("#amount").val($td.attr("amount"));

				if($(this).hasClass("authorizedOk")){
					$("#progressFlag").val("3");
					$("#alert_popup").find("dt").text("승인처리 하시겠습니까?");
				}else if($(this).hasClass("authorizedCancel")){
					$("#progressFlag").val("2");
					$("#alert_popup").find("dt").text("취소처리 하시겠습니까?");
				}else{
					return;
				}

				$("#alert_popup").css("visibility", "visible").fadeIn("slow");
			});

			// 승인 & 취소 comfirm popup - 확인
			$("#alert_popup").find(".btn_ok").click(function(){
				$("#loadingPopup").css("visibility", "visible");

				var ajaxData = $("#updateItem").serialize();

				//인증서모듈체크
				if (!HB2BLoanSign(ajaxData, "", 0)) {
					$("#loadingPopup").css("visibility", "hidden");
					$("#alert_popup").fadeOut("slow");
					return false;
				}

				var flag = $("#progressFlag").val();

				if(flag == "3"){ // 지급 승인
					authorizedAjax("<c:url value='/buyer/unauthorized/insert.json'/>", ajaxData);
				}else if(flag = "2"){ // 지급 취소
					authorizedAjax("<c:url value='/buyer/unauthorized/delete.json'/>", ajaxData);
				}else{
					return;
				}
			});

			// 승인 & 취소 comfirm popup - 취소
			$("#alert_popup").find(".btn_cancel").click(function() {
				$("#alert_popup").fadeOut("slow");
				initUpdateItem();
			});
		});
	</script>
</body>
</html>