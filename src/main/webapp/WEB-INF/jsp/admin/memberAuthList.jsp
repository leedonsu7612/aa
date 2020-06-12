<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  /**
  * @Class Name : memberAuthList.jsp
  * @Description : 사용자 권한설정 List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2018.12.18            최초 생성
  *
  * author CDF Team
  * since 2018.12.18
  *
  */
%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>사용자 권한 조회</title>
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
	$(function() {
		$('#mc<c:out value="${searchVO.membClass}"/>').addClass('active');
		
		$(".category > ul > li > a").click(function() {
			var membClass = $(this).attr("id").substring(2,3);
			if(membClass == 'A'){
		        $("#searchForm #membClass").val("B");
				document.searchForm.action = "<c:url value='/admin/groupAuthList.do'/>";
		       	document.searchForm.submit();
			}else{
		        $("#searchForm #membClass").val(membClass);
				document.searchForm.action = "<c:url value='/admin/memberAuthList.do'/>";
		       	document.searchForm.submit();
			}
		});

		$("#alertConfirm").click(function() {
			$("#alertPopup").fadeOut("slow");
			return false;
		});

	    $("#deleteCancel").click(function() {
			$("#deleteOKPopup").fadeOut("slow");
			return false;
		});

		$("#deleteOk").click(function() {
			var arrStr = "";
			$("#user_data input[name=delChk]").each(function(key, item){
				if($(this).prop("checked")){
					arrStr += $(this).attr("id") + ",";
				}
			});
			if(arrStr.length > 0){
			   	document.searchForm.arrStr.value = arrStr;
				reload_page();
			} 
		});
	});
	// 사용자 설정 화면
	function setupPopup(userId) {
 		var qrystr = "userId=" + userId;
		$(".popup06 > .pop-bx").empty();
		$(".popup06 > .pop-bx").load("<c:url value='/admin/memberAuthEdit.do'/>", qrystr, function(responseText, textStatus, XMLHttpRequest) {
			if (textStatus == "success") {
				//부모창 불투명 처리
				//event.preventDefault();
				wrapWindowByMask($('.popup06'));

				$(".popup06").css("visibility", "visible");
				$(".popup06").fadeIn("slow");
 			} else if (textStatus == "error") {
				$("#alertPopup > .msg-txt").text("<통신 실패>" + "\n" + "CODE : " + XMLHttpRequest.status + "\n" + "ERROR : " + XMLHttpRequest.statusText);
				$("#alertPopup").fadeIn("show");
			}
		});
	}

	function reload_page(){
		document.searchForm.action = "<c:url value='/admin/memberAuthList.do'/>";
       	document.searchForm.submit();
	}
	
    /* pagination 페이지 링크 function */
    function link_page(pageNo){
	   	document.searchForm.pageIndex.value = pageNo;
		document.searchForm.action = "<c:url value='/admin/memberAuthList.do'/>";
       	document.searchForm.submit();
    }

    function deleteUsers(){
 		$("#deleteOKPopup").fadeIn("slow"); //저장 하시겠습니까?
		return false;
    }
</script>
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
					<li><a href="<c:url value='/admin/companyList.do'/>">보증내역</a></li>
					<li><a href="<c:url value='/admin/memberAuthList.do'/>" class="active">권한관리</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="m2-bg"></div>
	<!-- 상단 끝 -->
    <div id="container">
        <div id="contents">
			<h2>권한관리 조회</h2>
			<div class="contents-bx">
				<form:form commandName="searchVO" id="searchForm" name="searchForm" method="post">    
		    	<input name="pageIndex" type="hidden" value="${searchVO.pageIndex}">
		    	<input name="arrStr" type="hidden" value="">
			    <input id="membClass" name="membClass" type="hidden" value="${searchVO.membClass}">
				<div class="category">
					<ul>
						<li><a href="#LINK" id="mcB">대리점</a></li>
						<li><a href="#LINK" id="mcS">품목점</a></li>
						<li><a href="#LINK" id="mcM">모비스</a></li>
						<li><a href="#LINK" id="mcH">HCI</a></li>
					</ul>
					<ul>
						<li><a href="#LINK" id="mcA">권한설정</a></li>
					</ul>
				</div>
				<div class="tbl-type01 basic mt30">
					<table summary="">
						<caption>대리점 목록</caption>
						<colgroup>
							<col width="9%" />
							<col width="7%" />
							<col width="23%" />
							<col width="21%" />
							<col width="13%" />
							<col width="" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">NO</th>
								<th scope="col">ID</th>
								<th scope="col">이름</th>
								<th scope="col">정지여부</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody id="user_data">
					 		<c:if test="${fn:length(resultList) == 0}">
							<!-- 데이터가 없으면 -->
							<tr>
								<td colspan="6">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
							</tr>
							</c:if>
							<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td><input type="checkbox" id="${result.userSeqNo}" name="delChk"/><label for="${result.userSeqNo}" class="mr0"><span class="mr0"></span></label></td>
                        		<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.recordCountPerPage + status.count)}"/></td>
								<td><c:out value="${result.userId}"/></td>
								<td><a href="#LINK" onClick="javascript:setupPopup('${result.userId}');"><c:out value="${result.companyName}"/></a></td>
								<td><c:out value="${result.isDelete}"/></td>
								<td><c:out value="${result.regDate}"/></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			  	<div class="paging">
			  		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="link_page" />
			  	</div>
				<div class="btn-set">
					<a href="#" class="cancel" onClick="javascript:deleteUsers();">삭제</a>
				</div>
				</form:form>
			</div>
        </div><!--// contents -->
    </div><!--// container -->
	<!-- footer -->
	<c:import url="../inc/logedfooter.jsp" />
	<!--// footer -->    
</div><!--// wrap -->
<div id="popup" class="popup06" style="display:none;">
	<div class="pop_draggable"><strong>사용자 설정</strong></div>
	<div class="pop-bx"></div>
	<a href="#NONE" class="btn-close" onClick="javascript:closeMaskedPopup($('.popup06'));">닫기</a>
</div>
<div id="alertPopup" class="acc2-pop">
	<div class="msg-txt">
		경고박스입니다.
	</div>
	<div class="btn-set2">
		<a href="#NONE" id="alertConfirm">확인</a>
	</div>
</div>
<div id="deleteOKPopup" class="acc2-pop">
	<div class="msg-txt">
		선택한 상점을 삭제 하시겠습니까?
	</div>
	<div class="btn-set2">
		<a href="#NONE" id="deleteOk">확인</a>
		<a href="#NONE" class="cancel" id="deleteCancel">취소</a>
	</div>
</div>
</body>
</html>