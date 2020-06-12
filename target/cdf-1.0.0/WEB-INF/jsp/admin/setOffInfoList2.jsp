<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  /**
  * @Class Name : setOffInfoList.jsp
  * @Description : 상계수금 List 화면
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>보증 내역 조회</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/popup.css'/>">
<!--[if lte IE 7]>
<script type="text/javascript" src="/js/json2.js" ></script>
<![endif]-->
<script type="text/javascript" src="<c:url value='/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.easing.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.bxslider.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/select.js'/>"></script>
<script type="text/javascript">

    /* pagination 페이지 링크 function */
    function linkPage(pageNo){
    	document.searchForm.pageIndex.value = pageNo;
		document.searchForm.action = "<c:url value='/admin/setOffInfoList.do'/>";
       	document.searchForm.submit();
    }

	function gotoPage(url){
		document.accessForm.action = url;
       	document.accessForm.submit();
	}
    
</script>
</head>
<body class="main">
    <div id="wrap">
        <div id="container">
            <div id="contents">

<!-- 검색조건 -->
<!-- title -->
<h2 class="hidden">
    상계수금 조회
</h2>
<form name="accessForm" class="mt20" action="" method="post">    
    <input id="buyerBizNo" name="buyerBizNo" type="hidden" value="${searchVO.buyerBizNo}">
    <input id="buyerCoNm" name="buyerCoNm" type="hidden" value="${searchVO.buyerCoNm}">
    <input id="sellerBizNo" name="sellerBizNo" type="hidden" value="${searchVO.sellerBizNo}">
    <input id="sellerCoNm" name="sellerCoNm" type="hidden" value="${searchVO.sellerCoNm}">
    <input id="membClass" name="membClass" type="hidden" value="${searchVO.membClass}">
</form>


<form:form commandName="searchVO" id="searchForm" name="searchForm" class="mt20" method="post">    
    <input id="buyerBizNo" name="buyerBizNo" type="hidden" value="${searchVO.buyerBizNo}">
    <input id="buyerCoNm" name="buyerCoNm" type="hidden" value="${searchVO.buyerCoNm}">
    <input id="sellerBizNo" name="sellerBizNo" type="hidden" value="${searchVO.sellerBizNo}">
    <input id="sellerCoNm" name="sellerCoNm" type="hidden" value="${searchVO.sellerCoNm}">
    <input id="membClass" name="membClass" type="hidden" value="${searchVO.membClass}">
    <input id="pageIndex" name="pageIndex" type="hidden" value="1">

    <fieldset>
        <table class="tbl_search" summary="">
            <caption>대리점</caption>
            <colgroup>
                <col width="20%">
                <col width="30%">
                <col width="20%">
                <col width="30%">
            </colgroup>
            <tbody>
                       <!-- 13번째 searchForm -->
                        <tr>
					<c:choose>
						<c:when test="${searchVO.membClass eq 'B'}">
							<th scope="row">대리점 상호</th>
                            <td>                               
                                <c:out value="${searchVO.buyerCoNm}"/>
                           	</td>
                            <th scope="row">사업자번호</th>
                            <td>
                                <c:out value="${searchVO.buyerBizNo}"/>
                            </td>
						</c:when>
						<c:when test="${searchVO.membClass eq 'S'}">
							<th scope="row">품목점 상호</th>
                            <td>                               
                                <c:out value="${searchVO.sellerCoNm}"/>
                           	</td>
                            <th scope="row">사업자번호</th>
                            <td>
                                <c:out value="${searchVO.sellerBizNo}"/>
                            </td>
						</c:when>
					</c:choose>
                        </tr>
                
            </tbody>
        </table>
    </fieldset>
	<br>
	
	<!-- detail tabs -->
	<div class="tab-contents">
		<!-- tab menu -->
		<ul>
			<li><a href="#NONE" id="tab01" onClick='gotoPage("<c:url value='/admin/dfrdAcntsRcvbleList.do'/>");'>매출채권</a></li>
			<li><a href="#NONE" id="tab02" onClick='gotoPage("<c:url value='/admin/extraCollectionList.do'/>");'>기타수금</a></li>
			<li class="active"><a href="#NONE" id="tab03" onClick='gotoPage("<c:url value='/admin/setOffInfoList.do'/>");'>상계수금</a></li>
			<li><a href="#NONE" id="tab04" onClick='gotoPage("<c:url value='/admin/taxbillList.do'/>");'>세금계산서</a></li>
			<li><a href="#NONE" id="tab05" onClick='gotoPage("<c:url value='/admin/salesSlipList.do'/>");'>매출전표</a></li>
		</ul>
		<!--// tab menu -->     
	</div>
	<!--// detail tabs -->

	<!-- 상계수금 조회 -->
	<h3 class="hidden">상계수금 조회</h3>
    <table class="tbl_view2 mb10 mt15" summary="상계수금 검색내역입니다.">
        <caption>상계수금 조회</caption>
		<thead>
			<!-- 테이블 헤드 -->
			<tr>
				<th class="tbl_center" scope="col">No</th>
				<th class="tbl_center" scope="col">상계수금번호</th>
			<c:choose>
				<c:when test="${searchVO.membClass eq 'B'}">
				<th class="tbl_center" scope="col">대리점<br/>사업자번호</th>
				<th class="tbl_center" scope="col">품목점<br/>사업자번호</th>
				<th class="tbl_center" scope="col">품목점상호</th>
				</c:when>
				<c:when test="${searchVO.membClass eq 'S'}">
				<th class="tbl_center" scope="col">품목점<br/>사업자번호</th>
				<th class="tbl_center" scope="col">대리점<br/>사업자번호</th>
				<th class="tbl_center" scope="col">대리점상호</th>
				</c:when>
			</c:choose>
				<th class="tbl_center" scope="col">발행일</th>
				<th class="tbl_center" scope="col">매출월</th>
				<th class="tbl_center" scope="col">발행금액</th>
				<th class="tbl_center" scope="col">만기일</th>
				<th class="tbl_center" scope="col">결제일</th>
				<th class="tbl_center" scope="col">상태</th>
			</tr>
		</thead>
        
        <tbody>
		 		<c:if test="${fn:length(resultList) == 0}">
					<!-- 데이터가 없으면 -->
					<tr>
						<td colspan="11" class="text_center">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
					</tr>
				</c:if>
     			<c:forEach var="result" items="${resultList}" varStatus="status">
                     <tr>
                         <td class="text_center"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
                         <td class="text_center"><c:out value="${result.transactionNo}"/></td>
					<c:choose>
						<c:when test="${searchVO.membClass eq 'B'}">
                         <td class="text_center"><c:out value="${result.buyerBizNo}"/></td>
                         <td class="text_center"><c:out value="${result.sellerBizNo}"/></td>
                         <td class="text_center"><c:out value="${result.sellerCoNm}"/></td>
						</c:when>
						<c:when test="${searchVO.membClass eq 'S'}">
                         <td class="text_center"><c:out value="${result.sellerBizNo}"/></td>
                         <td class="text_center"><c:out value="${result.buyerBizNo}"/></td>
                         <td class="text_center"><c:out value="${result.buyerCoNm}"/></td>
						</c:when>
					</c:choose>
                          <td class="text_center"><c:out value="${result.issueDate}"/></td>
                          <td class="text_center"><c:out value="${result.salesDate}"/></td>
                         <td class="text_center"><fmt:formatNumber value="${result.amount }" pattern="#,###" /></td>
                         <td class="text_center"><c:out value="${result.expirationDate}"/></td>
                         <td class="text_center"><c:out value="${result.paymentDate}"/></td>
                         <td class="text_center"><c:out value="${result.progressFlag}"/></td>
                     </tr>
                 </c:forEach>
         </tbody>
    </table>
  	<!-- /List -->
  	<div class="paging">
  		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
  		<%-- <form:hidden path="pageIndex" /> --%>
  	</div>
</form:form>

<!--// container -->

            </div>
        </div>
    </div>
</body>
</html>