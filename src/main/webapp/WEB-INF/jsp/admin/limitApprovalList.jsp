<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  /**
  * @Class Name : limitApprovalList.jsp
  * @Description : 한도승인 List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2018.12.06            최초 생성
  *
  * author CDF Team
  * since 2018.12.06
  *
  */
%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>한도승인</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/base.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/buyer/jquery-ui.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/layout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/common.css'/>" />
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
	<div id="mask" style="width: 1453px; height: 480px;"></div>
	<!-- 상단 시작 -->
	<div id="hd">
		<h1 id="hd_h1">한도승인</h1>
		<div id="skip_to_container"><a href="#container">본문내용 바로가기</a></div>
		<div class="head">
			<div class="logo">
				<a href="<c:url value='/logout.do'/>">
					<%-- <img src="<c:url value='/images/common/logo.png'/>" alt="현대커머셜 로고" /> --%>
				</a>
			</div>
			<div class="gnb">
				<ul>
					<li><a href="<c:url value='/admin/checkMemberList.do'/>">품목/대리점 조회</a></li>
					<li><a href="<c:url value='/admin/abnormalDaily.do'/>">일자별 이상거래</a></li>
					<li><a href="<c:url value='/admin/abnormalHeeledSales.do'/>">매출분포 이상거래</a></li>
					<li><a href="<c:url value='/admin/limitInfoList.do'/>">대리점 한도조회</a></li>
					<li><a href="<c:url value='/admin/limitApprovalList.do'/>" class="active">한도승인</a></li>
					<li><a href="<c:url value='/admin/companyList.do'/>">보증내역</a></li>
					<li><a href="<c:url value='/admin/memberAuthList.do'/>">권한관리</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="m2-bg"></div>
	<!-- 상단 끝 -->
	
<script type="text/javascript">

	$(function() {
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		
		// 검색날짜 데이터피커
		$("#searchFromDate").datepicker({
			showOn : "button",
			buttonImage : "<c:url value='/images/ico/ico-calendar.png'/>",
			buttonImageOnly : true,
			dateFormat : 'yy.mm.dd',
			changeMonth: true,
			changeYear: true
		});
		$("#searchToDate").datepicker({
			showOn : "button",
			buttonImage : "<c:url value='/images/ico/ico-calendar.png'/>",
			buttonImageOnly : true,
			dateFormat : 'yy.mm.dd',
			changeMonth: true,
			changeYear: true
		});
	});

	//EXCEL EXPORT
    function excelExport(){
		var form = $('#searchForm').clone().hide();

		form.attr( 'action', "<c:url value='/downloads/limitInfoList.do'/>" );

		$('body').append(form);

		form.submit().remove();
    }

    /* pagination 페이지 링크 function */
    function fn_link_page(pageNo){
		if($('#rcvAt1').prop('checked'))
			document.searchForm.rcvAt.value = '1';
		else document.searchForm.rcvAt.value = '0';
	   	document.searchForm.pageIndex.value = pageNo;
		document.searchForm.action = "<c:url value='/admin/limitApprovalList.do'/>";
       	document.searchForm.submit();
    }

    function fn_selectList() {
		if($('#rcvAt1').prop('checked'))
			document.searchForm.rcvAt.value = '1';
		else document.searchForm.rcvAt.value = '0';
		document.searchForm.action = "<c:url value='/admin/limitApprovalList.do'/>";
	   	document.searchForm.submit();
	}
    
	//상세보기 팝업
	function requestPopup(businessNo) {
		var qrystr = "businessNo=" + businessNo;
		$(".popup03 > .pop-bx").empty();
		$(".popup03 > .pop-bx").load("<c:url value='/admin/limitApproval.do'/>", qrystr, function(responseText, textStatus, XMLHttpRequest) {
			if (textStatus == "success") {
				//부모창 불투명 처리
				//event.preventDefault();
				wrapWindowByMask($('.popup03'));

				$('.popup03').show();
				$(".popup03").css("visibility", "visible");
				$(".popup03").fadeIn("slow");
			} else if (textStatus == "error") {
				$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + XMLHttpRequest.status + "\n" + "ERROR : " + XMLHttpRequest.statusText);
				$("#ajaxErrorPopup").css("visibility", "visible");
				$("#ajaxErrorPopup").fadeIn("show");
			}
		});
	}

	//한도이력조회 팝업
	function limitHistoryPopup(obj) {
    	var membNo = "membNo=" + $(obj).parent().siblings("td:nth-child(3)").text();
    	var companyName = "&companyName=" + encodeURI($(obj).text());
    	var businessNo = "&businessNo=" + $(obj).parent().siblings("td:nth-child(6)").text();
    	var lastDate = "&lastDate=" + $(obj).parent().siblings("td:nth-child(15)").text();
    	var qryStr = membNo + companyName + businessNo + lastDate;
	    wrapWindowByMask($('.popup022'));
	    $('.popup022 > .pop-bx > iframe').attr('src', "<c:url value='/admin/limitHistory.do'/>?" + qryStr);
	    $('.popup022').show();
	}
	
</script>

	<!-- 콘텐츠 시작  -->
	<div id="container">
		<div id="contents">
			<h2>한도승인-
            <c:choose>
				<c:when test="${userClass eq 'N'}">모비스 부서장</c:when>
				<c:when test="${userClass eq 'H'}">HCI 부서원</c:when>
				<c:when test="${userClass eq 'I'}">HCI 부서장</c:when>
			 </c:choose>
			</h2>
			<form:form commandName="searchVO" id="searchForm" name="searchForm" class="mt20" method="post">    
		    <input name="pageIndex" type="hidden" value="1">
            <input name="rcvAt" type="hidden" value="" />
			<div class="bd-head">
				<ul>
					<li>
						<label for="sch-w01">요청일</label>
						<input type="text" id="searchFromDate" name="searchFromDate" class="wx120" value='<c:out value="${searchVO.searchFromDate}"/>' readonly/> 
						~ <input type="text" id="searchToDate" name="searchToDate" class="wx120" value='<c:out value="${searchVO.searchToDate}"/>' readonly/>
					</li>
					<li>
						<span class="label">진행상태</span>
						<div class="select-bx wx120">
							<label for="sch-w03">
	                         <c:choose>
								<c:when test="${searchVO.searchCondition eq '0'}">전체</c:when>
								<c:when test="${searchVO.searchCondition eq '1'}">최초한도설정</c:when>
								<c:when test="${searchVO.searchCondition eq '2'}">한도증액</c:when>
								<c:when test="${searchVO.searchCondition eq '3'}">한도감액</c:when>
								<c:when test="${searchVO.searchCondition eq '4'}">한도이관</c:when>
								<c:when test="${searchVO.searchCondition eq '5'}">휴업</c:when>
								<c:when test="${searchVO.searchCondition eq '6'}">폐업</c:when>
							 </c:choose>
							</label>
							<select id="searchCondition" name="searchCondition">
                                <option value="0" <c:if test="${searchVO.searchCondition == '0'}">selected="selected"</c:if>>전체</option>
                                <option value="1" <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>최초한도설정</option>
                                <option value="2" <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>>한도증액</option>
                                <option value="3" <c:if test="${searchVO.searchCondition == '3'}">selected="selected"</c:if>>한도감액</option>
                                <option value="4" <c:if test="${searchVO.searchCondition == '4'}">selected="selected"</c:if>>한도이관</option>
                                <option value="5" <c:if test="${searchVO.searchCondition == '5'}">selected="selected"</c:if>>휴업</option>
                                <option value="6" <c:if test="${searchVO.searchCondition == '6'}">selected="selected"</c:if>>폐업</option>
							</select>
						</div>
					</li>
					<li>
						<label for="sch-w04">대리점</label>
						<input type="text" id="searchKeyword" name="searchKeyword" class="wx120" value='<c:out value="${searchVO.searchKeyword}"/>' maxlength="50">
					</li>
					<li><input type="checkbox" id="rcvAt1" <c:if test="${searchVO.rcvAt == '1'}">checked</c:if>/><label for="rcvAt1" class="ml10"><span></span>양수/양도 포함</label></li>
					<li><a href="#" class="btn-submit" onClick="javascript:fn_selectList();">조회하기</a></li>
				</ul>
			</div>
			<div class="bd-info">
				<ul>
					<li>총 <fmt:formatNumber value="${totCnt }" pattern="#,###" /> 건</li>
					<li>
						<div class="select-bx wx70">
							<label for="bd-ctn"><c:out value="${searchVO.recordCountPerPage}"/></label>
							<select id="recordCountPerPage" name="recordCountPerPage">
                                <option value="10" <c:if test="${searchVO.recordCountPerPage == '10'}">selected="selected"</c:if>>10</option>
                                <option value="50" <c:if test="${searchVO.recordCountPerPage == '50'}">selected="selected"</c:if>>50</option>
                                <option value="100" <c:if test="${searchVO.recordCountPerPage == '100'}">selected="selected"</c:if>>100</option>
                                <option value="200" <c:if test="${searchVO.recordCountPerPage == '200'}">selected="selected"</c:if>>200</option>
							</select>
						</div>
						<a href="#NONE" class="btn-excel" onClick="javascript:excelExport();">다운로드</a>
					</li>
				</ul>
			</div>
			<div class="tbl-type01">
				<table summary="">
					<caption>한도승인 목록</caption>
					<colgroup>
						<col width="4%" />
						<col width="" />
						<col width="4%" />
						<col width="5%" />
						<col width="5%" />
						<col width="6%" />
						<col width="5%" />
						<col width="5%" />
						<col width="6%" />
						<col width="6%" />
						<col width="5%" />
						<col width="5%" />
						<col width="5%" />
						<col width="5%" />
						<col width="5%" />
						<col width="5%" />
						<col width="6%" />
						<col width="6%" />
						<col width="4%" />
					</colgroup>
					<thead>
						<tr>
							<th rowspan="2" scope="col">NO</th>
							<th rowspan="2" scope="col">대리점</th>
							<th rowspan="2" scope="col">코드</th>
							<th rowspan="2" scope="col">대표명</th>
							<th rowspan="2" scope="col">사업소</th>
							<th rowspan="2" scope="col">사업자번호</th>
							<th colspan="2" scope="colgroup">거래한도</th>
							<th rowspan="2" scope="col">총<br />거래한도</th>
							<th rowspan="2" scope="col">잔여한도</th>
							<th rowspan="2" scope="col">초과한도</th>
							<th rowspan="2" scope="col">보증초과</th>
							<th rowspan="2" scope="col">보증금액</th>
							<th rowspan="2" scope="col">공증금액</th>
							<th rowspan="2" scope="col">휴업/폐업</th>
							<th rowspan="2" scope="col">비고</th>
							<th rowspan="2" scope="col">진행상태</th>
							<th rowspan="2" scope="col">요청일</th>
							<th rowspan="2" scope="col"></th>
						</tr>
						<tr>
						  <th scope="col">모비스</th>
						  <th scope="col">HCI</th>
					  </tr>
					</thead>
					<tbody>
     					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr>
                         	<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.recordCountPerPage + status.count)}"/></td>
							<td class="subject"><a href="#" onClick="javascript:limitHistoryPopup(this);"><c:out value="${result.companyName}"/></a></td>
							<td><c:out value="${result.membNo}"/></td>
							<td><c:out value="${result.ceoName}"/></td>
							<td><c:out value="${result.bizPlace}"/></td>
							<td><c:out value="${result.businessNo}"/></td>
							<td class="txt-r"><fmt:formatNumber value="${result.mobisLimit }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.hciLimit }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.salesLimit }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.remLimit }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.overLimit }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.guaranteeOver }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.guaranteePrice }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.notarialPrice }" pattern="#,###" /></td>
							<td><c:out value="${result.closeDate}" escapeXml="false"/></td>
							<td><c:out value="${result.memo}" escapeXml="false"/></td>
							<td><c:out value="${result.process}" escapeXml="false"/></td>
							<td><c:out value="${result.reqDate}"/></td>
							<td><c:if test="${((userClass == 'A' || userClass == 'N') && (result.processNo == 1 || result.processNo == 97))
								 || (userClass == 'H' && (result.processNo == 2 || result.processNo == 3 || result.processNo == 5 || result.processNo == 98))
								 || (userClass == 'I' && (result.processNo == 4 || result.processNo == 6 || result.processNo == 99))}">
								<a href="#" class="btn-submit" onClick="javascript:requestPopup('${result.businessNo}');">확인</a>
								</c:if></td>
						</tr>
                 		</c:forEach>
					</tbody>
				</table>
			</div>
		  	<div class="paging">
		  		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_link_page" />
		  		<%-- <form:hidden path="pageIndex" /> --%>
		  	</div>
			</form:form>
		</div>
	</div>    
	<!-- 콘텐츠 끝 -->
	<!-- 하단 시작 -->
	<c:import url="../inc/logedfooter.jsp" />
	<!-- 하단 끝 -->
</div>
<div id="popup" class="popup03" style="display:none;">
	<div class="pop_draggable"><strong>대리점 한도 승인</strong></div>
	<div class="pop-bx"></div>
	<a href="#" class="btn-close" onClick="javascript:closeMaskedPopup($('.popup03'));">닫기</a>
</div>
<div id="popup" class="popup022" style="display:none;">
	<div class="pop_draggable"><strong>한도이력 조회</strong></div>
	<div class="pop-bx">
		<iframe src="" width="100%" height="640" style="border:none"></iframe>
	</div>
	<a href="#" class="btn-close" onClick="javascript:closeMaskedPopup($('.popup022'));">닫기</a>
</div>
<!-- ajax 통신실패 경고창 -->
<div id="ajaxErrorPopup" class="alert_popup abc" style="visibility: hidden; position: absolute; left: 290px; top: 44.5px;">
	<dl>
		<dt>통신실패.</dt>
		<dd>
			<span class="btn btn_normal popokbtn"><a href="javascript:;" style="width: 80px;">확인</a> </span>
		</dd>
	</dl>
</div>
<!-- //ajax 통신실패 경고창 -->
<!-- 로딩팝업 -->
<div id="loadingPopup" class="loading_popup abc" style="visibility: hidden">
	<dl>
		<dt>잠시만 기다려주세요...</dt>
	</dl>
</div>
<!-- //로딩팝업 -->
</body>
</html>