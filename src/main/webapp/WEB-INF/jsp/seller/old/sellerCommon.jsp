<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- 사업소 미선택시 경고창 -->
	<div id="notChoicePopup" class="alert_popup abc" style="visibility: hidden; position: absolute; left: 290px; top: 44.5px;">
		<dl>
			<dt>먼저 찾기 또는 My 거래처를 선택해 주세요.</dt>
			<dd>
				<span class="btn btn_normal popokbtn"><a href="javascript:;" style="width: 80px;">확인</a></span>
			</dd>
		</dl>
	</div>
	<!-- //사업소 미선택시 경고창 -->
	
	<!-- ajax 통신실패 경고창 -->
	<div id="ajaxErrorPopup" class="alert_popup abc" style="visibility: hidden; position: absolute; left: 290px; top: 44.5px;">
		<dl>
			<dt>통신실패.</dt>
			<dd>
				<span class="btn btn_normal popokbtn"><a href="javascript:;" style="width: 80px;">확인</a> </span>
			</dd>
		</dl>
	</div>
	<!-- //ajax 통신실패 경고창 -->
	
	<!-- 달력 Validation -->
	<div id="range_alert1" class="alert_popup abc" style="visibility: hidden; position: absolute; left: 290px; top: 44.5px;">
		<dl>
			<dt>조회기간은 최소 6개월 이상이여야 조회가 가능합니다.</dt>
			<dd>
				<span class="btn btn_normal popokbtn"><a href="javascript:;" style="width: 80px;">확인</a></span>
			</dd>
		</dl>
	</div>
	
	<div id="range_alert2" class="alert_popup abc" style="visibility: hidden; position: absolute; left: 290px; top: 44.5px;">
		<dl>
			<dt>조회기간은 최대 1년까지만 조회가 가능합니다.</dt>
			<dd>
				<span class="btn btn_normal popokbtn"><a href="javascript:;" style="width: 80px;">확인</a></span>
			</dd>
		</dl>
	</div>
	
	<div id="range_alert3" class="alert_popup abc" style="visibility: hidden; position: absolute; left: 290px; top: 44.5px;">
		<dl>
			<dt>조회시작날짜가 조회종료날짜보다 클 수 없습니다.</dt>
			<dd>
				<span class="btn btn_normal popokbtn"><a href="javascript:;" style="width: 80px;">확인</a></span>
			</dd>
		</dl>
	</div>
	<!-- //달력 Validation -->
	
	<!-- 로딩팝업 -->
	<div id="loadingPopup" class="loading_popup abc" style="visibility: hidden">
		<dl>
			<dt>잠시만 기다려주세요...</dt>
		</dl>
	</div>
	<!-- //로딩팝업 -->
	
	<!-- 매출 채권 성공 팝업 -->
	<div id="message_popup" class="alert_popup abc" style="visibility: hidden; position: absolute; left: 290px; top: 44.5px;">
		<dl>
			<dt>매출 채권이 정상적으로 생성되었습니다.</dt>
			<dd>
				<span id="messageOk" class="btn btn_popup btn_popup3"><a href="javascript:;" style="width: 80px;">확인</a></span>
			</dd>
		</dl>
	</div>
	<!-- //매출 채권 성공 팝업 -->
	
	<!-- 적수일 경고창 -->
	<div id="expitation_popup" class="alert_popup abc" style="visibility: hidden; position: absolute; left: 290px; top: 44.5px;">
		<dl>
			<dt>적수일자가 개별 지정가능 최대 만기일 180일을 초과하였습니다. 만기일을 다시 설정해 주세요.</dt>
			<dd>
				<span class="btn btn_normal popokbtn"><a href="javascript:;" style="width: 80px;">확인</a> </span>
			</dd>
		</dl>
	</div>
	<!-- //적수일 경고창  -->
	
	<!-- 적수일 경고창2 -->
	<div id="expitation_popup2" class="alert_popup abc" style="visibility: hidden; position: absolute; left: 290px; top: 44.5px;">
		<dl>
			<dt>적수일자가 월별 적수 65일을 초과하였습니다. 만기일을 다시 설정해 주세요.</dt>
			<dd>
				<span class="btn btn_normal popokbtn"><a href="javascript:;" style="width: 80px;">확인</a></span>
			</dd>
		</dl>
	</div>
	<!-- //적수일 경고창2 -->
	
	<!-- 승인 경고창 -->
	<div id="approveChiocePopup" class="alert_popup abc" style="display: none; position: absolute; left: 290px; top: 44.5px;">
		<dl>
			<dt>일괄승인하시려면 하나 이상 선택하세요.</dt>
			<dd>
				<span class="btn btn_normal popokbtn"><a href="javascript:;" style="width: 80px;">확인</a></span>
			</dd>
		</dl>
	</div>
	<!-- //승인 경고창 -->
	
	<!-- EXCEL EXPORT 경고창 -->
	<div id="notExeportPopup" class="alert_popup abc" style="display: none; position: absolute; left: 290px; top: 44.5px;">
		<dl>
			<dt>데이터 조회 후 EXPORT 하시기 바랍니다.</dt>
			<dd>
				<span class="btn btn_normal popokbtn"><a href="javascript:;" style="width: 80px;">확인</a></span>
			</dd>
		</dl>
	</div>
	<!-- //EXCEL EXPORT 경고창 -->
	
	<div id="expirationErrorPopup" class="alert_popup" style="position: absolute; left: 290px; top: 44.5px;">
		<dl>
			<dt>검색어를 입력하세요</dt>
			<dd>
				<span class="btn btn_normal" id="errorOk01"> <a href="javascript:;" style="width: 80px;">확인</a></span>
			</dd>
		</dl>
	</div>
	
	<!-- 조회하기 경고창2 -->
	<div id="alert_popup2" class="alert_popup abc" style="visibility: hidden; position: absolute; left: 290px; top: 20px;">
		<dl>
			<dt>검색어를 입력해 주세요.</dt>
			<dd>
				<span class="btn btn_normal popokbtn"><a href="javascript:;" style="width: 80px;">확인</a> </span>
			</dd>
		</dl>
	</div>
	<!-- //조회하기 경고창2 -->
	
	<script>
		$(function() {
			// 라디오 체크 이벤트
			$('input[type=radio][value="2"]').click(function() {
				$("input[type=radio]").prop("checked", false);
				$('input[type=radio][value="2"]').prop("checked", true);
				$("#groupType").val("2");
				searchExecute();
			});
	
			$('input[type=radio][value="0"]').click(function() {
				$("input[type=radio]").prop("checked", false);
				$('input[type=radio][value="0"]').prop("checked", true);
				$("#groupType").val("0");
				searchExecute();
			});
	
			$('input[type=radio][value="1"]').click(function() {
				$("input[type=radio]").prop("checked", false);
				$('input[type=radio][value="1"]').prop("checked", true);
				$("#groupType").val("1");
				searchExecute();
			});
	
			$("#allRadio").click(function() {
				$("input[type=radio]").prop("checked", false);
				$('input[type=radio][value="2"]').prop("checked", true);
				$("#groupType").val("2");
				searchExecute();
			});
	
			$("#hyundaiRadio").click(function() {
				$("input[type=radio]").prop("checked", false);
				$('input[type=radio][value="0"]').prop("checked", true);
				$("#groupType").val("0");
				searchExecute();
			});
	
			$("#kiaRadio").click(function() {
				$("input[type=radio]").prop("checked", false);
				$('input[type=radio][value="1"]').prop("checked", true);
				$("#groupType").val("1");
				searchExecute();
			});
	
			if ($("#groupType").val() == "0") {
				$("input[type=radio]").prop("checked", false);
				$('input[type=radio][value="0"]').prop("checked", true);
				$("#groupType").val("0");
			} else if ($("#groupType").val() == "1") {
				$("input[type=radio]").prop("checked", false);
				$('input[type=radio][value="1"]').prop("checked", true);
				$("#groupType").val("1");
			} else {
				if ($("#allRadio").length == 0) {
					$("input[type=radio]").prop("checked", false);
					$('input[type=radio][value="0"]').prop("checked", true);
					$("#groupType").val("0");
				} else {
					$("input[type=radio]").prop("checked", false);
					$('input[type=radio][value="2"]').prop("checked", true);
					$("#groupType").val("2");
				}
			}
	
			if ($("#startTaxBillDate").length > 0) {
				initDate();
			}
			// 라디오 체크 이벤트 END
	
			// 날짜 Enter key 입력시 submit
			$(".EnterKeyDown").keydown(function(event) {
				if (event.keyCode == '13') {
					showAlartPopup($("#loadingPopup"));
					$("#searchForm").submit();
				}
	
				if (event.which && ((event.which > 47 && event.which < 58) || (event.which > 95 && event.which < 106) || event.which == 8 || event.which == 37 || event.which == 39)) {
				} else {
					return false;
				}
	
				if (event.which != 8 && event.which != 37 && event.which != 39) {
					var textInputLength = getTextLength($(this).val());
	
					if (textInputLength == 4) {
						$(this).val($(this).val() + ".");
					}
				}
			});

			// 검색어 필드 Enter 이벤트
			$('input[name="searchKeyword"]').keypress(function(e) {
				if (e.which == 13) {
					$('a.btn_search_click', $(this).parents('tr')).trigger('click');
					e.preventDefault();
				}
			});
		});
	
		//EXCEL EXPORT
		function excelExport(dataLength) {
			if (dataLength <= 0) {
				$("#notExeportPopup").css("visibility", "visible");
				$("#notExeportPopup").fadeIn("show");
				return false;
			}
	
			var url = $("#excelUrl").val();
			var origin_url = $("#searchForm").attr("action");
			var form = $("#searchForm").toArray()[0];
	
			form.action = url;
			form.method = "post";
			form.submit();
	
			form.action = origin_url;
		}
	
		//찾기 검색 팝업
		function searchClick(url) {
			var jsonData = $("#searchForm").serializeObject();
			var officesSearch = $("#officesSearchPopup");
		
			//id가 없으면 생성
			if (officesSearch.length <= 0) {
				$('#myOfficesSearchPopup').remove();
				$('body').append('<div id="officesSearchPopup" class = "pop_wrap layer_popup"></div>');
			} else {//id가 있으면 삭제하고 생성
				$('#officesSearchPopup').remove();
				$('body').append('<div id="officesSearchPopup" class = "pop_wrap layer_popup"></div>');
			}
			
			//id가 없으면 생성
			if (accountSearch.length <= 0) {
				$('#requestPopup').remove();
				$('body').append('<div id="requestPopup" class = "pop_wrap layer_popup"></div>');
			} else {//id가 있으면 삭제하고 생성
				$('#requestPopup').remove();
				$('body').append('<div id="requestPopup" class = "pop_wrap layer_popup"></div>');
			}
	
			$("#officesSearchPopup").load(url, jsonData, function(responseText, textStatus, XMLHttpRequest) {
				if (textStatus == "success") {
					//부모창 불투명 처리
					//event.preventDefault();
					wrapWindowByMask($("#officesSearchPopup"));
	
					$("#officesSearchPopup").css("visibility", "visible");
					$("#officesSearchPopup").fadeIn("slow");
				} else if (textStatus == "error") {
					$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + XMLHttpRequest.status + "\n" + "ERROR : " + XMLHttpRequest.statusText);
					$("#ajaxErrorPopup").css("visibility", "visible");
					$("#ajaxErrorPopup").fadeIn("show");
				}
			});
		}
		
		//만기일 변경/취소 승인 팝업
		function searchClick1(url) {
			var jsonData = $("#searchForm").serializeObject();
			var accountSearch = $("#requestPopup");
	
			//id가 없으면 생성
			if (accountSearch.length <= 0) {
				$('#requestPopup').remove();
				$('body').append('<div id="requestPopup" class = "pop_wrap layer_popup"></div>');
			} else {//id가 있으면 삭제하고 생성
				$('#requestPopup').remove();
				$('body').append('<div id="requestPopup" class = "pop_wrap layer_popup"></div>');
			}
			
			//id가 없으면 생성
			if (accountSearch.length <= 0) {
			    $('#requestPopup').remove();
				$('body').append('<div id="requestPopup" class = "pop_wrap layer_popup"></div>');
			} else {//id가 있으면 삭제하고 생성
			
				$('#requestPopup').remove();
				$('body').append('<div id="requestPopup" class = "pop_wrap layer_popup"></div>');
			}
	
			$("#requestPopup").load(url, jsonData, function(responseText, textStatus, XMLHttpRequest) {
				if (textStatus == "success") {
					//부모창 불투명 처리
					//event.preventDefault();
					wrapWindowByMask($("#requestPopup"));
	
					$("#requestPopup").css("visibility", "visible");
					$("#requestPopup").fadeIn("slow");
				} else if (textStatus == "error") {
					$("#requestPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + XMLHttpRequest.status + "\n" + "ERROR : " + XMLHttpRequest.statusText);
					$("#requestPopup").css("visibility", "visible");
					$("#requestPopup").fadeIn("show");
				}
			});
		}
		
		

		//내 대리점, 품목점 검색 팝업
		function searchMyItemsClick(url, width, height) {
//			var jsonData = "jsonData=" + encodeURI(JSON.stringify($("#searchForm").serializeObject()));
			var jsonData = $("#searchForm").serializeObject();
			var myOfficesSearch = $("#myOfficesSearchPopup");
	
			//id가 없으면 생성
			if (myOfficesSearch.length <= 0) {
				$('#officesSearchPopup').remove();
				$('body').append('<div id="myOfficesSearchPopup" class = "pop_wrap layer_popup abc"></div>');
			} else {//id가 있으면 삭제하고 생성
				$('#myOfficesSearchPopup').remove();
				$('body').append('<div id="myOfficesSearchPopup" class = "pop_wrap layer_popup abc"></div>');
			}
	
			$("#myOfficesSearchPopup").load(url, jsonData, function(responseText, textStatus, XMLHttpRequest) {
				if (textStatus == "success") {
					//부모창 불투명 처리
					//event.preventDefault();
					wrapWindowByMask($("#myOfficesSearchPopup"));
	
					$("#myOfficesSearchPopup").css("visibility", "visible");
					$("#myOfficesSearchPopup").fadeIn("slow");
				} else if (textStatus == "error") {
					$("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : " + XMLHttpRequest.status + "\n" + "ERROR : " + XMLHttpRequest.statusText);
					$("#ajaxErrorPopup").css("visibility", "visible");
					$("#ajaxErrorPopup").fadeIn("show");
				}
			});
		}
	
		function dateClick(name) {
			$('#' + name).datepicker('show');
		}
	
		var IsSearchKeyword = false;
	
		function searchExecute() {
			$("#searchForm").submit();
		}
	
		function initDate() {
			//현재날짜
			var nowDate = new Date();
			//비교할 현재 날짜
			var compareNowDate = nowDate.getFullYear() + "." + (nowDate.getMonth() + 1);
			//시작날짜
			//var startDateArray = $("#startTaxBillDate").val().split(".");
			//var startDate = new Date( startDateArray[0], startDateArray[1], startDateArray[2] );
			startDate = currentDate($("#startTaxBillDate").val());//new Date($("#startTaxBillDate").val());
			//비교할 시작 날짜
			var compareStartDate = startDate.getFullYear() + "." + (startDate.getMonth() + 1);
			//끝날짜
			//var endDateArray = $("#endTaxBillDate").val().split(".");
			//var endDate = new Date( endDateArray[0], endDateArray[1], endDateArray[2] );
			var endDate = currentDate($("#endTaxBillDate").val());//new Date($("#endTaxBillDate").val());
			//선택한 월의 마지막 일자 셋팅
			var lastDay = 32 - new Date(startDate.getFullYear(), startDate.getMonth(), 32).getDate();
	
			var taxDate = currentDate($("#taxBillDate").val());//new Date( $("#taxBillDate").val() );
	
			//년.월 텍스트 박스 VIEW 셋팅
			$("#taxBillDate").val(startDate.getFullYear() + ((startDate.getMonth() + 1) < 10 ? (".0" + (startDate.getMonth() + 1)) : ("." + (startDate.getMonth() + 1))));
	
			$("#startTaxBillDay > select > option").each(function() {
				$(this).remove();
			});
			$("#endTaxBillDay > select > option").each(function() {
				$(this).remove();
			});
	
			var tempMonth = $("#taxBillDate").val();
			var strArr = tempMonth.split(".");
			var lastDayOfMonth = (new Date(Number(strArr[0]), Number(strArr[1]), 0)).getDate();
	
			$("#startTaxBillDate").val($("#taxBillDate").val() + ".01");
			$("#endTaxBillDate").val($("#taxBillDate").val() + "." + lastDayOfMonth);
		}
		
		/* pagination 페이지 링크 function */
		function fn_egov_link_page(pageNo) {
			//document.searchForm.pageIndex.value = pageNo;
			//document.searchForm.action = "/cdf/admin/checkMemberList.do";
			$("#pageIndex").val(pageNo);
			$("#searchForm").submit();
		}

		function fn_egov_selectList() {
			//document.searchForm.action = "/cdf/admin/checkMemberList.do";
			$("#searchForm").submit();
		}
	</script>