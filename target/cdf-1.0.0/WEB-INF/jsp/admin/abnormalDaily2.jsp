<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  /**
  * @Class Name : abnormalDaily.jsp
  * @Description : 일자별 이상거래 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2018.11.19            최초 생성
  *
  * author CDF Team
  * since 2018.11.19
  *
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>일단위 이상거래</title>
<!-- 2015.03.30 pew -->
<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/popup.css'/>">
<!--[if lte IE 7]>
<script type="text/javascript" src="<c:url value='/js/json2.js'/>" ></script>
<![endif]-->
<script type="text/javascript" src="<c:url value='/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.easing.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.bxslider.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/select.js'/>"></script>
</head>
<body class="main" style="">
<div id="mask"></div>
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
			<li class="on"><a href="<c:url value='/admin/abnormalDaily.do'/>">일자별 이상거래</a></li>
			<li><a href="<c:url value='/admin/abnormalHeeledSales.do'/>">매출분포 이상거래</a></li>
			<li><a href="<c:url value='/admin/limitInfoList.do'/>">대리점 한도조회</a></li>
			<li><a href="<c:url value='/admin/limitApprovalList.do'/>">한도승인</a></li>
			<li><a href="<c:url value='/admin/companyList.do'/>">보증내역</a></li>
		</ul>
		
		<!--// global menu -->     
		<!--// service_menu -->
	</div>
</div>
<!--// header -->

    
    <div id="wrap">
        <div id="container">
            <div id="contents">
<!-- 사업자 목록 조회 -->
<h3 class="hidden">일자별 이상거래</h3>



<form id="searchForm" class="mt20" action="<c:url value='/admin/abnormalDaily.do'/>" method="post">    
    <input id="regDate" name="regDate" type="hidden" value=""/>
    <fieldset>
        <legend>검색폼</legend>
        <table class="tbl_search" summary="">
            <caption>조회</caption>
            <colgroup>
                <col width="130">
                <col width="*">
            </colgroup>
            <tbody>
                    <tr>
                        <th scope="row">검색조건</th>
                        <td>
                            <p>
                                <label for="baseDate" class="hidden">조회 시작날짜 선택</label>
                                <input id="baseDate" name="baseDate" style="width: 95px;" class="input ac mr5 EnterKeyDown" type="text" value="<c:out value="${yesterday}"/>"/>
                                 
                                <span class="btn btn_normal" style="margin-left: 20px;"> 
                                    <a id="searchButton" href="#" style="width: 80px;">조회하기</a> 
                                </span>
                            </p>
                        </td>
                        <td><p><span class="btn btn_normal"><a href="#NONE" id="excelExport" style="width: 100px;">엑셀</a></span></p></td>
                    </tr>
            </tbody>
        </table>
    </fieldset>
</form>
<script type="text/javascript">
$(function() {
	$("#baseDate").datepicker({
	    prevText : '이전 달',
	    nextText : '다음 달',
	    monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
	    monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
	    dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
	    dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
	    dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
	    dateFormat : 'yy.mm.dd',
	    showMonthAfterYear : true,
	    showOn: "both",
	    buttonImage: "<c:url value='/images/ico/ico_calendar.gif'/>",
	    maxDate : 0,
	    yearSuffix : '년'
	});
	$('#searchButton').click( function() {
		var regDate = $("#baseDate").val();
        $("#regDate").val( regDate.replace(/\./g, '') );
		$('#searchForm').submit();
	});
	
	$('#excelExport').click( function() {
/* 		var dataLength = 0;
		

        if ( dataLength <= 0 ){
            $("#notExeportPopup").css("visibility", "visible");
            $("#notExeportPopup").fadeIn("show");
            return false;
        }
 */        
		var regDate = $("#baseDate").val();
		$("#regDate").val( regDate.replace(/\./g, '') );

 		var form = $('#searchForm').clone().hide();
        
        form.attr( 'action', "<c:url value='/downloads/abnormalDaily.do'/>" );
        
		$('body').append(form);
		
		form.submit().remove();
		
	});
	
	/* function excelExport( dataLength ){
		
        var url = $("#excelUrl").val();
        var origin_url = $("#searchForm").attr( "action" );
        var form = $("#searchForm").toArray()[0];
        
        form.action = url;
        form.method = "post";
        form.submit();
        
        form.action = origin_url;
    } */
});
</script>
<br>


<table class="tbl_view2 mb10" summary="일자별 이상거래 검색내역입니다.">
	<caption>일자별 이상거래</caption>
	<thead>
		<!-- 테이블 헤드 -->
		<tr>
			<th class="tbl_center" scope="col">기준월</th>
			<th class="tbl_center" scope="col">상호</th>
			<th class="tbl_center" scope="col">사업자번호</th>
			<th class="tbl_center" scope="col">코드</th>
			<th class="tbl_center" scope="col">부여한도</th>
			<th class="tbl_center" scope="col">잔여한도</th>
			<th class="tbl_center" scope="col">초과한도</th>
			<th class="tbl_center" scope="col">이상거래내역</th>
		</tr>
	</thead>

	<tbody>
	 		<c:if test="${fn:length(resultList) == 0}">
				<!-- 데이터가 없으면 -->
				<tr>
					<td colspan="8" class="text_center">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
				</tr>
			</c:if>
								
			<c:forEach var="result" items="${resultList}" varStatus="status">
			    <tr>
			        <td class="text_center"><c:out value="${result.regDate}"/></td>
			        <td class="text_center"><c:out value="${result.companyName}"/></td>
			        <td class="text_center"><c:out value="${result.businessNo}"/></td>
			        <td class="text_center"><c:out value="${result.membNo}"/></td>
			        <td class="text_center"><fmt:formatNumber value="${result.salesLimit }" pattern="#,###" /></td>
			        <td class="text_center"><fmt:formatNumber value="${result.remainingLimit }" pattern="#,###" /></td>
			        <td class="text_center"><fmt:formatNumber value="${result.overLimit }" pattern="#,###" /></td>
			        <td class="text_center"><fmt:formatNumber value="${result.tradeAmt }" pattern="#,###" />
			        (-<fmt:formatNumber value="${result.abnormalAmt }" pattern="#,###" />)</td>
			    </tr>
			</c:forEach>
		
	</tbody>
</table>
<!-- 엑셀 출력 -->
<p class="ar">
	
</p>










            </div>
        </div>
    </div>
<!-- footer -->
<c:import url="../inc/logedfooter.jsp" />
<!--// footer -->    
</body><!-- -12312321 -->
</html>
