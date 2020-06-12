<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	/**
	* @Class Name : loanList.jsp
	* @Description : 대출 가능 채권 조회 List 화면
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
	<title>대출 가능 채권조회</title>
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
				<h2>대출 가능 채권조회</h2>

				<form action="<c:url value='/seller/loan/list.do'/>" method="post" name="searchForm" id="searchForm">
					<input type="hidden" name="targetBizNo" id="targetBizNo" value="${params.targetBizNo }" />
					<input type="hidden" name="pageIndex" id="pageIndex" value="${paginationInfo.currentPageNo }" />

					<div class="bd-head">
						<ul>
							<li class="wp100 mb10">
								<ul>
									<li>
										<div class="select-bx wx130">
											<label for="searchType">발행일</label>
											<select id="searchType" name="searchType">
												<option value="0">발행일</option>
												<option value="1">만기일</option>
											</select>
										</div>
									</li>
									<li>
										<label for="startDate" class="sound_only">날짜 선택</label>
										<input type="text" class="wx120" title="날짜 선택 시작일" id="startDate" name="startDate" value="${params.startDate }" />
										~
										<label for="endDate" class="sound_only">날짜 선택</label>
									 	<input type="text" class="wx120" title="날짜 선택 종료일" id="endDate" name="endDate" value="${params.endDate }" />
									</li>
								</ul>
							</li>
							<li class="ml0">
								<input type="radio" name="groupType" value="2" id="allRadio" onclick="submitSearchForm();" <c:if test="${params.groupType ne '0' or params.groupType ne '1'}">checked</c:if>><label for="allRadio" class="ml0 pl0"><span></span>All</label>
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

				<div class="bd-info">
					<ul>
						<li>&nbsp;</li>
						<li><a href="javascript:;" class="btn-excel" onclick="excelExport(${fn:length(list)});">다운로드</a></li>
					</ul>
				</div>

				<div class="tbl-type01 basic">
					<table summary="대출가능 채권 조회입니다.">
						<caption>대출가능 채권조회 목록</caption>
						<colgroup>
							<col width="8%" />
							<col width="*" />
							<col width="12%" />
							<col width="12%" />
							<col width="12%" />
							<col width="20%" />
							<col width="12%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">NO</th>
								<th scope="col">대리점</th>
								<th scope="col">발행일</th>
								<th scope="col">만기일</th>
								<th scope="col">금액</th>
								<th scope="col">승인번호</th>
								<th scope="col">대출실행</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty list}">
									<tr>
										<td colspan="7">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${list}" varStatus="status">
										<tr>
											<td>${status.count }</td>
											<td>
												<c:if test="${item.groupType eq '0' }"><span class="blue">(현대)</span></c:if>
												<c:if test="${item.groupType eq '1' }"><span class="red">(기아)</span></c:if>
												<a href="javascript:;" onclick="linkToSalesBilling(${item.buyerBizNo});">${item.companyName}</a>
											</td>
											<td>${item.issueDate }</td>
											<td>${item.expirationDate }</td>
											<td class="txt-r"><fmt:formatNumber value="${item.account }" pattern="#,###" /></td>
											<td>${item.transactionNo}</td>
											<td><a href="javascript:;" onclick="linkToHci('${item.issueDate }', '${item.expirationDate }', '${item.transactionNo}')">결제대기</a></td>
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
		var EXCEL_URL = "<c:url value='/downloads/sellerImpossibleLoan.do'/>"; // EXCEL EXPORT URL

		$(function() {
			// 검색날짜 datepicker 설정
			setMonthpicker("#startDate", "yy.mm", $("#startDate").val());
			setMonthpicker("#endDate", "yy.mm", $("#endDate").val());
		});
	</script>
</body>
</html>