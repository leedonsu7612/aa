<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	/**
	* @Class Name : accountReceivableList.jsp
	* @Description : 대리점 채권만기일 지정 List 화면
	* @Modification Information
	*
	*   수정일          수정자      수정내용
	*  ------------    --------    ---------------------------
	*   2018.11.28      CDF Team    최초 생성
	*
	* author CDF Team
	* since 2018.11.28
	*
	*/
%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>채권만기일 지정</title>
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

		<!-- 콘텐츠 시작 -->
		<div id="container" class="agency">
			<div id="contents">
				<h2>채권만기일 지정</h2>

				<form action="<c:url value='/buyer/accountReceivable/list.do'/>" method="post" name="searchForm" id="searchForm">
					<input type="hidden" name=targetBizNo id="targetBizNo" value="${params.targetBizNo }" />

					<div class="bd-head">
						<ul>
							<li><label for="searchDate" class="sound_only">날짜 선택</label><input type="text" class="wx120" id="searchDate" name="searchDate" value="${params.searchDate }" /></li>
							<li>
								<input type="radio" name="groupType" value="2" id="allRadio" onclick="submitSearchForm();" <c:if test="${params.groupType ne '0' or params.groupType ne '1'}">checked</c:if>><label for="allRadio"><span></span>All</label>
								<input type="radio" name="groupType" value="0" id="hyundaiRadio" onclick="submitSearchForm();" <c:if test="${params.groupType eq '0'}">checked</c:if>><label for="hyundaiRadio"><span></span>현대</label>
								<input type="radio" name="groupType" value="1" id="kiaRadio" onclick="submitSearchForm();" <c:if test="${params.groupType eq '1'}">checked</c:if>><label for="kiaRadio"><span></span>기아</label>
							</li>
							<li><label for="searchKeyword" class="sound_only">검색어 입력</label><input type="text" class="txt-c wx245" name="searchKeyword" id="searchKeyword" value="${params.searchKeyword }" placeholder="상점 선택" /></li>
							<li><a href="javascript:;" class="btn-sch" id="searchShopBtn">찾기</a></li>
							<li><a href="javascript:;" class="btn-sch" id="searchMyShopBtn">My 거래처</a></li>
							<li><a href="javascript:;" class="btn-submit" onclick="submitSearchForm();">조회하기</a></li>
						</ul>
					</div>
				</form>

				<div class="warr-msg">해당월 (${params.searchDate }) 매출의 기산일은 ${params.valueDate } 이며, 적수 65일의 만기일은 ${params.expirationDate } 입니다.</div>

				<c:if test="${params.groupType ne '1'}">
					<div class="ag-title">현대</div>

					<div class="tbl-type01 basic">
						<table summary="승인 확인을 위한 거래내역 확인 내용입니다." class="buyerAccount buyerAccountH">
							<caption>채권만기일 지정</caption>
							<colgroup>
								<col width="24%" />
								<col width="24%" />
								<col width="24%" />
								<col width="24%" />
								<col width="*" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">발행일</th>
									<th scope="col">발행가능금액</th>
									<th scope="col">발행금액</th>
									<th scope="col">만기일</th>
									<th scope="col">적수</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty listH }">
										<tr>
											<td colspan="5" class="text_center">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="item" items="${listH }" varStatus="status" begin="0" end="4">
											<tr>
												<td class="issueDate">${item.issueDate }</td>
												<td class="unexpectedDue"><fmt:formatNumber value="${item.account }" pattern="#,###" /></td>
												<td class="account"><input type="text" name="account" finalDateUnpay="${item.account }" isExtraaccount="${item.isExtraAmount }" period1Use="0" period2Use="0" period3Use="0" /></td>
												<td class="expirationDate"><input type="text" name="expirationDate" readonly /></td>
												<td class="expirationAvg"><input type="hidden" name="expirationAvg" /></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</c:if>

				<c:if test="${params.groupType ne '0'}">
					<div class="ag-title">기아</div>

					<div class="tbl-type01 basic">
						<table summary="승인 확인을 위한 거래내역 확인 내용입니다." class="buyerAccount buyerAccountK">
							<caption>채권만기일 지정</caption>
							<colgroup>
								<col width="25%" />
								<col width="*" />
								<col width="25%" />
								<col width="25%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">발행일</th>
									<th scope="col">발행가능금액</th>
									<th scope="col">발행금액</th>
									<th scope="col">만기일</th>
									<th scope="col">적수</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty listK }">
										<tr>
											<td colspan="5" class="text_center">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="item" items="${listK }" varStatus="status" begin="0" end="4">
											<tr>
												<td class="issueDate">${item.issueDate }</td>
												<td class="unexpectedDue"><fmt:formatNumber value="${item.account }" pattern="#,###" /></td>
												<td class="account"><input type="text" name="account" finalDateUnpay="${item.account }" isExtraAmount="${item.isExtraAmount }" period1Use="0" period2Use="0" period3Use="0" /></td>
												<td class="expirationDate"><input type="text" name="expirationDate" readonly /></td>
												<td class="expirationAvg"><input type="hidden" name="expirationAvg" /></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</c:if>

				<div class="btn-set">
					<a href="javascript:;" id="issueBtn">발행</a>
				</div>
			</div>

		</div>
		<!-- 콘텐츠 끝 -->

		<!-- 하단 시작 -->
		<c:import url="../inc/buyer/footer.jsp" />
		<!-- 하단 끝 -->
	</div>

	<!-- 대리점 공통 -->
	<c:import url="../inc/buyer/commom.jsp" />
	<!-- // 대리점 공통 -->

	<script>
		var today = new Date().toJSON().slice(0,10).replace(/-/g, '.'); // 오늘 날짜 "yyyy.mm.dd"
		var dishoneredCode = "${dishoneredCode }"; // 연체/부도 코드
		var IsSuccessSingleExpAvg = false; // 싱글 만기일 적수 정상여부
		var IsSuccessExpAvg = false; // 만기일 적수 정상여부
		// TODO 키보드 & 마우스 컨트롤 등
		var isClicked = false;
		var isKeyProcess = false;
		var isMouseProcess = false;

		// 발행가능 금액 계산
		function calculateAmount(el, type) {
			var amt = uncomma(el.val());

			if (amt != null) {
				if (amt == "0") {
					amt = "";
				}

				var sum = 0;
				var unpay = el.attr("finalDateUnpay");
				var used = uncomma($(this).parent(".account").siblings(".unexpectedDue").text());

				el.parents(".buyerAccount").find("[name=account]").each(function() {
					sum += Number(uncomma($(this).val()));
				});

				var dif = unpay - sum;

				if (type == "keyup") {
					if (dif < 0) {
						el.val(0);
					} else {
						el.val(comma(amt));
					}
				} else if (type == "blur") {
					if (dif < 0) {
						el.parents(".buyerAccount").find(".unexpectedDue").text(comma(used));
					} else {
						el.parents(".buyerAccount").find(".unexpectedDue").text(comma(dif));
					}
				}
			}
		}

		// 적수 계산
		function calculateExpirationAvg(el) {
			var $parent = el.parent(".account");
			var account = uncomma(el.val());
			var expirationDate = $parent.next(".expirationDate").children("[name=expirationDate]").val();

			if (account != null && expirationDate != null) {
				checkExpirationDateSingle(el);
				checkExpirationDate();
			} else {
				$parent.siblings(".expirationAvg").children("[name=expirationAvg]").val(0);
			}
		}

		// 싱글 만기일 적수 계산
		function checkExpirationDateSingle(el){
			var attributes = el[0].attributes;
			var searchDate = getDate($("#searchDate").val());
			var valueDate = new Date(searchDate.getFullYear(), (searchDate.getMonth() + 1), 1);
			var periodBal = [ Number(attributes.period1Bal.value), Number(attributes.period2Bal.value), Number(attributes.period3Bal.value) ];

			el.parents(".buyerAccount").find("tbody").find("tr").each(function(index, item) {
				var expirationDate = getDate($("[name=expirationDate]").eq(index).val());
				var expAvg = getDateDiff(expirationDate - valueDate);
				var account = Number(uncomma($("[name=account]").eq(index).val()));
				var periodUse = [ "period1Use", "period2Use", "period3Use" ];

				if (expirationDate == null || expirationDate == "" || account == null || account == "" || account == 0) {
					continue;
				}

				if (account > 0) {
					$.each(periodUse, function(idx, item) { // 구간별 계산
						var bal = periodBal[idx];
						var use = 0;

						if (bal >= account) {
							bal -= account;
							use = account * expAvg;
							account = 0;
						} else {
							use = bal * expAvg;
							account -= bal;
							bal = 0;
						}

						$(".account").eq(index).attr(item, use);
					});
				}

				if (expAvg >= 180) {
					openAlert("적수일자가 개별 지정가능 최대 만기일 180일을 초과하였습니다. 만기일을 다시 설정해 주세요.");
					IsSuccessSingleExpAvg = false;
					return false;
				} else {
					IsSuccessSingleExpAvg = true;
				}
			});
		}

		// 만기일 적수 계산
		function checkExpirationDate() {
			var dataList = getDataList();

			if (dataList.length < 1) {
				$("[name=expirationAvg]").each(function() {
					$(this).val(0);
				});

				return false;
			}

			var ajaxUrl = "<c:url value='/buyer/accountReceivable/expirationAvg.json' />";
			var jsonData = "jsonData=" + (JSON.stringify(dataList));

			doAjax(ajaxUrl, jsonData, function(data) {
				var expAvgH = 0, expAvgK = 0;

				if (data.length > 0) {
					$("[name=expirationAvg]").each(function() {
						$(this).val(0);
					});

					var idxH = 0, idxK = 0;

					$.each(data, function(index, item) {
						if (item.groupType == "0") {
							expAvgH = item.expirationAvgH;
							$(".buyerAccountH").find("[name=expirationAvg]").eq(idxH++).val(expAvgH);
						} else if (item.groupType == "1") {
							expAvgK = item.expirationAvgK;
							$(".buyerAccountK").find("[name=expirationAvg]").eq(idxK++).val(expAvgK);
						}
					});

					if (expAvgH > 65 || expAvgK > 65) {
						openAlert("적수일자가 월별 적수 65일을 초과하였습니다. 만기일을 다시 설정해 주세요.");
						IsSuccessExpAvg = false;
						return false;
					} else {
						IsSuccessExpAvg = true;
					}
				}
			});
		}

		// 채권만기일 지정 리스트
		function getDataList(){
			var dataList = new Array();

			$(".buyerAccount").each(function() {
				var groupType = $(this).hasClass("buyerAccountH") ? "0" : "1";

				$(this).find("tbody").children("tr").each(function(index, item) {
					var account = uncomma($(this).find("[name=account]").val());
					var expirationDate = $(this).find("[name=expirationDate]").val();

					if (account != null && account != "" && expirationDate != null && expirationDate != "") {
						var buyerBizNo = "${user.businessNo }";
						var sellerBizNo = $("#targetBizNo").val();
						var issueDate = $(this).find(".issueDate").text();
						var expirationAvg = $(this).find("[name=expirationAvg]").val();
						var salesDate = $("#searchDate").val();

						if (issueDate != "" && buyerBizNo != "" && sellerBizNo != "" && groupType != "" && expirationAvg != "" && salesDate != "") {
							var dataObj = {
								account : account,
								expirationDate : expirationDate,
								issueDate : issueDate,
								buyerBizNo : buyerBizNo,
								sellerBizNo : sellerBizNo,
								groupType : groupType,
								expirationAvg : expirationAvg,
								salesDate : salesDate
							};

							dataList.push(dataObj);
						}
					}
				});
			});

			return dataList;
		}

		$(function() {
			// 검색날짜 datepicker 설정
			setMonthpicker("#searchDate", "yy.mm", $("#searchDate").val());

			// 만기일 datepicker 설정
			setDatepicker("[name=expirationDate]", "yy.mm.dd", today, false, "${params.valueDate }", "${params.expirationDate }");

			// 페이지 열릴 때 발행가능 금액이 0 이면 disabled 해준다.
			$(".unexpectedDue").each(function(index, item) {
				if ($(this).text() == "0") {
					$("[name=expirationDate]").eq(index).prop("disabled", true);
					$("[name=account]").eq(index).prop("disabled", true);
				}
			});

			// 연체/부도 체크
			if (dishoneredCode.indexOf("Y") != -1) {
				if (dishoneredCode.substring(1, 2) == "Y" || dishoneredCode.substring(3, 4) == "Y") {
					openAlert("부도 중에는 연체 시작일 이후 매출에 대하여 매출채권 발행이 제한됩니다.");
				} else if (dishoneredCode.substring(0, 1) == "Y" || dishoneredCode.substring(2, 3) == "Y") {
					openAlert("연체 중에는 연체 시작일 이후 매출에 대하여 매출채권 발행이 제한됩니다.");
				}
			}

			//기타지급 요청 체크
			$("[name=account]").each(function(index, item) {
				if ($(this).attr("isExtraAmount") == "1") {
					openAlert("기타 지급 요청이 있습니다. 기타 지급 요청 금액만큼 발행가능 금액이 차감되므로 먼저 처리해 주시기 바랍니다.");
					return false;
				}
			});

			// 발행가능금액 입력
			$("[name=account]").on({
				"keyup" : function() {
					calculateAmount($(this), "keyup");
				},
				"blur" : function() {
					if($(this).val == null || $(this).val() == "") return false;
					calculateAmount($(this), "blur");
					checkExpirationDate($(this));
				}
			});

			// 만기일 입력
			$("[name=expirationDate]").on({
				"change" : function() {
					if($(this).val == null || $(this).val() == "") return false;
					calculateAmount($(this).parent(".expirationDate").siblings(".account").children("[name=account]"), "blur");
					checkExpirationDate($(this).parent(".expirationDate").siblings(".account").children("[name=account]"));
				}
			});

			// 발행 버튼 클릭
			$("#issueBtn").click(function() {
				$(document).scrollTop(0);

				var dataList = getDataList();

				if (dataList.length > 0) {
					var jsonData = "jsonData=" + (JSON.stringify(dataList));

					doAjax("<c:url value='/buyer/salesBilling/unspecified.json' />", jsonData, function(data) {
						if (data["resultMessage"] == "Success") { //성공
							openAlert("매출채권이 정상적으로 생성되었습니다.", submitSearchForm);
						} else { //실패
							if (data["resultCode"] == "210") {
								openAlert("발행 중인 매출채권이 존재 합니다. 5분뒤에 다시 시도 해 주세요.", submitSearchForm);
							} else {
								openAlert("일부 매출채권 생성에 실패하였습니다.\r\n건수 : " + data["errorMessage"] + "성공", submitSearchForm);
							}
						}
					});
				} else {
					openAlert("금액이 설정되어있지 않은 매출채권이 있습니다.");
				}
			});
		});
	</script>
</body>
</html>