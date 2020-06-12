<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	/**
	* @class name : taxbillList.jsp
	* @description : 세금계산서발행 list 화면
	* @modification information
	*
	*   수정일     수정자      수정내용
	*  -------    --------    ---------------------------
	*  2018.12.5  cdf team    최초 생성
	*
	* author cdf team
	* since 2018.12.5
	*
	*/
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>세금계산서 발행</title>
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
				<h2>세금계산서 발행</h2>

				<form action="<c:url value='/seller/taxBill/list.do'/>" method="post" name="searchForm" id="searchForm">
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

				<div class="tbl-btn">
					<a href="javascript:;" onclick="checkAll(true);">전체선택</a>
					<a href="javascript:;" onclick="checkAll(false);">선택해제</a>
					<a href="javascript:;" onclick="openTaxBillConfirm();">매출세금계산서 발행</a>
					<a href="javascript:;" onclick="openTaxBillAlert();">세금계산서관련 참고사항</a>
				</div>

				<div class="tbl-type01 basic">
					<table summary="세금계산서 발행을 하기위한 표입니다.">
						<caption>세금계산서 발행</caption>
						<colgroup>
							<col width="8%">
							<col width="*">
							<col width="10%">
							<col width="15%">
							<col width="10%">
							<col width="12%">
							<col width="12%">
							<col width="12%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">추가</th>
								<th scope="col">대리점명</th>
								<th scope="col">코드</th>
								<th scope="col">매출기간</th>
								<th scope="col">증표건수</th>
								<th scope="col">공급가액</th>
								<th scope="col">세액</th>
								<th scope="col">계</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<td colspan="3"></td>
								<td class="txt-c">총 계</td>
								<td></td>
								<td id="supplyValue">-</td>
								<td id="taxAmount">-</td>
								<td id="salesSlipSum">-</td>
							</tr>
						</tfoot>
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
											<td rowspan="2">
												<input type="checkbox" id="p-wr-${status.count}" name="chk_item" class="checkItem">
												<label for="p-wr-${status.count}" class="mr0">
													<span class="mt0 mr0"></span>
												</label>
											</td>
											<td>
												<c:if test="${item.groupType eq '0' }"><span class="blue">(현대)</span></c:if>
												<c:if test="${item.groupType eq '1' }"><span class="red">(기아)</span></c:if>
												<a href="javascript:;" onclick="linkToSalesBilling(${item.buyerBizNo});">${item.buyerCompanyName}</a>
											</td>
											<td>${item.buyerCode }</td>
											<td>${item.minSalesDate } - ${item.maxSalesDate }</td>
											<td><fmt:formatNumber value="${item.salesSlipCnt }" pattern="#,###" /></td>
											<td class="txt-r supplyValue"><fmt:formatNumber value="${item.supplyValue}" pattern="#,###" /></td>
											<td class="txt-r taxAmount"><fmt:formatNumber value="${item.taxAmount}" pattern="#,###" /></td>
											<td class="txt-r salesSlipSum"><fmt:formatNumber value="${item.salesSlipSum}" pattern="#,###" /></td>
										</tr>
										<tr>
											<td class="bdr-t0">비고 입력</td>
											<td colspan="6" class="bdr-t0">
												<c:if test="${item.groupType == '0' }">
													<input type="text" class="wp100" value="현대 [${item.buyerCode }] ">
												</c:if>
												<c:if test="${item.groupType == '1' }">
													<input type="text" class="wp100" value="기아 [${item.buyerCode }] ">
												</c:if>
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

	<!-- 매출세금계산서 발행 확인 팝업 -->
	<div class="acc2-pop" id="taxBillConfirmPopup" style="display: none; margin:-110px auto auto -261px; width: 522px; height: 220px;">
		<div class="pop-border"></div>
		<div class="msg-txt">
			세금계산서 발행시 국세청에 바로 전송됩니다.<br />
			또한 국세청에서 확인후 응답을 받기까지 15 ~ 30분정도의 시간이 소요 됩니다.<br />
			선택한 세금계산서에 대하여 발행하시겠습니까?<br />
			(진행상황은 세금계산서 진행조회 화면에서 확인 가능합니다.)'
		</div>
		<div class="btn-set2">
			<a href="javascript:;" class="ok" onclick="issueTaxBill();">확인</a>
			<a href="javascript:;" class="close" onclick="closeTaxBillConfirm();">취소</a>
		</div>
		<a href="javascript:;" class="btn-close" onclick="closeTaxBillConfirm();">닫기</a>
	</div>
	<!-- // 매출세금계산서 발행 확인 팝업 -->

	<!-- 세금계산서관련 참고사항 알림 팝업 -->
	<div class="acc2-pop" id="taxBillAlertPopup" style="display: none; margin:-110px auto auto -302px; width: 604px; height: 220px;">
		<div class="pop-border"></div>
		<div class="msg-txt" style="text-align: left;">
			1. 세금계산서 1 ~ 100건 발행시간은 동일하오니 일괄 발행 신청을 권장합니다.<br />
			2. 세금계산서 발행가능 시간은 24시간입니다.<br />
			3. 전일 발행 신청후 익일 확인을 최대한 활용하시기 바랍니다.<br />
			4. 국세청 업무가 집중되는 경우(월말 등) 발행시간이 늦어질 수 있으니 유의하시기 바랍니다.
		</div>
		<div class="btn-set2">
			<a href="javascript:;" class="ok" onclick="closeTaxBillAlert();">확인</a>
		</div>
		<a href="javascript:;" class="btn-close" onclick="closeTaxBillAlert();">닫기</a>
	</div>
	<!-- // 세금계산서관련 참고사항 알림 팝업 -->

	<script>
		var EXCEL_URL = ""; // EXCEL EXPORT URL

		// 전체 선택 || 선택 해제
		function checkAll(checked) {
			$(".checkItem").prop("checked", checked);
			summaryTaxbillAmount();
		}

		// 총계
		function summaryTaxbillAmount() {
			var length = checkedItemLength("chk_item");
			var keys = ["supplyValue", "taxAmount", "salesSlipSum"];
			var list = [];

			if (length > 0) {
				$(".checkItem:checked").each(function() {
					var i = $(".checkItem").index(this);
					var map = {};

					$.each(keys, function(index, key) {
						map[key] = Number(uncomma($("." + key).eq(i).text()));
					});

					list.push(map);
				});

				$.each(keys, function(index, key) {
					var amt = list.reduce(function(sum, item) {
						return sum + item[key]
					}, 0);

					$("#" + key).text(comma(amt));
				});
			} else {
				$.each(keys, function(index, key) {
					$("#" + key).text("-");
				});
			}
		}

		// 매출세금계산서 발행 확인 팝업 열기
		function openTaxBillConfirm() {
			var length = checkedItemLength("chk_item");

			if (length > 0) {
				$("#taxBillConfirmPopup").fadeIn();
			} else {
				openAlert("세금계산서를 발행하시려면 하나 이상 선택하세요.");
			}
		}

		// 매출세금계산서 발행 확인 팝업 닫기
		function closeTaxBillConfirm() {
			$("#taxBillConfirmPopup").hide();
		}

		// TODO fix 매출세금계산서 발행
		function issueTaxBill() {
			closeTaxBillConfirm();

			// 임시 알림창
			openAlert("세금계산서 발행이 완료되었습니다.", submitSearchForm);
		}

		// 세금계산서관련 참고사항 알림 팝업 열기
		function openTaxBillAlert() {
			$("#taxBillAlertPopup").fadeIn();
		}

		// 세금계산서관련 참고사항 알림 팝업 닫기
		function closeTaxBillAlert() {
			$("#taxBillAlertPopup").hide();
		}

		$(function() {
			// TODO fix : 검색기간 한달로 설정
			// 검색날짜 datepicker 설정
			setDatepicker("#startDate", "yy.mm.dd", $("#startDate").val(), true, null, null);
			setDatepicker("#endDate", "yy.mm.dd", $("#endDate").val(), true, null, null);

			// 체크박스 체크/체크해제시 총계
			$(document).on("change", ".checkItem", function() {
				summaryTaxbillAmount();
			});
		});
	</script>
</body>
</html>