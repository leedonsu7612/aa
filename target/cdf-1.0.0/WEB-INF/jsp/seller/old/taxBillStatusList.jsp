<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	/**
	* @Class Name : taxBillStatusList.jsp
	* @Description : 대리점 세금계산서발행 List 화면
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>세금계산서발행</title>
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
<script type="text/javascript">
function initDate()
{
    //현재날짜
    var nowDate = new Date();
    //비교할 현재 날짜
    var compareNowDate = nowDate.getFullYear() + "." + (nowDate.getMonth() + 1);
     startDate = currentDate($("#startTaxBillDate").val());
    //비교할 시작 날짜
    var compareStartDate = startDate.getFullYear() + "." + (startDate.getMonth() + 1);
     var endDate = currentDate($("#endTaxBillDate").val());//new Date($("#endTaxBillDate").val());
    //선택한 월의 마지막 일자 셋팅
    var lastDay = 32 - new Date( startDate.getFullYear(), startDate.getMonth(), 32 ).getDate();  
    
    var taxDate = currentDate($("#taxBillDate").val());//new Date( $("#taxBillDate").val() );
    
    //년.월 텍스트 박스 VIEW 셋팅
    $("#taxBillDate").val( startDate.getFullYear() + 
            ((startDate.getMonth() + 1) < 10 ? 
                    (".0" + (startDate.getMonth() + 1)) : 
                        ("." + (startDate.getMonth() + 1))));
    
    $("#startTaxBillDay > select > option").each(function()
    {
        $(this).remove();
    });
    $("#endTaxBillDay > select > option").each(function()
    {
        $(this).remove();
    });
    
    var tempMonth = $("#taxBillDate").val();
    var strArr = tempMonth.split(".");
    var lastDayOfMonth = ( new Date( Number(strArr[0]), Number(strArr[1]), 0)).getDate();
    
    $("#startTaxBillDate").val($("#taxBillDate").val() + ".01");
    $("#endTaxBillDate").val($("#taxBillDate").val() + "." + lastDayOfMonth);
}   


//전체선택
$("#allCheck").click(function(){
	//만약 전체 선택 체크박스가 체크된상태일경우 
	if($("#allCheck").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
		$("input[type=checkbox]").prop("checked",true); 
	// 전체선택 체크박스가 해제된 경우 
	} else { //해당화면에 모든 checkbox들의 체크를해제시킨다.
		$("input[type=checkbox]").prop("checked",false); 
	} 
	 });
 //선택해제
function allCheck(){
	alert("1");
	if($("#allCheck").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
		$("input[type=checkbox]").prop("checked",true); 
	// 전체선택 체크박스가 해제된 경우 
	} else { //해당화면에 모든 checkbox들의 체크를해제시킨다.
		$("input[type=checkbox]").prop("checked",false); 
	} 
};


//세금계산서 관련 참고사항
function taxRefer(){
 alert("11111.");	
};
$("#searchForm").submit( function ( e ) {
	var re = /^[\d]{4}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[0-1])$/;
	var startDateStr = $("#paymentStartDate").val().replace(/\./g, "");
	var endDateStr = $("#paymentEndDate").val().replace(/\./g, "");
	if ( !re.test(startDateStr) || !re.test(endDateStr)) {
		alert("시작일과 종료일을 확인해 주세요.");
		e.preventDefault();
		return false;
	}
	var startDate = $.datepicker.parseDate( "yymmdd", startDateStr );
	var endDate = $.datepicker.parseDate( "yymmdd", endDateStr );
	
	if ( (startDate.getFullYear() != endDate.getFullYear()) || 
			(startDate.getMonth() != endDate.getMonth()) ) {
		alert("시작일과 종료일은 같은 달 내에서만 조회 가능합니다.");
		e.preventDefault();
		return false;
	}
	
});

  $(function() {
      //세금계산서 발행 조회
      $("#searchButton").click(function(e) 
      {
          $("#searchForm").submit();
      });

      $("#itemShopCode").change(function() {
          $("#searchForm").submit();
      });

  });
  
//EXCEL EXPORT
  function excelExport( dataLength ){
      if ( dataLength <= 0 ){
          $("#notExeportPopup").css("visibility", "visible");
          $("#notExeportPopup").fadeIn("show");
          return false;
      }    
      
      var url = $("#excelUrl").val();
      var origin_url = $("#searchForm").attr( "action" );
      var form = $("#searchForm").toArray()[0];
      
      form.action = url;
      form.method = "post";
      form.submit();
      
      form.action = origin_url;
  }

  
  function downloadXml( taxNo )
  {
   var form = document.createElement("form");
   form.setAttribute("method", "post");
   form.setAttribute("action", "http://tax.inib2b.com/hci/down.do");
   form.setAttribute("target", "_DOWNTAX");
   var input = document.createElement('input');
   input.type = 'hidden';
   input.name = 'in';
   input.value = taxNo;
   form.appendChild(input);
   document.body.appendChild(form);
   form.submit();
   document.body.removeChild(form);
  };
  
   
  //세금계산서 팝업
  function taxDisplayPopup( taxBillNumber ) {
      var form = $("#taxBillForm")[0];
      $("#taxBillNumber").val( taxBillNumber );
      form.action = $("#taxBillPopupUrl").val();
      form.target = form.id;
      form.method = "post";
      window.open( "", form.id, "width=660,height=640,resizable=no,scrollbars=1,menubar=no");        
      form.submit();
  }
  
  function searchClick( url ) 
  {
      var jsonData = $("#searchForm").serializeObject();
      var officesSearch = $("#officesSearchPopup");
      
      //id가 없으면 생성
      if ( officesSearch.length <= 0 ){
          $('#myOfficesSearchPopup').remove();
          $('body').append('<div id="officesSearchPopup" class = "pop_wrap layer_popup"></div>');
      }
      else {//id가 있으면 삭제하고 생성
          $('#officesSearchPopup').remove();            
          $('body').append('<div id="officesSearchPopup" class = "pop_wrap layer_popup"></div>');
      }
      
      $("#officesSearchPopup").load( url, jsonData, function( responseText, textStatus, XMLHttpRequest ) {
         if (textStatus == "success") {
             //부모창 불투명 처리
             //event.preventDefault();
             wrapWindowByMask( $("#officesSearchPopup") );
             
             $("#officesSearchPopup").css( "visibility", "visible" );
             $("#officesSearchPopup").fadeIn("slow");
         }
         else if (textStatus == "error") {
             $("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : "+XMLHttpRequest.status + "\n" + "ERROR : " + XMLHttpRequest.statusText);
             $("#ajaxErrorPopup").css("visibility", "visible");
             $("#ajaxErrorPopup").fadeIn("show");
         }
      });
  }
  
  //내 대리점, 품목점 검색 팝업
  function searchMyItemsClick( url, width, height ) 
  {
      var jsonData = "jsonData=" + JSON.stringify($("#searchForm").serializeObject());
      var myOfficesSearch = $("#myOfficesSearchPopup");
      
      //id가 없으면 생성
      if ( myOfficesSearch.length <= 0 ) {
          $('#officesSearchPopup').remove();
          $('body').append('<div id="myOfficesSearchPopup" class = "pop_wrap layer_popup abc"></div>');
      }
      else {//id가 있으면 삭제하고 생성
          $('#myOfficesSearchPopup').remove();
          $('body').append('<div id="myOfficesSearchPopup" class = "pop_wrap layer_popup abc"></div>');            
      }
      
      $("#myOfficesSearchPopup").load( url, jsonData, function( responseText, textStatus, XMLHttpRequest ) {
         if (textStatus == "success") {
             //부모창 불투명 처리
             //event.preventDefault();
             wrapWindowByMask($("#myOfficesSearchPopup"));
             
             $("#myOfficesSearchPopup").css( "visibility", "visible" );
             $("#myOfficesSearchPopup").fadeIn("slow");
         }
         else if (textStatus == "error") {
             $("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : "+XMLHttpRequest.status + "\n" + "ERROR : " + XMLHttpRequest.statusText);
             $("#ajaxErrorPopup").css("visibility", "visible");
             $("#ajaxErrorPopup").fadeIn("show");
         }
      });
  }

  function dateClick(name) {
      $('#' + name).datepicker('show');
  }
 
  var IsSearchKeyword = false;
  function searchExecute(){
      $("#searchForm").submit();
  }
  

//라디오 체크 이벤트
  $(function()
  {
      $('input[type=radio][value="2"]').click( function()
      {
          $("input[type=radio]").prop( "checked", false );
          $('input[type=radio][value="2"]').prop( "checked", true );
          $("#groupType").val("2");
          searchExecute();
      });
      
      $('input[type=radio][value="0"]').click( function()
      {
          $("input[type=radio]").prop( "checked", false );
          $('input[type=radio][value="0"]').prop( "checked", true );
          $("#groupType").val("0");
          searchExecute();
      });
      
      $('input[type=radio][value="1"]').click( function()
      {
          $("input[type=radio]").prop( "checked", false );
          $('input[type=radio][value="1"]').prop( "checked", true );    
          $("#groupType").val("1");
          searchExecute();
      });
      
      $("#allRadio").click( function()
      {
          $("input[type=radio]").prop( "checked", false );
          $('input[type=radio][value="2"]').prop( "checked", true );    
          $("#groupType").val("2");
          searchExecute();
      });
      
      $("#hyundaiRadio").click( function()
      {
          $("input[type=radio]").prop( "checked", false );
          $('input[type=radio][value="0"]').prop( "checked", true ); 
          $("#groupType").val("0");
          searchExecute();
      });
      
      $("#kiaRadio").click( function()
      {
          $("input[type=radio]").prop( "checked", false );
          $('input[type=radio][value="1"]').prop( "checked", true );    
          $("#groupType").val("1");
          searchExecute();
      });    
      
      if($("#groupType").val() == "0"){
          $("input[type=radio]").prop( "checked", false );
          $('input[type=radio][value="0"]').prop( "checked", true ); 
          $("#groupType").val("0");
      }
      else if($("#groupType").val() == "1"){
          $("input[type=radio]").prop( "checked", false );
          $('input[type=radio][value="1"]').prop( "checked", true );    
          $("#groupType").val("1");
      }
      else{
          if($("#allRadio").length == 0){
              $("input[type=radio]").prop( "checked", false );
              $('input[type=radio][value="0"]').prop( "checked", true ); 
              $("#groupType").val("0");
          }
          else{
              $("input[type=radio]").prop( "checked", false );
              $('input[type=radio][value="2"]').prop( "checked", true );    
              $("#groupType").val("2");
          }
      }
      
      if($("#paymentStartDate").length > 0){
          initDate();
      }
      
      //날짜 Enter key 입력시 submit
      $(".EnterKeyDown").keydown(function(event)
      {
          if ( event.keyCode == '13' )
          {
              showAlartPopup($("#loadingPopup"));
              $("#searchForm").submit();
          } 
          
          if (event.which && ((event.which  > 47 && event.which  < 58) || (event.which  > 95 && event.which  < 106) || event.which == 8 || event.which == 37 || event.which == 39 )) {
          } else { return false; }
          if(event.which != 8 && event.which != 37 && event.which != 39)
          {
              var textInputLength = getTextLength($(this).val());
              
              if(textInputLength == 4){ $(this).val($(this).val() + "."); }   
          } 
      });
  });


</script>


<body class="main">
	<div id="mask" style="width: 1453px; height: 480px;"></div>

	<!-- header -->
	<c:import url="../../inc/buyer/old/sellerHeader.jsp" />
	<!--// header -->

	<div id="wrap">
		<div id="container">
			<div id="contents">
				<!-- title -->
				<h2 class="hidden">세금계산서 발행</h2>
				<!-- // title -->
				
				<!-- 검색조건 -->
				<form name="searchForm" method="post" id="searchForm" class="mt20" action="<c:url value='/seller/taxBill/statusList.do'/>">
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
											<label for="paymentStartDate" class="hidden">조회 시작날짜 선택</label><input id="paymentStartDate" name="startDate" style="width: 95px;" class="input ac mr5 EnterKeyDown" type="text" value="${params.startDate }">
											<img onclick="dateClick('paymentStartDate')" src="<c:url value='/images/ico/ico_calendar.gif'/>" alt="검색 시작날짜 선택">
											~
											<label for="paymentEndDate" class="hidden">조회 끝날짜 선택</label><input id=paymentEndDate name="endDate" style="width: 95px;" class="input ac mr5 EnterKeyDown" type="text" value="${params.endDate }">
											<img onclick="dateClick('paymentEndDate')" src="<c:url value='/images/ico/ico_calendar.gif'/>" alt="검색 끝날짜 선택" class="mr15">
											<input type="radio" class="mr5 ml5" value="2" checked="checked" /><a href="javascript:;" id="allRadio" class="mr15 fb">All</a>
											<input type="radio" class="mr5" value="0" /><a href="javascript:;" id="hyundaiRadio" class="mr15 fb">현대</a>
											<input type="radio" class="mr5" value="1" /><a href="javascript:;" id="kiaRadio" class="mr15 fb">기아</a>
										</p>
										<p class="mt10">
											<label for="searchKeyword" class="hidden">이름 검색</label><input type="text" name="searchKeyword" id="searchKeyword" class="input mr5 businessKeyword" value="${params.searchKeyword }" />
											<span class="btn btn_normal">
												<a href="javascript:;" onclick="searchClick('<c:url value='/seller/officesItem/list.do'/>')" style="width: 80px;" class="btn_search_click">찾기</a>
											</span> <span class="btn btn_normal">
												<a href="javascript:;" onclick="searchMyItemsClick('<c:url value='/seller/myOfficesItem/list.do'/>','834','600')" style="width: 80px;">My 거래처</a>
											</span> <span class="btn btn_normal">
												<a id="searchButton" href="javascript:;" style="width: 80px;">조회하기</a>
											</span>
										</p>
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				
				<!-- // 검색조건 -->
				
				<br />
				<br />

				<input type="hidden" id="taxIssueUrl" value="">

				<!-- 세금계산서 등록 조회 -->
				<form id="searchPopup" action="/seller/taxBill/list.do" method="post"></form>

	
				<h3 class="hidden">세금계산서 발행</h3>
				<table id="taxBillTable" class="tbl_view2 mb10 mt15" summary="세금계산서 발행을 하기위한 표입니다.">
					<span class="btn btn_normal2 mb10"> <a href="javascript:;" onclick="allCheck();" style="width: 100px;">전체선택</a></span>
				    <span class="btn btn_normal2 mb10"> <a href="javascript:;" onclick="allCheck();" style="width: 100px;">선택해제</a></span>
	                <span class="btn btn_normal2 mb10"> <a href="javascript:;" onclick="downloadXml('');" style="width: 130px;">매출세금계산서 발행</a></span>
	                <span class="btn btn_normal2 mb10"> <a href="javascript:;" onclick="taxRefer();" style="width: 150px;">세금계산서관련 참고사항</a></span>
					<caption></caption>
					<colgroup>
						<col width="10%" />
	                	<col width="10%" />
		                <col width="10%" />
		                <col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
					<thead>
						<tr>
							<th class="tbl_center" style="padding-left:10px;">총계</th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th class="money_right" style="padding-left:10px;">-</th>
							<th class="money_right" style="padding-left:10px;">-</th>
							<th class="money_right" style="padding-left:10px;">0</th>
						</tr>
						<tr>
							<th class="tbl_center" style="padding-left:10px;">추가</th>
							<th class="tbl_center" style="padding-left:10px;">대리점명</th>
							<th class="tbl_center" style="padding-left:10px;">코드</th>
							<th class="tbl_center" style="padding-left:10px;">매출기간</th>
							<th class="tbl_center" style="padding-left:10px;">종료건수</th>
							<th class="tbl_center" style="padding-left:10px;">공급가액</th>
							<th class="tbl_center" style="padding-left:10px;">세액</th>
							<th class="tbl_center" style="padding-left:10px;">계</th>
						</tr>
						
					</thead>
					<tbody>
							<c:choose>
							<c:when test="${empty list }">
							<tr>
								<td colspan="8" class="text_center">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
							</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td><input type="checkbox" id="allCheck"/></td>
									<td class="text_center">${item.sellerCompanyName}</td>
									<td class="text_center">${item.buyerCode}</td>
									<td class="text_center" id="issueDateTD">${item.salesDate}~${item.issueDate}</td>
									<td class="text_center" id="expirationDateTD"></td>
									<td class="money_right" id="amountOfMoneyTD"><fmt:formatNumber value="${item.amount}" pattern="#,###" /></td>
									<td class="money_right" id="amountOfMoneyTD"><fmt:formatNumber value="${item.amount}" pattern="#,###" /></td>
									<td class="money_right" id="amountOfMoneyTD"><fmt:formatNumber value="${item.amount}" pattern="#,###" /></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</form>	
				<!--// 세금계산서 등록 조회 -->
				
				<!-- 페이징 -->
				<div class="paging">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
				</div>
				<!-- // 페이징 -->
				
				<!-- 상세 페이지 URL -->
				<input id="detailUrl" type="hidden" value="<c:url value='/seller/salesBilling/list.do'/>" />
				<!-- 상세 페이지 URL -->

				<!-- 세금계산서 팝업 URL -->
				<input type="hidden" id="taxBillPopupUrl" value="<c:url value='/seller/taxBill/popup.do'/>">
				<!-- 세금계산서 팝업 URL -->

				<form id="taxBillForm" method="post" action="<c:url value='/seller/taxBill/popup.do'/>">
					<input type="hidden" id="taxBillNumber" name="taxBillNumber">
				</form>
				
				<!-- 대리점 공통 -->
				<c:import url="sellerCommon.jsp" />
				<!-- // 대리점 공통 -->
			</div>
			<!-- // #contents -->
		</div>
		<!-- // #container -->
	</div>
	<!-- // #wrap -->
	<!-- 사업소 미선택시 경고창 -->
<div id='notChoicePopup' class="alert_popup abc" style="visibility: hidden">
    <dl>
        <dt>먼저 찾기 또는 My 거래처를 선택해 주세요.</dt>
        <dd><span class="btn btn_normal popokbtn"><a href="#" style="width: 80px;">확인</a> </span></dd>
    </dl>
</div>
<!-- //사업소 미선택시 경고창 -->

<!-- ajax 통신실패 경고창 -->
<div id='ajaxErrorPopup' class="alert_popup abc" style="visibility: hidden">
    <dl>
        <dt>통신실패.</dt>
        <dd><span class="btn btn_normal popokbtn"><a href="#" style="width: 80px;">확인</a> </span></dd>
    </dl>
</div>
<!-- //ajax 통신실패 경고창 -->

<!-- 달력 Validation -->
<div id='range_alert1' class="alert_popup abc" style="visibility: hidden">
    <dl>
        <dt>조회기간은 최소 6개월 이상이여야 조회가 가능합니다.</dt>
        <dd><span class="btn btn_normal popokbtn"><a href="#" style="width: 80px;">확인</a> </span></dd>
    </dl>
</div>

<div id='range_alert2' class="alert_popup abc" style="visibility: hidden">
    <dl>
        <dt>조회기간은 최대 1년까지만 조회가 가능합니다.</dt>
        <dd>
            <span class="btn btn_normal popokbtn"><a href="#" style="width: 80px;">확인</a> </span>
        </dd>
    </dl>
</div>

<div id='range_alert3' class="alert_popup abc" style="visibility: hidden">
    <dl>
        <dt>조회시작날짜가 조회종료날짜보다 클 수 없습니다.</dt>
        <dd>
            <span class="btn btn_normal popokbtn"><a href="#" style="width: 80px;">확인</a> </span>
        </dd>
    </dl>
</div>
<!-- //달력 Validation -->

<!-- 로딩팝업 -->
<div id='loadingPopup' class="loading_popup abc" style="visibility: hidden">
    <dl>
        <dt>잠시만 기다려주세요...</dt>
    </dl>
</div>
<!-- //로딩팝업 -->

<!-- 매출 채권 성공 팝업 -->
<div id='message_popup' class="alert_popup abc" style="visibility: hidden">
    <dl>
        <dt>매출 채권이 정상적으로 생성되었습니다.</dt>
        <dd><span id="messageOk" class="btn btn_popup btn_popup3"><a href="#" style="width: 80px;">확인</a> </span></dd>
    </dl>
</div>
<!-- //매출 채권 성공 팝업 -->

<!-- 적수일 경고창 -->
<div id='expitation_popup' class="alert_popup abc" style="visibility: hidden">
    <dl>
        <dt>적수일자가 개별 지정가능 최대 만기일 180일을 초과하였습니다. 만기일을 다시 설정해 주세요.</dt>
        <dd><span class="btn btn_normal popokbtn"><a href="#" style="width: 80px;">확인</a> </span></dd>
    </dl>
</div>
<!-- //적수일 경고창  -->

<!-- 적수일 경고창2 -->
<div id='expitation_popup2' class="alert_popup abc" style="visibility: hidden">
    <dl>
        <dt>적수일자가 월별 적수 65일을 초과하였습니다. 만기일을 다시 설정해 주세요.</dt>
        <dd><span class="btn btn_normal popokbtn"><a href="#" style="width: 80px;">확인</a> </span></dd>
    </dl>
</div>
<!-- //적수일 경고창  -->

<!-- 승인 경고창 -->
<div id='approveChiocePopup' class="alert_popup abc" style="display: none;">
    <dl>
        <dt>일괄승인하시려면 하나 이상 선택하세요.</dt>
        <dd><span class="btn btn_normal popokbtn"><a href="#" style="width: 80px;">확인</a> </span></dd>
    </dl>
</div>
<!-- //승인 경고창 -->

<!-- EXCEL EXPORT 경고창 -->
<div id='notExeportPopup' class="alert_popup abc" style="display: none;">
    <dl>
        <dt>데이터 조회 후 EXPORT 하시기 바랍니다.</dt>
        <dd><span class="btn btn_normal popokbtn"><a href="#" style="width: 80px;">확인</a> </span></dd>
    </dl>
</div>
<!-- //EXCEL EXPORT 경고창 -->
	

	<!-- footer -->
	<c:import url="../../inc/logedfooter.jsp" />
	<!--// footer -->

	
</body>
</html>