<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	/**
	* @Class Name : accountReceivableList.jsp
	* @Description : 대리점 채권만기일 변경 승인 List 화면
	* @Modification Information
	*
	*   수정일     수정자      수정내용
	*  -------    --------    ---------------------------
	*  2018.11.28  CDF Team    최초 생성
	*
	* author CDF Team
	* since 2018.11.28
	*
	*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>채권만기일 변경승인</title>
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
<body class="main" >
	<div id="mask" style="width: 1453px; height: 480px;"></div>
	<!-- header -->
	<c:import url="../../inc/buyer/old/sellerHeader.jsp" />
	<!--// header -->

	<div id="wrap">
		<div id="container">
			<div id="contents">
				<!-- title -->
				<h2 class="hidden">채권만기일 변경승인</h2>
				<!-- // title -->

				<!-- 검색조건 -->
				<form id="searchForm" method="post" name="searchForm" class="mt20" action="<c:url value='/seller/accountReceivable/list.do'/>" >
					<input type="hidden" name="transactionNo" id="transactionNo" value="${params.transactionNo }" />
					<input type="hidden" name="pageIndex" id="pageIndex" value="${paginationInfo.currentPageNo }" />

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
									<td col>
										<p>
											<label for="startDate" class="hidden">조회 시작날짜 선택</label><input type="text" name="startDate" id="startDate" class="input ac mr5 EnterKeyDown" style="width: 95px;" value="${params.startDate }">
											<img src="<c:url value='/images/ico/ico_calendar.gif'/>" alt="검색 시작날짜 선택" onclick="dateClick('startDate')">
											~
											<label for="endDate" class="hidden">조회 끝날짜 선택</label><input type="text" name="endDate" id="endDate" class="input ac mr5 EnterKeyDown" style="width: 95px;" value="${params.endDate }">
											<img src="<c:url value='/images/ico/ico_calendar.gif'/>" alt="검색 끝날짜 선택" class="mr15" onclick="dateClick('endDate')">


	                        			    <select id="progressFlag" name="progressFlag" style="width: 136px;">
                                              <option value="100">ALL</option>
                                              <option value="4"> 변경요청</option>
                                              <option value="6">취소요청</option>
                                            </select>

											<span class="btn btn_normal">
												<a id="searchButton" href="javascript:;" style="width: 80px;">조회하기</a>
											</span>
										</p>

									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
		 		<!--  <button id="btn_1" onclick="">전체선택</button> -->
				<!--  <button id="btn_2" onclick="">전체해제</button>
	             <button  id="btn_3" onclick="">일괄승인</button>  -->
				</form>
				<br>
				<!-- // 검색조건 -->


				<!-- 지급내역 현황 조회 -->
				<table id="ariTable" class="tbl_view2 mb10" summary="기간 별 결제내역 현황 조회입니다.">
		<!-- 		 <button id="btn_1" onclick="">전체선택</button>
				 <button id="btn_2" onclick="">전체해제</button>
	             <button  id="btn_3" onclick="">일괄승인</button>
	             -->
					<caption></caption>
					<colgroup>
						<col width="7%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
						    <th class="tbl_center" scope="col">추가</th>
							<th class="tbl_center" scope="col">NO</th>
							<th class="tbl_center" scope="col">대리점</th>
							<th class="tbl_center" scope="col">발행일</th>
							<th class="tbl_center" scope="col">만기일</th>
							<th class="tbl_center" scope="col">변경만후만기일</th>
							<th class="tbl_center" scope="col">금액</th>
							<th class="tbl_center" scope="col">거래번호</th>
							<th class="tbl_center" scope="col">진행상태</th>
						</tr>
					</thead>
					<tbody>
					      	<c:choose>
							<c:when test="${empty list}">
							<tr>
								<td colspan="9" class="text_center">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
							</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td><input type="checkbox" id="allCheck"/></td>
							        <td class="text_center"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
									<td class="text_center"></td>
									<td class="text_center">${item.issueDate }</td>
									<td class="text_center">${item.expirationDate }</td>
									<td class="text_center">${item.paymentDate }</td>
									<td class="money_right"><fmt:formatNumber value="${item.account }" pattern="#,###" /></td>
									<td class="text_center">${item.transactionNo }</td>
									<c:choose>
										<c:when test="${item.progressFlag eq '변경요청' }">
										<td class="text_center payment_w" id="inquiryClick">
											<a href="javascript:;" onclick="searchClick1('<c:url value='/seller/accountReceivable/popup.do'/>')" style="width: 80px;" class="btn_search_click">변경요청</a>
										</td>
										</c:when>
										<c:otherwise>
										<td class="text_center">
										<a href="javascript:;" onclick="searchClick1('<c:url value='/seller/accountReceivable/popup.do'/>')" style="width: 80px;" class="btn_search_click">취소요청</a>
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


				<!-- 대리점 공통 -->
				<c:import url="sellerCommon.jsp" />
				<!-- // 대리점 공통 -->



				<!-- 변경요청 클릭 -->
				<input type="hidden" id="detailUrl" value="<c:url value='/seller/salesBilling/detail.do'/>">
				<!-- // 결제대기 클릭 -->


			</div>
			<!-- #contents -->
		</div>
		<!-- // #container -->
	</div>
	<!-- // #wrap -->

	<!-- footer -->
	<c:import url="../../inc/logedfooter.jsp" />
	<!--// footer -->

	<script type="text/javascript">

	$(function(){
	 /*        var totCnt=
	        alert(totCnt);
	        if(totCnt <0){
	       	$("#btn_1").hide();
		    $("#btn_2").hide();
		    $("#btn_3").hide();
	        }else{
	       	$("#btn_1").show();
	    	$("#btn_2").show();
	    	$("#btn_3").show();
	        } */
	      /*   if(totCnt == 0){
	        	$("#btn_1").hide();
	        }else{
	        	$("#btn_1").show();
	        } */
			$("#progressFlag").children("option[value=${params.progressFlag}]").prop("selected", true);
	});


	//전체선택
	$("#allCheck").click(function(){
		alert("1");
		//만약 전체 선택 체크박스가 체크된상태일경우
		if($("#allCheck").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다
			$("input[type=checkbox]").prop("checked",true);
		// 전체선택 체크박스가 해제된 경우
		} else { //해당화면에 모든 checkbox들의 체크를해제시킨다.
			$("input[type=checkbox]").prop("checked",false);
		}
		 });
	 //선택해제
/* 	function allCheck(){
		alert("1");
		if($("#allCheck").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다
			$("input[type=checkbox]").prop("checked",true);
		// 전체선택 체크박스가 해제된 경우
		} else { //해당화면에 모든 checkbox들의 체크를해제시킨다.
			$("input[type=checkbox]").prop("checked",false);
		}
    }; */

    //일괄승인
  //일괄승은 확인 버튼 클릭 이벤트
    var allApproveOk = function(){
        if(isClicked){
            return false;
        }
        isClicked = true;
        var dataList = new Array();
        var index = 0;
        $("input[type=checkbox]").each(function() {
            if($(this).prop("checked") == true) {
                dataObject = new Object();

                $("#taxBillNumber").val($(this).parents("tr").find("#taxBillNum").val());
                $("#transactionNumber").val($(this).parents("tr").find("#transactionNum").val());
                $("#beforeExpirationDate").val($.trim($(this).parents("tr").find("#beforeFinalDate").text()));

                $("#afterExpirationDate").val($.trim($(this).parents("tr").find("#afterFinalDate").text()));

                $("#amountOfMoney").val($.trim($(this).parents("tr").find("#money").text()).replace(/,/g, ""));

                $("#expirationAvg").val($.trim($(this).parents("tr").find("#afterFinalDate").attr("expirationAvg")));


                //데이터 셋팅
                dataObject.taxBillNumber = $(this).parents("tr").find("#taxBillNum").val();
                dataObject.transactionNumber = $(this).parents("tr").find("#transactionNum").val();
                dataObject.beforeExpirationDate =  $.trim($(this).parents("tr").find("#beforeFinalDate").text());
                dataObject.afterExpirationDate =  $.trim($(this).parents("tr").find("#afterFinalDate").text());
                dataObject.expirationAvg =  $.trim($(this).parents("tr").find("#afterFinalDate").attr("expirationAvg"));
                dataObject.amountOfMoney =  $.trim($(this).parents("tr").find("#money").text()).replace(/,/g, "");
                dataObject.progressFlag =  $(this).parents("tr").find("#progressFlag").attr("flag");


                var before = $.datepicker.parseDate( 'yy.mm.dd', dataObject.beforeExpirationDate );

                //var today = new Date();
                var today = $.datepicker.parseDate( 'yy.mm.dd',  dataObject.afterFinalDate );

                //if ( today.getHours() >= 17 ){
                //	today.setDate(today.getDate() + 1);
                //}

                today.setHours(0);
                today.setMinutes(0);
                today.setSeconds(0);
                today.setMilliseconds(0);


                if (  Math.ceil((today - before) / (1000 * 60 * 60 * 24)) > 0 ) {
                	alert('변경전 만기일이 당일(17시 이후일 경우 익일)포함 이전의 경우 \r\n 일괄 승인 하실수 없습니다.');
                	isClicked = false;
                	return false;
                }
                if ( dataObject.afterExpirationDate && dataObject.afterExpirationDate != '-' ) {
	                var after = $.datepicker.parseDate( 'yy.mm.dd', dataObject.afterExpirationDate );
	                if (  Math.ceil((today - after) / (1000 * 60 * 60 * 24)) > 0 ) {
	                	alert('변경 만기일이 당일(17시 이후일 경우 익일)포함 이전의 경우 \r\n 일괄 승인 하실수 없습니다.');
	                	isClicked = false;
	                	return false;
	                }
                }

                dataList[ index++ ] = dataObject;
            }
        });

        //데이터 변경 필요.
        var ajaxUrl = $("#allApproveJson").val();
        var jsonData = "jsonData=" + JSON.stringify(dataList);

        $.ajax({
            url : ajaxUrl,
            type : "post",
            data : jsonData,
            dataType : "json",
            success : function(data) {
                isClicked = false;
                var get_data = eval(data);
                $("#mask").hide();
                $("#loadingPopup").css("visibility", "hidden");
                $("#mask").hide();
                //window.location.reload();   //refresh
                $("#searchForm").submit();
                //$("#unpayTable > tbody:last > tr").remove();
                //$("#unpayTable > tbody:last").append
            },
            error : function(request,status,error){
                isClicked = false;
                $("#mask").hide();
                $("#loadingPopup").css("visibility", "hidden");
                $("#allApprove_popup").fadeOut();
                $("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : "+request.status + "\n" + "ERROR : "+error);
                $("#ajaxErrorPopup").css("visibility", "visible");
                $("#ajaxErrorPopup").fadeIn("show");

                $("#mask").hide();
            }
        });

        showAlartPopup($("#loadingPopup"));
        $("#loadingPopup").css("visibility", "visible");
        $("#loadingPopup").fadeIn("fast");

    };

    //일괄승은 취소 버튼
    var allApproveCancel = function(){
        $("#mask").hide();
        $("#allApprove_popup").fadeOut("slow");
    };



 		//구매 결제내역서, 결제내역조회 팝업
		function salesDetailClick(event, taxBillNumber, transactionNumber, paymentDate, expirationDate, amountOfMoney, expirationAvg) {
			var searchDetail = $("#searchDetailPopup");

			var jsonData = "jsonData=" + (JSON.stringify(dataObject));
			$("#searchDetailPopup").load($("#detailUrl").val(), jsonData, function(responseText, textStatus, XMLHttpRequest) {
				if (textStatus == "success") {

					if ($("#overExpirationDate").val() == "1") {
						$("#mask").hide();
						$("#ajaxErrorPopup").find("dt").text("만기일이 현재 기준 2영업일 이전의 매출채권은 변경/취소 할 수 없습니다.");
						$("#ajaxErrorPopup").css("visibility", "visible");
						position_cm($("#ajaxErrorPopup")[0]);
						$("#ajaxErrorPopup").fadeIn("show");
						return false;
					}
					//부모창 불투명 처리
					event.preventDefault();
					wrapWindowByMask($("#searchDetailPopup"));

					//레이어 팝업 visible
					$("#searchDetailPopup").css("visibility", "visible");
					$("#searchDetailPopup").fadeIn("slow");
				} else if (textStatus == "error") {
					$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + XMLHttpRequest.status + "\n" + "ERROR : " + XMLHttpRequest.statusText);
					$("#ajaxErrorPopup").css("visibility", "visible");
					$("#ajaxErrorPopup").fadeIn("show");
				}
			});
		}
		function unpayClick() {
			$("#issuePopup").fadeIn("slow");
		}


		var isShowPopup = 0;

		$(function() {
			$(document).mousedown(function(e) {
				if (isShowPopup == 1) {
					$(".pay_info3").fadeOut("show");
					$(".pay_info4").fadeOut("show");

					isShowPopup = 0;
				}
			});

			//잔여한도 클릭 팝업 위치
			$("#storeInfoTable > tbody > tr > td > .tb_view03").click(function(e) {
				isShowPopup = 1;
				//위치셋팅
				$(".pay_info3").css("top", $(this).offset().top - $("#contents").offset().top - 10);
				$(".pay_info3").css("left", $(this).offset().left - $("#contents").offset().left - 250);

				$(".pay_info3").fadeIn("show");
			});

			//미지급금 클릭 팝업 위치
			$("#transactionTable > tbody > tr > .tb_view04 > #unpayPopupTag").click(function(event) {
				isShowPopup = 1;
				var accessLevel = "R";
				//위치셋팅
				$(".pay_info4").css("top", $(this).offset().top - $("#contents").offset().top + 22);
				$(".pay_info4").css("left", $(this).offset().left - $("#contents").offset().left - 140);

				/* 미지급금 테이블 동적생성 */
				//값 셋팅
				var finalDateUnpay = $(this).parent("td").parent("tr").find("#finalDateUnpayVal").val(); //event.delegateTarget.children[1].value;
				var taxBillUnpay = $(this).parent("td").parent("tr").find("#taxBillUnpayVal").val(); //Number( event.delegateTarget.children[2].value );
				var overValue = $(this).parent("td").parent("tr").find("#overVal").val(); //Number( event.delegateTarget.children[2].value );

				var fdu = Number(finalDateUnpay);
				var tbu = Number(taxBillUnpay);
				var overDiff = Number(overValue);

				if (overDiff > 0) {
					if (fdu > overDiff) {
						fdu = fdu - overDiff;
						overDiff = 0;
					} else {
						overDiff = overDiff - fdu;
						fdu = 0;
					}

					fdu = fdu < 0 ? 0 : fdu;

					if (tbu > overDiff) {
						tbu = tbu - overDiff;
					} else {
						overDiff = overDiff - tbu;
						tbu = 0;
					}

					tbu = tbu < 0 ? 0 : tbu;

				}
				//dto에 셋팅
				$("#finalDateUnpay").val($(this).parent("td").parent("tr").find("#finalDateUnpayVal").val());
				$("#date").val($(this).parent("td").parent("tr").find("#dateTD").text());
				$("#taxBillPayK").val($(this).parent("td").parent("tr").find("#taxBillPayKVal").val());
				$("#taxBillPayH").val($(this).parent("td").parent("tr").find("#taxBillPayHVal").val());
				$("#paymentHistoryK").val($(this).parent("td").parent("tr").find("#paymentHistoryKVal").val());
				$("#paymentHistoryH").val($(this).parent("td").parent("tr").find("#paymentHistoryHVal").val());

				$("#unpayTable > tbody:last > tr").remove();

				if (Number(fdu) > 0 && accessLevel != "R") {
					$("#unpayTable > tbody:last").append('<tr>' //(콤마),찍힌 스트링 값이 아닌 원본값을 넘겨주기 위해서
							+ '<td  style="text-align:center;"><a href = "#" id = "finalDateUnpayData" onclick = "unpayClick()" > ' + Number(fdu).toLocaleString().split('.')[0] + '</a>' + '</td>' + '<td id = "taxBillUnpayData"  style="text-align:center;">' + Number(tbu).toLocaleString().split('.')[0] + '</td>' + '<td id = "limitOverData">' + Number(overValue).toLocaleString().split('.')[0] + '</td>' + '</tr>');
				} else {
					$("#unpayTable > tbody:last").append('<tr>' //(콤마),찍힌 스트링 값이 아닌 원본값을 넘겨주기 위해서
							+ '<td  style="text-align:center;">' + Number(fdu).toLocaleString().split('.')[0] + '</td>' + '<td id = "taxBillUnpayData"  style="text-align:center;">' + Number(tbu).toLocaleString().split('.')[0] + '</td>' + '<td id = "limitOverData"  style="text-align:center;">' + Number(overValue).toLocaleString().split('.')[0] + '</td>' + '</tr>');
				}

				/*미지급금 테이블 동적생성 */

				$(".pay_info4").fadeIn("show");
			});

			 $("#searchButton").click(function(e) {
		            $("#searchForm").submit();
		        });


			$("#inquiry > a").click(function(e) {
				$("#loadingPopup").css("visibility", "visible");

				var searchDate = $.trim($(this).parents("tr").find("td:first").text());
				var totalSalesAmount = Number(uncomma($.trim($(this).parents("tr").find("#totalSalesAmount").text())));
				var totalExpirationAvg = Number(uncomma($.trim($(this).parents("tr").find("#totalExpirationAvg").text())));
				$("#inquiryForm").find("#salesDate").val(searchDate);

				//합계적수
				$("#ExAvg").val(totalExpirationAvg);

				paymentInquiryAjax();
			});

			$(".popokbtn").click(function() {
				$(".abc").fadeOut("slow");
			});

			//승인
			$("#issueOk1").click(function() {
				$("#issuePopup").fadeOut("show");
				var date = $.trim($("#unpayItem #date").val());
				$("#searchForm #startDate").val(date);
				$("#searchForm").attr("action", $("#unpayItem").attr("action"));
				$("#searchForm").submit();
			});

			//취소
			$("#issueCancel1").click(function() {
				$("#issuePopup").fadeOut("show");
			});
		});

		function paymentInquiryAjax() {
			var ajaxUrl = $("#inquiryForm").attr("action");
//			var jsonData = "jsonData=" + JSON.stringify($('#inquiryForm').serializeObject());
			var jsonData = $('#inquiryForm').serializeObject();

			$.ajax({
				url : ajaxUrl,
				type : "post",
				data : jsonData,
				dataType : "json",
				success : function(data) {
					var get_data = eval(data);
					var total = 0;
					$('#ariTable > tbody:last > tr').remove();
					for (var i = 0; i < get_data.length; i++) {
						$('#ariTable > tbody:last').append('<tr>' + '<td class = "text_center">' + (i+1) + '</td>' + '<td class = "text_center" id = "issueDateTD">' + get_data[i].issueDate + '</td>' + '<td class = "text_center" id = "expirationDateTD">' + get_data[i].expirationDate + '</td>' + '<td class = "text_center" id = "paymentDateTD">' + get_data[i].paymentDate + '</td>' + '<td class = "money_right" id = "amountOfMoneyTD">' + (get_data[i].amount).toLocaleString().split('.')[0] + '</td>' + '<td class = "text_center" id = "transactionNumberTD">' + get_data[i].transactionNo + '<input type = "hidden" id = "taxBillNumberValue" value = "' + get_data[i].taxBillNo + '" >' + '</td>' + '<td class = "text_center" id = "expirationAvgTD">' + get_data[i].expirationAvg + '</td>' + (get_data[i].progressFlag == 1 || get_data[i].progressFlag == 5 ? '<td class="text_center payment_w" id="inquiryClick' + i + '">' + '<a href="javascript:;"'
                                     + 'style="width: 80px;"> ' + getProgressStatus(get_data[i].progressFlag, "B") + '</a>' : '<td class = "text_center">' + getProgressStatus(get_data[i].progressFlag, "B")) + '</td>' + '</tr>');

						total += Number(get_data[i].amount);
						//totalExpirationAvg += (Number(get_data[i].expirationAvg) * get_data[i].amountOfMoney);
						/* 결제대기 클릭 이벤트 */
						$("#inquiryClick" + i + " > a").bind("click", {
							//원본 키값
							taxBillNumber : get_data[i].taxBillNo,
							transactionNumber : get_data[i].transactionNo,
							paymentDate : get_data[i].paymentDate,
							expirationDate : get_data[i].expirationDate,
							amountOfMoney : get_data[i].amount,
							expirationAvg : get_data[i].expirationAvg
						}, function(event) {
							//원본
							//salesDetailClick( event.data.taxBillNumber, event.data.transactionNumber );

							//레이어 테스트 1 ( include or 동적생성 )
							//salesDetailClick( event.data );
							salesDetailClick(event, event.data.taxBillNumber, event.data.transactionNumber, event.data.paymentDate, event.data.expirationDate, event.data.amountOfMoney, event.data.expirationAvg);
						});
					}

					/* 값 셋팅 */
					$('#ariTable > tbody:last').append('<tr>' + '<td></td>' + '<td></td>' + '<td class = "text_center">계</td>' + '<td></td>' + '<td class = "money_right">' + total.toLocaleString().split('.')[0] + '</td>' + '<td class = "text_center">-</td>'
					//+ '<td class = "text_center">' + Math.floor(totalExpirationAvg / totalSalesAmount) + '</td>'
					+ '<td class = "text_center">' + Math.floor($("#ExAvg").val()) + '</td>' + '<td></td>' + '</tr>');

					$("#loadingPopup").css("visibility", "hidden");
				},
				error : function(request, status, error) { //실패
					$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + request.status + "\n" + "ERROR : " + error);
					$("#ajaxErrorPopup").css("visibility", "visible");
					$("#ajaxErrorPopup").fadeIn("show");
				}
			});
		}





	</script>
</body>

</html>