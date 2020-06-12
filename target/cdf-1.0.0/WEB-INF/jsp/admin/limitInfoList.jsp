<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  /**
  * @Class Name : limitInfoList.jsp
  * @Description : 대리점 한도조회 List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2018.12.03            최초 생성
  *
  * author CDF Team
  * since 2018.12.03
  *
  */
%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>대리점 한도조회</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/base.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/layout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin/common.css'/>" />
<script src="<c:url value='/js/admin/jquery-3.3.1.min.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script src="<c:url value='/js/admin/jquery.fileupload.js'/>"></script>
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
		<h1 id="hd_h1">대리점 한도조회</h1>
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
					<li><a href="<c:url value='/admin/limitInfoList.do'/>" class="active">대리점 한도조회</a></li>
					<li><a href="<c:url value='/admin/limitApprovalList.do'/>">한도승인</a></li>
					<li><a href="<c:url value='/admin/companyList.do'/>">보증내역</a></li>
					<li><a href="<c:url value='/admin/memberAuthList.do'/>">권한관리</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="m2-bg"></div>
	<!-- 상단 끝 -->
	
<script type="text/javascript">
	$(function() {
		$("#alertConfirm").click(function() {
			$("#alertPopup").fadeOut("slow");
			return false;
		});
	});

    //EXCEL EXPORT
    function excelExport(){
		var form = $('#searchForm').clone().hide();

		form.attr( 'action', "<c:url value='/downloads/limitInfoList.do'/>" );

		$('body').append(form);

		form.submit().remove();
    }

    /* pagination 페이지 링크 function */
    function fn_link_page(pageNo){
		if($('#rcvAt1').prop('checked'))
			document.searchForm.rcvAt.value = '1';
		else document.searchForm.rcvAt.value = '0';
	   	document.searchForm.pageIndex.value = pageNo;
		document.searchForm.action = "<c:url value='/admin/limitInfoList.do'/>";
       	document.searchForm.submit();
    }

    function fn_selectList() {
		if($('#rcvAt1').prop('checked'))
			document.searchForm.rcvAt.value = '1';
		else document.searchForm.rcvAt.value = '0';
		document.searchForm.action = "<c:url value='/admin/limitInfoList.do'/>";
	   	document.searchForm.submit();
	}
    
	//상세보기 팝업
	function requestPopup(businessNo) {
		var qrystr = "businessNo=" + businessNo;
		$(".popup01 > .pop-bx").empty();
		$(".popup01 > .pop-bx").load("<c:url value='/admin/limitRequest.do'/>", qrystr, function(responseText, textStatus, XMLHttpRequest) {
			if (textStatus == "success") {
				//부모창 불투명 처리
				//event.preventDefault();
				wrapWindowByMask($('.popup01'));

//				$('.popup01').show();
				$(".popup01").css("visibility", "visible");
				$(".popup01").fadeIn("slow");
			} else if (textStatus == "error") {
				$("#alertPopup > .msg-txt").text("<통신 실패>" + "\n" + "CODE : " + XMLHttpRequest.status + "\n" + "ERROR : " + XMLHttpRequest.statusText);
				$("#alertPopup").fadeIn("show");
			}
		});
	}

	//대리점조회 팝업
	function buyerSearchPopup() {
	    $('.popup02 > .pop-bx > iframe').attr('src', "<c:url value='/admin/buyerList.do'/>");
	    $('.popup02').show();
	}

	//한도이력조회 팝업
	function limitHistoryPopup(obj) {
    	var membNo = "membNo=" + $(obj).parent().siblings("td:nth-child(3)").text();
    	var companyName = "&companyName=" + encodeURI($(obj).text());
    	var businessNo = "&businessNo=" + $(obj).parent().siblings("td:nth-child(6)").text();
    	var lastDate = "&lastDate=" + $(obj).parent().siblings("td:nth-child(15)").text();
    	var qryStr = membNo + companyName + businessNo + lastDate;
	    wrapWindowByMask($('.popup022'));
	    $('.popup022 > .pop-bx > iframe').attr('src', "<c:url value='/admin/limitHistory.do'/>?" + qryStr);
	    $('.popup022').show();
	}

	function closeIFPopup(){
		closePopup($('.popup02'));
	}
</script>

	<!-- 콘텐츠 시작  -->
	<div id="container">
		<div id="contents">
			<h2>대리점 한도조회</h2>
			<form:form commandName="searchVO" id="searchForm" name="searchForm" class="mt20" method="post">    
		    <input name="pageIndex" type="hidden" value="1">
            <input name="rcvAt" type="hidden" value="" />
			<div class="bd-head">
				<ul>
					<li>
						<div class="select-bx wx160">
							<label for="bd-type">
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
					<li><label for="bd-text" class="sound_only">검색어 입력</label>
						<input type="text" id="searchKeyword" name="searchKeyword" value='<c:out value="${searchVO.searchKeyword}"/>' maxlength="50">
					</li>
					<li><input type="checkbox" id="rcvAt1" <c:if test="${searchVO.rcvAt == '1'}">checked</c:if>/><label for="rcvAt1" class="ml10"><span></span>양수/양도 포함</label></li>
					<li><a href="#" class="btn-submit" onClick="javascript:fn_selectList();">조회하기</a></li>
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
						<a href="#NONE" class="btn-excel" onClick="javascript:excelExport();">다운로드</a>
					</li>
				</ul>
			</div>
			<div class="tbl-type01">
				<table summary="">
					<caption>대리점 한도조회 목록</caption>
					<colgroup>
						<col width="4%" />
						<col width="" />
						<col width="4%" />
						<col width="6%" />
						<col width="5%" />
						<col width="6%" />
						<col width="5%" />
						<col width="5%" />
						<col width="6%" />
						<col width="6%" />
						<col width="5%" />
						<col width="5%" />
						<col width="5%" />
						<col width="5%" />
						<col width="7%" />
						<col width="5%" />
						<col width="8%" />
						<col width="4%" />
					</colgroup>
					<thead>
						<tr>
							<th rowspan="2" scope="col">NO</th>
							<th rowspan="2" scope="col">대리점</th>
							<th rowspan="2" scope="col">코드</th>
							<th rowspan="2" scope="col">대표명</th>
							<th rowspan="2" scope="col">사업소</th>
							<th rowspan="2" scope="col">사업자번호</th>
							<th colspan="2" scope="colgroup">거래한도</th>
							<th rowspan="2" scope="col">총<br />거래한도</th>
							<th rowspan="2" scope="col">잔여한도</th>
							<th rowspan="2" scope="col">초과한도</th>
							<th rowspan="2" scope="col">보증초과</th>
							<th rowspan="2" scope="col">보증금액</th>
							<th rowspan="2" scope="col">공증금액</th>
							<th rowspan="2" scope="col">휴업/폐업</th>
							<th rowspan="2" scope="col">비고</th>
							<th rowspan="2" scope="col">진행상태</th>
							<th rowspan="2" scope="col"></th>
						</tr>
						<tr>
						  <th scope="col">모비스</th>
						  <th scope="col">HCI</th>
					  </tr>
					</thead>
					<tbody>
     					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr>
                         	<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.recordCountPerPage + status.count)}"/></td>
							<td class="subject"><a href="#" onClick="javascript:limitHistoryPopup(this);"><c:out value="${result.companyName}"/></a></td>
							<td><c:out value="${result.membNo}"/></td>
							<td><c:out value="${result.ceoName}"/></td>
							<td><c:out value="${result.bizPlace}"/></td>
							<td><c:out value="${result.businessNo}"/></td>
							<td class="txt-r"><fmt:formatNumber value="${result.mobisLimit }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.hciLimit }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.salesLimit }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.remLimit }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.overLimit }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.guaranteeOver }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.guaranteePrice }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.notarialPrice }" pattern="#,###" /></td>
							<td><c:out value="${result.closeDate}" escapeXml="false"/></td>
							<td><c:out value="${result.memo}" escapeXml="false"/></td>
							<td><c:out value="${result.process}" escapeXml="false"/></td>
							<td><c:if test="${result.processNo < 2 || result.processNo > 99}"><a href="#" class="btn-submit" onClick="javascript:requestPopup('${result.businessNo}');">확인</a></c:if></td>
						</tr>
                 		</c:forEach>
					</tbody>
				</table>
			</div>
		  	<div class="paging">
		  		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_link_page" />
		  		<%-- <form:hidden path="pageIndex" /> --%>
		  	</div>
			</form:form>
		</div>
	</div>    
	<!-- 콘텐츠 끝 -->
	<!-- 하단 시작 -->
	<c:import url="../inc/logedfooter.jsp" />
	<!-- 하단 끝 -->
</div>
<div id="popup" class="popup01" style="display:none;">
	<div class="pop_draggable"><strong>대리점 한도 요청</strong></div>
	<a href="#" class="btn-close" onClick="javascript:closeMaskedPopup($('.popup01'));">닫기</a>
	<div class="pop-bx"></div>
</div>
<div id="popup" class="popup02" style="display:none;">
	<div class="pop_draggable"><strong>대리점 조회</strong></div>
	<div class="pop-bx">
		<iframe src="" width="100%" height="640" style="border:none"></iframe>
	</div>
	<a href="#" class="btn-close" onClick="javascript:closeIFPopup();">닫기</a>
</div>
<div id="popup" class="popup022" style="display:none;">
	<div class="pop_draggable"><strong>한도이력 조회</strong></div>
	<div class="pop-bx">
		<iframe src="" width="100%" height="640" style="border:none"></iframe>
	</div>
	<a href="#" class="btn-close" onClick="javascript:closeMaskedPopup($('.popup022'));">닫기</a>
</div>
<!-- ajax 통신실패 경고창 -->
<div id="alertPopup" class="acc2-pop">
	<div class="msg-txt">
		경고박스입니다.
	</div>
	<div class="btn-set2">
		<a href="#NONE" id="alertConfirm">확인</a>
	</div>
</div>
<!-- //ajax 통신실패 경고창 -->
<!-- 로딩팝업 -->
<div id="loadingPopup" class="loading_popup abc" style="visibility: hidden">
	<dl>
		<dt>잠시만 기다려주세요...</dt>
	</dl>
</div>
<!-- //로딩팝업 -->
</body>
</html>