<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>상계수금 요청</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/buyer/base.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/buyer/jquery-ui.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/buyer/layout.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/buyer/common.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/buyer/dev.css'/>" />
	<script src="<c:url value='/js/admin/jquery-3.3.1.min.js'/>"></script>
	<script src="<c:url value='/js/jquery-ui.js'/>"></script>
	<script src="<c:url value='/js/datepicker-ko.js'/>"></script>
	<script src="<c:url value='/js/admin/common.js'/>"></script>
	<!--[if lte IE 8]>
	<script type="text/javascript" src="<c:url value='/js/admin/html5.js'/>"></script>
	<![endif]-->
</head>
<body>
	<div id="wrap">
		<!-- 상단 시작 -->
		<c:import url="../inc/buyer/header.jsp" />
		<!-- 상단 끝 -->

		<!-- 콘텐츠 시작  -->
		<div id="container" class="agency">
			<div id="contents">
				<h2>상계수금 요청</h2>

				<form action="<c:url value='/seller/setOff/list.do'/>" method="post" name="searchForm" id="searchForm">
					<input type="hidden" name="targetBizNo" id="targetBizNo" value="${params.targetBizNo }" />
					<input type="hidden" name="pageIndex" id="pageIndex" value="${paginationInfo.currentPageNo }" />

					<div class="bd-head">
						<ul>
							<li>
								<label for="searchDate" class="sound_only">날짜 선택</label>
								<input type="text" id="searchDate" class="wx120" name="searchDate" value="${params.searchDate }" />
							</li>
							<li>
								<input type="radio" name="groupType" value="2" id="allRadio" onclick="submitSearchForm();" <c:if test="${params.groupType ne '0' or params.groupType ne '1'}">checked</c:if>><label for="allRadio"><span></span>All</label>
								<input type="radio" name="groupType" value="0" id="hyundaiRadio" onclick="submitSearchForm();" <c:if test="${params.groupType eq '0'}">checked</c:if>><label for="hyundaiRadio"><span></span>현대</label>
								<input type="radio" name="groupType" value="1" id="kiaRadio" onclick="submitSearchForm();" <c:if test="${params.groupType eq '1'}">checked</c:if>><label for="kiaRadio"><span></span>기아</label>
							</li>
							<li>
								<label for="searchKeyword" class="sound_only">검색어 입력</label>
								<input type="text" class="txt-c wx245" name="searchKeyword" id="searchKeyword" value="${params.searchKeyword }" placeholder="상점 선택" />
							</li>
							<li>
								<a href="javascript:;" class="btn-sch" id="searchShopBtn">찾기</a>
							</li>
							<li>
								<a href="javascript:;" class="btn-sch" id="searchMyShopBtn">My 거래처</a>
							</li>
							<li>
								<a href="javascript:;" class="btn-submit" onclick="submitSearchForm();">조회하기</a>
							</li>
						</ul>
					</div>
				</form>

				<div class="bd-info"></div>

				<div class="tbl-type01 basic">
					<table summary="상계수금 요청입니다.">
						<caption>상계수금 요청</caption>
						<colgroup>
							<col width="8%">
							<col width="12%">
							<col width="12%">
							<col width="13%">
							<col width="13%">
							<col width="*">
							<col width="12%">
							<col width="12%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">NO</th>
								<th scope="col">발행일</th>
								<th scope="col">만기일</th>
								<th scope="col">요청가능금액</th>
								<th scope="col">상계수금 요청금액</th>
								<th scope="col">대리점명</th>
								<th scope="col">거래구분</th>
								<th scope="col">승인요청</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty list}">
									<tr>
										<td colspan="8">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${list}" varStatus="status">
										<tr>
											<td>${status.count }</td>
											<td>${item.issueDate }</td>
											<td>${item.expirationDate }</td>
											<td class="txt-r"><fmt:formatNumber value="${item.amountRequestable }" pattern="#,###" /></td>
											<td class="txt-r"><fmt:formatNumber value="${item.amountRequested }" pattern="#,###" /></td>
											<td>
												<c:if test="${item.groupType eq '0' }"><span class="blue">(현대)</span></c:if>
												<c:if test="${item.groupType eq '1' }"><span class="red">(기아)</span></c:if>
												<a href="javascript:;" onclick="linkToSalesBilling(${item.buyerBizNo});">${item.companyName}</a>
											</td>
											<td>상계수금</td>
											<td>
												<a href="javascript:;" class="btn-submit2" onclick="requestExtra(${item.amountRequestable}, '${item.issueDate}', '${item.expirationDate}', '${item.groupType}', '${item.buyerBizNo}', '${item.salesDate}');">요청하기</a>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>

				<!-- 페이징 -->
				<div class="paging">
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_link_page" />
				</div>
				<!-- // 페이징 -->
			</div>
		</div>
		<!-- 콘텐츠 끝 -->

		<!-- 하단 시작 -->
		<c:import url="../inc/buyer/footer.jsp" />
		<!-- 하단 끝 -->
	</div>
	<!-- // #wrap -->

	<!-- 상계수금 요청 팝업 -->
	<div class="acc3-pop hx210 draggable" id="requestPopup" style="display: none;">
		<div class="pop-border"></div>
		<p class="p-title">상계수금 요청</p>
		<div class="tbl-type02 tbl-center">
			<table summary="">
				<caption>상계수금 요청</caption>
				<colgroup>
					<col width="30%">
					<col width="*">
					<col width="25%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">미수금액</th>
						<th scope="col">요청금액</th>
						<th scope="col">만기일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="txt-r" id="amountRequestable"></td>
						<td class="pd5">
							<input type="text" class="wp100 txt-r" name="amount" id="requestAmount" numberOnly="true">
						</td>
						<td id="requestExpirationDate"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn-set2 mt20">
			<a href="javascript:;" class="ok">확인</a>
		</div>
		<a href="javascript:;" class="btn-close">닫기</a>
	</div>
	<!-- // 상계수금 요청 팝업 -->

	<!-- 상계수금 요청 폼 -->
	<form action="<c:url value='/seller/setOff/request.do'/>" method="post" name="requestForm" id="requestForm">
		<input type="hidden" name="issueDate" id="reqIssueDate" />
		<input type="hidden" name="expirationDate" id="reqExpirationDate" />
		<input type="hidden" name="amount" id="reqAmount" />
		<input type="hidden" name="groupType" id="reqGroupType" />
		<input type="hidden" name="progressFlag" id="reqProgressFlag" value="1" />
		<input type="hidden" name="buyerBizNo" id="reqBuyerBizNo" />
		<input type="hidden" name="sellerBizNo" id="reqSellerBizNo" value="${user.businessNo }" />
		<input type="hidden" name="salesDate" id="reqSalesDate" />
	</form>
	<!-- // 상계수금 요청 폼 -->

	<!-- 대리점 공통 -->
	<c:import url="../inc/buyer/commom.jsp" />
	<!-- // 대리점 공통 -->

	<script>
		var EXCEL_URL = ""; // EXCEL EXPORT URL
		var requestDate = {issueDate : "", expirationDate : "", amount: 0, groupType : "", progressFlag : "", buyerBizNo : "", salesDate : ""};

		// 상계수금 요청 팝업 열기
		function requestExtra(amountRequestable, issueDate, expirationDate, groupType, buyerBizNo, salesDate) {
			$("#requestPopup").fadeIn();
			$("#amountRequestable").text(comma(amountRequestable));
			$("#requestExpirationDate").text(expirationDate);
			$("#requestAmount").val("");
			$("#reqIssueDate").val(issueDate.replace(/\./g, ""));
			$("#reqExpirationDate").val(expirationDate.replace(/\./g, ""));
			$("#reqAmount").val("");
			$("#reqGroupType").val(groupType);
			$("#reqBuyerBizNo").val(buyerBizNo);
			$("#reqSalesDate").val(salesDate.replace(/\./g, ""));
		}

		$(function() {
			// 검색날짜 datepicker 설정
			setMonthpicker("#searchDate", "yy.mm", $("#searchDate").val());

			// 요청금액 입력 이벤트
			$(document).on("keyup", "#requestAmount", function(){
				var amount = Number(uncomma($(this).val()));
				var amountRequestable = Number(uncomma($("#amountRequestable").text()));

				if(amount == 0 || amount > amountRequestable) {
					amount = "";
				}

				$(this).val(comma(amount));
			});

			// 상계수금 요청 팝업 - 확인 버튼 클릭
			$("#requestPopup").on("click", ".ok", function(){
				var amount = Number(uncomma($("#requestAmount").val()));

				if(amount == null || amount == "" || amount == 0) {
					openAlert("요청 금액을 입력해주세요.");
					return false;
				}

				$("#reqAmount").val(amount);

				var ajaxUrl = $("#requestForm").attr("action");
				var jsonData = $("#requestForm").serialize();

				doAjax(ajaxUrl, jsonData, function(){
					openAlert("상계수금 요청이 완료되었습니다.", submitSearchForm);
				});

				$("#requestPopup").hide();
			});
		});
	</script>
</body>
</html>