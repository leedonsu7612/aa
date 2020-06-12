<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	/**
	* @Class Name : companysBillingList.jsp
	* @Description : 품목점 수금현황(종합) List 화면
	* @Modification Information
	*
	*   수정일     수정자      수정내용
	*  -------    --------    ---------------------------
	*   2018.11.30             최초 생성
	*
	* author CDF Team
	* since 2018.11.30
	*
	*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>품목점 수금현황(종합)</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/popup.css'/>">
	<!--[if lte IE 7]>
	<script type="text/javascript" src="<c:url value='/js/json2.js'/>" ></script>
	<![endif]-->
	<script type="text/javascript" src="<c:url value='/js/jquery-1.10.2.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery-ui.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery.easing.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery.bxslider.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/select.js'/>"></script>
</head>
<body class="main">
	<div id="mask"></div>

	<!-- header -->
	<c:import url="../../inc/buyer/old/sellerHeader.jsp" />
	<!--// header -->

	<div id="wrap">
		<div id="container">
			<div id="contents">
				<!-- title -->
				<h2 class="hidden">품목점 수금 현황(종합)</h2>
				<!-- // title -->

				<!-- 검색조건 -->
				<form id="searchForm" class="mt20" action="<c:url value='/seller/companysBilling/list.do' />" method="post">
					<input type="hidden" name="groupType" id="groupType" value="${params.groupType }" />
					<input type="hidden" name="businessNo" id="businessNo" value="${params.businessNo }" />
					<input type="hidden" name="businessNoList" id="businessNoList" value="${params.businessNoList }" />
					<input type="hidden" name="searchType" id="searchType" value="${params.searchType }" />
					<input type="hidden" name="searchKeyword" id="searchKeyword" value="${params.searchKeyword }" />
					<input type="hidden" name="progressStatus" id="progressStatus" value="${params.progressStatus }" />
					<input type="hidden" name="pageIndex" id="pageIndex" value="${params.pageIndex }" />
					<fieldset>
						<legend>검색폼</legend>
						<table class="tbl_search" summary="">
							<caption>조회</caption>
							<colgroup>
								<col width="130">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">검색조건</th>
									<td>
										<p>
											<label for="startDate" class="hidden">조회 기준날짜 선택</label><input type="text" name="startDate" id="startDate" class="input ac mr5 EnterKeyDown" style="width: 95px;" value="${params.startDate }">
											<img src="<c:url value='/images/ico/ico_calendar.gif'/>" alt="검색 기준날짜 선택" class="mr15" onclick="dateClick('startDate')">
											<input type="radio" value="2" class="mr5"><a href="javascript:;" id="allRadio" class="mr15 fb">All</a>
											<input type="radio" value="0" class="mr5"><a href="javascript:;" id="hyundaiRadio" class="mr15 fb">현대</a>
											<input type="radio" value="1" class="mr5"><a href="javascript:;" id="kiaRadio" class="mr15 fb">기아</a>
											<span class="btn btn_normal ml10">
												<a href="javascript:;" id="searchButton" style="width: 80px;">조회하기</a>
											</span>
										</p>
									</td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</form>
				<!-- // 검색조건 -->

				<br />

				<!-- 품목점 수금 현황(종합) -->
				<h3 class="hidden">품목점 수금 현황(종합)</h3>

				<table id="ariListTable" class="tbl_view2 mb10 mt15" summary="품목점 수금 현황(종합)을 상세하게 조회합니다.">
					<caption>품목점 수금 현황(종합)</caption>
					<colgroup>
						<col width="20%">
						<col width="13%">
						<col width="13%">
						<col width="13%">
						<col width="13%">
						<col width="9%">
						<col width="13%">
						<col width="6%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="tbl_center" rowspan="2" id="store_name">대리점명</th>
							<th scope="col" class="tbl_center" colspan="3" id="give_month">수금 대상(조회월 기준)</th>
							<th scope="col" class="tbl_center" rowspan="2" id="this_month">당월수금</th>
							<th scope="col" class="tbl_center" rowspan="2" id="recovery">회수율</th>
							<th scope="col" class="tbl_center" rowspan="2" id="balance">미회수잔액</th>
							<th scope="col" class="tbl_center" rowspan="2" id="etc_money">적수</th>
						</tr>
						<tr>
							<th class="tbl_center" scope="col" id="first_month">${month1 }월이전</th>
							<th class="tbl_center" scope="col" id="second_month">${month2 }월</th>
							<th class="tbl_center" scope="col" id="third_month">${month3 }월</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list}">
							<tr>
								<td colspan="8" class="text_center">자료가 없습니다. 다른 검색조건을 선택해주세요.</td>
							</tr>
							<tr>
								<th class="tbl_center" scope="row" id="sum_final">합계</th>
								<td class="money_right" headers="give_month first_month sum_final">0</td>
								<td class="money_right" headers="give_month second_month sum_final">0</td>
								<td class="money_right" headers="give_month third_month sum_final">0</td>
								<td class="money_right" headers="this_month sum_final">0</td>
								<td class="text_center" headers="recovery sum_final">0%</td>
								<td class="money_right" headers="balance sum_final">0</td>
								<td class="text_center" headers="etc_money sum_final">0</td>
							</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${list}" varStatus="status">
									<c:choose>
										<c:when test="${status.last}">
										<!-- 합계 -->
										<tr>
											<th class="tbl_center" scope="row" id="sum_final">합계</th>
											<td class="money_right" headers="give_month first_month sum_final">
												<fmt:formatNumber value="${item.salesAmount2 }" pattern="#,###" />
											</td>
											<td class="money_right" headers="give_month second_month sum_final">
												<fmt:formatNumber value="${item.salesAmount1 }" pattern="#,###" />
											</td>
											<td class="money_right" headers="give_month third_month sum_final">
												<fmt:formatNumber value="${item.salesAmount }" pattern="#,###" />
											</td>
											<td class="money_right" headers="this_month sum_final">
												<fmt:formatNumber value="${item.collectAmount }" pattern="#,###" />
											</td>
											<td class="text_center" headers="recovery sum_final">
												<fmt:formatNumber value="${item.collectAmountRate }" pattern="#.#" /> %
											</td>
											<td class="money_right" headers="balance sum_final">0</td>
											<td class="text_center" headers="etc_money sum_final">0</td>
										</tr>
										<!-- // 합계 -->
										</c:when>
										<c:otherwise>
										<tr>
											<td class="text_center businessName" id="store_name + '${status.current }'" businessnumber="${item.buyerBizNo }">
												<a href="javascript:;">[${item.buyerMembNo }] <script>changeGroupColor('${item.buyerCompanyName }');</script></a>
											</td>
											<td class="money_right ivory" headers="give_month first_month store_name + '${status.current}'">
												<fmt:formatNumber value="${item.salesAmount2 }" pattern="#,###" />
											</td>
											<td class="money_right ivory" headers="give_month second_month store_name + '${status.current}'">
												<fmt:formatNumber value="${item.salesAmount1 }" pattern="#,###" />
											</td>
											<td class="money_right ivory" headers="give_month third_month store_name + '${status.current}'">
												<fmt:formatNumber value="${item.salesAmount }" pattern="#,###" />
											</td>
											<td class="tb_view01 money_right" headers="this_month store_name + '${status.current}'" currentpayment="0" extrapayment="0">
												<fmt:formatNumber value="${item.collectAmount }" pattern="#,###" />
											</td>
											<td class="text_center" headers="recovery store_name + '${status.current}'">
												<fmt:formatNumber value="${item.collectAmountRate }" pattern="#.#" /> %
											</td>
											<td class="tb_view04 money_right ivory" headers="balance store_name0" untaxbillpayment="0" totalnonpayment="0" receivablemoney="0">
												<fmt:formatNumber value="${item.endAmount }" pattern="#,###" />
											</td>
											<td class="text_center" headers="etc_money store_name + '${status.current}'">
												<fmt:formatNumber value="${item.expirationAvg }" pattern="#,###" />
											</td>
										</tr>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<!-- // 품목점 수금현황(종합) -->

				<!-- 엑셀 출력 -->
				<p class="ar">
					<span class="btn btn_normal2 mb10"><a href="javascript:;" onclick="excelExport(11)" style="width: 100px;">엑셀</a></span>
				</p>
				<!-- // 엑셀 출력 -->

				<!-- EXCEL URL -->
				<input type="hidden" id="excelUrl" value="<c:url value='/downloads/sellerCompanyBilling.do' />">
				<!-- // EXCEL URL -->

				<!-- 상세 페이지 URL -->
				<input id="detailUrl" type="hidden" value="<c:url value='/seller/salesBilling/list.do' />">
				<!-- // 상세 페이지 URL -->

				<!-- 대리점 공통 -->
				<c:import url="sellerCommon.jsp" />
				<!-- // 대리점 공통 -->
			</div>
			<!-- // #contents -->
		</div>
		<!-- // #container -->
	</div>
	<!-- // #wrap -->

	<!-- footer -->
	<c:import url="../../inc/logedfooter.jsp" />
	<!--// footer -->

	<%-- <div id="noticePopup" class="pop_wrap layer_popup" style="width: 665px; overflow: hidden; position: absolute; left: 394px; top: 44.5px; visibility: visible; display: block;">
		<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
		<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> -->
		<script type="text/javascript">
			$(function() {
				//close 버튼
				$("div > #closePopup").click(function() {
					//불투명 처리 해제
					$("#mask").hide();
					$("#noticePopup").fadeOut("slow");
					return false;
				});

				$("#closeNoticePopup").click(function() {
					$("#mask").hide();
					$("#noticePopup").fadeOut("slow");
					return false;
				});
			});

			function goAccountReceivable(buyerBizNumber, sellerBizNumber, regDate) {
				$("#searchForm #businessNo").val(sellerBizNumber);
				$("#searchForm #startDate").val(regDate);
				$("#searchForm #endDate").val(regDate);
				$("#searchForm").attr("action", $("#accountReceivableUrl").val());
				$("#searchForm").submit();
			}
		</script>

		<div class="btn closeButton mr10 mb5 mt5">
			<a id="closePopup" href="javascript:;">×</a>
		</div>

		<div id="notice">
			<!-- HEADER -->
			<h1 class="ptxt pop_draggable">매출채권 팩토링 알림</h1>
			<!-- //HEADER -->
			<!-- CONTAINER -->
			<div id="pop_container">
				<div class="pop_cont">
					<!-- 컨텐츠 입력 -->
					<h2>매출채권 발행가능한 품목점이 11건 있습니다.</h2>
					<br>
					<div class="div_scroll">
						<div>
							<input id="accountReceivableUrl" type="hidden" value="<c:url value='/buyer/accountReceivable/list.do'/>">

							<table id="isiTable" border="1" class="tbl mb15" summary="대리점 연체/부도 건수 조회">
								<caption>매출채권 발행가능 품목점 조회</caption>
								<colgroup>
									<col width="34%">
									<col width="33%">
									<col width="33%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="bg_c width200">년월</th>
										<th scope="col" class="bg_c width200">품목점명</th>
										<th scope="col" class="bg_c width200">발행가능금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="width200">2018.10</td>
										<td onclick="goAccountReceivable('6268100403', '4088162285', '2018.10')" class="width200">
											<a href="javascript:;">（주）아이유통상</a>
										</td>
										<td class="width200">748,319</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- //컨텐츠 입력 -->

					<div class="btn_group ac mt30">
						<span class="btn btn_popup"><a href="javascript:;" id="closeNoticePopup">확인</a></span>
					</div>
				</div>
			</div>
			<!-- //CONTAINER -->
		</div>
	</div> --%>

	<script type="text/javascript">
		$(function() {
			/*************** 부품 B2B론 알림 팝업 ***************/ //임시주석 START
			/* var noticePopup = $("#noticePopup");
			var url = "<c:url value='/buyer/notice/list.do'/>";

			//pb2bln_
			//id가 없으면 생성
			if (noticePopup.length <= 0) {
				$('body').append('<div id="noticePopup" class = "pop_wrap layer_popup" style="width: 665px; overFlow : hidden;"></div>');
			} else { //id가 있으면 삭제하고 생성
				$('#noticePopup').remove();
				$('body').append('<div id="noticePopup" class = "pop_wrap layer_popup" style="width: 665px; overFlow : hidden;"></div>');
			}

			$("#noticePopup").load(url, "test", function(responseText, textStatus, XMLHttpRequest) {
				if (textStatus == "success") {
					var notice = $("#noticePopup #notice");

					if (notice.length > 0) {
						//부모창 불투명 처리
						//event.preventDefault();
						wrapWindowByMask($("#noticePopup"));

						$("#noticePopup").css("visibility", "visible");
						$("#noticePopup").fadeIn("slow");
					}
				} else if (textStatus == "error") {
					$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + XMLHttpRequest.status + "\n" + "ERROR : " + XMLHttpRequest.statusText);
					$("#ajaxErrorPopup").css("visibility", "visible");
					$("#ajaxErrorPopup").fadeIn("show");
				}
			}); */ // 임시주석 END
			/*************** 부품 B2B론 알림 팝업 ***************/

			/* 품목지원센터 이름 클릭시 코드 담아서 메인페이지로 이동 */
			$("#ariListTable > tbody > tr > .businessName").click(function(event) {
				$("#searchForm").toArray()[0].action = $("#detailUrl").val();
				$("#businessNo").val($(this).attr("businessNumber"));
				$("#startDate").val(null);
				$("#endDate").val(null);
				$("#searchForm").submit();
			});

			$(".popokbtn").click(function() {
				$(".abc").fadeOut("slow");
				return false;
			});

			// 업체별 지급내역 현황 조회
			$("#searchButton").click(function(e) {
				$("#searchForm").submit();
			});
		});
	</script>
</body>
</html>