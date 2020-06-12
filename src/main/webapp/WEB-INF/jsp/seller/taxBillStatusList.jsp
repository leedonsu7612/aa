<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	/**
	* @Class Name : taxBillStatusList.jsp
	* @Description : 세금계산서 진행조회 List 화면
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
	<title>세금계산서 진행조회</title>
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
				<h2>세금계산서 진행조회</h2>

				<form action="<c:url value='/seller/taxBill/statusList.do'/>" method="post" name="searchForm" id="searchForm">
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

				<div class="bd-info">
					<ul>
						<li>&nbsp;</li>
						<li><a href="javascript:;" class="btn-excel" onclick="excelExport(${fn:length(list)});">다운로드</a></li>
					</ul>
				</div>

				<div class="tbl-type01 basic">
					<table summary="세금계산서 진행조회을 하기위한 표입니다.">
						<caption>세금계산서 진행조회</caption>
						<colgroup>
							<col width="17%" />
							<col width="*" />
							<col width="7%" />
							<col width="7%" />
							<col width="10%" />
							<col width="15%" />
							<col width="10%" />
							<col width="9%" />
							<col width="9%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">발행번호</th>
								<th scope="col">대리점명</th>
								<th scope="col">코드</th>
								<th scope="col">구분</th>
								<th scope="col">대리점</th>
								<th scope="col">매출기간</th>
								<th scope="col">금액</th>
								<th scope="col">진행상태</th>
								<th scope="col">발행일</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<td></td>
								<td class="txt-c">총 건수</td>
								<td></td>
								<td class="txt-c">
									<c:if test="${totCnt eq 0 }">-</c:if>
									<c:if test="${totCnt gt 0 }"><fmt:formatNumber value="${totCnt }" pattern="#,###" />건</c:if>
								</td>
								<td></td>
								<td class="txt-c">합계</td>
								<td>
									<c:if test="${totSum eq 0 }">-</c:if>
									<c:if test="${totSum gt 0 }"><fmt:formatNumber value="${totSum }" pattern="#,###" /></c:if>
								</td>
								<td></td>
								<td></td>
							</tr>
						</tfoot>
						<tbody>
							<c:choose>
								<c:when test="${empty list}">
									<tr>
										<td colspan="9">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
									</tr>
								</c:when>
								<c:otherwise>
									<!-- TODO fix : 매출기간, 진행상태 -->
									<c:forEach var="item" items="${list}" varStatus="status">
										<tr>
											<td><a href="javascript:;">${item.taxbillNo }</a></td>
											<td>${item.buyerCompanyName }</td>
											<td>${item.buyerCode }</td>
											<td>
												<c:if test="${item.groupType == '0' }">현대</c:if>
												<c:if test="${item.groupType == '1' }">기아</c:if>
											</td>
											<td>${item.buyerBizNo }</td>
											<td> - </td>
											<td class="txt-r"><fmt:formatNumber value="${item.amount }" pattern="#,###" /></td>
											<td>발행완료</td>
											<td>${item.issueDate }</td>
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

	<script>
		var EXCEL_URL = "<c:url value='/downloads/sellerTaxBillStatusList.do'/>"; // EXCEL EXPORT URL

		// TODO - 세금계산서 번호 클릭시 세금계산서 다운로드

		$(function() {
			// TODO fix : 검색기간 한달로 설정
			// 검색날짜 datepicker 설정
			setDatepicker("#startDate", "yy.mm.dd", $("#startDate").val(), true, null, null);
			setDatepicker("#endDate", "yy.mm.dd", $("#endDate").val(), true, null, null);
		});
	</script>
</body>
</html>