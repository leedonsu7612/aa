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
	*   수정일          수정자      수정내용
	*  ------------    --------    ---------------------------
	*   2018.11.23      CDF Team    최초 생성
	*
	* author CDF Team
	* since 2018.11.23
	*
	*/
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>상계지급 승인요청 조회</title>
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
				<h2>상계지급 승인</h2>

				<form action="<c:url value='/buyer/setOff/list.do'/>" method="post" name="searchForm" id="searchForm">
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

				<div class="bd-info">
					<ul>
						<li>총 <fmt:formatNumber value="${paginationInfo.totalRecordCount }" pattern="#,###" /> 건</li>
						<li><a href="javascript:;" class="btn-excel" onclick="excelExport(${fn:length(list)});">다운로드</a></li>
					</ul>
				</div>

				<div class="tbl-type01 basic">
					<table summary="상계지급 승인요청 조회 상세 현황입니다.">
						<caption>상계지급 승인 목록</caption>
						<colgroup>
							<col width="8%" />
							<col width="15%" />
							<col width="15%" />
							<col width="15%" />
							<col width="*" />
							<col width="13%" />
							<col width="13%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">NO</th>
								<th scope="col">발행일</th>
								<th scope="col">만기일</th>
								<th scope="col">상계지급금액</th>
								<th scope="col">거래처명</th>
								<th scope="col">거래구분</th>
								<th scope="col">승인</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty list}">
									<tr>
										<td colspan="7">자료가 없습니다. 다른 검색조건을 선택해주세요.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${list }" varStatus="status">
										<tr>
											<td>${status.count }</td>
											<td>${item.issueDate }</td>
											<td>${item.expirationDate }</td>
											<td class="txt-r"><fmt:formatNumber value="${item.amount }" pattern="#,###" /></td>
											<td>
												<c:if test="${item.groupType eq '0' }"><span class="fs-blue">(현대)</span></c:if>
												<c:if test="${item.groupType eq '1' }"><span class="fs-red">(기아)</span></c:if>
												<a href="javascript:;" onclick="linkToSalesBilling('${item.sellerBizNo }')">${item.sellerCompanyName }</a>
											</td>
											<td>상계지급</td>
											<td>
												<span class="hide" transactionNo="${item.transactionNo }" amount="${item.amount }"></span>
												<a href="javascript:;" class="btn-submit paymentBtn approve">승인</a>
												<a href="javascript:;" class="btn-cancel paymentBtn cancel">취소</a>
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

	<!-- 대리점 공통 -->
	<c:import url="../inc/buyer/commom.jsp" />
	<!-- // 대리점 공통 -->

	<script>
		var EXCEL_URL = "<c:url value='/downloads/buyerSetOff.do'/>"; // EXCEL EXPORT URL

		// 승인 || 취소 처리
		function updateUnauthorized(jsonData) {
			closeConfirm();
			$_LOADING.fadeIn();

			//인증서모듈체크
			if (!HB2BLoanSign(jsonData, "", 0)) {
				$_LOADING.fadeOut();
				return false;
			}

			var flag = jsonData.progressFlag;
			var ajaxUrl = "";

			if(flag == "3") { // 승인
				ajaxUrl = "<c:url value='/buyer/setOff/approve.json'/>";
			} else if (flag == "2") { // 취소
				ajaxUrl = "<c:url value='/buyer/setOff/reject.json'/>";
			} else {
				return false;
			}

			doAjax(ajaxUrl, jsonData, submitSearchForm);
		}

		$(function() {
			// 검색날짜 datepicker 설정
			setMonthpicker("#searchDate", "yy.mm", $("#searchDate").val());

			// 승인 || 취소 버튼 클릭
			$(document).on("click", ".paymentBtn", function(){
				var $this = $(this);
				var msg, progressFlag = "";

				if($this.hasClass("approve")) {
					msg = "승인처리 하시겠습니까?";
					progressFlag = "3";
				} else if ($this.hasClass("cancel")) {
					msg = "취소처리 하시겠습니까?";
					progressFlag = "2";
				} else {
					return false;
				}

				var attributes = $this.siblings("span")[0].attributes;
				var jsonData = {
						transactionNo : attributes.transactionNo.value,
						amount : attributes.amount.value,
						progressFlag : progressFlag
				};

				openConfirm(msg, updateUnauthorized, [jsonData]);
			});
		});
	</script>
</body>
</html>