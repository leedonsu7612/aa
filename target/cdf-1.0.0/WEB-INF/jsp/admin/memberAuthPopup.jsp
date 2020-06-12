<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	/**
	* @Class Name : memberAuthPopup.jsp
	* @Description : 사용자권한설정 팝업
	* @Modification Information
	*
	*   수정일     수정자      수정내용
	*  -------    --------    ---------------------------
	*  2018.12.20              최초 생성
	*
	* author CDF Team
	* since 2018.12.20
	*
	*/
%>
		<form id="regForm" name="regForm" action="<c:url value='/admin/updateMemberAuth.json'/>" method="post">    
		<input id="userSeqNo" name="userSeqNo" type="hidden" value="${resultVO.userSeqNo}">
		<input id="sendSMS" name="sendSMS" type="hidden" value="N">
		<div class="tbl-type02 mt30">
			<table summary="">
				<caption>사용자 설정화면</caption>
				<colgroup>
					<col width="124" />
					<col />
					<col width="124" />
					<col />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">ID</th>
						<td><c:out value="${resultVO.userId}"/></td>
						<th scope="row">PASSWORD</th>
						<td><c:out value="${resultVO.userPw}"/></td>
					</tr>
					<tr>
						<th scope="row">이름</th>
						<td><c:out value="${resultVO.companyName}"/></td>
						<th scope="row">정지여부</th>
						<td>
							<input type="radio" id="isDelete1" name="isDelete" value="Y" <c:if test='${resultVO.isDelete eq "Y"}'>checked</c:if>/><label for="isDelete1"><span></span>Y</label>
							<input type="radio" id="isDelete2" name="isDelete" value="N" <c:if test='${resultVO.isDelete eq "N"}'>checked</c:if>/><label for="isDelete2"><span></span>N</label>
						</td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td colspan="3">
				  			<c:if test="${not empty resultVO.attchFileId}">
			                <c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" >
			                    <c:param name="param_atchFileId" value="${resultVO.attchFileId}" />
			                </c:import>                             
				  			</c:if>      
						</td>
					</tr>
					<tr>
						<th scope="row">부여권한</th>
						<td colspan="3" class="rad-bx">
							<input type="radio" id="membClass1" name="membClass" value="B" <c:if test='${resultVO.membClass eq "B"}'>checked</c:if>/><label for="membClass1"><span></span>대리점</label>
							<input type="radio" id="membClass2" name="membClass" value="S" <c:if test='${resultVO.membClass eq "S"}'>checked</c:if>/><label for="membClass2"><span></span>품목점</label>
							<input type="radio" id="membClass3" name="membClass" value="M" <c:if test='${resultVO.membClass eq "M"}'>checked</c:if>/><label for="membClass3"><span></span>모비스(부서원)</label>
							<input type="radio" id="membClass4" name="membClass" value="N" <c:if test='${resultVO.membClass eq "N"}'>checked</c:if>/><label for="membClass4"><span></span>모비스(부서장)</label>
							<input type="radio" id="membClass5" name="membClass" value="H" <c:if test='${resultVO.membClass eq "H"}'>checked</c:if>/><label for="membClass5"><span></span>HCI(부서원)</label>
							<input type="radio" id="membClass6" name="membClass" value="I" <c:if test='${resultVO.membClass eq "I"}'>checked</c:if>/><label for="membClass6"><span></span>HCI(부서장)</label>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn-set">
			<a href="#NONE" onClick="javascript:saveClick();">저장</a>
		</div>
		</form>
	<div id="saveOKPopup" class="acc2-pop">
		<div class="msg-txt">
			저장 하시겠습니까?
		</div>
		<div class="btn-set2">
			<a href="#NONE" id="saveOk">확인</a>
			<a href="#NONE" class="cancel" id="saveCancel">취소</a>
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
		$(function() {
		    $("#saveCancel").click(function() {
				$("#saveOKPopup").fadeOut("slow");
				return false;
			});
			
			$("#alertConfirm").click(function() {
				$("#alertPopup").fadeOut("slow");
				return false;
			});

		    //요청 확인
			$("#saveOk").click(function() {
				$("#loadingPopup").css("visibility", "visible");
	
				var ajaxUrl = $("#regForm").attr("action");
				var jsonData = $('#regForm').serialize();

				$.ajax({
					url : ajaxUrl,
					type : "post",
					data : jsonData,
					dataType : "json",
					success : function(data) {
						if (data == "Success") { //성공
							reload_page();
							closeMaskedPopup($('.popup06'));
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

		function saveClick(){			
			var isDelete = $("input[name=isDelete]:checked").val();
			var membClass = $("input[name=membClass]:checked").val();
			if(isDelete == '${resultVO.isDelete}' && membClass == '${resultVO.membClass}'){
				closeMaskedPopup($('.popup06'));
				return false;
			}
			if(isDelete == 'N'){
				$('#regForm #sendSMS').val('Y');
			}
	 		$("#saveOKPopup").fadeIn("slow"); //저장 하시겠습니까?
			return false;
		}
	</script>				