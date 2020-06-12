<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  /**
  * @Class Name : buyerList.jsp
  * @Description : 대리점 List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2018.12.13            최초 생성
  *
  * author CDF Team
  * 2018.12.13
  *
  */
%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
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
		document.searchForm.action = "<c:url value='/admin/buyerList.do'/>";
       	document.searchForm.submit();
    }

	function searching(){
		document.searchForm.action = "<c:url value='/admin/buyerList.do'/>";
       	document.searchForm.submit();
	}

    function selectClick(){
    	var obj = $("input[name=buyerSelRadio]:checked");
    	var companyName = $(obj).parent().siblings("td:nth-child(3)").text();
    	var membNo = $(obj).parent().siblings("td:nth-child(4)").text();
    	var businessNo = $(obj).parent().siblings("td:nth-child(5)").text();
    	window.parent.buyerSelectClick(companyName, membNo, businessNo);
    	window.parent.closeIFPopup();
    }
</script>
</head>
<body class="main">
    <div id="wrap">
        <div id="pop_container">
            <div id="contents">

<form:form commandName="searchVO" id="searchForm" name="searchForm" class="mt20" method="post">    
    <input id="businessNo" name="businessNo" type="hidden" value="">
    <input id="CompanyName" name="CompanyName" type="hidden" value="">
    <input id="membNo" name="membNo" type="hidden" value="">
    <input id="membClass" name="membClass" type="hidden" value="B">
    <input id="pageIndex" name="pageIndex" type="hidden" value="1">

	<div class="pop-bd-head">
		<ul>
			<li class="wx100">
				<div class="select-bx">
					<label for="pop-bd-type">
	                <c:choose>
						<c:when test="${searchVO.searchCondition eq '0'}">대리점</c:when>
						<c:when test="${searchVO.searchCondition eq '1'}">코드</c:when>
						<c:when test="${searchVO.searchCondition eq '2'}">사업자번호</c:when>
					 </c:choose>
					</label>
					<select id="searchCondition" name="searchCondition">
                              <option value="0" <c:if test="${searchVO.searchCondition == '0'}">selected="selected"</c:if>>대리점</option>
                              <option value="1" <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>코드</option>
                              <option value="2" <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>>사업자번호</option>
					</select>
				</div>
			</li>
			<li>
				<label for="pop-bd-text" class="sound_only">검색어 입력</label>
				<input type="text" id="searchKeyword" name="searchKeyword" value='<c:out value="${searchVO.searchKeyword}"/>' maxlength="50">
			</li>
			<li><a href="#" class="btn-submit" onClick="javascript:searching();">조회하기</a></li>
		</ul>
	</div>
	
	<div class="tbl-type02 tbl-center">
		<table summary="">
			<caption>대리점 조회 목록</caption>
			<colgroup>
				<col width="50" />
				<col width="50" />
				<col width="" />
				<col width="" />
				<col width="" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col" class="bdr-l0">NO</th>
					<th scope="col">대리점</th>
					<th scope="col">코드</th>
					<th scope="col">사업자번호</th>
				</tr>							
			</thead>
			<tbody>
     			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
					<td><input type="radio" id="<c:out value='${result.membNo}'/>" name="buyerSelRadio"/><label for="<c:out value='${result.membNo}'/>"><span></span></label></td>
					<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.recordCountPerPage + status.count)}"/></td>
					<td><c:out value='${result.companyName}'/></td>
					<td><c:out value="${result.membNo}"/></td>
					<td><c:out value='${result.businessNo}'/></td>
				</tr>
                </c:forEach>
			</tbody>
		</table>
	</div>
  	<!-- /List -->
  	<div class="paging mt30">
  		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
  	</div>
	<div class="btn-set">
		<a href="#" onClick="javascript:selectClick();">선택</a>
		<a href="#" class="cancel" onClick="javascript:window.parent.closeIFPopup();">취소</a>
	</div>
</form:form>

<!--// container -->


            </div>
        </div>
    </div>
</body>
</html>