<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	/**
	* @Class Name : paymentList.jsp
	* @Description : 대리점 결제내역 조회 List 화면
	* @Modification Information
	*
	*   수정일     수정자      수정내용
	*  -------    --------    ---------------------------
	*  2018.11.26  CDF Team    최초 생성
	*
	* author CDF Team
	* since 2018.11.26
	*
	*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>결제내역 조회</title>
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
	<div id="mask" style="width: 1453px; height: 480px;"></div>

	<!-- header -->
	<c:import url="../../inc/buyer/old/header.jsp" />
	<!--// header -->

	<div id="wrap">
		<div id="container">
			<div id="contents">
				<!-- title -->
				<h2 class="hidden">결제내역 조회</h2>
				<!-- // title -->

				<!-- 검색조건 -->
				<form name="searchForm" method="post" id="searchForm" class="mt20" action="<c:url value='/buyer/payment/list.do'/>">
					<input type="hidden" name="groupType" id="groupType" value="${params.groupType }" />
					<input type="hidden" name="sellerBizNo" id="sellerBizNo" value="${params.sellerBizNo }" />
					<input type="hidden" name="pageIndex" id="pageIndex" value="${paginationInfo.currentPageNo }" />
					<fieldset>
						<legend>검색폼</legend>
						<table class="tbl_search" summary="">
							<caption>조회</caption>
							<colgroup>
								<col width="130" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">검색조건</th>
									<td>
										<p>
											<select id="searchType" name="searchType" style="width: 136px;" class="mr15">
												<option value="0">발행일</option>
												<option value="1">만기일</option>
											</select>
											<label for="paymentStartDate" class="hidden">조회 시작날짜 선택</label><input id="paymentStartDate" name="startDate" style="width: 95px;" class="input ac mr5 EnterKeyDown" type="text" value="${params.startDate }">
											<img onclick="dateClick('paymentStartDate')" src="<c:url value='/images/ico/ico_calendar.gif'/>" alt="검색 시작날짜 선택">
											~
											<label for="paymentEndDate" class="hidden">조회 끝날짜 선택</label><input id=paymentEndDate name="endDate" style="width: 95px;" class="input ac mr5 EnterKeyDown" type="text" value="${params.endDate }">
											<img onclick="dateClick('paymentEndDate')" src="<c:url value='/images/ico/ico_calendar.gif'/>" alt="검색 끝날짜 선택" class="mr15">
											<select id="sendStatus" name="sendStatus" style="width: 150px;">
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
										</p>
										<p class="mt10">
											<input type="radio" class="mr5 ml5" value="2" checked="checked" /><a href="javascript:;" id="allRadio" class="mr15 fb">All</a>
											<input type="radio" class="mr5" value="0" /><a href="javascript:;" id="hyundaiRadio" class="mr15 fb">현대</a>
											<input type="radio" class="mr5" value="1" /><a href="javascript:;" id="kiaRadio" class="mr15 fb">기아</a>
											<label for="searchKeyword" class="hidden">이름 검색</label><input type="text" name="searchKeyword" id="searchKeyword" class="input mr5 businessKeyword" value="${params.searchKeyword }" />
											<span class="btn btn_normal">
												<a href="javascript:;" onclick="searchClick('<c:url value='/buyer/officesItem/list.do'/>')" style="width: 80px;" class="btn_search_click">찾기</a>
											</span>
											<span class="btn btn_normal">
												<a href="javascript:;" onclick="searchMyItemsClick('<c:url value='/buyer/myOfficesItem/list.do'/>','834','600')" style="width: 80px;">My 거래처</a>
											</span>
											<span class="btn btn_normal">
												<a id="searchButton" href="javascript:;" style="width: 80px;">조회하기</a>
											</span>
										</p>
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</form>
				<!-- // 검색조건 -->
				
				<br />
				<br />

				<!-- 지급내역 현황 조회 -->
				<h3>기간 별 결제내역조회</h3>
				<table id="ariTable" class="tbl_view2 mb10" summary="기간 별 결제내역 현황 조회입니다.">
					<caption>기간 별 결제내역조회</caption>
					<colgroup>
						<col width="5%" />
						<col width="15%" />
						<col width="5%" />
						<col width="11%" />
						<col width="11%" />
						<col width="11%" />
						<col width="15%" />
						<col width="17%" />
						<col width="11%" />
					</colgroup>
					<thead>
						<tr>
							<th class="tbl_center" scope="col">NO</th>
							<th class="tbl_center" scope="col">품목지원센터</th>
							<th class="tbl_center" scope="col">코드</th>
							<th class="tbl_center" scope="col">발행일</th>
							<th class="tbl_center" scope="col">만기일</th>
							<th class="tbl_center" scope="col">결제일</th>
							<th class="tbl_center" scope="col">금액</th>
							<th class="tbl_center" scope="col">승인번호</th>
							<th class="tbl_center" scope="col">진행상태</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th class="tbl_center" scope="col"></th>
							<th class="tbl_center" scope="col"></th>
							<th class="tbl_center" scope="col"></th>
							<th class="tbl_center" scope="col">총건수</th>
							<th class="tbl_center" scope="col"><fmt:formatNumber value="${totCnt }" pattern="#,###" />건</th>
							<th class="tbl_center" scope="col">합계</th>
							<th class="money_right" scope="col" style="text-align: right;"><fmt:formatNumber value="${summary }" pattern="#,###" /></th>
							<th class="tbl_center" scope="col"></th>
							<th class="tbl_center" scope="col"></th>
						</tr>
					</tfoot>
					<tbody>
						<c:choose>
							<c:when test="${empty list }">
							<tr>
								<td colspan="9" class="text_center">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
							</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td class="text_center">${status.count }</td>
									<td class="text_center" id="companyTD">
										<a href="#" onclick="linkToSalesBilling('${item.sellerBizNo}')">
											<c:if test="${item.groupType eq '0' }">(<font color="blue">현대</font>)<br /></c:if>
											<c:if test="${item.groupType eq '1' }">(<font color="red">기아</font>)<br /></c:if>
											${item.sellerCompanyName }
										</a>
									</td>
									<td class="text_center">${item.sellerMembNo}</td>
									<td class="text_center" id="issueDateTD">${item.issueDate}</td>
									<td class="text_center" id="expirationDateTD">${item.expirationDate}</td>
									<td class="text_center" id="paymentDateTD">${item.paymentDate}</td>
									<td class="money_right" id="amountOfMoneyTD"><fmt:formatNumber value="${item.amount}" pattern="#,###" /></td>
									<td class="text_center" id="transactionNumberTD">
										${item.transactionNo}
										<input type="hidden" id="taxBillNumberValue" value="${item.taxbillNo}">
										<input type="hidden" id="expirationAvgValue" value="${item.expirationAvg}">
									</td>
									<c:choose>
										<c:when test="${item.sendStatus eq '결제대기' }">
										<td class="text_center payment_w" id="inquiryClick">
											<a style="width: 80px;" onclick="salesDetailClick('${item.taxbillNo}', '${item.transactionNo}', '${item.paymentDate}', '${item.expirationDate}', '${item.amount}', '${item.expirationAvg}')">결제대기</a>
										</td>
										</c:when>
										<c:otherwise>
										<td class="text_center">${item.sendStatus }</td>
										</c:otherwise>
									</c:choose>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<!-- // 지급내역 현황 조회 -->

				<!-- 페이징 -->
				<div class="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
				</div>
				<!-- // 페이징 -->

				<!-- 엑셀 출력 -->
				<p class="ar">
					<span class="btn btn_normal2 mb10"><a href="javascript:;" onclick="excelExport('${paginationInfo.currentPageNo }')" style="width: 100px;">엑셀</a> </span>
				</p>
				<!-- // 엑셀 출력 -->

				<!-- EXCEL URL -->
				<input type="hidden" id="excelUrl" value="<c:url value='/downloads/buyerPayment.do'/>">
				<!-- // EXCEL URL -->

				<!-- 상세 페이지 URL -->
				<input type="hidden" id="detailUrl" value="<c:url value='/buyer/salesBilling/list.do'/>" />
				<!-- // 상세 페이지 URL -->

				<!-- 대리점 공통 -->
				<c:import url="buyerCommon.jsp" />
				<!-- // 대리점 공통 -->

				<!-- 결제대기 클릭 -->
				<input type="hidden" id="payPopUrl" value="/buyer/salesBilling/detail.do">
				<!-- // 결제대기 클릭 -->
				
				<!-- 조회하기 경고창2 -->
				<div id='alert_popup2' class="alert_popup abc" style="visibility: hidden">
					<dl>
						<dt>검색어를 입력해 주세요.</dt>
						<dd>
							<span class="btn btn_normal popokbtn"><a href="#" style="width: 80px;">확인</a> </span>
						</dd>
					</dl>
				</div>
			</div>
			<!-- // #contents -->
		</div>
		<!-- // #container -->
	</div>
	<!-- // #wrap -->

	<!-- footer -->
	<c:import url="../../inc/logedfooter.jsp" />
	<!--// footer -->

	<script type="text/javascript">
		// 셀렉트박스 옵션 선택
		$(function(){
			$("#searchType").children("option[value=${params.searchType}]").prop("selected", true);
			$("#sendStatus").children("option[value=${params.sendStatus}]").prop("selected", true);
		});
	
	    //구매 결제내역서, 결제내역조회 팝업 
	    function salesDetailClick(taxBillNumber, transactionNumber, paymentDate, expirationDate, amountOfMoney, expirationAvg) {
	        var searchDetail = $("#searchDetailPopup");
	    
	        //id가 없으면 생성
	        if (searchDetail.length <= 0) {
	            $('body').append('<div id="searchDetailPopup" class = "pop_wrap layer_popup abc"></div>');
	            $('body').append(
		                '<div id = "change_popup" class="pop_wrap alertLayer_popup">'
		                        + '<dl>'
		                        + '<dt>해당 매출에 대하여 변경 처리 하시겠습니까 ?</dt>'
		                        + '<dd>'
		                        + '<span class="btn btn_normal" id = "salesDetailOk1"><a href="#" style="width: 80px;">확인</a></span>'
		                        + '<span class="btn btn_normal" id = "salesDetailCancel1"><a href="#" style="width: 80px;">취소</a></span> '
		                        + '</dd></dl></div>');
	            $('body').append(
		                '<div id = "cancel_popup" class="pop_wrap alertLayer_popup">'
		                        + '<dl>'
		                        + '<dt>해당 매출에 대하여 취소 처리 하시겠습니까 ?</dt>'
		                        + '<dd>'
		                        + '<span class="btn btn_normal" id = "salesDetailOk2"><a href="#" style="width: 80px;">확인</a></span>'
		                        + '<span class="btn btn_normal" id = "salesDetailCancel2"><a href="#" style="width: 80px;">취소</a></span> '
		                        + '</dd></dl></div>');
	        } else { //id가 있으면 삭제하고 생성
	            $('#searchDetailPopup').remove();
	            $('#change_popup').remove();
	            $('#cancel_popup').remove();
	            
	            $('body').append('<div id="searchDetailPopup" class = "pop_wrap layer_popup abc"></div>');
	            $('body').append(
		                '<div id = "change_popup" class="pop_wrap alertLayer_popup">'
		                        + '<dl>'
		                        + '<dt>해당 매출에 대하여 변경 처리 하시겠습니까 ?</dt>'
		                        + '<dd>'
		                        + '<span class="btn btn_normal" id = "salesDetailOk1"><a href="#" style="width: 80px;">확인</a></span>'
		                        + '<span class="btn btn_normal" id = "salesDetailCancel1"><a href="#" style="width: 80px;">취소</a></span> '
		                        + '</dd></dl></div>');
	            $('body').append(
		                '<div id = "cancel_popup" class="pop_wrap alertLayer_popup">'
		                        + '<dl>'
		                        + '<dt>해당 매출에 대하여 취소 처리 하시겠습니까 ?</dt>'
		                        + '<dd>'
		                        + '<span class="btn btn_normal" id = "salesDetailOk2"><a href="#" style="width: 80px;">확인</a></span>'
		                        + '<span class="btn btn_normal" id = "salesDetailCancel2"><a href="#" style="width: 80px;">취소</a></span> '
		                        + '</dd></dl></div>');
	        }
	    
	        var dataObject = new Object();
	    
	        dataObject.amountOfMoney = amountOfMoney;
	        dataObject.expirationDate = expirationDate;
	        dataObject.paymentDate = paymentDate;
	        dataObject.expirationAvg = expirationAvg;
	        dataObject.transactionNumber = transactionNumber;
	        dataObject.taxBillNumber = taxBillNumber;
	    
	        var jsonData = "jsonData=" + (JSON.stringify(dataObject));
	        $("#searchDetailPopup").load( $("#payPopUrl").val(), jsonData, function(responseText, textStatus, XMLHttpRequest) {
	            if (textStatus == "success") {
	            	if($("#overExpirationDate").val() == "1"){
	            		$("#mask").hide();
	            		$("#ajaxErrorPopup").find("dt").text("만기일이 현재 기준 2영업일 이전의 매출채권은 변경/취소 할 수 없습니다.");
	                    $("#ajaxErrorPopup").css("visibility", "visible");
	                    position_cm($("#ajaxErrorPopup")[0]);
	                    $("#ajaxErrorPopup").fadeIn("show");
	                    return false;
	            	}
	            	
	                //부모창 불투명 처리
	                wrapWindowByMask($("#searchDetailPopup"));
	
	                //레이어 팝업 visible
	                $("#searchDetailPopup").css("visibility", "visible");
	                $("#searchDetailPopup").fadeIn("slow");
	            } else if (textStatus == "error") {
	                $("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : "+XMLHttpRequest.status + "\n" + "ERROR : "+XMLHttpRequest.statusText);
	                $("#ajaxErrorPopup").css("visibility", "visible");
	                $("#ajaxErrorPopup").fadeIn("show");
	            }
	        });
	    }
	
	    //지급내역 현황 조회
	    $(function() {
	        $("#searchButton").click(function(e) {
	            /* //찾기 & My 거래처 데이터 체크
	            if ( $("#searchForm").toArray()[0][0].value == "" && $("#searchForm #codeList").toArray()[0].value == "" )
	            {
	                $("#notChoicePopup").css("visibility", "visible");
	                $("#notChoicePopup").fadeIn("show");
	                return false;
	            } */
	          
	            $("#searchForm").submit();
	        });
	
	        $(".popokbtn").click(function() {
	            $(".abc").fadeOut("slow");
	        });
	
	        $("#go_hci_loan").click(function() {
	            $("#alert_loan_popup").css("visibility", "hidden");
	            $("#alert_loan_popup").fadeOut("slow");
	        });
	        
	        $(".loanPopup").click(function() {
	            $("#alert_loan_popup").css("visibility", "visible");
	            $("#alert_loan_popup").fadeIn("slow");
	        });
	    });
	    
	    function paymentInquiryAjax(){
	    	$("#searchForm").submit()
	    }
	</script>
</body>
</html>