<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	/**
	* @Class Name : limitList.jsp
	* @Description : 거래처 한도조회 List 화면
	* @Modification Information
	*
	*   수정일     수정자      수정내용
	*  -------    --------    ---------------------------
	*  2018.12.5  CDF Team    최초 생성
	*
	* author CDF Team
	* since 2018.12.5
	*
	*/
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>거래처 한도조회</title>
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
				<h2>거래처 한도조회</h2>

				<form action="<c:url value='/seller/limit/list.do'/>" method="post" name="searchForm" id="searchForm">
					<input type="hidden" name="targetBizNo" id="targetBizNo" value="${params.targetBizNo }" />
					<input type="hidden" name="pageIndex" id="pageIndex" value="${paginationInfo.currentPageNo }" />

					<div class="bd-head">
						<ul>
							<li>
								<label for="searchDate" class="sound_only">날짜 선택</label>
								<input type="text" id="searchDate" class="wx120" name="searchDate" value="${params.searchDate }" />
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
					<table summary="거래처 별 한도조회입니다.">
						<caption>거래처 별 한도조회</caption>
						<colgroup>
							<col width="8%">
							<col width="*">
							<col width="10%">
							<col width="15%">
							<col width="16%">
							<col width="16%">
							<col width="16%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">NO</th>
								<th scope="col">대리점</th>
								<th scope="col">코드</th>
								<th scope="col">사업자번호</th>
								<th scope="col">거래한도</th>
								<th scope="col">잔여한도</th>
								<th scope="col">초과한도</th>
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
											<td><a href="javascript:;" onclick="linkToSalesBilling(${item.businessNo});">${item.companyName}</a></td>
											<td>${item.membNo }</td>
											<td>${item.businessNo }</td>
											<td class="txt-r"><fmt:formatNumber value="${item.salesLimit }" pattern="#,###" /></td>
											<td class="txt-r"><fmt:formatNumber value="${item.remainingLimit }" pattern="#,###" /></td>
											<td class="txt-r"><fmt:formatNumber value="${item.overLimit }" pattern="#,###" /></td>
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

	<!-- 대리점 공통 -->
	<c:import url="../inc/buyer/commom.jsp" />
	<!-- // 대리점 공통 -->

	<script>
		var EXCEL_URL = "<c:url value='/downloads/sellerBusinessLimit.do'/>"; // EXCEL EXPORT URL

		$(function() {
			// 검색날짜 datepicker 설정
			setMonthpicker("#searchDate", "yy.mm", $("#searchDate").val());
		});
	</script>
</body>
</html>