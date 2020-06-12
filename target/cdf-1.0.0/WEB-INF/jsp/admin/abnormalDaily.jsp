<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  /**
  * @Class Name : abnormalDaily.jsp
  * @Description : 일자별 이상거래 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2018.11.19            최초 생성
  *
  * author CDF Team
  * since 2018.11.19
  *
  */
%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>일단위 이상거래</title>
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
<script type="text/javascript">
	$(function() {
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		
		// 검색날짜 데이터피커
		$("#baseDate").datepicker({
			showOn : "button",
			buttonImage : "<c:url value='/images/ico/ico-calendar.png'/>",
			buttonImageOnly : true,
			dateFormat : 'yy.mm.dd',
			changeMonth: true,
			changeYear: true
		});
	
		$('#searchButton').click( function() {
			var regDate = $("#baseDate").val();
	        $("#regDate").val( regDate.replace(/\./g, '') );
			$('#searchForm').submit();
		});
		
		$('#excelExport').click( function() {
			var regDate = $("#baseDate").val();
			$("#regDate").val( regDate.replace(/\./g, '') );
	
	 		var form = $('#searchForm').clone().hide();
	        
	        form.attr( 'action', "<c:url value='/downloads/abnormalDaily.do'/>" );
	        
			$('body').append(form);
			
			form.submit().remove();
			
		});
		
		/* function excelExport( dataLength ){
			
	        var url = $("#excelUrl").val();
	        var origin_url = $("#searchForm").attr( "action" );
	        var form = $("#searchForm").toArray()[0];
	        
	        form.action = url;
	        form.method = "post";
	        form.submit();
	        
	        form.action = origin_url;
	    } */
	});
    /* pagination 페이지 링크 function */
    function fn_link_page(pageNo){
	   	document.searchForm.pageIndex.value = pageNo;
		document.searchForm.action = "<c:url value='/admin/abnormalDaily.do'/>";
       	document.searchForm.submit();
    }
</script>
</head>
<body>
<div id="wrap">
	<div id="mask" style="width: 100%; height: 100%;"></div>
	<!-- 상단 시작 -->
	<div id="hd">
		<h1 id="hd_h1">일자별 이상거래</h1>
		<div id="skip_to_container"><a href="#container">본문내용 바로가기</a></div>
		<div class="head">
			<div class="logo">
				<a href="<c:url value='/logout.do'/>">
					<img src="<c:url value='/images/common/logo.png'/>" alt="현대커머셜 로고" />
				</a>
			</div>
			<div class="gnb">
				<ul>
					<li><a href="<c:url value='/admin/checkMemberList.do'/>">품목/대리점 조회</a></li>
					<li><a href="<c:url value='/admin/abnormalDaily.do'/>" class="active">일자별 이상거래</a></li>
					<li><a href="<c:url value='/admin/abnormalHeeledSales.do'/>">매출분포 이상거래</a></li>
					<li><a href="<c:url value='/admin/limitInfoList.do'/>">대리점 한도조회</a></li>
					<li><a href="<c:url value='/admin/limitApprovalList.do'/>">한도승인</a></li>
					<li><a href="<c:url value='/admin/companyList.do'/>">보증내역</a></li>
					<li><a href="<c:url value='/admin/memberAuthList.do'/>">권한관리</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="m2-bg"></div>
	<!-- 상단 끝 -->
	<!-- 콘텐츠 시작  -->
	<div id="container">
		<div id="contents">
			<h2>일자별 이상거래</h2>
			<form id="searchForm" class="mt20" action="<c:url value='/admin/abnormalDaily.do'/>" method="post">    
		    <input name="pageIndex" type="hidden" value="1">
		    <input id="regDate" name="regDate" type="hidden" value=""/>
			<div class="bd-head">
				<ul>
					<li>
						<label for="sch-w01">검색조건</label>
						<input type="text" id="baseDate" name="baseDate" class="wx120" value='<c:out value="${yesterday}"/>' readonly/>
					</li>
					<li><a href="#" id="searchButton" class="btn-submit">조회하기</a></li>
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
						<a href="#NONE" id="excelExport" class="btn-excel">다운로드</a>
					</li>
				</ul>
			</div>
			</form>
			<div class="tbl-type01 basic">
				<table summary="">
					<caption>대리점 한도조회 목록</caption>
					<colgroup>
						<col width="5%" />
						<col width="8%" />
						<col width="15%" />
						<col width="10%" />
						<col width="8%" />
						<col width="12%" />
						<col width="12%" />
						<col width="12%" />
						<col width="" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">NO</th>
							<th scope="col">기준월</th>
							<th scope="col">상호</th>
							<th scope="col">사업자번호</th>
							<th scope="col">코드</th>
							<th scope="col">부여한도</th>
							<th scope="col">잔여한도</th>
							<th scope="col">초과한도</th>
							<th scope="col">이상거래내역</th>
						</tr>
					</thead>
					<tbody>
				 		<c:if test="${fn:length(resultList) == 0}">
						<!-- 데이터가 없으면 -->
						<tr>
							<td colspan="9">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
						</tr>
						</c:if>
											
						<c:forEach var="result" items="${resultList}" varStatus="status">
					    <tr>
                        	<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.recordCountPerPage + status.count)}"/></td>
					        <td><c:out value="${result.regDate}"/></td>
					        <td><c:out value="${result.companyName}"/></td>
					        <td><c:out value="${result.businessNo}"/></td>
					        <td><c:out value="${result.membNo}"/></td>
					        <td class="txt-r"><fmt:formatNumber value="${result.salesLimit }" pattern="#,###" /></td>
					        <td class="txt-r"><fmt:formatNumber value="${result.remainingLimit }" pattern="#,###" /></td>
					        <td class="txt-r"><fmt:formatNumber value="${result.overLimit }" pattern="#,###" /></td>
					        <td class="txt-r"><fmt:formatNumber value="${result.tradeAmt }" pattern="#,###" />
					        	(-<fmt:formatNumber value="${result.abnormalAmt }" pattern="#,###" />)</td>
					    </tr>
						</c:forEach>
					</tbody>
				</table>
            </div>
		  	<div class="paging">
		  		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_link_page" />
		  	</div>
        </div><!--// contents -->
    </div><!--// container -->
	<!-- 콘텐츠 끝 -->
	<!-- 하단 시작 -->
	<c:import url="../inc/logedfooter.jsp" />
	<!-- 하단 끝 -->
</div><!--// wrap -->
</body>
</html>
