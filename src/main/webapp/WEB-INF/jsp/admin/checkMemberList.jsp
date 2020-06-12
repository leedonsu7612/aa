<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  /**
  * @Class Name : checkMemberList.jsp
  * @Description : 상점 List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2018.11.06            최초 생성
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
<title>사업자 목록 조회</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/base.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/layout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/common.css'/>" />
<script src="<c:url value='/js/admin/jquery-3.3.1.min.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script src="<c:url value='/js/admin/common.js'/>"></script>
<!--[if lte IE 8]>
<script type="text/javascript" src="<c:url value='/js/admin/html5.js'/>"></script>
<![endif]-->
<script type="text/javascript">

    //EXCEL EXPORT
    function excelExport( dataLength ){
		var form = $('#searchForm').clone().hide();

		form.attr( 'action', "<c:url value='/downloads/checkMemberList.do'/>" );

		$('body').append(form);

		form.submit().remove();
    }

    /* pagination 페이지 링크 function */
    function link_page(pageNo){
    	document.searchForm.pageIndex.value = pageNo;
		document.searchForm.action = "<c:url value='/admin/checkMemberList.do'/>";
       	document.searchForm.submit();
    }

    function selectList() {
		document.searchForm.action = "<c:url value='/admin/checkMemberList.do'/>";
	   	document.searchForm.submit();
	}
    
    function accessCompany(businessNo, membClass){
        $("#accessForm #businessNo").val(businessNo);
        $("#accessForm #membClass").val(membClass);
        $("#accessForm").submit();
    }
</script>
</head>
<body>
<div id="wrap">
	<div id="mask" style="width: 100%; height: 100%;"></div>
	<!-- 상단 시작 -->
	<div id="hd">
		<!-- <h1 id="hd_h1">현대커머셜</h1> -->
		<div id="skip_to_container"><a href="#container">본문내용 바로가기</a></div>
		<div class="head">
			<div class="logo">
				<a href="<c:url value='/logout.do'/>">
					<%-- <img src="<c:url value='/images/common/logo.png'/>" alt="현대커머셜 로고" /> --%>
				</a>
			</div>
			<div class="gnb">
				<ul>
					<li><a href="<c:url value='/admin/checkMemberList.do'/>" class="active">품목/대리점 조회</a></li>
					<li><a href="<c:url value='/admin/abnormalDaily.do'/>">일자별 이상거래</a></li>
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
    <div id="container">
        <div id="contents">
			<h2>품목/대리점 조회</h2>

			<form id="accessForm" class="mt20" action="<c:url value='/accessCompany.do'/>" method="post">    
			    <input id="businessNo" name="businessNo" type="hidden" value="">
			    <input id="membClass" name="membClass" type="hidden" value="">
			</form>
			
			
			<form:form commandName="searchVO" id="searchForm" name="searchForm" class="mt20" method="post">    
			<input id="pageIndex" name="pageIndex" type="hidden" value="1">

			<div class="bd-head">
				<ul>
					<li>
						<div class="select-bx wx200">
							<label for="bd-type">
	                         <c:choose>
								<c:when test="${searchVO.membClass == 'A'}">전체</c:when>
								<c:when test="${searchVO.membClass == 'B'}">대리점</c:when>
								<c:when test="${searchVO.membClass == 'S'}">품목점</c:when>
							 </c:choose>
							</label>
                            <select id="membClass" name="membClass">
                                <option value="A" <c:if test="${searchVO.membClass == 'A'}">selected="selected"</c:if>>전체</option>
                                <option value="B" <c:if test="${searchVO.membClass == 'B'}">selected="selected"</c:if>>대리점</option>
                                <option value="S" <c:if test="${searchVO.membClass == 'S'}">selected="selected"</c:if>>품목점</option>
                            </select>
						</div>
					</li>
					<li>
						<div class="select-bx wx200">
							<label for="bd-type2">
	                         <c:choose>
								<c:when test="${searchVO.searchCondition == '0'}">사업자번호</c:when>
								<c:when test="${searchVO.searchCondition == '1'}">상점명</c:when>
								<c:when test="${searchVO.searchCondition == '2'}">대표자명</c:when>
							 </c:choose>
							</label>
                            <select id="searchCondition" name="searchCondition">
                                <option value="0" <c:if test="${searchVO.searchCondition == '0'}">selected="selected"</c:if>>사업자번호</option>
                                <option value="1" <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>상점명</option>
                                <option value="2" <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>>대표자명</option>
                            </select>  
						</div>
					</li>
					<li><label for="bd-text" class="sound_only">검색어 입력</label>
                        <input id="searchKeyword" name="searchKeyword" type="text" value='<c:out value="${searchVO.searchKeyword}"/>' maxlength="50">
					</li>
					<li><a href="#" class="btn-submit" onClick="javascript:selectList();">조회하기</a></li>
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
						<a href="#NONE" class="btn-excel" onClick="javascript:excelExport(0);">다운로드</a>
					</li>
				</ul>
			</div>
			<div class="tbl-type01 basic">
				<table summary="">
					<caption>품목/대리점 조회 목록</caption>
					<colgroup>
						<col width="8%" />
						<col width="" />
						<col width="13%" />
						<col width="24%" />
						<col width="13%" />
						<col width="13%" />
						<col width="13%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">NO</th>
							<th scope="col">구분</th>
							<th scope="col">코드</th>
							<th scope="col">상호</th>
							<th scope="col">대표자명</th>
							<th scope="col">사업자번호</th>
							<th scope="col">연체중</th>
						</tr>
					</thead>
					<tbody>
     				<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr>
							<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.recordCountPerPage + status.count)}"/></td>
							<td>
	                         <c:choose>
								<c:when test="${result.membClass eq 'A'}">관리자</c:when>
								<c:when test="${result.membClass eq 'B'}">대리점</c:when>
								<c:when test="${result.membClass eq 'S'}">품목점</c:when>
							 </c:choose>
							</td>
							<td><c:out value="${result.membNo}"/></td>
							<td><a href="#" onclick="accessCompany('${result.businessNo}', '${result.membClass}')"><c:out value="${result.companyName}"/></a></td>
							<td><c:out value="${result.ceoName}"/></td>
							<td><c:out value="${result.businessNo}"/></td>
							<td><span class="fs-red">
	                         <c:choose>
								<c:when test="${result.dishonoredType eq 'C'}">커머셜 연체</c:when>
								<c:when test="${result.dishonoredType eq 'M'}">모비스 연체</c:when>
							 </c:choose>
							</span></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>					
		  	<!-- /List -->
		  	<div class="paging">
		  		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="link_page" />
		  		<%-- <form:hidden path="pageIndex" /> --%>
		  	</div>
		</form:form>
        </div><!--// contents -->
    </div><!--// container -->
	<!-- footer -->
	<c:import url="../inc/logedfooter.jsp" />
	<!--// footer -->    
</div><!--// wrap -->
</body>
</html>