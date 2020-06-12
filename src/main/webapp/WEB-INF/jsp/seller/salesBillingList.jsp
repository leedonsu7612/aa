<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	/**
	* @Class Name : salesBillingList.jsp
	* @Description : 수금내역(상세) List 화면
	* @Modification Information
	*
	*   수정일     수정자      수정내용
	*  -------    --------    ---------------------------
	*  2018.11.19  CDF Team    최초 생성
	*
	* author CDF Team
	* since 2018.11.19
	*
	*/
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>수금내역(상세)</title>
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
				<h2>수금내역(상세)</h2>

				<form action="<c:url value='/seller/salesBilling/list.do'/>" method="post" name="searchForm" id="searchForm">
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
					<table summary="품목점 상세정보표 입니다.">
						<caption>품목점 상세정보</caption>
						<colgroup>
							<col width="*" />
							<col width="16%" />
							<col width="16%" />
							<col width="16%" />
							<col width="16%" />
							<col width="16%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">품목지원센터</th>
								<th scope="col">대표자</th>
								<th scope="col">사업자번호</th>
								<th scope="col">지급보증한도</th>
								<th scope="col">잔여보증금액</th>
								<th scope="col">초과금액</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${limit.companyName }</td>
								<td>${limit.ceoName }</td>
								<td>${limit.businessNo }</td>
								<td class="txt-r"><fmt:formatNumber value="${limit.salesLimit }" pattern="#,###" /></td>
								<td class="txt-r"><fmt:formatNumber value="${limit.remainingLimit }" pattern="#,###" /></td>
								<td class="txt-r"><fmt:formatNumber value="${limit.overLimit }" pattern="#,###" /></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="tbl-type01 basic mt20">
					<table summary="품목점 거래내역 상세정보 입니다.">
						<caption>품목점 거래내역 정보</caption>
						<colgroup>
							<col width="7%" />
							<col width="11%" />
							<col width="11%" />
							<col width="11%" />
							<col width="11%" />
							<col width="11%" />
							<col width="11%" />
							<col width="11%" />
							<col width="11%" />
							<col width="5%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">년월</th>
								<th scope="col">매출내역</th>
								<th scope="col">세금계산서<br />발행금액</th>
								<th scope="col">총수금내역</th>
								<th scope="col">만기일<br />지정수금</th>
								<th scope="col">기타수금</th>
								<th scope="col">상계수금</th>
								<th scope="col">미수금</th>
								<th scope="col">초과수금</th>
								<th scope="col">적수</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty list}">
									<tr>
										<td colspan="10">자료가 없습니다. 다른 검색조건을 선택해주세요.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<!-- TODO fix - 데이터 정확히 맞추기 -->
									<c:forEach var="item" items="${list}" varStatus="status">
										<tr>
											<td class="salesDate">${item.regDate }</td>
											<td class="txt-r salesAmount"><fmt:formatNumber value="${item.salesAmount }" pattern="#,###" /></td>
											<td class="txt-r taxAmount"><fmt:formatNumber value="${item.taxAmount }" pattern="#,###" /></td>
											<td class="txt-r collectAmount">
												<c:if test="${item.collectAmount gt 0}">
												<a href="javascript:;" class="fs-red2"><fmt:formatNumber value="${item.collectAmount }" pattern="#,###" /></a>
												</c:if>
												<c:if test="${item.collectAmount le 0}">
												0
												</c:if>
											</td>
											<td class="txt-r receivableAmount"><fmt:formatNumber value="${item.receivableAmount }" pattern="#,###" /></td>
											<td class="txt-r extraAmountOk"><fmt:formatNumber value="${item.extraAmountOk }" pattern="#,###" /></td>
											<td class="txt-r setoffOk"><fmt:formatNumber value="${item.setoffOk}" pattern="#,###" /></td>
											<td class="txt-r endAmount">
												<c:if test="${item.endAmount gt 0}">
													<a href="javascript:;" class="btn-acc fs-blue"><fmt:formatNumber value="${item.endAmount }" pattern="#,###" /></a>
													<span class="hide" unexpectedDue="${item.taxAmount }" unpaidTaxBill="${item.salesAmount - item.taxAmount - item.setoffOk}" limitExcess="${item.overAmount }"></span>
												</c:if>
												<c:if test="${item.endAmount le 0}">0</c:if>
											</td>
											<td class="txt-r overAmount"><fmt:formatNumber value="${item.collectAmount gt item.salesAmount ? item.collectAmount - item.salesAmount : 0}" pattern="#,###" /></td>
											<td class="expirationAvg"><fmt:formatNumber value="${item.expirationAvg }" pattern="#,###" /></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>

				<h3>기간별 결제내역조회</h3>

				<div class="tbl-type01 basic mt20">
					<table summary="기간별 결제내역 현황 조회입니다." id="collcetionByPeriod">
						<caption>기간별 결제내역조회 목록</caption>
						<colgroup>
							<col width="8%" />
							<col width="13%" />
							<col width="13%" />
							<col width="13%" />
							<col width="13%" />
							<col width="*" />
							<col width="8%" />
							<col width="13%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">NO</th>
								<th scope="col">발행일</th>
								<th scope="col">만기일</th>
								<th scope="col">결제일</th>
								<th scope="col">금액</th>
								<th scope="col">승인번호</th>
								<th scope="col">적수</th>
								<th scope="col">진행상태</th>
							</tr>
						</thead>
						<tfoot>
							<td></td>
							<td></td>
							<td class="txt-c">계</td>
							<td></td>
							<td class="totalCollectionAmount">-</td>
							<td></td>
							<td class="txt-c totalExpirationAvg">-</td>
							<td></td>
						</tfoot>
						<tbody>
							<tr>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td class="txt-r">-</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
							</tr>
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

	<!-- 미수금 팝업 -->
	<div class="acc-pop" id="endAmountPopup" style="display: none;">
		<div class="pop-border"></div>
		<div class="tbl-type04 mt30">
			<table summary="마우스를 올리거나 클릭, 포커스가 올라오면 만기일미지정, 미발행세금계산서 확인이 가능합니다.">
				<caption>미수금</caption>
				<thead>
					<tr>
						<th scope="colgroup" colspan="2">발행가능 금액</th>
						<th scope="col" rowspan="2">초과금액</th>
					</tr>
					<tr>
						<th scope="col" class="fs-blue bdr-l0">만기일 미지정</th>
						<th scope="col" class="bdr-l0">세금계산서 미발행</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td id="unexpectedDue">-</td>
						<td id="unpaidTaxBill">-</td>
						<td id="limitExcess">-</td>
					</tr>
				</tbody>
			</table>
		</div>
		<a href="javascript:;" class="btn-close">닫기</a>
	</div>
	<!-- // 미수금 팝업 -->

	<!-- 대리점 공통 -->
	<c:import url="../inc/buyer/commom.jsp" />
	<!-- // 대리점 공통 -->

	<script>
		var EXCEL_URL = "<c:url value='/downloads/sellerSalesBilling.do'/>"; // EXCEL EXPORT URL
		var COLLECTION_BY_PERIOD_URL = "<c:url value='/seller/salesBilling/list.json'/>"; // 기간별 결제내역조회 URL
		var expirationAvg; // 합계적수 가지고 있을 변수

		// 총수금내역 목록 출력
		function selectCollectionAmount(data) {
			var $collectionTb = $("#collcetionByPeriod");
			var dataLength = data.length;
			var totalAmount = 0;
			var html = "";

			$collectionTb.find("a").off();

			if(dataLength > 0) {
				$collectionTb.find("tbody").empty();

				for(i = 0; i < dataLength; i++) {
					html =
						"<tr>"
						+ "<td>" + (i + 1) + "</td>"
						+ "<td>" + data[i].issueDate + "</td>"
						+ "<td>" + data[i].expirationDate + "</td>"
						+ "<td>" + data[i].paymentDate + "</td>"
						+ "<td class=\"txt-r\">" + comma(data[i].amount) + "</td>"
						+ "<td>" + data[i].transactionNo + "</td>"
						+ "<td>" + data[i].expirationAvg + "</td>"
						+ "<td>" + (data[i].progressFlag == 1 || data[i].progressFlag == 5 ? "<a href=\"javascript:;\" class=\"fs-red2\" onclick=\"linkToHci('" + data[i].issueDate + "', '" + data[i].expirationDate + "', '" + data[i].transactionNo + "');\">" + getProgressStatus(data[i].progressFlag, "B") + "</a>" : getProgressStatus(data[i].progressFlag, "B")) + "</td>"
						+ "</tr>";

					$collectionTb.append(html);
					totalAmount += Number(data[i].amount);
				}

				$("#collcetionByPeriod").find(".totalCollectionAmount").text(comma(totalAmount)).siblings(".totalExpirationAvg").text(expirationAvg);
			} else {
				html = "<td colspan=\"8\">자료가 없습니다. 다른 검색조건을 선택해주세요.</td>";
				$collectionTb.find("tbody").html(html);
				$("#collcetionByPeriod").find(".totalCollectionAmount").text("-").siblings(".totalExpirationAvg").text("-");
			}
		}

		// 미수금 팝업 위치
		function positoinEndAmountPopup(targetEl, popupEl){
			var top = targetEl.offset().top + targetEl.outerHeight() - 5;
			var left = targetEl.offset().left - popupEl.outerWidth();
			popupEl.css({"top" : top, "left" : left});
		}

		// 세금계산서 발행 페이지로 이동
		function linkToTaxBill() {
			$("#searchForm").attr("action", "<c:url value='/seller/taxBill/list.do'/>");
			submitSearchForm();
		}

		$(function() {
			// 검색날짜 datepicker 설정
			setMonthpicker("#startDate", "yy.mm", $("#startDate").val());
			setMonthpicker("#endDate", "yy.mm", $("#endDate").val());

			// 총수금내역 클릭
			$(document).on("click", ".collectAmount a", function() {
				var $parent = $(this).parent(".collectAmount");
				var buyerBizNo = $("#targetBizNo").val(); // 대리점 사업자번호
				var sellerBizNo = "${user.businessNo}"; // 품목점 사업자번호
				var groupType = $("#groupType").val(); // 구분
				var salesDate = $parent.siblings(".salesDate").text(); // 매출월
				expirationAvg = Number(uncomma($parent.siblings(".expirationAvg").text())); // 적수
				var jsonData = {
					buyerBizNo : buyerBizNo,
					sellerBizNo : sellerBizNo,
					groupType : groupType,
					salesDate : salesDate,
					expirationAvg : expirationAvg
				};

				// 총수금내역 목록 조회
				doAjax(COLLECTION_BY_PERIOD_URL, jsonData, selectCollectionAmount);
			});

			// 세금계산서 미발행 클릭
			$(document).on("click", ".endAmount a", function(){
				var $this = $(this);
				var $popup = $("#endAmountPopup");
				$popup.hide();
				var accessLevel = "R";
				var sellerBizNo = $("#targetBizNo").val(); // 품목점 사업자번호
				var salesDate = $this.parent("td").siblings(".salesDate").text(); // 매출월
				var unexpectedDue = Number($this.next().attr("unexpectedDue")); // 채권만기일 미지정 금액
				var unpaidTaxBill = Number($this.next().attr("unpaidTaxBill")); // 세금계산서 미발행 금액
				var limitExcess = Number($this.next().attr("limitExcess")); // 한도초과 금액
				var limitDiff = limitExcess;

				if (limitDiff > 0) {
					if (unexpectedDue > limitDiff) { // 미지정 > 초과
						unexpectedDue = unexpectedDue - limitDiff; // 미지정 = 미지정 - 초과		[강남송도 - 삼한모터렌] (4131329 = 10603115 - 6471786)
						limitDiff = 0; // 초과 = 0
					} else { // 미지정 <= 초과
						limitDiff = limitDiff - unexpectedDue; // 초과 = 초과 - 미지정
						unexpectedDue = 0; // 미지정 = 0
					}

					unexpectedDue = unexpectedDue < 0 ? 0 : unexpectedDue;

					if (unpaidTaxBill > limitDiff) { // 미발행 > 초과
						unpaidTaxBill = unpaidTaxBill - limitDiff; // 미발행 = 미발행 - 초과		[강남송도 - 삼한모터렌] (3618164 = 3618164 - 0)
					} else { // 미발행 <= 초과
						limitDiff = limitDiff - unpaidTaxBill; // 초과 = 초과 - 미발행
						unpaidTaxBill = 0; // 미발행 = 0
					}

					unpaidTaxBill = unpaidTaxBill < 0 ? 0 : unpaidTaxBill;
				}

				// TODO fix 임시주석
				/* if (Number(unexpectedDue) > 0 && accessLevel != "R") { */
					var html  = "<a href=\"javascript:;\" onclick=\"linkToTaxBill();\">" + comma(unpaidTaxBill) + "</a>";
					$("#unexpectedDue").text(comma(unexpectedDue));
					$("#unpaidTaxBill").html(html);
					$("#limitExcess").text(comma(limitExcess));
				/* } else {
					$("#unexpectedDue").text(comma(unexpectedDue));
					$("#unpaidTaxBill").text(comma(unpaidTaxBill));
					$("#limitExcess").text(comma(limitExcess));
				} */

				positoinEndAmountPopup($this.parent("td").next("td"), $popup);
				$popup.fadeIn();
			});
		});
	</script>
</body>
</html>