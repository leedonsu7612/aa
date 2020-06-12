<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  /**
  * @Class Name : salesSlipList.jsp
  * @Description : 매출전표 List 화면
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script type="text/javascript">

    /* pagination 페이지 링크 function */
    function linkPage(pageNo){
    	document.searchForm.pageIndex.value = pageNo;
		document.searchForm.action = "<c:url value='/admin/salesSlipList.do'/>";
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
        <div id="pop_container">
            <div id="contents">

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

				<div class="tbl-type02 mt30">
					<table summary="">
						<caption>대리점 정보</caption>
                        <tr>
					<c:choose>
						<c:when test="${searchVO.membClass eq 'B'}">
							<th scope="row">대리점명</th>
                            <td>                               
                                <c:out value="${searchVO.buyerCoNm}"/>
                           	</td>
                            <th scope="row">사업자번호</th>
                            <td>
                                <c:out value="${searchVO.buyerBizNo}"/>
                            </td>
						</c:when>
						<c:when test="${searchVO.membClass eq 'S'}">
							<th scope="row">품목점명</th>
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
					</table>
				</div>
				<!-- detail tabs -->
				<div class="category">
					<!-- tab menu -->
					<ul>
						<li><a href="#NONE" id="tab01" onClick='gotoPage("<c:url value='/admin/dfrdAcntsRcvbleList.do'/>");'>매출채권</a></li>
						<li><a href="#NONE" id="tab02" onClick='gotoPage("<c:url value='/admin/extraCollectionList.do'/>");'>기타수금</a></li>
						<li><a href="#NONE" id="tab03" onClick='gotoPage("<c:url value='/admin/setOffInfoList.do'/>");'>상계수금</a></li>
						<li><a href="#NONE" id="tab04" onClick='gotoPage("<c:url value='/admin/taxbillList.do'/>");'>세금계산서</a></li>
						<li><a href="#NONE" class="active" id="tab05" onClick='gotoPage("<c:url value='/admin/salesSlipList.do'/>");'>매출전표</a></li>
					</ul>
					<!--// tab menu -->     
				</div>
				<!--// detail tabs -->
				<div class="tbl-type02 tbl-scr">
					<table summary="">
						<caption>조회 목록</caption>
						<colgroup>
							<col width="" />
							<col width="" />
							<col width="" />
							<col width="" />
							<col width="" />
							<col width="" />
							<col width="" />
							<col width="" />
							<col width="" />
							<col width="" />
							<col width="" />
						</colgroup>
						<thead>
							<!-- 테이블 헤드 -->
							<tr>
								<th scope="col">No</th>
								<th scope="col">매출일</th>
								<th scope="col">헤임즈전표번호</th>
							<c:choose>
								<c:when test="${searchVO.membClass eq 'B'}">
								<th scope="col">품목점 사업자번호</th>
								<th scope="col">품목점 상호</th>
								</c:when>
								<c:when test="${searchVO.membClass eq 'S'}">
								<th scope="col">대리점 사업자번호</th>
								<th scope="col">대리점 상호</th>
								</c:when>
							</c:choose>
								<th scope="col">전표금액</th>
								<th scope="col">세금계산서발행여부</th>
								<th scope="col">세금계산서번호</th>
								<th scope="col">매출구분</th>
								<th scope="col">헤임즈기록보증초과금액</th>
								<th scope="col">이니시스잔여보증초과금액</th>
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
				                         <td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.recordCountPerPage + status.count)}"/></td>
				                         <td><c:out value="${result.salesDate}"/></td>
				                         <td><c:out value="${result.heimsSalesSlipNo}"/></td>
									<c:choose>
										<c:when test="${searchVO.membClass eq 'B'}">
				                         <td><c:out value="${result.sellerBizNo}"/></td>
				                         <td><c:out value="${result.sellerCoNm}"/></td>
										</c:when>
										<c:when test="${searchVO.membClass eq 'S'}">
				                         <td><c:out value="${result.buyerBizNo}"/></td>
				                         <td><c:out value="${result.buyerCoNm}"/></td>
										</c:when>
									</c:choose>
				                         <td class="txt-r"><fmt:formatNumber value="${result.supplyValue }" pattern="#,###" /></td>
				                         <td><c:out value="${result.useTaxbillYn}"/></td>
				                         <td><c:out value="${result.taxbillNo}"/></td>
				                         <td><c:out value="${result.groupType}"/></td>
				                         <td class="txt-r"><fmt:formatNumber value="${result.overInput }" pattern="#,###" /></td>
				                         <td class="txt-r"><fmt:formatNumber value="${result.overOutput }" pattern="#,###" /></td>
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

            </div><!--// contents -->
        </div><!--// pop_container -->
    </div><!--// wrap -->
</body>
</html>