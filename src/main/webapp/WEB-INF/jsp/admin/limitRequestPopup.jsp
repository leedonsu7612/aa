<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	/**
	* @Class Name : limitRequestPopup.jsp
	* @Description : 대리점한도요청 팝업
	* @Modification Information
	*
	*   수정일     수정자      수정내용
	*  -------    --------    ---------------------------
	*  2018.12.05              최초 생성
	*
	* author CDF Team
	* since 2018.12.05
	*
	*/
%>
		<div>
			<form id="reqForm" name="reqForm" action="<c:url value='/admin/insertLimitRequest.json'/>" method="post" enctype="multipart/form-data" >    
			    <input id="reqId" name="reqId" type="hidden" value="${resultVO.reqId}">
			    <input id="businessNo" name="businessNo" type="hidden" value="${resultVO.businessNo}">
			    <input id="processNo" name="processNo" type="hidden" value="1">
				<input id="attchFileId" name="attchFileId" type="hidden" value="<c:out value="${resultVO.attchFileId}"/>" />
				<input id="rcvBizNo" name="rcvBizNo" type="hidden" value="<c:out value="${resultVO.rcvBizNo}"/>" />
				<ul>
					<li><span>요청내용</span>
						<div class="tbl-type02">
							<table summary="">
								<caption>요청내용 작성</caption>
								<colgroup>
									<col width="124" />
									<col />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">구분</th>
										<td>
											<input type="radio" id="lmtReqGbn1" name="lmtReqGbn" value="LM01" <c:if test='${resultVO.lmtReqGbn eq "LM01"}'>checked</c:if>/><label for="lmtReqGbn1"><span></span>최초 한도설정</label>
											<input type="radio" id="lmtReqGbn2" name="lmtReqGbn" value="LM02" <c:if test='${resultVO.lmtReqGbn eq "LM02"}'>checked</c:if>/><label for="lmtReqGbn2"><span></span>한도증액</label>
											<input type="radio" id="lmtReqGbn3" name="lmtReqGbn" value="LM03" <c:if test='${resultVO.lmtReqGbn eq "LM03"}'>checked</c:if>/><label for="lmtReqGbn3"><span></span>한도감액</label>
											<input type="radio" id="lmtReqGbn4" name="lmtReqGbn" value="LM04" <c:if test='${resultVO.lmtReqGbn eq "LM04"}'>checked</c:if>/><label for="lmtReqGbn4"><span></span>한도이관</label>
											<input type="radio" id="lmtReqGbn5" name="lmtReqGbn" value="LM05" <c:if test='${resultVO.lmtReqGbn eq "LM05"}'>checked</c:if>/><label for="lmtReqGbn5"><span></span>휴업</label>
											<input type="radio" id="lmtReqGbn6" name="lmtReqGbn" value="LM06" <c:if test='${resultVO.lmtReqGbn eq "LM06"}'>checked</c:if>/><label for="lmtReqGbn6"><span></span>폐업</label>
										</td>
									</tr>
								</tbody>
								<tbody id="limit1">
									<tr>
										<th scope="row">기존한도</th>
										<td class="txt-r" id="salesLimit"><fmt:formatNumber value="${resultVO.salesLimit }" pattern="#,### 원" /></td>
									</tr>
									<tr>
										<th scope="row">변경한도</th>
										<td class="txt-r" id="deltaLimit"><fmt:formatNumber value="${resultVO.reqLimit - resultVO.salesLimit}" pattern="#,### 원" /></td>
									</tr>
									<tr>
										<th scope="row">변경후 한도</th>
										<td class="txt-r"><input type="text" id="reqLimit" name="reqLimit" class="txt-r wp100" value="<c:out value='${resultVO.reqLimit}'/>"/></td>
									</tr>
									<tr>
										<th scope="row">변동후 고정여부</th>
										<td>
											<input type="radio" id="fixAt1" name="fixAt" value="Y" <c:if test='${resultVO.fixAt eq "Y"}'>checked</c:if>/><label for="fixAt1"><span></span>Y</label>
											<input type="radio" id="fixAt2" name="fixAt" value="N" <c:if test='${resultVO.fixAt eq "N"}'>checked</c:if>/><label for="fixAt2"><span></span>N</label>
										</td>
									</tr>
								</tbody>
								<tbody id="limit2" style="display:none;">
									<tr>
										<th scope="row">양수 대리점</th>
										<td>
											<ul>
							  					<c:if test="${empty resultVO.rcvBizNo}">
												<li class="fs-red">대리점 정보 없음</li>
												</c:if>
							  					<c:if test="${not empty resultVO.rcvBizNo}">
												<li><c:out value="${resultVO.rcvCoNm}"/> / <c:out value="${resultVO.rcvMembNo}"/><br/><c:out value="${resultVO.rcvBizNo}"/></li>
												</c:if>
											</ul>
											<a href="#" id="searchBuyer" class="btn-view2" onClick="javascript:buyerSearchPopup();">대리점 조회</a>
										</td>
									</tr>
									<tr>
										<th scope="row">변경유형</th>
										<td>
											<input type="radio" id="rcvType1" name="rcvType" value="1" <c:if test='${resultVO.rcvType eq "1"}'>checked</c:if>/><label for="rcvType1"><span></span>개인 → 법인전환</label>
											<input type="radio" id="rcvType2" name="rcvType" value="2" <c:if test='${resultVO.rcvType eq "2"}'>checked</c:if>/><label for="rcvType2"><span></span>인수합병</label>
										</td>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<th scope="row">첨부파일</th>
										<td>
                                		<div class="file-bx">
											<div class="upload-btn_wrap">
												<input type="text" class="upload_text" readonly>
												<button type="button" title="파일찾기"><span>찾아보기</span></button>
												<input type="file" name="ajaxfile" id="uploadFile" class="input_file" title="파일찾기">
											</div>
											<div id="progress" class="progress">
											    <div class="progress-bar progress-bar-success"></div>
											</div>
										</div>
							  			<c:if test="${not empty resultVO.attchFileId}">
						                <c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfsForUpdate.do" >
						                    <c:param name="param_atchFileId" value="${resultVO.attchFileId}" />
						                </c:import>                             
							  			</c:if>      
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<p class="mt10">※ 첨부파일 최대 10MB</p>
					</li>
					<li><span id="reqBuyer">요청 대상 대리점</span>
						<div class="tbl-type02">
							<table summary="">
								<caption>요청 대상 대리점 작성</caption>
								<colgroup>
									<col width="124" />
									<col width="140" />
									<col width="124" />
									<col />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">대리점명</th>
										<td><c:out value="${resultVO.companyName}"/> / <c:out value="${resultVO.membNo}"/></td>
										<th scope="row">사업자번호</th>
										<td><c:out value="${resultVO.businessNo}"/></td>
									</tr>
									<tr>
										<th scope="row">거래한도</th>
										<td class="txt-r"><fmt:formatNumber value="${resultVO.salesLimit }" pattern="#,###" /></td>
										<th scope="row">공증금액</th>
										<td class="txt-r"><fmt:formatNumber value="${resultVO.notarialPrice }" pattern="#,###" /></td>
									</tr>
									<tr>
										<th scope="row">초과한도</th>
										<td class="txt-r"><fmt:formatNumber value="${resultVO.overLimit }" pattern="#,###" /></td>
										<th scope="row">잔여한도</th>
										<td class="txt-r"><fmt:formatNumber value="${resultVO.remLimit }" pattern="#,###" /></td>
									</tr>
									<tr>
										<th scope="row">보증금액</th>
										<td class="txt-r"><fmt:formatNumber value="${resultVO.guaranteePrice }" pattern="#,###" /></td>
										<th scope="row">보증초과</th>
										<td class="txt-r"><fmt:formatNumber value="${resultVO.guaranteeOver }" pattern="#,###" /></td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
				</ul>
			</form>
	</div>
	<div class="btn-set">
		<a href="#NONE" class="btn-ok" onClick="javascript:requestClick();">요청</a>
		<a href="#NONE" class="cancel" onClick="javascript:reqCacelClick();">요청취소</a>
	</div>
	<div id="addLimitPopup" class="acc2-pop">
		<div class="msg-txt">
			한도요청을 하시겠습니까?
		</div>
		<div class="btn-set2">
			<a href="#NONE" id="addLimitOk">확인</a>
			<a href="#NONE" class="cancel" id="limitCancel">취소</a>
		</div>
	</div>
	<div id="alertPopup" class="acc2-pop">
		<div class="msg-txt">
			경고박스입니다.
		</div>
		<div class="btn-set2">
			<a href="#NONE" id="alertConfirm">확인</a>
		</div>
	</div>
	<script type="text/javascript">
		var reqLimit = 0;
		var salesLimit = 0;
		var deltaLimit = 0;
		$(function() {
			// load
			var lmtReqGbn = '<c:out value="${resultVO.lmtReqGbn}"/>';
			var processNo = '<c:out value="${resultVO.processNo}"/>';
			if(lmtReqGbn == 'LM04'){
			    $("#limit1").hide();
			    $("#limit2").show();
			    $("#reqBuyer").empty().text("양도 대상 대리점");
			}
			if(processNo == 0 || processNo == 100){
				$(".btn-set > .cancel").attr("disabled", true);
			}else{
				$(".btn-set > .btn-ok").attr("disabled", true);
				$("input[name=lmtReqGbn]").attr("disabled", true);
				$("input[name=fixAt]").attr("disabled", true);
				$("input[name=rcvType]").attr("disabled", true);
			    $("#reqLimit").attr("disabled", true);
			    $("#searchBuyer").attr("disabled", true);
			}
			// load
			
			$('input[name="reqLimit"]').keyup(function() {
		        $(this).val($(this).val().replace(/[^0-9]/gi, ""));
				reqLimit = parseInt($(this).val());
				salesLimit = parseInt($('#salesLimit').text().replace(/[^0-9]/gi, ""));
				deltaLimit = reqLimit - salesLimit;
				$('#deltaLimit').empty().text(numberWithCommas(deltaLimit) + " 원");
		    });

		    $("#lmtReqGbn1, #lmtReqGbn2, #lmtReqGbn3").click(function(){
			    $("#limit2").hide();
			    $("#limit1").show();
			    $("#reqLimit").attr("disabled", false);
			    $("#reqBuyer").empty().text("요청 대상 대리점");
			});

		    $("#lmtReqGbn5, #lmtReqGbn6").click(function(){
			    $("#limit2").hide();
			    $("#limit1").show();
				salesLimit = parseInt($('#salesLimit').text().replace(/[^0-9]/gi, ""));
				$('#deltaLimit').empty().text(numberWithCommas(salesLimit * (-1)) + " 원");
			    $("#reqLimit").val(0).attr("disabled", true);
			    $("#reqBuyer").empty().text("요청 대상 대리점");
			});

		    $("#lmtReqGbn4").click(function(){
			    $("#limit1").hide();
			    $("#limit2").show();
			    $("#reqBuyer").empty().text("양도 대상 대리점");
			});

		    $("#limitCancel").click(function() {
				$("#addLimitPopup").fadeOut("slow");
				return false;
			});
			
			$("#alertConfirm").click(function() {
				$("#alertPopup").fadeOut("slow");
				return false;
			});

			$("#uploadFile").on('change', function(){
				var filename = "";
				if(window.FileReader){	// mordern browser
					filename = $(this)[0].files[0].name;
				}else { // old IE 
					filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
				} 
				// 추출한 파일명 삽입
				$(this).siblings('.upload_text').val(filename); 
			});

		    var url = "<c:url value='/admin/upload.do'/>?attchFileId=" + document.reqForm.attchFileId.value;;
		    $('#uploadFile').fileupload({
		        url: url,
		        dataType: 'json',
		        replaceFileInput : false,
		        limitMultiFileUploadSize :  10000000,
		        done: function (e, data) {
		        	document.reqForm.attchFileId.value = data.result.attchFileId;
		        	$('.upload_text').val('');
		        	var appendStr = "<div><img src=\"<c:url value='/images/ico/ico-file.png'/>\" />&nbsp;";
		        	appendStr += data.result.oriFileNm + "&nbsp;[" + data.result.fileSize + "&nbsp;byte] ";
		        	appendStr += "<img src=\"<c:url value='/images/ico/ico-close2.png'/>\"";
		        	appendStr += "width=\"19\" height=\"18\" onClick=\"fn_egov_deleteFile(this,\'";
		        	appendStr += data.result.attchFileId + "\',\'" + data.result.fileSn + "\');\" /><br></div>";
		        	$(".file-bx").parent().append(appendStr);
		        },
		        fail: function (e, data) {
					$("#alertPopup > .msg-txt").text("파일의 크기가 10MBytes를 넘어 서버로 보내는데 실패했습니다."); //div 내용 변경
					$("#alertPopup").fadeIn("slow");
					$("#uploadFile").val('');
		        },
		        progressall: function (e, data) {
		            var progress = parseInt(data.loaded / data.total * 100, 10);
		            $('#progress .progress-bar').css(
		                'width',
		                progress + '%'
		            );
		        }
		    }).prop('disabled', !$.support.fileInput)
		        .parent().addClass($.support.fileInput ? undefined : 'disabled');

		    //요청 확인
			$("#addLimitOk").click(function() {
				if($('#processNo').val() == '0' && $('#reqId').val() == ''){
					closeMaskedPopup($('.popup01'));
					return false;
				}
				if($('#processNo').val() == '1' && $('#reqId').val() != ''){
					closeMaskedPopup($('.popup01'));
					return false;
				}
				$("#loadingPopup").css("visibility", "visible");
	
				var ajaxUrl = $("#reqForm").attr("action");
				var jsonData = $('#reqForm').serialize();

				$.ajax({
					url : ajaxUrl,
					type : "post",
					data : jsonData,
					dataType : "json",
					success : function(data) {
						if (data == "Success") { //성공
						   	document.searchForm.pageIndex.value = "1";
							fn_selectList();
							closeMaskedPopup($('.popup01'));
						} else { //실패
							$("#alertPopup > .msg-txt").text("<통신 실패>" + "\n" + "ERROR : " + get_data["errorMessage"]);
							$("#alertPopup").fadeIn("show");
						} 
					},
					error : function(request, status, error) {
						//실패
						$("#alertPopup > .msg-txt").text("<통신 실패>" + "\n" + "CODE : " + request.status + "\n" + "ERROR : " + error);
						$("#alertPopup").fadeIn("show");
					}
				});

				$("#loadingPopup").css("visibility", "hidden");

				return false;
			});
		});

		function requestClick(){
			var lmtReqGbn = $("input[name=lmtReqGbn]:checked").val();

			if (lmtReqGbn == null || lmtReqGbn == "") {
				$("#alertPopup > .msg-txt").text("선택된 구분이 없습니다."); //div 내용 변경
				$("#alertPopup").fadeIn("slow");
				return false;
			}

			if(lmtReqGbn == "LM01" && salesLimit > 0){
				$("#alertPopup > .msg-txt").html("기존설정된 한도가 있는데,<br/> 최초 한도 설정을 선택했습니다."); //div 내용 변경
				$("#alertPopup").fadeIn("slow");
				return false;
			}

			if(lmtReqGbn == "LM02" && deltaLimit < 0){
				$("#alertPopup > .msg-txt").text("기존설정된 한도보다 적게 설정되어 있습니다."); //div 내용 변경
				$("#alertPopup").fadeIn("slow");
				return false;
			}
			
			if(lmtReqGbn == "LM03" && deltaLimit > 0){
				$("#alertPopup > .msg-txt").text("기존설정된 한도보다 많게 설정되어 있습니다."); //div 내용 변경
				$("#alertPopup").fadeIn("slow");
				return false;
			}
			
			if(lmtReqGbn == "LM04" && $("#rcvBizNo").val() == ""){
				$("#alertPopup > .msg-txt").text("양수기업이 선택되지 않았습니다."); //div 내용 변경
				$("#alertPopup").fadeIn("slow");
				return false;
			}
			
			// 파일 확장자 검사
	 		var isOkExt = true;
	 		var ext = $("#uploadFile").val().split('.').pop().toLowerCase();

			if($("#uploadFile").val() != null && $("#uploadFile").val() != ""){
	 			if($.inArray(ext, ["hwp","xls","xlsx","docx","pdf","jpg","xlsm","xlsb","xltx","xlt","txt","csv","prn","dif","slk","xlam","xla","xps","hwpx","hwt","bmp","jgp","gif","png","docm","doc","dotx","dotm","dot","pptx","ppt","pptm","potx","potm","pot","thmx","ppsx","ppsm","pps","ppam","ppa","tif","zip","rtf"]) == -1) {
	 				 isOkExt = false;
	 			}
			}
	 		if (!isOkExt) {
				$("#alertPopup > .msg-txt").text("등록할 수 없는 파일 확장자가 포함되어 있습니다."); //div 내용 변경
				$("#alertPopup").fadeIn("slow");
	 			return;
	 		}

	 		$("#addLimitPopup").fadeIn("slow"); //요청 하시겠습니까
			return false;
		}

		function reqCacelClick(){
	    	document.reqForm.processNo.value = "101";
			$("#addLimitPopup > .msg-txt").text("한도요청을 취소 하시겠습니까?"); //div 내용 변경
			$("#addLimitPopup").fadeIn("slow");
			return false;
		}

		function buyerSelectClick(companyName, membNo, businessNo){
			$("#limit2 .fs-red").html(companyName + "/" + membNo + "<br/>" + businessNo);
	    	document.reqForm.rcvBizNo.value = businessNo;
		}
	</script>				