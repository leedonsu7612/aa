<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	/**
	* @Class Name : taxBillList.jsp
	* @Description : 대리점 세금계산서조회 List 화면
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
	<title>세금계산서 조회</title>
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
	<c:import url="../../inc/buyer/old/sellerHeader.jsp" />
	<!--// header -->

	<div id="wrap">
		<div id="container">
			<div id="contents">
				<!-- title -->
				<h2 class="hidden">세금계산서 조회</h2>
				<!-- // title -->
				
				<!-- 검색조건 -->
				<form name="searchForm" method="post" id="searchForm" class="mt20" action="<c:url value='/seller/taxBill/list.do'/>">
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
				</form>
				<!-- // 검색조건 -->
				
				<br />
				<br />

				<input type="hidden" id="taxIssueUrl" value="">

				<!-- 세금계산서 등록 조회 -->
				<form id="searchPopup" action="/seller/taxBill/list.do" method="post"></form>

				<!-- 세금계산서 요약정보 -->
				<!-- <div class="btn_group mb10">
					<span class="btn btn_popup">
						<a id="taxBillPopup" href="#">세금계산서</a>
					</span>
				</div> -->

				<h3 class="hidden">세금계산서 조회</h3>
				<table id="taxBillTable" class="tbl_view2 mb10 mt15" summary="세금계산서 발행을 하기위한 표입니다.">
					<caption>세금계산서 조회</caption>
					<colgroup>
						<col width="20%" />
						<col width="20%" />
						<col width="20%" />
						<col width="20%" />
						<col width="20%" />
					</colgroup>
					<thead>
						<tr>
							<th class="tbl_center">거래처</th>
							<th class="tbl_center">발행번호</th>
							<th class="tbl_center">발행일</th>
							<th class="tbl_center">금액</th>
							<th class="tbl_center">출력</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="7" class="text_center">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
						</tr>
					</tbody>
				</table>
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

	<!-- footer -->
	<c:import url="../../inc/logedfooter.jsp" />
	<!--// footer -->

	<script type="text/javascript">
	    $(function() {
	        //세금계산서 발행 조회
	        $("#searchButton").click(function(e) 
	        {
	            $("#searchForm").submit();
	        });
	
	        $("#itemShopCode").change(function() {
	            $("#searchForm").submit();
	        });
	        
	        //체크박스 이벤트
	        $("#allCheck").click(function(){
	           $("input[type=checkbox]").prop("checked",true);
	           sumDataCheck();
	        }); 
	        
	        $("#allUnCheck").click(function(){
	           $("input[type=checkbox]").prop("checked",false);
	           sumDataCheck();
	        }); 
	        
	        //체크박스 클릭
	        $("#taxBillTable > tbody > tr > td > #checkBill").click(function(){
	           sumDataCheck();
	        });
	    });
	    
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
	</script>
</body>
</html>