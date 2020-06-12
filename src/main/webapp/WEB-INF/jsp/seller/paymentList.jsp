<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	/**
	* @Class Name : paymentList.jsp
	* @Description : 대리점 결제내역 조회 List 화면
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
	<title>수금내역조회</title>
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
				<h2>수금내역조회</h2>

				<form action="<c:url value='/seller/payment/list.do'/>" method="post" name="searchForm" id="searchForm">
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
									<li>
										<div class="select-bx wx130">
											<label for="sendStatus">All</label>
											<select id="sendStatus" name="sendStatus">
												<option value="100">ALL</option>
												<option value="0">결제완료</option>
												<option value="1">결제대기</option>
												<option value="2">기타지급요청</option>
												<option value="12">기타지급승인</option>
												<option value="13">기타지급취소</option>
												<option value="31">상계지급요청</option>
												<option value="30">상계지급승인</option>
												<option value="39">상계지급취소</option>
												<option value="3">대출실행</option>
												<option value="4">변경요청</option>
												<option value="5">변경완료</option>
												<option value="6">취소요청</option>
												<option value="7">취소완료</option>
											</select>
										</div>
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
						<li>
							<div class="ag-title">기간별 수금내역조회</div>
						</li>
						<li><a href="javascript:;" class="btn-excel" onclick="excelExport(${fn:length(list)});">다운로드</a></li>
					</ul>
				</div>

				<div class="tbl-type01 basic">
					<table summary="기간별 수금내역 현황 조회입니다.">
						<caption>기간별 수금내역조회</caption>
						<colgroup>
							<col width="5%" />
							<col width="*" />
							<col width="8%" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="12%" />
							<col width="17%" />
							<col width="8%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">NO</th>
								<th scope="col">대리점</th>
								<th scope="col">코드</th>
								<th scope="col">발행일</th>
								<th scope="col">만기일</th>
								<th scope="col">결제일</th>
								<th scope="col">금액</th>
								<th scope="col">승인번호</th>
								<th scope="col">진행상태</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<td></td>
								<td></td>
								<td class="txt-c">총 건수</td>
								<td class="txt-c">
									<c:if test="${totCnt eq 0 }">-</c:if>
									<c:if test="${totCnt gt 0 }"><fmt:formatNumber value="${totCnt }" pattern="#,###" />건</c:if>
								</td>
								<td></td>
								<td class="txt-c">합계</td>
								<td>
									<c:if test="${summary eq 0 }">-</c:if>
									<c:if test="${summary gt 0 }"><fmt:formatNumber value="${summary }" pattern="#,###" /></c:if>
								</td>
								<td></td>
								<td></td>
							</tr>
						</tfoot>
						<tbody>
							<c:choose>
								<c:when test="${empty list}">
									<tr>
										<td colspan="9">자료가 없습니다. 다른 검색조건을 선택해주세요.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${list }" varStatus="status">
										<tr>
											<td>${status.count }</td>
											<td>
												<c:if test="${item.groupType eq '0' }"><span class="fs-blue">(현대)</span></c:if>
												<c:if test="${item.groupType eq '1' }"><span class="fs-red">(기아)</span></c:if>
												<a href="javascript:;" onclick="linkToSalesBilling('${item.buyerBizNo }')">${item.companyName }</a>
											</td>
											<td>${item.buyerMembNo}</td>
											<td>${item.issueDate}</td>
											<td>${item.expirationDate}</td>
											<td>${item.paymentDate}</td>
											<td class="txt-r"><fmt:formatNumber value="${item.amount}" pattern="#,###" /></td>
											<td>
												${item.transactionNo}
												<input type="hidden" id="taxBillNumberValue" value="${item.taxbillNo}">
												<input type="hidden" id="expirationAvgValue" value="${item.expirationAvg}">
											</td>
											<c:choose>
												<c:when test="${item.sendStatus eq '결제대기' }">
													<td>
														<a href="javascript:;" class="fs-red" onclick="linkToHci('${item.issueDate }', '${item.expirationDate }', '${item.transactionNo}')">결제대기</a>
													</td>
												</c:when>
												<c:otherwise>
													<td>${item.sendStatus }</td>
												</c:otherwise>
											</c:choose>
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
		var EXCEL_URL = "<c:url value='/downloads/sellerPayment.do'/>"; // EXCEL EXPORT URL

		$(function() {
			// 검색날짜 datepicker 설정
			setDatepicker("#startDate", "yy.mm.dd", $("#startDate").val(), true, null, null);
			setDatepicker("#endDate", "yy.mm.dd", $("#endDate").val(), true, null, null);

			// 검색조건 설정
			$("#searchType").children("option[value=${params.searchType}]").prop("selected", true).parent("#searchType").change();
			$("#sendStatus").children("option[value=${params.sendStatus}]").prop("selected", true).parent("#sendStatus").change();
		});
	</script>
</body>
</html>