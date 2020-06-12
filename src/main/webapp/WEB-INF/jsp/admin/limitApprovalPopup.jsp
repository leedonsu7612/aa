<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	/**
	* @Class Name : limitApprovalPopup.jsp
	* @Description : 대리점한도요청 모비스부서장 승인팝업
	* @Modification Information
	*
	*   수정일     수정자      수정내용
	*  -------    --------    ---------------------------
	*  2018.12.06              최초 생성
	*
	* author CDF Team
	* since 2018.12.06
	*
	*/
%>
		<div>
			<form id="reqForm" name="reqForm" action="<c:url value='/admin/insertLimitRequest.json'/>" method="post">    
			    <input id="reqId" name="reqId" type="hidden" value="${resultVO.reqId}">
			    <input id="businessNo" name="businessNo" type="hidden" value="${resultVO.businessNo}">
			    <input id="lmtReqGbn" name="lmtReqGbn" type="hidden" value="${resultVO.lmtReqGbn}">
			    <input id="reqLimit" name="reqLimit" type="hidden" value="${resultVO.reqLimit}">
			    <input id="fixAt" name="fixAt" type="hidden" value="${resultVO.fixAt}">
			    <input id="rcvBizNo" name="rcvBizNo" type="hidden" value="${resultVO.rcvBizNo}">
			    <input id="rcvMembYn" name="rcvMembYn" type="hidden" value="${resultVO.rcvMembYn}">
			    <input id="rcvType" name="rcvType" type="hidden" value="${resultVO.rcvType}">
			    <input id="attchFileId" name="attchFileId" type="hidden" value="${resultVO.attchFileId}">
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
										 <c:choose>
											<c:when test="${resultVO.lmtReqGbn eq 'LM01'}">최초 한도설정</c:when>
											<c:when test="${resultVO.lmtReqGbn eq 'LM02'}">한도증액</c:when>
											<c:when test="${resultVO.lmtReqGbn eq 'LM03'}">한도감액</c:when>
											<c:when test="${resultVO.lmtReqGbn eq 'LM04'}">한도이관</c:when>
											<c:when test="${resultVO.lmtReqGbn eq 'LM05'}">휴업</c:when>
											<c:when test="${resultVO.lmtReqGbn eq 'LM06'}">폐업</c:when>
										 </c:choose>
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
										<td class="txt-r" id="reqLimit"><fmt:formatNumber value="${resultVO.reqLimit}" pattern="#,### 원" /></td>
									</tr>
									<tr>
										<th scope="row">변동후 고정여부</th>
										<td><c:out value="${resultVO.fixAt}"/></td>
									</tr>
								</tbody>
								<tbody id="limit2" style="display:none;">
									<tr>
										<th scope="row">양수 대리점</th>
										<td>
											<p class="fs-bold"><c:out value="${resultVO.rcvCoNm}"/> / <c:out value="${resultVO.rcvMembNo}"/></p>
											<p class="fs-bold"><c:out value="${resultVO.rcvBizNo}"/></p>
										</td>
									</tr>
									<tr>
										<th scope="row">변형유형</th>
										<td>
										 <c:choose>
											<c:when test="${resultVO.rcvType eq '1'}">개인 → 법인전환</c:when>
											<c:when test="${resultVO.rcvType eq '2'}">인수합병</c:when>
										 </c:choose>
										</td>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<th scope="row">첨부파일</th>
										<td>
							  			<c:if test="${not empty resultVO.attchFileId}">
						                <c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" >
						                    <c:param name="param_atchFileId" value="${resultVO.attchFileId}" />
						                </c:import>                             
							  			</c:if>      
										</td>
									</tr>
								</tbody>
							</table>
						</div>
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
					<li><span>처리내역</span>
						<div class="tbl-type02">
							<table summary="">
								<caption>처리내역 작성</caption>
								<colgroup>
									<col width="124" />
									<col />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">진행상태</th>
										<td>
											<input type="radio" id="processNo1" name="processNo" value="2" <c:if test='${resultVO.processNo eq "2"}'>checked</c:if>/><label for="processNo1"><span></span>승인</label>
											<input type="radio" id="processNo2" name="processNo" value="97" <c:if test='${resultVO.processNo eq "97"}'>checked</c:if>/><label for="processNo2"><span></span>취소</label>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
				</ul>
			</form>
	</div>
	<div class="btn-set">
		<a href="#NONE" onClick="javascript:approvalClick();">저장</a>
	</div>
	<div id="addLimitPopup" class="acc2-pop">
		<div class="msg-txt">
			한도요청을 승인 하시겠습니까?
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
		$(function() {
			var lmtReqGbn = '<c:out value="${resultVO.lmtReqGbn}"/>';
			if(lmtReqGbn == 'LM04'){
			    $("#limit1").hide();
			    $("#limit2").show();
			    $("#reqBuyer").empty().text("양도 대상 대리점");
			}

			$("#limitCancel").click(function() {
				$("#addLimitPopup").fadeOut("slow");
				return false;
			});
			
			$("#alertConfirm").click(function() {
				$("#alertPopup").fadeOut("slow");
				return false;
			});

			//승인 확인
			$("#addLimitOk").click(function() {
				if($("input[name=processNo]:checked").val() == '<c:out value="${resultVO.processNo}"/>'){
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

				return false;
			});
		});

		function approvalClick(){			
			if($("input[name=processNo]:checked").val() == '97'){
				$("#addLimitPopup > .msg-txt").text("한도요청을 취소 하시겠습니까?"); //div 내용 변경
			}
			$("#addLimitPopup").fadeIn("slow"); //요청 하시겠습니까
			return false;
		}
	</script>				