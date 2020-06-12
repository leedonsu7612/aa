<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
<script type="text/javascript">
  
    //ctrl + v 막기
    //$(document).keydown(function (event) {
        //if (event.ctrlKey && event.keyCode == 86) {
        //    return false;
        //}
    //});
    
    /* pagination 페이지 링크 function */
    function fn_egov_link_page(pageNo){
    	document.searchForm.pageIndex.value = pageNo;
		document.searchForm.action = "<c:url value='/admin/companyList.do'/>";
       	document.searchForm.submit();
    }

    function fn_egov_selectList() {
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

<!-- 검색조건 -->
<!-- title -->
<h2 class="hidden">
    보증내역 조회
</h2>

<form id="accessForm" class="mt20" action="<c:url value='/admin/guaranteeList.do'/>" method="post">    
    <input id="buyerBizNo" name="buyerBizNo" type="hidden" value="">
    <input id="buyerCoNm" name="buyerCoNm" type="hidden" value="">
    <input id="sellerBizNo" name="sellerBizNo" type="hidden" value="">
    <input id="sellerCoNm" name="sellerCoNm" type="hidden" value="">
    <input id="membClass" name="membClass" type="hidden" value="">
</form>




<!-- EXCEL URL -->

<input type="hidden" id="excelUrl" value="">

<form:form commandName="searchVO" id="searchForm" name="searchForm" class="mt20" method="post">    
    <input id="pageIndex" name="pageIndex" type="hidden" value="1">

    <fieldset>
        <legend>검색폼</legend>
        <table class="tbl_search" summary="">
            <caption>조회</caption>
            <colgroup>
                <col width="130">
                <col width="*">
            </colgroup>
            <tbody>
                       <!-- 13번째 searchForm -->
                        <tr>
                            <th scope="row">검색조건</th>
                            <td>
                                <select id="membClass" name="membClass" style="width: 100px; position: absolute; left: -100000px; height: auto;" class="mr15">
                                    <option value="A" <c:if test="${searchVO.membClass == 'A'}">selected="selected"</c:if>>전체</option>
                                    <option value="B" <c:if test="${searchVO.membClass == 'B'}">selected="selected"</c:if>>대리점</option>
                                    <option value="S" <c:if test="${searchVO.membClass == 'S'}">selected="selected"</c:if>>품목점</option>
                                </select>
                                <select id="searchCondition" name="searchCondition" style="width: 140px; position: absolute; left: -100000px; height: auto;" class="mr15">
                                    <option value="0" <c:if test="${searchVO.searchCondition == '0'}">selected="selected"</c:if>>사업자번호</option>
                                    <option value="1" <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>상점명</option>
                                    <option value="2" <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>>대표자명</option>
                                </select>  
                                
                                <input id="searchKeyword" name="searchKeyword" style="font-size:13pt;" class="input ac mr5" type="text" value='<c:out value="${searchVO.searchKeyword}"/>' maxlength="50">
                                
                                <span class="btn btn_normal ml10">
                                    <a href="#" style="width: 80px;" onClick="javascript:fn_egov_selectList();">조회하기</a> 
                                </span>
                           	</td>
                            <td>
                                
                            </td>
                        </tr>
                
            </tbody>
        </table>
    </fieldset>
	<br>
	
	<!-- 사업자 목록 조회 -->
	<h3 class="hidden">보증내역 조회</h3>
    <table class="tbl_view2 mb10 membinfo" summary="보증내역 검색내역입니다.">
        <caption>보증내역 조회</caption>
        <thead> <!-- 테이블 헤드 -->
            <tr>
                <th class="tbl_center" scope="col">NO</th>
                <th class="tbl_center" scope="col">구분</th>
                <th class="tbl_center" scope="col">코드</th>
                <th class="tbl_center" scope="col">상점명</th>
                <th class="tbl_center" scope="col">대표자명</th>
                <th class="tbl_center" scope="col">사업자번호</th>
            </tr>
        </thead>
        
        <tbody>
     			<c:forEach var="result" items="${resultList}" varStatus="status">
                     <tr>
                         <td class="text_center"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
                         <td class="text_center">
                         <c:choose>
							<c:when test="${result.membClass eq 'A'}">관리자</c:when>
							<c:when test="${result.membClass eq 'B'}">대리점</c:when>
							<c:when test="${result.membClass eq 'S'}">품목점</c:when>
						 </c:choose>
						 </td>
                         <td class="text_center"><c:out value="${result.membNo}"/></td>
                         <td class="text_center" onclick="accessCompany('${result.businessNo}', '${result.companyName}', '${result.membClass}')">
                             <a href="#"><c:out value="${result.companyName}"/></a>
                         </td>
                         <td class="text_center"><c:out value="${result.ceoName}"/></td>
                         <td class="text_center"><c:out value="${result.businessNo}"/></td>
                     </tr>
                 </c:forEach>
         </tbody>
    </table>
  	<!-- /List -->
  	<div class="paging">
  		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
  		<%-- <form:hidden path="pageIndex" /> --%>
  	</div>
</form:form>

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
</body>
</html>