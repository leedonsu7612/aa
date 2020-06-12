<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
  /**
  * @Class Name : limitHistory.jsp
  * @Description : 한도이력조회 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2018.12.14            최초 생성
  *
  * author CDF Team
  * 2018.12.14
  *
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대리점 조회</title>
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

    /* pagination 페이지 링크 function */
    function linkPage(pageNo){
    	document.searchForm.pageIndex.value = pageNo;
		document.searchForm.action = "<c:url value='/admin/limitHistory.do'/>";
       	document.searchForm.submit();
    }
</script>
</head>
<body class="main">
    <div id="wrap">
        <div id="pop_container">
            <div id="contents">

<form:form commandName="searchVO" id="searchForm" name="searchForm" class="mt20" method="post">    
    <input id="businessNo" name="businessNo" type="hidden" value="${searchVO.businessNo}">
    <input id="companyName" name="companyName" type="hidden" value="${searchVO.companyName}">
    <input id="membNo" name="membNo" type="hidden" value="${searchVO.membNo}">
    <input id="lastDate" name="lastDate" type="hidden" value="${searchVO.lastDate}">
    <input id="pageIndex" name="pageIndex" type="hidden" value="1">

	<div class="tbl-type02 mt30">
		<table summary="">
			<caption>대리점 정보</caption>
			<tr>
				<th scope="row">대리점명</th>
				<td><c:out value="${searchVO.companyName}"/></td>
				<th scope="row">사업자번호</th>
				<td><c:out value="${searchVO.businessNo}"/></td>
			</tr>
			<tr>
				<th scope="row">코드</th>
				<td><c:out value="${searchVO.membNo}"/></td>
				<th scope="row">휴업/폐업</th>
				<td><c:out value="${searchVO.lastDate}"/></td>
			</tr>
		</table>
	</div>

	<div class="tbl-type02 tbl-center">
		<table summary="">
			<caption>한도이력 조회 목록</caption>
			<colgroup>
				<col width="50" />
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">NO</th>
					<th scope="col">구분</th>
					<th scope="col">변경 전 한도</th>
					<th scope="col">변경 후 한도</th>
					<th scope="col">상태</th>
					<th scope="col">승인일</th>
				</tr>							
			</thead>
			<tbody>
     			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
                    <td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
					<td>
					 <c:choose>
						<c:when test="${result.lmtReqGbn eq 'LM01'}">최초 한도설정</c:when>
						<c:when test="${result.lmtReqGbn eq 'LM02'}">한도증액</c:when>
						<c:when test="${result.lmtReqGbn eq 'LM03'}">한도감액</c:when>
						<c:when test="${result.lmtReqGbn eq 'LM04'}">한도이관</c:when>
						<c:when test="${result.lmtReqGbn eq 'LM05'}">휴업</c:when>
						<c:when test="${result.lmtReqGbn eq 'LM06'}">폐업</c:when>
					 </c:choose>
					</td>
					<td><fmt:formatNumber value="${result.salesLimit }" pattern="#,###" /></td>
					<td><fmt:formatNumber value="${result.reqLimit }" pattern="#,###" /></td>
					<td><c:out value="${result.process}"/></td>
					<td><c:out value="${result.regDate}"/></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
  	<!-- /List -->
  	<div class="paging mt30">
  		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
  	</div>
</form:form>

<!--// container -->


            </div>
        </div>
    </div>
</body>
</html>