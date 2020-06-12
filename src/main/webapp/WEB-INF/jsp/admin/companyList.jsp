<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  /**
  * @Class Name : companyList.jsp
  * @Description : 보증내역 List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2018.11.26            최초 생성
  *
  * author CDF Team
  * since 2018.11.26
  *
  */
%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>보증 내역 조회</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/base.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/layout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/common.css'/>" />
<script src="<c:url value='/js/admin/jquery-3.3.1.min.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
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
		<h1 id="hd_h1">현대커머셜</h1>
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
					<li><a href="<c:url value='/admin/limitApprovalList.do'/>">한도승인</a></li>
					<li><a href="<c:url value='/admin/companyList.do'/>" class="active">보증내역</a></li>
					<li><a href="<c:url value='/admin/memberAuthList.do'/>">권한관리</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="m2-bg"></div>
	<!-- 상단 끝 -->
    <div id="container">
        <div id="contents">
<script type="text/javascript">
  
    //ctrl + v 막기
    //$(document).keydown(function (event) {
        //if (event.ctrlKey && event.keyCode == 86) {
        //    return false;
        //}
    //});
    
    /* pagination 페이지 링크 function */
    function link_page(pageNo){
    	document.searchForm.pageIndex.value = pageNo;
		document.searchForm.action = "<c:url value='/admin/companyList.do'/>";
       	document.searchForm.submit();
    }

    function selectList() {
		document.searchForm.action = "<c:url value='/admin/companyList.do'/>";
	   	document.searchForm.submit();
	}
    
    function accessCompany(businessNo, companyName, membClass){
        $("#accessForm #buyerBizNo").val(businessNo);
        $("#accessForm #buyerCoNm").val(companyName);
        $("#accessForm #sellerBizNo").val(businessNo);
        $("#accessForm #sellerCoNm").val(companyName);
        $("#accessForm #membClass").val(membClass);
        $("#accessForm").submit();
    }
</script>
			<h2>보증내역 조회</h2>

			<form id="accessForm" class="mt20" action="<c:url value='/admin/guaranteeList.do'/>" method="post">    
			    <input id="buyerBizNo" name="buyerBizNo" type="hidden" value="">
			    <input id="buyerCoNm" name="buyerCoNm" type="hidden" value="">
			    <input id="sellerBizNo" name="sellerBizNo" type="hidden" value="">
			    <input id="sellerCoNm" name="sellerCoNm" type="hidden" value="">
			    <input id="membClass" name="membClass" type="hidden" value="">
			</form>
			
			<form:form commandName="searchVO" id="searchForm" name="searchForm" class="mt20" method="post">    
		    <input id="pageIndex" name="pageIndex" type="hidden" value="1">

			<div class="bd-head">
				<ul>
					<li>
						<input type="radio" id="membClass1" name="membClass" value="B" <c:if test='${searchVO.membClass eq "B"}'>checked</c:if>/><label for="membClass1" class="pl0"><span></span>대리점</label>
						<input type="radio" id="membClass2" name="membClass" value="S" <c:if test='${searchVO.membClass eq "S"}'>checked</c:if>/><label for="membClass2"><span></span>품목점</label>
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
					</li>
				</ul>
			</div>
			<div class="tbl-type01 basic">
				<table summary="">
					<caption>보증내역 조회 목록</caption>
					<colgroup>
						<col width="8%" />
						<col width="" />
						<col width="13%" />
						<col width="28%" />
						<col width="16%" />
						<col width="16%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">NO</th>
							<th scope="col">구분</th>
							<th scope="col">코드</th>
							<th scope="col">상호</th>
							<th scope="col">대표자명</th>
							<th scope="col">사업자번호</th>
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
							<td><a href="#" onclick="accessCompany('${result.businessNo}', '${result.companyName}', '${result.membClass}')"><c:out value="${result.companyName}"/></a></td>
							<td><c:out value="${result.ceoName}"/></td>
							<td><c:out value="${result.businessNo}"/></td>
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