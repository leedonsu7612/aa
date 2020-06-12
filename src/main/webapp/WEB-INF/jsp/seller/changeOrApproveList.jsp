<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	/**
	* @Class Name : changeOrApproveListList.jsp
	* @Description : 대리점 채권만기일 변경 승인 List 화면
	* @Modification Information
	*
	*   수정일          수정자        수정내용
	*  ------------    ----------    ---------------------------
	*   2018.11.28      CDF Team      최초 생성
	*
	* author CDF Team
	* since 2018.11.28
	*
	*/
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>채권만기일 변경승인</title>
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
				<h2>채권만기일 변경승인</h2>

				<form action="<c:url value='/seller/changeOrApprove/list.do'/>" method="post" name="searchForm" id="searchForm">
					<input type="hidden" name="targetBizNo" id="targetBizNo" value="${params.targetBizNo }" />

					<div class="bd-head">
						<ul>
							<li>
								<label for="startDate" class="sound_only">날짜 선택</label>
								<input type="text" class="wx120" title="날짜 선택 시작일" id="startDate" name="startDate" value="${params.startDate }" />
								~
								<label for="endDate" class="sound_only">날짜 선택</label>
							 	<input type="text" class="wx120" title="날짜 선택 종료일" id="endDate" name="endDate" value="${params.endDate }" />
							</li>
							<li>
								<div class="select-bx wx130">
									<label for="progressFlag">All</label>
									<select id="progressFlag" name="progressFlag">
										<option value="0">ALL</option>
										<option value="4">변경요청</option>
										<option value="6">취소요청</option>
									</select>
								</div>
							</li>
							<li>
								<a href="javascript:;" class="btn-submit" onclick="submitSearchForm();">조회하기</a>
							</li>
						</ul>
					</div>
				</form>

				<c:if test="${empty list }">
					<div class="bd-info"></div>
				</c:if>

				<c:if test="${!empty list }">
					<div class="tbl-btn">
						<a href="javascript:;" onclick="checkAll(true);">전체선택</a>
						<a href="javascript:;" onclick="checkAll(false);">선택해제</a>
						<a href="javascript:;" onclick="batchApproval();">일괄승인</a>
					</div>
				</c:if>

				<div class="tbl-type01 basic">
					<table summary="변경요청 / 승인 내역입니다.">
						<caption>채권만기일 변경승인</caption>
						<colgroup>
							<col width="5%">
							<col width="5%">
							<col width="*">
							<col width="11%">
							<col width="11%">
							<col width="11%">
							<col width="11%">
							<col width="15%">
							<col width="11%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">추가</th>
								<th scope="col">NO</th>
								<th scope="col">대리점</th>
								<th scope="col">발행일</th>
								<th scope="col">만기일</th>
								<th scope="col">변경후 만기일</th>
								<th scope="col">금액</th>
								<th scope="col">거래번호</th>
								<th scope="col">진행상태</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty list }">
									<tr>
										<td colspan="9">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${list }" varStatus="status">
										<tr>
											<td>
												<input type="checkbox" id="p-wr-${status.count}" value="${status.index }" name="chk_item" class="checkItem">
												<label for="p-wr-${status.count}" class="mr0">
													<span class="mt0 mr0"></span>
												</label>
											</td>
											<td>${status.count}</td>
											<td>
												<c:if test="${item.groupType eq '0' }"><span class="blue">(현대)</span></c:if>
												<c:if test="${item.groupType eq '1' }"><span class="red">(기아)</span></c:if>
												<a href="javascript:;" onclick="linkToSalesBilling(${item.buyerBizNo});">${item.buyerCompanyName}</a>
											</td>
											<td class="issuDate${status.index }">${item.issueDate}</td>
											<td class="beforeExpiDate${status.index }">${item.beforeExpiDate}</td>
											<td class="afterExpiDate${status.index }">
												<c:if test="${empty item.afterExpiDate}">-</c:if>
												<c:if test="${not empty item.afterExpiDate}"></c:if>
											</td>
											<td class="txt-r account${status.index }"><fmt:formatNumber value="${item.account }" pattern="#,###" /></td>
											<td class="transactionNo${status.index }">${item.transactionNo}</td>
											<td>
												<c:choose>
													<c:when test="${item.progressFlag eq '4'}">
														<a href="javascript:;" class="btn-submit2" onclick="updateRequest('${item.transactionNo }', 4);">변경요청</a>
													</c:when>
													<c:when test="${item.progressFlag eq '6'}">
														<a href="javascript:;" class="btn-submit2" onclick="updateRequest('${item.transactionNo }', 6);">취소요청</a>
													</c:when>
													<c:otherwise>-</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 콘텐츠 끝 -->

		<!-- 하단 시작 -->
		<c:import url="../inc/buyer/footer.jsp" />
		<!-- 하단 끝 -->
	</div>
	<!-- // #wrap -->

	<!-- 대리점 공통 -->
	<c:import url="../inc/buyer/commom.jsp" />
	<!-- // 대리점 공통 -->

	<!-- 확인 팝업 -->
	<div class="acc2-pop" id="confirmPopup2" style="display: none;">
		<div class="pop-border"></div>
		<div class="msg-txt">[변경 또는 취소승인 확인]<br />해당 매출채권에 대하여 변경승인 하시겠습니까?</div>
		<div class="btn-set2">
			<a href="javascript:;" class="change">확인</a>
			<a href="javascript:;" class="reject">반려</a>
		</div>
		<a href="javascript:;" class="btn-close" onclick="closeConfirm();">닫기</a>
	</div>
	<!-- // 확인 팝업 -->

	<script>
		var EXCEL_URL = ""; // EXCEL EXPORT URL
		var CHANGE_URL = "<c:url value='/seller/changeOrApprove/change.json'/>";
		var REJECT_URL = "<c:url value='/seller/changeOrApprove/reject.json'/>";
		var CANCEL_URL = "<c:url value='/seller/changeOrApprove/cancel.json'/>";

		// 변경요청 || 취소요청 버튼 클릭
		function updateRequest(transactionNo, progressFlag) {
			var jsonData = [{transactionNo : transactionNo, progressFlag : progressFlag}];
			var ajaxUrl = "";

			if (progressFlag == "4" || progressFlag == "6") {
				$("#confirmPopup2").find(".change").off().on("click", function(){ // 확인
					doAjax(CHANGE_URL, "jsonData=" + JSON.stringify(jsonData), submitSearchForm);
				});

				$("#confirmPopup2").find(".reject").off().on("click", function(){ // 반려
					doAjax(REJECT_URL, "jsonData=" + JSON.stringify(jsonData), submitSearchForm);
				});
			} else {
				return false;
			}

			$("#confirmPopup2").fadeIn();
		}

		// 전체 선택 || 선택 해제
		function checkAll(checked) {
			$(".checkItem").prop("checked", checked);
			summaryTaxbillAmount();
		}

		// 일괄승인
		function batchApproval() {
			var length = checkedItemLength("chk_item");

			if (length > 0) {

			} else {
				openAlert("일괄승인하시려면 하나 이상 선택하세요.");
			}
		}

		$(function() {
			// 검색날짜 datepicker 설정
			setMonthpicker("#startDate", "yy.mm", $("#startDate").val());
			setMonthpicker("#endDate", "yy.mm", $("#endDate").val());
		});
	</script>
</body>
</html>