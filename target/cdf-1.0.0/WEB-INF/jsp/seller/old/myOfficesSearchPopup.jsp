<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	/**
	* @Class Name : myOfficesSearchPopup.jsp
	* @Description : 내 거래처 찾기 팝업
	* @Modification Information
	*
	*   수정일     수정자      수정내용
	*  -------    --------    ---------------------------
	*  2018.11.30              최초 생성
	*
	* author CDF Team
	* since 2018.11.30
	*
	*/
%>
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>

	<div class="btn closeButton mr10 mb5 mt5">
		<a id="closePopup" href="javascript:;">×</a>
	</div>
	<!-- 팝업 사이즈 : 915px * 905px -->
	<div id="myOfficesSearch">
		<!-- HEADER -->
		<h1 class="ptxt pop_draggable">품목점 목록</h1>
		<!-- //HEADER -->
		<!-- CONTAINER -->
		<div id="pop_container">
			<div class="pop_cont">
				<!-- 컨텐츠 입력 -->
				<h3 class="ptxt">품목점 목록</h3>
				<div class="div_scroll">
					<div>
						<table id="isiTable" border="1" class="tbl mb15" summary="전체검색 상세내용입니다. 업체명, 사업자번호, 전화번호, 대표자, 선택 항목으로 구성">
							<caption>전체검색</caption>
							<thead>
								<tr>
									<th class="bg_c width40">선택</th>
									<th class="bg_c width40">No.</th>
									<th class="bg_c width200">품목점명</th>
									<th class="bg_c width300">사업자번호</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list }">
									<!-- 처음 검색된 항목이 없을 시 하단의 tr만 나와있게 하면 됨 -->
									<tr>
										<td class="width40"></td>
										<td class="width40"></td>
										<td class="width400">
											<p class="noDate">데이터가 없습니다.</p>
										</td>
										<td class="width100"></td>
									</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="item" items="${list }" varStatus="status">
										<tr>
											<td class="width40">
												<input type="checkbox" name="chk_store" value="이 품목점을 선택">
											</td>
											<td class="width40">
												${status.count}
											</td>
											<td class="width200">
												<a href="javascript:;"><span>${item.sellerCompanyName }</span> [${item.sellerMembNo }]</a>
												<input id="itemCode${status.index}" type="hidden" value="${item.sellerMembNo }">
											</td>
											<td class="width250">${item.sellerBizNo }</td>
										</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
				<form id="deleteItem" action="<c:url value='/seller/myOfficesItem/delete.json'/>" method="post"></form>
				<div class="btn_group ac mt30">
					<span class="btn btn_popup">
						<a id="acceptButton" href="javascript:;">확인</a>
					</span>
					<span class="btn btn_popup">
						<a id="deleteButton" href="javascript:;">삭제</a>
					</span>
				</div>
				<div id="deleteMyOfficesPopup" class="alert_popup1">
					<dl>
						<dt>선택한 품목점을 정말 삭제하시겠습니까?</dt>
						<dd>
							<span class="btn btn_normal" id="myOfficesCancel">
								<a href="javascript:;" style="width: 80px;">취소</a> 
							</span> 
							<span class="btn btn_normal" id="myOfficesOk1">
								<a href="javascript:;" style="width: 80px;">확인</a>
							</span>
						</dd>
					</dl>
				</div>
				<div id="cancelMyOfficesPopup" class="alert_popup1">
					<dl>
						<dt>선택된 품목점이 없습니다.</dt>
						<dd>
							<span class="btn btn_normal" id="myOfficesOk2">
								<a href="javascript:;" style="width: 80px;">확인</a>
							</span>
						</dd>
					</dl>
				</div>
				<!-- 조회 경고창 -->
				<div id="multiPopup" class="alert_popup1">
					<dl>
						<dt>한개 이상 조회가 불가능 합니다.</dt>
						<dd>
							<span class="btn btn_normal" id="myOfficesOk3">
								<a href="javascript:;" style="width: 80px;">확인</a>
							</span>
						</dd>
					</dl>
				</div>
				<!-- //조회 경고창 -->
				<!-- //컨텐츠 입력 -->
			</div>
		</div>
		<!-- //CONTAINER -->
	</div>
	<script type="text/javascript">
		$(function() {
			// 확인
			$("#acceptButton").click(function() {
				var index = 0;
				$("input[name=chk_store]:checked").each(function() {
					index++;
				});
	
				if (index > 1) {
					$("#multiPopup").fadeIn("show");
					return false;
				}
	
				if (index <= 0) {
					$("#cancelMyOfficesPopup").fadeIn("slow");
					return false;
				}
	
				var businessNumber = $("input[name=chk_store]:checked").parent().parent().children("td:last").text();
	
				$("#sellerBizNo").val(businessNumber);
				$("#searchForm").submit();
	
				//불투명 처리 해제
				$("#mask").hide();
				$("#myOfficesSearchPopup").fadeOut("slow");
				
				return false;
			});
	
			//삭제
			$("#deleteButton").click(function() {
				var itemCodeData = [];
				var index = 0;
				$("input[name=chk_store]:checked").each(function() {
					itemCodeData[index] = $(this).parent().parent().children("td:last").text();
					index++;
				});
	
				if (itemCodeData.length == 0) {
					$("#cancelMyOfficesPopup").fadeIn("slow");
				} else {
					$("#deleteMyOfficesPopup").fadeIn("slow");
				}
	
				return false;
			});
	
			//삭제 확인
			$("#myOfficesOk1").click(function() {
				var itemCodeData = [];
				var index = 0;
	
				$("input[name=chk_store]:checked").each(function() {
					itemCodeData[index] = $(this).parent().parent().children("td:last").text();//$("#itemCode" + index).val();
					index++;
				});
	
				$("#loadingPopup").css("visibility", "visible");
	
				var ajaxUrl = $("#deleteItem").attr("action");
//				var jsonData = "jsonData=" + JSON.stringify(itemCodeData);
				var arrQue = "arrstr=" + itemCodeData.join();
	
				$.ajax({
					url : ajaxUrl,
					type : "post",
					data : arrQue,
					dataType : "json",
					success : function(data) {
//						var get_data = eval(data);
	
//						if (get_data["resultMessage"] == "Success") { //성공
						if (data == "Success") { //성공
							$("#searchForm").submit();
	
							//불투명 처리 해제
							$("#mask").hide();
							$("#myOfficesSearchPopup").fadeOut("slow");
						} else { //실패
							$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "ERROR : " + get_data["errorMessage"]);
							$("#ajaxErrorPopup").css("visibility", "visible");
							$("#ajaxErrorPopup").fadeIn("show");
						}
	
						$("#loadingPopup").css("visibility", "hidden");
					},
					error : function(request, status, error) {
						$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + request.status + "\n" + "ERROR : " + error);
						$("#ajaxErrorPopup").css("visibility", "visible");
						$("#ajaxErrorPopup").fadeIn("show");
					}
				});
	
				$("#loadingPopup").css("visibility", "hidden");
	
				//불투명 처리 해제
				//$("#mask").hide();
				$("#deleteMyOfficesPopup").fadeOut("slow");
				
				return false;
			});
			
			//삭제 취소
			$("#myOfficesCancel").click(function() {
				$("#deleteMyOfficesPopup").fadeOut("slow");
				return false;
			});
	
			$("#myOfficesOk2").click(function() {
				$("#cancelMyOfficesPopup").fadeOut("slow");
				return false;
			});
	
			$("#myOfficesOk3").click(function() {
				$("#multiPopup").fadeOut("slow");
				return false;
			});
	
			$("#isiTable > tbody > tr > td > a").click(function() {
				$("#sellerBizNo").val($(this).parent().parent().children("td:last").text());
				$("#searchKeyword").val($(this).find("span").text());
				$("#searchForm").submit();
	
				//불투명 처리 해제
				$("#mask").hide();
				$("#myOfficesSearchPopup").fadeOut("slow");
			});
	
			//close 버튼
			$("div > #closePopup").click(function() {
				//불투명 처리 해제
				$("#mask").hide();
				$("#myOfficesSearchPopup").fadeOut("slow");
				
				return false;
			});
		});
	</script>