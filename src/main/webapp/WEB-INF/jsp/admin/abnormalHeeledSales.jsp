<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  /**
  * @Class Name : abnormalHeeledSales.jsp
  * @Description : 매출분포 이상거래 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2018.11.19            최초 생성
  *
  * author CDF Team
  * since 2018.11.06
  *
  */
%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>매출분포 이상거래</title>
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
	
		$('#searchButton').click( function() {
			$('#searchForm').submit();
		});
	
		$('#excelExport').click( function() {
			var form = $('#searchForm').clone().hide();
	
			form.attr( 'action', "<c:url value='/downloads/abnormalHeeledSales.do'/>" );
			$('body').append(form);
			form.submit().remove();
		});
	});
    /* pagination 페이지 링크 function */
    function fn_link_page(pageNo){
	   	document.searchForm.pageIndex.value = pageNo;
		document.searchForm.action = "<c:url value='/admin/abnormalHeeledSales.do'/>";
       	document.searchForm.submit();
    }
</script>
</head>
<body>
<div id="wrap">
	<div id="mask" style="width: 100%; height: 100%;"></div>
	<!-- 상단 시작 -->
	<div id="hd">
		<h1 id="hd_h1">매출분포 이상거래</h1>
		<div id="skip_to_container"><a href="#container">본문내용 바로가기</a></div>
		<div class="head">
			<div class="logo">
				<a href="<c:url value='/logout.do'/>">
			<%-- 		<img src="<c:url value='/images/common/logo.png'/>" alt="현대커머셜 로고" /> --%>
				</a>
			</div>
			<div class="gnb">
				<ul>
					<li><a href="<c:url value='/admin/checkMemberList.do'/>">품목/대리점 조회</a></li>
					<li><a href="<c:url value='/admin/abnormalDaily.do'/>">일자별 이상거래</a></li>
					<li><a href="<c:url value='/admin/abnormalHeeledSales.do'/>" class="active">매출분포 이상거래</a></li>
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
			<h2>매출분포 이상거래</h2>
			<form id="searchForm" class="mt20" action="<c:url value='/admin/abnormalHeeledSales.do'/>" method="post">    
	    	<input name="pageIndex" type="hidden" value="1">
			<div class="bd-head">
				<ul>
					<li>
						<label for="sch-w01">검색조건</label>
						<input type="text" id="searchKeyword" name="searchKeyword" class="wx120" value='<c:out value="${searchVO.searchKeyword}"/>' maxlength="50">
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
			<div class="tbl-type01">
				<table summary="">
					<caption>매출분포 이상거래 조회 목록</caption>
					<colgroup>
						<col width="6%" />
						<col width="8%" />
						<col width="8%" />
						<col width="6%" />
						<col width="8%" />
						<col width="8%" />
						<col width="6%" />
						<col width="9%" />
						<col width="9%" />
						<col width="9%" />
						<col width="" />
					</colgroup>
					<thead>
						<tr>
							<th colspan="3" scope="colgroup">대리점</th>
							<th colspan="3" scope="colgroup">품목점</th>
							<th rowspan="2" scope="col">코드</th>
							<th rowspan="2" scope="col">부여한도</th>
							<th rowspan="2" scope="col">잔여한도</th>
							<th rowspan="2" scope="col">초과한도</th>
							<th rowspan="2" scope="col">이상거래내역</th>
						</tr>
						<tr>
							<th scope="col" class="bdr-l0">기준월</th>
							<th scope="col">상호</th>
							<th scope="col">사업자번호</th>
							<th scope="col">코드</th>
							<th scope="col">상호</th>
							<th scope="col">사업자번호</th>
						</tr>
					</thead>
					<tbody>
				 		<c:if test="${fn:length(resultList) == 0}">
						<!-- 데이터가 없으면 -->
						<tr>
							<td colspan="11">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
						</tr>
						</c:if>
											
						<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr>
							<td><c:out value="${result.regDate}"/></td>
							<td><c:out value="${result.buyerCoNm}"/></td>
							<td><c:out value="${result.buyerBizNo}"/></td>
							<td><c:out value="${result.buyerMembNo}"/></td>
							<td><c:out value="${result.sellerCoNm}"/></td>
							<td><c:out value="${result.sellerBizNo}"/></td>
							<td><c:out value="${result.sellerMembNo}"/></td>
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
