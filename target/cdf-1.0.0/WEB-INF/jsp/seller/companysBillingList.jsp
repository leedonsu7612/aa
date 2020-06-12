<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	/**
	* @Class Name : companysBillingList.jsp
	* @Description : 품목점 수금현황(종합) List 화면
	* @Modification Information
	*
	*   수정일          수정자      수정내용
	*  ------------    --------    ---------------------------
	*   2018.11.30                  최초 생성
	*
	* author CDF Team
	* since 2018.11.30
	*
	*/
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>품목센터 수금현황(종합)</title>
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
				<h2>수금현황(종합)</h2>

				<form action="<c:url value='/seller/companysBilling/list.do'/>" method="post" name="searchForm" id="searchForm">
					<input type="hidden" name="targetBizNo" id="targetBizNo" value="${params.targetBizNo }" />

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
								<a href="javascript:;" class="btn-submit" id="searchButton" onclick="submitSearchForm();">조회하기</a>
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

				<div class="tbl-type01">
					<table summary="대리점 수금현황(종합)을 상세하게 조회합니다.">
						<caption>대리점 수금현황(종합)</caption>
						<colgroup>
							<col width="8%" />
							<col width="*" />
							<col width="11%" />
							<col width="11%" />
							<col width="11%" />
							<col width="11%" />
							<col width="8%" />
							<col width="11%" />
							<col width="8%" />
						</colgroup>
						<thead>
							<tr>
								<th rowspan="2" scope="col">업체코드</th>
								<th rowspan="2" scope="col">대리점명</th>
								<th colspan="3" scope="colgroup">수금 대상 (조회월 기준)</th>
								<th rowspan="2" scope="col">당월수금</th>
								<th rowspan="2" scope="col">회수율</th>
								<th rowspan="2" scope="col">미회수잔액</th>
								<th rowspan="2" scope="col">적수</th>
							</tr>
							<tr>
								<th scope="col">${month1 }월 이전</th>
								<th scope="col">${month2 }월</th>
								<th scope="col">${month3 }월</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${empty list}">
								<tfoot>
									<tr>
										<th colspan="2">합계</th>
										<td>-</td>
										<td>-</td>
										<td>-</td>
										<td>-</td>
										<td class="txt-c">-</td>
										<td>-</td>
										<td class="txt-c">-</td>
									</tr>
								</tfoot>
								<tbody>
									<tr>
										<td colspan="9">자료가 없습니다. 다른 검색조건을 선택해주세요.</td>
									</tr>
								</tbody>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${list}" varStatus="status">
									<c:choose>
										<c:when test="${status.last}">
											<tfoot>
												<tr>
													<th colspan="2">합계</th>
													<td><fmt:formatNumber value="${item.salesAmount2 }" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${item.salesAmount1 }" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${item.salesAmount }" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${item.collectAmount }" pattern="#,###" /></td>
													<td class="txt-c"><fmt:formatNumber value="${item.collectAmountRate }" pattern="#.#" />%</td>
													<td><fmt:formatNumber value="${item.endAmount }" pattern="#,###" /></td>
													<td class="txt-c"><fmt:formatNumber value="${item.expirationAvg }" pattern="#,###" /></td>
												</tr>
											</tfoot>
										</c:when>
										<c:otherwise>
											<tbody>
												<tr>
													<td>${item.buyerMembNo }</td>
													<td>
														<c:if test="${params.groupType eq '0' }"><span class="blue">(현대)</span></c:if>
														<c:if test="${params.groupType eq '1' }"><span class="red">(기아)</span></c:if>
														<a href="javascript:;" onclick="linkToSalesBilling(${item.buyerBizNo});">${item.buyerCompanyName}</a>
													</td>
													<td class="txt-r"><fmt:formatNumber value="${item.salesAmount2 }" pattern="#,###" /></td>
													<td class="txt-r"><fmt:formatNumber value="${item.salesAmount1 }" pattern="#,###" /></td>
													<td class="txt-r"><fmt:formatNumber value="${item.salesAmount }" pattern="#,###" /></td>
													<td class="txt-r"><fmt:formatNumber value="${item.collectAmount }" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${item.collectAmountRate }" pattern="#.#" />%</td>
													<td class="txt-r"><fmt:formatNumber value="${item.endAmount }" pattern="#,###" /></td>
													<td><fmt:formatNumber value="${item.expirationAvg }" pattern="#,###" /></td>
												</tr>
											</tbody>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:otherwise>
						</c:choose>
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

	<!-- 부품 B2B론 알림 팝업 -->
	<div id="popup" class="popup04 b2bPopup" style="display: none;">
		<div class="p-txt">
			<b>부품 B2B론 알림</b><br>
			매출채권 승인대기 건수가 <span class="fs-red fs-bold" id="b2bCnt">2건</span> 있습니다.<br>
			<a href="javascript:;" onclick="linkToChangeOrApprove();">[ 바로가기 ]</a>
		</div>
		<div class="closebox" onclick="closeB2BPopupNotToday();">
			<input type="checkbox" id="cls-btn">
			<label for="cls-btn">오늘 하루 그만보기<span class="mr0 ml10"></span></label>
		</div>
		<a href="javascript:;" class="btn-close">닫기</a>
	</div>
	<!-- // 부품 B2B론 알림 팝업 -->

	<script>
		var EXCEL_URL = "<c:url value='/downloads/sellerCompanyBilling.do' />"; // EXCEL EXPORT URL
		var b2bCnt = Number("${b2bCnt}");

		// TODO fix : 채권만기일 변경승인 페이지로 이동
		function linkToChangeOrApprove(){
			if(!HB2BLoanSign("", "${user.businessNo}", 0)) {
				openCertificateAlert();
			} else {
				window.location.href = "<c:url value='/seller/changeOrApprove/list.do'/>";
			}
		}

		// 오늘 하루 그만보기
		function closeB2BPopupNotToday(){
			setCookie("notToday", "Y", 1);
			$(".b2bPopup").hide();
			$_MASK.hide();
		}

		$(function(){
			// 검색날짜 데이트 피커 설정
			setMonthpicker("#searchDate", "yy.mm", $("#searchDate").val());

			// 부품 B2B론 알림 팝업
			if (b2bCnt > 0 && getCookie("notToday") != "Y") {
				$_MASK.show();
				$("#b2bCnt").text(b2bCnt + "건");
				$(".b2bPopup").fadeIn();
			}
		});
	</script>
</body>
</html>