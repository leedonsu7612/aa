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
</head>
<body class="main">
<div id="mask" style="width: 1485px; height: 514px;"></div>
<!-- header -->
<div id="header">
	<div class="header">        
		<h1>
			<a href="<c:url value='/logout.do'/>">
				<img src="<c:url value='/images/common/h1_logo.jpg'/>" alt="모비스 팩토링 관리자"> 
			</a>
		</h1>
		<!-- global menu -->
		<ul class="global_menu">
			<li><a href="<c:url value='/admin/checkMemberList.do'/>">품목/대리점 조회</a></li>
			<li><a href="<c:url value='/admin/abnormalDaily.do'/>">일자별 이상거래</a></li>
			<li><a href="<c:url value='/admin/abnormalHeeledSales.do'/>">매출분포 이상거래</a></li>
			<li><a href="<c:url value='/admin/limitInfoList.do'/>">대리점 한도조회</a></li>
			<li><a href="<c:url value='/admin/limitApprovalList.do'/>">한도승인</a></li>
			<li class="on"><a href="<c:url value='/admin/companyList.do'/>">보증내역</a></li>
		</ul>
		<!--// global menu -->     
		<!--// service_menu -->
	</div>
</div>
<!--// header -->
    <div id="wrap">
        <div id="container">
            <div id="contents">
<script type="text/javascript">

    //EXCEL EXPORT
    function excelExport( dataLength ){
/*         if ( dataLength <= 0 ){
            $("#notExeportPopup").css("visibility", "visible");
            $("#notExeportPopup").fadeIn("show");
            return false;
        }    
        
        var url = $("#excelUrl").val();
        var origin_url = $("#searchForm").attr( "action" );
        var form = $("#searchForm").toArray()[0];
        
        form.action = url;
        form.method = "post";
        form.submit();
        
        form.action = origin_url; */
        
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
	    $('#pop_container iframe').attr('src', "<c:url value='/admin/dfrdAcntsRcvbleList.do'/>?" + qrystr);
	    wrapWindowByMask($('#detailPopup'));
	    $('#detailPopup').show();
	}

	function closePopup(){
	    $('#mask').hide();
		$('#detailPopup').hide();
	}
</script>

<!-- 검색조건 -->
<!-- title -->
<h2 class="hidden">
    보증내역 조회
</h2>

<form id="accessForm" class="mt20">    
    <input id="buyerBizNo" name="buyerBizNo" type="hidden" value="${searchVO.buyerBizNo}">
    <input id="buyerCoNm" name="buyerCoNm" type="hidden" value="${searchVO.buyerCoNm}">
    <input id="sellerBizNo" name="sellerBizNo" type="hidden" value="${searchVO.sellerBizNo}">
    <input id="sellerCoNm" name="sellerCoNm" type="hidden" value="${searchVO.sellerCoNm}">
    <input id="membClass" name="membClass" type="hidden" value="${searchVO.membClass}">
</form>




<!-- EXCEL URL -->

<input type="hidden" id="excelUrl" value="">

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
                <col width="15%">
                <col width="35%">
                <col width="15%">
                <col width="35%">
            </colgroup>
            <tbody>
                       <!-- 13번째 searchForm -->
                        <tr>
					<c:choose>
						<c:when test="${searchVO.membClass eq 'B'}">
							<th scope="row">대리점 상호</th>
                            <td>                               
                                <c:out value="${searchVO.buyerCoNm}"/>
                                <span class="btn btn_normal ml10">
                                    <a href="#" style="width: 80px;" onClick="javascript:detailView()">상세보기</a> 
                                </span>
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
                                <span class="btn btn_normal ml10">
                                    <a href="#" style="width: 80px;" onClick="javascript:detailView();">상세보기</a> 
                                </span>
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
	
	<!-- 사업자 목록 조회 -->
	<h3 class="hidden">보증내역 조회</h3>
    <table class="tbl_view2 mb10 mt15" summary="보증내역 검색내역입니다.">
        <caption>보증내역 조회</caption>
		<thead>
			<!-- 테이블 헤드 -->
			<tr>
				<th class="tbl_center" scope="col" rowspan="3">No</th>
			<c:choose>
				<c:when test="${searchVO.membClass eq 'B'}">
				<th class="tbl_center" scope="col" rowspan="3">품목점<br/>사업자번호</th>
				<th class="tbl_center" scope="col" rowspan="3">품목점상호</th>
				</c:when>
				<c:when test="${searchVO.membClass eq 'S'}">
				<th class="tbl_center" scope="col" rowspan="3">대리점<br/>사업자번호</th>
				<th class="tbl_center" scope="col" rowspan="3">대리점상호</th>
				</c:when>
			</c:choose>
				<th class="tbl_center" scope="col" rowspan="3">거래금액</th>
				<th class="tbl_center" scope="col" rowspan="3">발행금액</th>
				<th class="tbl_center" scope="col" rowspan="3">매출채권<br/>발행금액</th>
				<th class="tbl_center" scope="col" rowspan="3">매출채권<br/>결제금액</th>
				<th class="tbl_center" scope="col" rowspan="3">기타수금<br/>승인</th>
				<th class="tbl_center" scope="col" rowspan="3">기타수금<br/>요청</th>
				<th class="tbl_center" scope="col" rowspan="3">상계수금<br/>승인</th>
				<th class="tbl_center" scope="col" rowspan="3">상계수금<br/>요청</th>
				<th class="tbl_center" scope="col" rowspan="3">초과금액</th>
				<th class="tbl_center" scope="col" colspan="3">모든 매출금액</th>
			</tr>
			<tr>
				<th class="tbl_center" scope="col" colspan="2">보증금액</th>
				<th class="tbl_center" scope="col">미보증금액</th>
			</tr>
			<tr>
				<th class="tbl_center" scope="col">(확정)미<br/>결제금액</th>
				<th class="tbl_center" scope="col">채권미<br/>발행금액</th>
				<th class="tbl_center" scope="col">초과금액</th>
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
                         <td class="text_center"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
					<c:choose>
						<c:when test="${searchVO.membClass eq 'B'}">
                         <td class="text_center"><c:out value="${result.sellerBizNo}"/></td>
                         <td class="text_center"><c:out value="${result.sellerCoNm}"/></td>
						</c:when>
						<c:when test="${searchVO.membClass eq 'S'}">
                         <td class="text_center"><c:out value="${result.buyerBizNo}"/></td>
                         <td class="text_center"><c:out value="${result.buyerCoNm}"/></td>
						</c:when>
					</c:choose>
                         <td class="text_center"><fmt:formatNumber value="${result.totalSalesAmount }" pattern="#,###" /></td>
                         <td class="text_center"><fmt:formatNumber value="${result.totalTaxAmount }" pattern="#,###" /></td>
                         <td class="text_center"><fmt:formatNumber value="${result.totalReceivableAmount }" pattern="#,###" /></td>
                         <td class="text_center"><fmt:formatNumber value="${result.totalCollectAmount }" pattern="#,###" /></td>
                         <td class="text_center"><fmt:formatNumber value="${result.totalExtraAmountOk }" pattern="#,###" /></td>
                         <td class="text_center"><fmt:formatNumber value="${result.totalExtraAmount }" pattern="#,###" /></td>
                         <td class="text_center"><fmt:formatNumber value="${result.totalSetoffOk }" pattern="#,###" /></td>
                         <td class="text_center"><fmt:formatNumber value="${result.totalSetoff }" pattern="#,###" /></td>
                         <td class="text_center"><fmt:formatNumber value="${result.totalOverAmount }" pattern="#,###" /></td>
                         <td class="text_center"><fmt:formatNumber value="${result.unpayAmount }" pattern="#,###" /></td>
                         <td class="text_center"><fmt:formatNumber value="${result.unissuedAmount }" pattern="#,###" /></td>
                         <td class="text_center"><fmt:formatNumber value="${result.totalOverAmount }" pattern="#,###" /></td>
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
<!-- 엑셀 출력 -->
<p class="ar">
    <span class="btn btn_normal2 mb10"><a href="#NONE" onclick="excelExport( 0 )" style="width: 100px;">엑셀</a> </span>
</p>

<!-- 상세 페이지 URL -->

<input id="detailUrl" type="hidden" value="">

<!--// container -->
<br><br>


            </div>
        </div>
    </div>
    



	<!-- footer -->
<c:import url="../inc/logedfooter.jsp" />
	<!--// footer -->    
	
	<div class="selectbox_option mr15" style="position:absolute;width:98px;display:none;z-index:10">
		<div class="scroll"></div>
	</div>
	<div class="selectbox_option mr15" style="position:absolute;width:138px;display:none;z-index:10">
		<div class="scroll"></div>
	</div>
	<div class="selectbox_option" style="position:absolute;width:148px;display:none;z-index:10">
		<div class="scroll"></div>
	</div>
	<div id="detailPopup" class="pop_wrap layer_popup abc" style="display:none;">
		<div class="btn closeButton mr10 mb5 mt5">
			<a href="#NONE" onClick="javascript:closePopup();">×</a>
		</div>
		<!-- 팝업 사이즈 : 915px * 905px -->
		<div id="officesSearch">
			<!-- HEADER -->
			<h1 class="ptxt pop_draggable">보증내역 상세</h1>
			<!-- //HEADER -->
			<!-- CONTAINER -->
			<div id="pop_container">
				<iframe src="" width="100%" height="700" style="border:none"></iframe>
			</div>
			<!-- //CONTAINER -->
		</div>
	</div>
</body>
</html>