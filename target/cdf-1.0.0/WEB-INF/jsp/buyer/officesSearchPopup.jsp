<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	/**
	* @Class Name : officesSearchPopup.jsp
	* @Description : 품목점 찾기 팝업
	* @Modification Information
	*
	*   수정일     수정자      수정내용
	*  -------    --------    ---------------------------
	*  2018.11.20              최초 생성
	*
	* author CDF Team
	* since 2018.11.20
	*
	*/
%>
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>

	<div class="btn closeButton mr10 mb5 mt5">
		<a id="closePopup" href="javascript:;">×</a>
	</div>
	<!-- 팝업 사이즈 : 915px * 905px -->
	<div id="officesSearch">
		<!-- HEADER -->
		<h1 class="ptxt pop_draggable">품목점 목록검색</h1>
		<!-- //HEADER -->
		<!-- CONTAINER -->
		<div id="pop_container">
			<div class="pop_cont">
				<!-- 컨텐츠 입력 -->
				<h3 class="ptxt hidden">품목점 목록검색입니다.</h3>
				<div class="wide_box mb30">
					<div class="sch_box_gline">
						<input id="officesItemSearchUrl" type="hidden" class="input mr15" style="width: 260px;" value="<c:url value='/buyer/officesItem/list.json'/>">
						<fieldset>
							<legend>검색폼</legend>
							<table class="tbl_popsearch" summary="품목점 목록검색">
								<caption>조회</caption>
								<colgroup>
									<col width="170">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">
											<label for="srch_cond">검색조건</label>
										</th>
										<td>
											<p>
												<input id="officesItemSearchKeyword" type="text" class="input mr15" style="width: 260px;" value="${vo.searchKeyword }">
												<span class="btn btn_popup"><a href="javascript:;" onclick="officesItemSearch()">검색</a></span>
												<!-- <c:url value='/buyer/officesItem/list.json'/> -->
											</p>
										</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
					</div>
				</div>
				<h3 class="ptxt">검색된 품목점</h3>
				<div class="div_scroll">
					<div>
						<table id="isiTable" border="1" class="tbl mb15" summary="전체검색 상세내용입니다. 업체명, 사업자번호, 전화번호, 대표자, 선택 항목으로 구성">
							<caption>전체검색</caption>
							<thead>
								<tr class="headerLock">
									<th scope="col" class="bg_c width40">선택</th>
									<th scope="col" class="bg_c width40">No.</th>
									<th scope="col" class="bg_c width200">품목점명</th>
									<th scope="col" class="bg_c width300">사업자번호</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list }">
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
										<c:forEach var="item" items="${list}" varStatus="status">
										<tr>
											<td class="width40">
												<input type="checkbox" name="chk_store" value="이 품목점을 선택">
											</td>
											<td class="width40">
												${status.count}
											</td>
											<td class="width200">
												<a href="javascript:;"><span>${item.companyName }</span> [${item.membNo }]</a>
												<input id="itemCode${status.index}" type="hidden" value="${item.businessNo }">
											</td>
											<td class="width250">${item.businessNo }</td>
										</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
				<form id="addItem" action="<c:url value='/buyer/myOfficesItem/insert.json'/>" method="post"></form>
				<div class="btn_group ac mt30">
					<span class="btn btn_popup"><a href="javascript:;" id="accButton">확인</a></span> <span class="btn btn_popup"><a href="javascript:;" id="confirmButton">추가</a> </span>
				</div>
				<div id="addOfficesPopup" class="alert_popup1">
					<dl>
						<dt>선택한 품목점을 추가하시겠습니까?</dt>
						<dd>
							<span class="btn btn_normal">
								<a href="javascript:;" style="width: 80px;" id="officesCancel">취소</a>
							</span>
							<span class="btn btn_normal" id="officesOk01">
								<a href="javascript:;" style="width: 80px;">확인</a>
							</span>
						</dd>
					</dl>
				</div>
				<div id="searchAlertPopup" class="alert_popup1">
					<dl>
						<dt>검색어를 입력하세요</dt>
						<dd>
							<span class="btn btn_normal" id="officesOk02">
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
			//enter event
			$("#officesItemSearchKeyword").keydown(function(e) {
				if (e.keyCode == '13')
					officesItemSearch();
			});
	
			// 확인
			$("#accButton").click(function() {
				var index = 0;
				$("input[name=chk_store]:checked").each(function() {
					index++;
				});
	
				if (index > 1) {
					$("#multiPopup").fadeIn("show");
					return false;
				}
	
				if (index <= 0) {
					$("#searchAlertPopup dt").text("선택된 품목점이 없습니다."); //div 내용 변경
					$("#searchAlertPopup").fadeIn("slow");
					return false;
				}
	
				var businessNumber = $("input[name=chk_store]:checked").parent().parent().children("td:last").text();
	
				$("#businessNo").val(businessNumber);
				$("#searchForm").submit();
	
				//불투명 처리 해제
				$("#mask").hide();
				$("#myOfficesSearchPopup").fadeOut("slow");
				
				return false;
			});
	
			//추가
			$("#confirmButton").click(function() {
				var itemCodeData = [];
				var index = 0;
				$("input[name=chk_store]:checked").each(function() {
					//itemCodeData[index] = $(this).parent().parent().children("td:last").text();
					itemCodeData[index] = $(this).parent().parent().children("td:last").text();
					index++;
				});
	
				if (itemCodeData.length == 0) { //선택된 품목점이 없습니다.
					$("#searchAlertPopup dt").text("선택된 품목점이 없습니다."); //div 내용 변경
					$("#searchAlertPopup").fadeIn("slow");
				} else {
					$("#addOfficesPopup").fadeIn("slow"); //품목점을 추가 하시겠습니까
				}
				
				return false;
			});
	
			//추가 확인
			$("#officesOk01").click(function() {
				var itemCodeData = [];
				var index = 0;
				
				$("input[name=chk_store]:checked").each(function() {
					itemCodeData[index] = $(this).parent().parent().children("td:last").text();//$("#itemCode" + index).val()
					//console.log(selItem);
					index++;
				});
	
				$("#loadingPopup").css("visibility", "visible");
	
				var ajaxUrl = $("#addItem").attr("action");
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
							$("#officesSearchPopup").fadeOut("show");
						} else { //실패
							$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "ERROR : " + get_data["errorMessage"]);
							$("#ajaxErrorPopup").css("visibility", "visible");
							$("#ajaxErrorPopup").fadeIn("show");
						} 
					},
					error : function(request, status, error) {
						//실패
						$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + request.status + "\n" + "ERROR : " + error);
						$("#ajaxErrorPopup").css("visibility", "visible");
						$("#ajaxErrorPopup").fadeIn("show");
					}
				});

				$("#loadingPopup").css("visibility", "hidden");
				$("#addOfficesPopup").fadeOut("slow");

				return false;
			});
			
			//추가 취소
			$("#officesCancel").click(function() {
				$("#addOfficesPopup").fadeOut("slow");
				
				return false;
			});
	
			$("#officesOk02").click(function() {
				$("#searchAlertPopup").fadeOut("slow");
				
				return false;
			});
	
			$("#myOfficesOk3").click(function() {
				$("#multiPopup").fadeOut("slow");
				
				return false;
			});
	
			$("#isiTable > tbody > tr > td > a").click(function() {
				//$("#businessNo").val($(this).parent().parent().children("td:last").text()); //$(this).parent().find("input:first").val()
				$("#businessNo").val($(this).next().val());
				$("#officesSearch").fadeOut("slow").remove();
				$("#searchForm").submit();
			});
	
			//close 버튼
			$("div > #closePopup").click(function(event) {
				event.preventDefault();
				$("#mask").hide();
	
				//부모창 스크롤 이벤트 삭제
				//$("#searchDetailPopup").removeClass("isScroll");
	
				$("#officesSearchPopup").fadeOut("slow").remove();
				
				return false;
			});
		});
	
		//검색 클릭
		function officesItemSearch() {
			$("#loadingPopup").css("visibility", "visible");
	
			//검색 내용이 없는지 check
			if ($("#officesItemSearchKeyword").val().length < 1) {
				$("#searchAlertPopup dt").text("검색어를 입력하세요"); //div 내용 변경
				$("#searchAlertPopup").fadeIn("slow"); //div 출력
	
				return false; //종료
			}
	
//			var dataObject = new Object();
//			dataObject.searchKeyword = $("#officesItemSearchKeyword").val();
	
			var ajaxUrl = $("#officesItemSearchUrl").val();
//			var jsonData = "jsonData=" + JSON.stringify(dataObject);
			$.ajax({
				url : ajaxUrl,
				type : "post",
				data : "keyword=" + $("#officesItemSearchKeyword").val(),
				dataType : "json",
				success : function(data) {
					console.log("data : ", data);
					var get_data = eval(data);
	
					if (get_data["errorMessage"] == null) { //성공
						$("#isiTable tbody tr").each(function() {
							$(this).remove();
						});
	
//						for (var i = 0; i < get_data.length; i++) {
//							$("#isiTable tbody").append('<tr>' + '<td class = "width40"><input type="checkbox" name="chk_store" value="이 품목점을 선택" /></td>' + '<td class = "width40">' + (i + 1) + '</td>' + '<td class = "width200"><a href="javascript:;">' + get_data[i].itemShopName + ' [' + get_data[i].hdcFlagCode + ']</a><input id = "itemCode' + i + '" type="hidden" value="' + get_data[i].businessNo + '" /></td>' + '<td class = "width250">' + get_data[i].businessNumber + '</td>' + '</tr>');
						for (var i = 0; i < data.length; i++) {
							$("#isiTable tbody").append('<tr>' + '<td class = "width40"><input type="checkbox" name="chk_store" value="이 품목점을 선택" /></td>' + '<td class = "width40">' + (i + 1) + '</td>' + '<td class = "width200"><a href="javascript:;">' + data[i].companyName + ' [' + data[i].membNo + ']</a><input id = "itemCode' + i + '" type="hidden" value="' + get_data[i].businessNo + '" /></td>' + '<td class = "width250">' + data[i].businessNo + '</td>' + '</tr>');
	
							$("#isiTable > tbody > tr > td > a").bind("click", function(event) {
								$("#businessNo").val($(this).parent().parent().children("td:last").text()); //$(this).parent().find("input:first").val()
								$("#searchForm").submit();
								$("#officesSearch").fadeOut("slow");
							});
						}
					} else { //실패
						$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "ERROR : " + get_data["errorMessage"]);
						$("#ajaxErrorPopup").css("visibility", "visible");
						$("#ajaxErrorPopup").fadeIn("show");
					}
				},
				error : function(request, status, error) { //실패
					$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + request.status + "\n" + "ERROR : " + error);
					$("#ajaxErrorPopup").css("visibility", "visible");
					$("#ajaxErrorPopup").fadeIn("show");
				}
			});
	
			$("#loadingPopup").css("visibility", "hidden");
			$("#addOfficesPopup").fadeOut("slow");
			
			return false;
		}
	</script>