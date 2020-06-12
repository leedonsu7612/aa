<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  /**
  * @Class Name : forceUnissuedList.jsp
  * @Description : 미발행 채권 강제 발행 List 화면
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
<script type="text/javascript">
	$(function() {
		$("#all_check").click(function(){
			if($(this).prop("checked")){
				$('input:checkbox[name="forceChk"]').prop('checked', true);
			}else{
				$('input:checkbox[name="forceChk"]').prop('checked', false);
			}
		});
	});  
	
	//EXCEL EXPORT
	function excelExport(){
		var form = $('#searchForm').clone().hide();
		form.attr( 'action', "<c:url value='/downloads/forceUnissuedList.do'/>" );
		$('body').append(form);
		form.submit().remove();
	}

	//발행 팝업
	function forceView() {
		$('.popup04 > .p-txt > span').empty().text("10,000원");
	    wrapWindowByMask($('.popup04'));
	    $('.popup04').show();
	}

	function closePopup(){
	    $('#mask').hide();
		$('.popup04').hide();
	}
</script>
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
			<h2>미발행 채권 강제 발행</h2>
			
			<form:form commandName="searchVO" id="searchForm" name="searchForm" class="mt20" method="post">    

			<div class="tbl-type03 mt30">
				<table summary="">
					<caption>대리점 정보</caption>
					<colgroup>
						<col width="210" />
						<col width="" />
						<col width="210" />
						<col width="" />
					</colgroup>
					<tbody>
					<c:choose>
						<c:when test="${searchVO.membClass eq 'B'}">
						<tr>
							<th scope="row">대리점 상호</th>
							<td><c:out value="${searchVO.buyerCoNm}"/></td>
							<th scope="row">사업자 번호</th>
							<td><c:out value="${searchVO.buyerBizNo}"/></td>
						</tr>
						<tr>
							<th scope="row">품목점 상호</th>
							<td><c:out value="${searchVO.sellerCoNm}"/></td>
							<th scope="row">사업자 번호</th>
							<td><c:out value="${searchVO.sellerBizNo}"/></td>
						</tr>
						</c:when>
						<c:when test="${searchVO.membClass eq 'S'}">
						<tr>
							<th scope="row">품목점 상호</th>
							<td><c:out value="${searchVO.sellerCoNm}"/></td>
							<th scope="row">사업자 번호</th>
							<td><c:out value="${searchVO.sellerBizNo}"/></td>
						</tr>
						<tr>
							<th scope="row">대리점 상호</th>
							<td><c:out value="${searchVO.buyerCoNm}"/></td>
							<th scope="row">사업자 번호</th>
							<td><c:out value="${searchVO.buyerBizNo}"/></td>
						</tr>
						</c:when>
					</c:choose>
					</tbody>
				</table>
			</div>
			<div class="tbl-type01 basic mt20">
				<table summary="">
					<caption>미발행 채권 강제 발행</caption>
					<colgroup>
						<col width="4%" />
						<col width="4%" />
						<col width="" />
						<col width="10%" />
						<col width="13%" />
						<col width="13%" />
						<col width="13%" />
						<col width="13%" />
						<col width="16%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col" class="bdr-l0">NO</th>
							<th scope="col">세금계산서 번호</th>
							<th scope="col">매출액</th>
							<th scope="col">매출채권발행금액</th>
							<th scope="col">기타수금금액</th>
							<th scope="col">상계수금금액</th>
							<th scope="col">미발행금액 (미확정)</th>
							<th scope="col">강제미발행금액</th>
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
							<td><input type="checkbox" id="fc_${status.count}" name="forceChk" /><label for="fc_${status.count}" class="mr0"><span class="mr0"></span></label></td>
							<td><c:out value="${status.count}"/></td>
							<td><c:out value="${result.taxbillNo}"/></td>
							<td class="txt-r"><fmt:formatNumber value="${result.salesAmount }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.receivableAmount }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.extraAmount }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.setoffAmount }" pattern="#,###" /></td>
							<td class="txt-r"><fmt:formatNumber value="${result.unissuedAmount }" pattern="#,###" /></td>
							<td><input type="text" class="txt-r wp85" /></td>
						</tr>
				        </c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="9">총 발행 예정금액 : 0 원</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<div class="btn-set">
				<a href="#LINK" onClick="javascript:forceView()">발행</a>
				<a href="#LINK" onClick="javascript:excelExport();">엑셀</a>
			</div>
	<!-- 콘텐츠 끝 -->
		</form:form>
        </div><!--// contents -->
    </div><!--// container -->
	<!-- footer -->
	<c:import url="../inc/logedfooter.jsp" />
	<!--// footer -->    
</div><!--// wrap -->
<div id="popup" class="popup04" style="display:none;">
	<div class="p-txt">
		미발행채권강제발행 금액이 총 <span>1,800원</span> 입니다.<br />강제발행 하시겠습니까?
	</div>
	<div class="btn-set">
		<a href="#">확인</a>
		<a href="#" class="cancel" onClick="javascript:closePopup();">취소</a>
	</div>
	<a href="#" class="btn-close" onClick="javascript:closePopup();">닫기</a>
</div>
</body>
</html>