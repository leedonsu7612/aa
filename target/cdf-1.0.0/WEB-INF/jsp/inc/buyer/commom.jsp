<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 마스크 -->
<div class="mask" style="display: none;"></div>
<!-- // 마스크 -->

<!-- 거래처 찾기 팝업 -->
<div id="popup" class="popup07 draggable officePopup" style="display: none;">
	<strong><span class="officeType">거래처</span> 목록 검색</strong>

	<div class="pop-bx">
		<div class="pop-bd-head">
			<ul>
				<li>
					<div class="ag-title mt0">검색된 <span class="officeType">거래처</span></div>
				</li>
				<li class="fr">
					<label for="officesSearchKeyword" class="sound_only">검색어 입력</label>
					<input type="text" id="officesSearchKeyword">
					<a href="javascript:;" onclick="searchOffices();" class="btn-submit ml5">검색</a>
				</li>
			</ul>
		</div>

		<div class="tbl-type02 tbl-center">
			<table summary="">
				<caption><span class="officeType">거래처</span> 조회 목록</caption>
				<colgroup>
					<col width="65" />
					<col width="140" />
					<col width="*" />
					<col width="240" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">선택</th>
						<th scope="col" class="bdr-l0">NO</th>
						<th scope="col"><span class="officeType">거래처</span>명</th>
						<th scope="col">사업자번호</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>

	<div class="btn-set">
		<a href="javascript:;" onclick="searchForShop();">조회</a>
		<a href="javascript:;" onclick="addMyShop();">추가</a>
	</div>

	<a href="javascript:;" class="btn-close">닫기</a>
</div>
<!-- // 거래처 찾기 팝업 -->

<!-- 내 거래처 찾기 팝업 -->
<div id="popup" class="popup07 draggable myOfficePopup" style="display: none;">
	<strong><span class="officeType">거래처</span> 목록</strong>

	<div class="pop-bx">
		<div class="tbl-type02 tbl-center mt30">
			<table summary="">
				<caption><span class="officeType">거래처</span> 목록</caption>
				<colgroup>
					<col width="65">
					<col width="140">
					<col width="*">
					<col width="240">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">선택</th>
						<th scope="col" class="bdr-l0">NO</th>
						<th scope="col"><span class="officeType">거래처</span>명</th>
						<th scope="col">사업자번호</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>

	<div class="btn-set">
		<a href="javascript:;" onclick="searchForShop();">조회</a>
		<a href="javascript:;" onclick="removeMyShop();">삭제</a>
	</div>

	<a href="javascript:;" class="btn-close">닫기</a>
</div>
<!-- // 내 거래처 찾기 팝업 -->

<!-- 로딩 팝업 -->
<div class="acc2-pop" id="loadingPopup" style="display: none;">
	<div class="pop-border"></div>
	<div class="msg-txt">잠시만 기다려주세요...</div>
</div>
<!-- // 로딩 팝업 -->

<!-- 확인 팝업 -->
<div class="acc2-pop" id="confirmPopup" style="display: none;">
	<div class="pop-border"></div>
	<div class="msg-txt"></div>
	<div class="btn-set2">
		<a href="javascript:;" class="ok">확인</a>
		<a href="javascript:;" class="close" onclick="closeConfirm();">취소</a>
	</div>
	<a href="javascript:;" class="btn-close" onclick="closeConfirm();">닫기</a>
</div>
<!-- // 확인 팝업 -->

<!-- 알림 팝업 -->
<div class="acc2-pop" id="alertPopup" style="display: none;">
	<div class="pop-border"></div>
	<div class="msg-txt"></div>
	<div class="btn-set2">
		<a href="javascript:;" class="ok" onclick="closeAlert();">확인</a>
	</div>
	<a href="javascript:;" class="btn-close" onclick="closeAlert();">닫기</a>
</div>
<!-- // 알림 팝업 -->

<!-- 공인인증서 로그인 알림 팝업 -->
<div id="popup" class="popup04 certificatePopup" style="display: none;">
	<div class="p-txt">공인인증서 로그인을 해주세요.</div>
	<div class="btn-set">
		<a href="javascript:;" class="ok">확인</a>
		<a href="javascript:;" class="cancel" onclick="closeCertificateAlert();">취소</a>
	</div>
	<a href="javascript:;" class="btn-close" onclick="closeCertificateAlert();">닫기</a>
</div>
<!-- // 공인인증서 로그인 알림 팝업 -->

<!-- 공인인증서 로그인 -->
<input type="hidden" id="certificateUrl" value="<c:url value='/certificateCheck.json'/>">
<script type="text/javascript" src="<c:url value='/js/customer/TSToolkitObject.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/customer/TSToolkitConfig.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/global.js?ver=1.1'/>"></script>
<!-- // 공인인증서 로그인 -->

<!-- 대출실행 페이지 이동 폼 -->
<form id="linkToHciForm" method="post">
	<input type="hidden" id="stdt" name="stdt">
	<input type="hidden" id="endt" name="endt">
	<input type="hidden" id="crdt" name="crdt">
	<input type="hidden" id="from" name="from">
</form>
<!-- // 대출실행 페이지 이동 폼 -->

<script>
	var $_MASK = $(".mask"); // 마스크
	var $_CONFIRM = $("#confirmPopup"); // 확인 팝업
	var $_ALERT = $("#alertPopup"); // 알림 팝업
	var $_LOADING = $("#loadingPopup"); // 로딩 팝업
	var $_SEARCH_FORM = $("#searchForm"); // 검색 폼
	var MEMB_CLASS = "${user.membClass}"; // 로그인 사용자 구분

	// ajax 배열데이터 전송 직렬화
	jQuery.ajaxSettings.traditional = true;

	// Date 객체 생성
	function getDate(date) {
		if (date == null || date == "") {
			return new Date();
		}

		var tempStr = date.split(".");

		if (tempStr.length == 2) {
			return new Date(Number(tempStr[0]), Number(tempStr[1]) - 1, 1);
		} else if (tempStr.length == 3) {
			return new Date(Number(tempStr[0]), Number(tempStr[1]) - 1, Number(tempStr[2]));
		}
	}

	// 날짜 차이 계산
	function getDateDiff(date1, date2) {
		var getDiffTime = date1.getTime() - date2.getTime();
		return Math.floor(getDiffTime / (1000 * 60 * 60 * 24));
	}

	// 콤마찍기
	function comma(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}

	// 콤마풀기
	function uncomma(str) {
		str = String(str);
		return str.replace(/,/g, '');
	}

	// 숫자만 입력가능 ex) input 속성에 numberOnly = "true" 설정
	$(document).on("keyup", "input:text[numberOnly=true]", function() {
		$(this).val($(this).val().replace(/[^0-9]/gi, ""));
	});

	// 체크박스 선택된 아이템 갯수
	function checkedItemLength(name) {
		return $("input[name=" + name + "]:checked").length;
	}

	/****************************** START AJAX ******************************/
	// AJAX
	function doAjax(ajaxUrl, jsonData, callback) {
		$.ajax({
			url : ajaxUrl,
			type : "post",
			data : jsonData,
			dataType : "json",
			success : function(data) { // 성공
				callback(data);
			},
			error : function(request, status, error) { //실패
				openAlert("<strong>[통신 실패]</strong>" + " CODE : " + request.status + " <strong>|</strong> ERROR : " + error);
			}
		});
	}

	// AJAX Success Callback
	function ajaxSuccessSubmit(data) {
		if (data == "Success") { //성공
			submitSearchForm();
		} else { // 실패
			openAlert("<strong>[통신 실패]</strong>");
		}
	}
	/****************************** END AJAX ******************************/

	/****************************** START datepicker ******************************/
	// datepicker 한국어 설정
	function datepickerKo() {
		$.datepicker.setDefaults($.datepicker.regional['ko']);
	}

	// datepicker
	function setDatepicker(selector, dateFormat, defaultDate, isBtn, minDate, maxDate) {
		$(selector).datepicker({
			showOn : isBtn ? "both" : "focus",
			buttonImage : "<c:url value='/images/ico/ico-calendar.png'/>",
			buttonImageOnly : true,
			dateFormat : dateFormat,
			defaultDate : getDate(defaultDate),
			minDate : minDate,
			maxDate : maxDate,
			yearRange : 'c-20:c+20',
			showOtherMonths : false,
			selectOtherMonths : false,
			showMonthAfterYear : true,
			changeMonth : true,
			changeYear : true
		});
	}

	// monthpicker
	function setMonthpicker(selector, dateFormat, defaultDate) {
		$(selector).datepicker({
			showOn : "button",
			buttonImage : "<c:url value='/images/ico/ico-calendar.png'/>",
			buttonImageOnly : true,
			dateFormat : dateFormat,
			defaultDate : getDate(defaultDate),
			maxDate : '+0d',
			yearRange : 'c-20:c+20',
			showMonthAfterYear : true,
			changeMonth : true,
			changeYear : true,
			onChangeMonthYear : function(year, month, inst) {
				$(this).val($.datepicker.formatDate(dateFormat, new Date(year, month - 1, 1)));
			},
			onClose : function(dateText, inst) {
				var month = $(".ui-datepicker-month :selected").val();
				var year = $(".ui-datepicker-year :selected").val();
				$(this).val($.datepicker.formatDate(dateFormat, new Date(year, month, 1)));

				if (inst.id == "startDate" || inst.id == "endDate") {
					var startDate, endDate;

					if (inst.id == "startDate") { // 시작일
						startDate = getDate(dateText).getTime();
						endDate = getDate($("#endDate").val()).getTime();
					} else if (inst.id == "endDate") { // 종료일
						startDate = getDate($("#startDate").val()).getTime();
						endDate = getDate(dateText).getTime();
					}

					var diffMonth = Math.ceil((endDate - startDate) / (1000 * 3600 * 24 * 30));

					if (diffMonth > 13) {
						openAlert("조회기간은 최대 1년까지만 조회가 가능합니다.");
						$(this).val($.datepicker.formatDate(dateFormat, getDate(inst.lastVal)));
					} else if (diffMonth < 0) {
						$(this).val($.datepicker.formatDate(dateFormat, getDate(inst.lastVal)));
					}
				}
			}
		}).focus(function() {
			$(".ui-datepicker-calendar").hide();
		});
	}

	// 데이트 피커 제거
	function destroyDetepicker(selector) {
		$(selector).datepicker("destroy");
	}
	/****************************** END datepicker ******************************/

	// 조회하기
	function submitSearchForm() {
		$_SEARCH_FORM.submit();
	}

	// 지급/수급내역(상세) 페이지로 이동
	function linkToSalesBilling(targetBizNo) {
		if(MEMB_CLASS == "B") { // 대리점
			$_SEARCH_FORM.attr("action", "<c:url value='/buyer/salesBilling/list.do' />");
		} else if(MEMB_CLASS == "S") { // 품목점
			$_SEARCH_FORM.attr("action", "<c:url value='/seller/salesBilling/list.do' />");
		} else {
			return false;
		}
		$("#searchForm input[name$='Date']").val("");
		$("#targetBizNo").val(targetBizNo);
		submitSearchForm();
	}

	// paging 링크
	function fn_link_page(pageNo) {
		$("#pageIndex").val(pageNo);
		submitSearchForm();
	}

	// EXCEL EXPORT
	function excelExport(dataLength) {
		if (dataLength <= 0) {
			openAlert("데이터 조회 후 EXPORT 하시기 바랍니다.");
			return false;
		}

		if(EXCEL_URL == null || EXCEL_URL == "") {
			openAlert("<strong>[통신 실패]</strong>");
		}

		var origin_url = $_SEARCH_FORM.attr("action");
		var form = $_SEARCH_FORM.toArray()[0];

		form.action = EXCEL_URL;
		form.method = "post";
		form.submit();
		form.action = origin_url;
	}

	// 진행상태 텍스트 가져오기
	function getProgressStatus(statusFlag, groupType) {
		if (statusFlag == 0) {
			return "결제완료";
		} else if (statusFlag == 1 && groupType == "B") {
			return "결제대기";
		} else if (statusFlag == 1 && groupType == "S") {
			return "결제대기";
		} else if (statusFlag == 2 && groupType == "B") {
			return "기타지급요청";
		} else if (statusFlag == 2 && groupType == "S") {
			return "기타수금요청";
		} else if (statusFlag == 3) {
			return "대출승인";
		} else if (statusFlag == 4) {
			return "변경요청";
		} else if (statusFlag == 5) {
			return "결제대기";
		} else if (statusFlag == 6) {
			return "취소요청";
		//} else if (statusFlag == 6 && groupType == "B") {
		//	return "결제대기";
		//} else if (statusFlag == 6 && groupType == "S") {
		//	return "대출요청";
		} else if (statusFlag == 7) {
			return "결제대기";
		} else if (statusFlag == 9) {
			return "결제전송중";
		} else if (statusFlag == 12 && groupType == "B") {
			return "기타지급승인"; // 승인완료
		} else if (statusFlag == 12 && groupType == "S") {
			return "기타수금승인"; // 승인완료
		} else if (statusFlag == 13 && groupType == "B") {
			return "기타지급취소";
		} else if (statusFlag == 13 && groupType == "S") {
			return "기타수금취소";
		} else if (statusFlag == 30 && groupType == "B") {
			return "상계지급승인"; // 승인완료
		} else if (statusFlag == 30 && groupType == "S") {
			return "상계수금승인"; // 승인완료
		} else if (statusFlag == 39 && groupType == "B") {
			return "상계지급취소"; // 승인완료
		} else if (statusFlag == 39 && groupType == "S") {
			return "상계수금취소"; // 승인완료
		} else if (statusFlag == 31 && groupType == "B") {
			return "상계지급요청"; // 승인완료
		} else if (statusFlag == 31 && groupType == "S") {
			return "상계수금요청"; // 승인완료
		} else {
			return "";
		}
	}

	/****************************** START popup ******************************/
	// 확인 팝업 열기
	function openConfirm(text, callback, args) {
		$_CONFIRM.find(".msg-txt").html(text);
		$_CONFIRM.find(".ok").off().on("click", function() {
			if (callback != undefined) {
				callback.apply(this, args);
			}
		});
		$_CONFIRM.fadeIn();
	}

	// 확인 팝업 닫기
	function closeConfirm() {
		$_CONFIRM.find(".msg-txt").text("");
		$_CONFIRM.hide();
	}

	// 알림 팝업 열기
	function openAlert(text, callback, args) {
		$_ALERT.find(".msg-txt").html(text);
		$_ALERT.find(".ok").off().on("click", function() {
			if (callback != undefined) {
				callback.apply(this, args);
			}
		});
		$_ALERT.fadeIn();
	}

	// 알림 팝업 닫기
	function closeAlert() {
		$_ALERT.hide();
		$_ALERT.find(".msg-txt").text("");
	}

	// TODO fix - 확인 클릭시 공인인증서 로그인 페이지로 이동
	// 공인인증서 알림 팝업 열기
	function openCertificateAlert(callback, args) {
		$_MASK.show();
		$(".certificatePopup").find(".ok").off().on("click", function() {
			if (callback != undefined) {
				callback.apply(this, args);
			}
		});
		$(".certificatePopup").fadeIn();
	}

	// 공인인증서 알림 팝업 닫기
	function closeCertificateAlert(callback, args) {
		$(".certificatePopup").hide();
		$_MASK.hide();
	}
	/****************************** END popup ******************************/

	/****************************** START 거래처 찾기 ******************************/
	var $_SEARCH_OFFICE = $(".officePopup");
	var $_SEARCH_MY_OFFICE = $(".myOfficePopup");
	var SEARCH_OFFICE_LIST_URL = (MEMB_CLASS == "B") ? "<c:url value='/buyer/officesItem/list.json' />" : "<c:url value='/seller/officesItem/list.json' />";
	var SEARCH_MY_OFFICE_LIST_URL = (MEMB_CLASS == "B") ? "<c:url value='/buyer/myOfficesItem/list.json' />" : "<c:url value='/seller/myOfficesItem/list.json' />";
	var SEARCH_MY_OFFICE_ADD_URL = (MEMB_CLASS == "B") ? "<c:url value='/buyer/myOfficesItem/insert.json'/>" : "<c:url value='/seller/myOfficesItem/insert.json' />";
	var SEARCH_MY_OFFICE_DELETE_URL = (MEMB_CLASS == "B") ? "<c:url value='/buyer/myOfficesItem/delete.json'/>" : "<c:url value='/seller/myOfficesItem/delete.json' />";
	var NO_OFFICE_CHOICE_MSG = (MEMB_CLASS == "B") ? "선택된 품목점이 없습니다." : "선택된 대리점이 없습니다.";
	var MY_OFFICE_ADD_MSG = (MEMB_CLASS == "B") ? "선택한 품목점을 추가하시겠습니까?" : "선택한 대리점을 추가하시겠습니까?";
	var MY_OFFICE_DELETE_MSG = (MEMB_CLASS == "B") ? "선택한 품목점을 삭제하시겠습니까?" : "선택한 대리점을 삭제하시겠습니까?";

	// 거래처 내역(상세) 조회
	function searchForShop(bizNo) {
		if (bizNo == undefined) {
			var length = checkedItemLength("chk_store");

			if (length == 0) {
				openAlert(NO_OFFICE_CHOICE_MSG);
			} else if (length > 1) {
				openAlert("한개 이상 조회가 불가능 합니다.");
			} else {
				bizNo = $("input[name=chk_store]:checked").prev().val();
				$("#targetBizNo").val(bizNo);
				submitSearchForm();
			}
		} else {
			$("#targetBizNo").val(bizNo);
			submitSearchForm();
		}
	}

	// 거래처 목록 조회 성공
	function searchOfficesSuccess(data) {
		if ($_SEARCH_OFFICE.is(":visible")) {
			$_SEARCH_OFFICE.find("tbody").html(getOfficeList("office", data));
		} else if ($_SEARCH_MY_OFFICE.is(":visible")) {
			$_SEARCH_MY_OFFICE.find("tbody").html(getOfficeList("myOffice", data));
		}
	}

	// 거래처 목록 html
	function getOfficeList(type, data) {
		var dataLength = data.length;
		var html = "";

		if (dataLength > 0) {
			switch (type) {
			case "office": // 거래처
				for (i = 0; i < data.length; i++) {
					html += "<tr>" + "<td><input type='checkbox' name='chk_store' id='chk_store" + i + "' value='" + data[i].businessNo + "' /><label for='chk_store" + i + "'><span></span></label></td>" + "<td>" + (i + 1) + "</td>" + "<td><a href=\"javascript:;\" onclick=\"searchForShop('" + data[i].businessNo + "')\">" + data[i].companyName + " [" + data[i].membNo + "]</a></td>" + "<td>" + data[i].businessNo + "</td>" + "</tr>";
				}
				break;
			case "myOffice": // 내 거래처
				for (i = 0; i < data.length; i++) {
					html += "<tr>" + "<td><input type='checkbox' name='chk_store' id='chk_store" + i + "' value='" + data[i].itemCode + "' /><label for='chk_store" + i + "'><span></span></label></td>" + "<td>" + (i + 1) + "</td>" + "<td><a href=\"javascript:;\" onclick=\"searchForShop('" + data[i].itemCode + "')\">" + data[i].companyName + " [" + data[i].membNo + "]</a></td>" + "<td>" + data[i].itemCode + "</td>" + "</tr>";
				}
				break;
			default:
				break;
			}
		} else {
			html = "<tr><td colspan='4'>데이터가 없습니다.</td></tr>";
		}

		return html;
	}

	// 거래처 찾기 팝업 내 검색
	function searchOffices() {
		var keyword = $("#officesSearchKeyword").val().trim();
		var jsonData = "keyword=" + keyword;

		if (keyword.length > 0) {
			doAjax(SEARCH_OFFICE_LIST_URL, jsonData, searchOfficesSuccess);
		} else {
			openAlert("검색어를 입력해주세요.");
		}
	}

	// 내 거래처 추가 버튼 클릭
	function addMyShop() {
		openConfirm(MY_OFFICE_ADD_MSG, modifyMyShop, [ "add" ]);
	}

	// 내 거래처 삭제 버튼 클릭
	function removeMyShop() {
		openConfirm(MY_OFFICE_DELETE_MSG, modifyMyShop, [ "delete" ]);
	}

	// 내 거래처 추가 || 삭제
	function modifyMyShop(type) {
		$_CONFIRM.hide();

		var length = checkedItemLength("chk_store");
		var itemCodeList = [];

		$("input[name=chk_store]:checked").each(function() {
			itemCodeList.push($(this).val());
		});

		var jsonData = {businessNo : "${user.businessNo}", itemCodeList : itemCodeList};

		if (length == 0) {
			openAlert(NO_OFFICE_CHOICE_MSG);
			return;
		} else {
			if (type == "add") { // 추가
				doAjax(SEARCH_MY_OFFICE_ADD_URL, jsonData, ajaxSuccessSubmit);
			} else if (type == "delete") { // 삭제
				doAjax(SEARCH_MY_OFFICE_DELETE_URL, jsonData, ajaxSuccessSubmit);
			} else {
				return;
			}
		}
	}

	$(function() {
		// 품목점/대리점 텍스트 변경
		if(MEMB_CLASS == "B") {
			$(".officeType").text("품목점");
		} else if(MEMB_CLASS == "S") {
			$(".officeType").text("대리점");
		} else {
			$(".officeType").text("거래처");
		}

		// 거래처 찾기 팝업 열기
		$("#searchShopBtn").click(function() {
			$("body").css("overflow", "hidden");
			$_MASK.show();
			$(".popup07").find("tbody").empty();
			$_SEARCH_OFFICE.fadeIn();
			$("#officesSearchKeyword").val($("searchKeyword").val());
			doAjax(SEARCH_OFFICE_LIST_URL, "keyword=", searchOfficesSuccess);
		});

		// 내 거래처 찾기 팝업 열기
		$("#searchMyShopBtn").click(function() {
			$("body").css("overflow", "hidden");
			$_MASK.show();
			$(".popup07").find("tbody").empty();
			$_SEARCH_MY_OFFICE.fadeIn();
			doAjax(SEARCH_MY_OFFICE_LIST_URL, "keyword=", searchOfficesSuccess);
		});

		// 거래처 찾기 팝업 내 검색 - 엔터
		$("#popup").on("keyup", "#officesSearchKeyword", function(e) {
			if (e.which == 13) {
				searchOffices();
				e.preventDefault();
			}
		});
	});
	/****************************** END 거래처 찾기 ******************************/

	/****************************** START ******************************/
	$(function() {
		// detepicker 한국어 설정
		datepickerKo();

		// 팝업 드래그 설정
		$( ".draggable" ).draggable();

		// 팝업 닫기
		$(document).on("click", ".btn-close", function() {
			var $parent = $(this).parent("div");

			$parent.hide();

			if ($parent.attr("id") == "popup") {
				$_MASK.hide();
			}

			if($("body").css("overflow") == "hidden") {
				$("body").css("overflow", "visible");
			}
		});

		// 검색조건이 바뀌면 페이지 번호 초기화
		if ($("#pageIndex").length > 0) {
			$("#searchForm").on("change", "input", function() {
				if ($(this).attr("id") == pageIndex) {
					return false;
				} else {
					$("#pageIndex").val(1);
				}
			});

			$("#searchForm").on("change", "select", function() {
				$("#pageIndex").val(1);
			});
		}
	});
	/****************************** END ******************************/

	/****************************** START 대출요청 페이지로 이동 ******************************/
	var HCI_URL = "http://b2b.hyundaicommercial.com/mbs/pl/0201executeLoan.hc"; // 대출요청 URL

	// HCI 이동
	function linkToHci(issueDate, expirationDate, transactionNo) {
		$("#stdt").val("");
		$("#endt").val("");
		$("#crdt").val("");

		openConfirm("해당 채권에 대하여 대출요청 페이지로<br />이동 하시겠습니까?", function(issueDate, expirationDate, transactionNo){
			var form = $("#linkToHciForm")[0];
			var target = form.id;

			issueDate = issueDate.replace(/\./g, "");
			expirationDate = expirationDate.replace(/\./g, "");

			$("#stdt").val(issueDate);
			$("#endt").val(expirationDate);
			$("#crdt").val(transactionNo);
			$("#from").val("inib2b");

			window.open("", target, "fullscreen=yes, toolbar=yes, menubar=yes, location=yes, resizable=yes, scrollbars=yes");
			form.action = HCI_URL;
			form.target = target;
			form.method = "post";
			form.submit();
			closeConfirm();
		}, [issueDate, expirationDate, transactionNo]);
	}
	/****************************** END 대출요청 페이지로 이동 ******************************/

	/****************************** START cookie ******************************/
	// 쿠키 만들기
	function setCookie(name, value, expiredays) {
		var today = getDate();
		today.setDate(today.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) + "; path=/; expires=" + today.toGMTString() + ";"
	}

	// 쿠키 가져오기
	function getCookie(name) {
		var cName = name + "=";
		var x = 0;
		while (x <= document.cookie.length) {
			var y = (x + cName.length);
			if (document.cookie.substring(x, y) == cName) {
				if ((endOfCookie=document.cookie.indexOf(";", y )) == -1) endOfCookie = document.cookie.length;
				return unescape(document.cookie.substring(y, endOfCookie));
			}

			x = document.cookie.indexOf(" ", x) + 1;
			if ( x == 0 ) break;
		}

		return "";
	}
	/****************************** END cookie ******************************/
</script>