<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  /**
  * @Class Name : groupAuthList.jsp
  * @Description : 그룹 권한설정 List 화면
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
<title>그룹 권한 조회</title>
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
		$('#rad-mc<c:out value="${searchVO.membClass}"/>').prop('checked', true);

		$(".category > ul > li > a").click(function() {
			var membClass = $(this).attr("id").substring(2,3);
	        $("#searchForm #membClass").val(membClass);
			if(membClass != 'A'){
				document.searchForm.action = "<c:url value='/admin/memberAuthList.do'/>";
		       	document.searchForm.submit();
			}
		});
		
		$(".bd-head > input[name=membClass1]").click(function() {
			var membClass = $(this).attr("id").substring(6,7);
	        $("#searchForm #membClass").val(membClass);
			document.searchForm.action = "<c:url value='/admin/groupAuthList.do'/>";
	       	document.searchForm.submit();
		});

		$("#chk_all").click(function(){
			if($(this).prop("checked")){
				$('input:checkbox[name="menu_chk"]').prop('checked', true);
			}else{
				$('input:checkbox[name="menu_chk"]').prop('checked', false);
			}
		});

	    $("#saveCancel").click(function() {
			$("#saveOKPopup").fadeOut("slow");
			return false;
		});

		$("#saveOk").click(function() {
			var arrStr = "";
			$("#user_data input[name=menu_chk]").each(function(key, item){
				if($(this).prop("checked")){
					arrStr += $(this).attr("id") + ":Y,";
				}else{
					arrStr += $(this).attr("id") + ":N,";
				}
			});
			$("#loadingPopup").css("visibility", "visible");
			
			var ajaxUrl = "<c:url value='/admin/updateGroupAuth.json'/>";

			$.ajax({
				url : ajaxUrl,
				type : "post",
				data : "membClass=<c:out value='${searchVO.membClass}'/>&arrStr="+ arrStr,
				dataType : "json",
				success : function(data) {
					if (data == "Success") { //성공
						$("#saveOKPopup").fadeOut("slow");
					} 
				}
			});

			$("#loadingPopup").css("visibility", "hidden");

			return false;
		});
	});
	
	function menuExtend(obj){
		if($(obj).attr("class") == "btn-minus"){
			$(obj).removeClass().addClass("btn-plus");
			parentID = $(obj).parent().siblings("td:nth-child(1)").children("input").attr("id");
			$("#user_data ." + parentID).hide();
		}else{
			$(obj).removeClass().addClass("btn-minus");
			parentID = $(obj).parent().siblings("td:nth-child(1)").children("input").attr("id");
			$("#user_data ." + parentID).show();
		}
	}

    function saveMenuAuth(){
 		$("#saveOKPopup").fadeIn("slow"); //저장 하시겠습니까?
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
			    <input id="membClass" name="membClass" type="hidden" value="${searchVO.membClass}">
				<div class="category">
					<ul>
						<li><a href="#LINK" id="mcB">대리점</a></li>
						<li><a href="#LINK" id="mcS">품목점</a></li>
						<li><a href="#LINK" id="mcM">모비스</a></li>
						<li><a href="#LINK" id="mcH">HCI</a></li>
					</ul>
					<ul>
						<li><a href="#LINK" id="mcA" class="active">권한설정</a></li>
					</ul>
				</div>
				<div class="bd-head">
					<input type="radio" id="rad-mcB" name="membClass1"/><label for="rad-mcB"><span></span>대리점</label>
					<input type="radio" id="rad-mcS" name="membClass1"/><label for="rad-mcS"><span></span>품목점</label>
					<input type="radio" id="rad-mcM" name="membClass1"/><label for="rad-mcM"><span></span>모비스(부서원)</label>
					<input type="radio" id="rad-mcN" name="membClass1"/><label for="rad-mcN"><span></span>모비스(부서장)</label>
					<input type="radio" id="rad-mcH" name="membClass1"/><label for="rad-mcH"><span></span>HCI(부서원)</label>
					<input type="radio" id="rad-mcI" name="membClass1"/><label for="rad-mcI"><span></span>HCI(부서장)</label>
				</div>
				<div class="tbl-type01 basic mt20">
					<table summary="">
						<caption>권한설정 목록</caption>
						<colgroup>
							<col width="9%" />
							<col width="" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><input type="checkbox" id="chk_all" /><label for="chk_all" class="mr0"><span class="mr0"></span></label></th>
								<th scope="col">메뉴명</th>
							</tr>
						</thead>
						<tbody id="user_data">
							<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr class="${result.parentId}">
								<td><input type="checkbox" id="${result.menuId}" name="menu_chk" <c:if test="${result.useAt eq 'Y'}">checked</c:if>/><label for="${result.menuId}" class="mr0"><span class="mr0"></span></label></td>
								<td class="set"><a href="#LINK" <c:if test="${result.numOfChildren > 1}">class="btn-minus" onClick="menuExtend(this);"</c:if>><c:out value="${result.menuNm}"/></a></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="btn-set">
					<a href="#LINK" onClick="javascript:saveMenuAuth();">저장</a>
				</div>
				</form:form>
			</div>
        </div><!--// contents -->
    </div><!--// container -->
	<!-- footer -->
	<c:import url="../inc/logedfooter.jsp" />
	<!--// footer -->    
</div><!--// wrap -->
<div id="saveOKPopup" class="acc2-pop">
	<div class="msg-txt">
		저장 하시겠습니까?
	</div>
	<div class="btn-set2">
		<a href="#NONE" id="saveOk">확인</a>
		<a href="#NONE" class="cancel" id="saveCancel">취소</a>
	</div>
</div>
</body>
</html>