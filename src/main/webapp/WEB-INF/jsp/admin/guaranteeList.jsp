<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  /**
  * @Class Name : guaranteeList.jsp
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
	<div id="mask" style="width: 100%; height: 100%;"></div>
	<!-- 상단 시작 -->
	<div id="hd">
		<h1 id="hd_h1">현대커머셜</h1>
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

    //EXCEL EXPORT
    function excelExport( dataLength ){
		var form = $('#searchForm').clone().hide();
		form.attr( 'action', "<c:url value='/downloads/guaranteeList.do'/>" );
		$('body').append(form);
		form.submit().remove();
    }

    /* pagination 페이지 링크 function */
    function linkPage(pageNo){
    	document.searchForm.pageIndex.value = pageNo;
		document.searchForm.action = "<c:url value='/admin/guaranteeList.do'/>";
       	document.searchForm.submit();
    }

	//상세보기 팝업
	function detailView() {
		var qrystr = $('#accessForm').serialize();
	    wrapWindowByMask($('.popup05'));
	    $('.popup05 > .pop-bx > iframe').attr('src', "<c:url value='/admin/dfrdAcntsRcvbleList.do'/>?" + qrystr);
	    $('.popup05').show();
	}

	function closePopup(){
	    $('#mask').hide();
		$('.popup05').hide();
	}

	function forceUnissued(regDate, businessNo, companyName){
        $("#accessForm #salesDate").val(regDate.substring(0, 6));
	<c:choose>
		<c:when test="${searchVO.membClass eq 'B'}">
        $("#accessForm #sellerBizNo").val(businessNo);
        $("#accessForm #sellerCoNm").val(companyName);
		</c:when>
		<c:when test="${searchVO.membClass eq 'S'}">
        $("#accessForm #buyerBizNo").val(businessNo);
        $("#accessForm #buyerCoNm").val(companyName);
		</c:when>
	</c:choose>
		document.accessForm.action = "<c:url value='/admin/forceUnissuedList.do'/>";
       	document.accessForm.submit();
	}
</script>

			<h2>보증내역</h2>

			<form id="accessForm" name="accessForm">    
			    <input id="salesDate" name="salesDate" type="hidden" value="">
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

			<div class="tbl-type03">
				<table summary="">
					<caption>대리점 정보</caption>
					<colgroup>
						<col width="210" />
						<col width="" />
						<col width="210" />
						<col width="" />
					</colgroup>
					<tbody>
						<tr>
						<c:choose>
							<c:when test="${searchVO.membClass eq 'B'}">
							<th scope="row">대리점 상호</th>
							<td><c:out value="${searchVO.buyerCoNm}"/><a href="#LINK" class="btn-view" onClick="javascript:detailView()">상세보기</a></td>
							<th scope="row">사업자 번호</th>
							<td><c:out value="${searchVO.buyerBizNo}"/></td>
							</c:when>
							<c:when test="${searchVO.membClass eq 'S'}">
							<th scope="row">품목점 상호</th>
							<td><c:out value="${searchVO.sellerCoNm}"/><a href="#LINK" class="btn-view" onClick="javascript:detailView()">상세보기</a></td>
							<th scope="row">사업자 번호</th>
							<td><c:out value="${searchVO.sellerBizNo}"/></td>
							</c:when>
						</c:choose>
						</tr>
					</tbody>
				</table>
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
			<div class="tbl-type01 tbl-type06">
				<table summary="">
					<caption>보증내역 목록</caption>
					<colgroup>
						<col width="3%" />
						<col width="" />
						<col width="10%" />
						<col width="5%" />
						<col width="5%" />
						<col width="5%" />
						<col width="5%" />
						<col width="8%" />
						<col width="5%" />
						<col width="5%" />
						<col width="5%" />
						<col width="5%" />
						<col width="9%" />
						<col width="9%" />
						<col width="7%" />
					</colgroup>
					<thead>
						<tr>
							<th rowspan="3" scope="col">NO</th>
						<c:choose>
							<c:when test="${searchVO.membClass eq 'B'}">
							<th rowspan="3" scope="col">품목점 사업자번호</th>
							<th rowspan="3" scope="col">품목점 상호</th>
							</c:when>
							<c:when test="${searchVO.membClass eq 'S'}">
							<th rowspan="3" scope="col">대리점 사업자번호</th>
							<th rowspan="3" scope="col">대리점 상호</th>
							</c:when>
						</c:choose>
							<th rowspan="3" scope="col">거래금액</th>
							<th rowspan="3" scope="col">발행금액</th>
							<th rowspan="3" scope="col">매출채권<br />발행금액</th>
							<th rowspan="3" scope="col">매출채권<br />결제금액</th>
							<th rowspan="3" scope="col">기타수금승인</th>
							<th rowspan="3" scope="col">기타<br />수금요청</th>
							<th rowspan="3" scope="col">상계<br />수금승인</th>
							<th rowspan="3" scope="col">상계<br />수금요청</th>
							<th rowspan="3" scope="col">초과금액</th>
							<th colspan="3" scope="col" class="tbl-bg-y">모든 매출금액</th>
						</tr>
						<tr>
						  <th colspan="2" scope="col" class="tbl-bg-y">보증금액</th>
						  <th scope="col" class="tbl-bg-y">미보증금액</th>
				      </tr>
						<tr>
						  <th scope="col" class="tbl-bg-y">(확정)미결재금액</th>
						  <th scope="col" class="tbl-bg-y">채권미발행금액</th>
						  <th scope="col" class="tbl-bg-y">초과금액</th>
				      </tr>
					</thead>
					<tbody>
			 		<c:if test="${fn:length(resultList) == 0}">
						<!-- 데이터가 없으면 -->
						<tr>
							<td colspan="15" class="text_center">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
						</tr>
					</c:if>
	     			<c:forEach var="result" items="${resultList}" varStatus="status">
 						<tr>
							<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.recordCountPerPage + status.count)}"/></td>
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
							<td class="txt-r"><fmt:formatNumber value="${result.totalSalesAmount }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.totalTaxAmount }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.totalReceivableAmount }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.totalCollectAmount }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.totalExtraAmountOk }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.totalExtraAmount }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.totalSetoffOk }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.totalSetoff }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.totalOverAmount }" pattern="#,###" /></td>
							<td class="txt-r tbl-bg-y"><fmt:formatNumber value="${result.unpayAmount }" pattern="#,###" /></td>
							<td class="txt-r tbl-bg-y">
						<c:choose>
							<c:when test="${searchVO.membClass eq 'B'}">
							<a href="#LINK" onclick="javascript:forceUnissued('${result.regDate}', '${result.sellerBizNo}', '${result.sellerCoNm}');">
							</c:when>
							<c:when test="${searchVO.membClass eq 'S'}">
							<a href="#LINK" onclick="javascript:forceUnissued('${result.regDate}', '${result.buyerBizNo}', '${result.buyerCoNm}');">
							</c:when>
						</c:choose>
							<fmt:formatNumber value="${result.unissuedAmount }" pattern="#,###" /></a></td>
							<td class="txt-r tbl-bg-y"><fmt:formatNumber value="${result.totalOverAmount }" pattern="#,###" /></td>
						</tr>
                 	</c:forEach>
					</tbody>
				</table>
			</div>
		  	<!-- /List -->
		  	<div class="paging">
		  		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
		  		<%-- <form:hidden path="pageIndex" /> --%>
		  	</div>
		</form:form>
        </div><!--// contents -->
    </div><!--// container -->
	<!-- footer -->
	<c:import url="../inc/logedfooter.jsp" />
	<!--// footer -->    
</div><!--// wrap -->
	
<div id="popup" class="popup05" style="display:none;">
	<div class="pop_draggable"><strong>보증내역 상세</strong></div>
	<div class="pop-bx">
		<iframe src="" width="100%" height="640" style="border:none"></iframe>
	</div>
	<a href="#" class="btn-close" onClick="javascript:closePopup();">닫기</a>
</div>
</body>
</html>