<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	
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
				<변경 또는 취소승인 확인>
                                           해당 매출채권에 대하여 변경승인 하시겠습니까?
				<div id="aa" class="btn_group ac mt30">
					<span class="btn btn_popup">
						<a id="changeOk" href="javascript:;">확인</a>
					</span>
					<span class="btn btn_popup">
						<a id="rejectItem" href="javascript:;">반려</a>
					</span>
					<span class="btn btn_normal" id="accountCancel">
								<a href="javascript:;" style="width: 80px;">취소</a> 
					</span> 
				</div>
			<!-- 	<div id="deleteMyOfficesPopup" class="alert_popup1">
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
				</div> -->
			
			
			</div>
		</div>
		<!-- //CONTAINER -->
<input type="hidden" id="changeJson" value="/seller/accountReceivable/change.json">
<!-- <input type="hidden" id="cancelJson" value="/seller/accountReceivable/cancel.json">
<input type="hidden" id="allApproveJson" value="/seller/accountReceivable/allApprove.json">
<input type="hidden" id="rejectJson" value="/seller/accountReceivable/reject.json">  -->

<form id="dataForm" action="/seller/accountReceivable/list.do" method="post">
<<!-- input id="taxBillNumber" name="taxBillNumber" type="hidden" value=""/>
<input id="transactionNumber" name="transactionNumber" type="hidden" value=""/>
<input id="beforeExpirationDate" name="beforeExpirationDate" type="hidden" value=""/>
<input id="afterExpirationDate" name="afterExpirationDate" type="hidden" value=""/>
<input id="amountOfMoney" name="amountOfMoney" type="hidden" value="0"/>
<input id="expirationAvg" name="expirationAvg" type="hidden" value=""/> -->
 <input id="transactionNo" name="transactionNo" type="hidden" value="${params.transactionNo}">
 <%-- <input id="businessNo" name="businessNo" type="hidden" value="${resultVO.businessNo}"> --%>
 <input id="progressFlag" name="progressFlag" type="hidden" value="${params.progressFlag}">
 <input id="expirationDate" name="expirationDate" type="hidden" value="${params.progressFlag}"/>
<input id="afterExpirationDate" name="afterExpirationDate" type="hidden" value=""/>
</form>
		
	</div>
	<script type="text/javascript">
	var isClicked = false;          //첫라인에 추가
    //test status
    function getTestProgressStatus(flag) {
        if (flag == 0)
            return "변경요청";
        else if (flag == 1)
            return "취소요청";
    }

	//변경요청 클릭
    $("#transactionTable > tbody > tr > td > #changeRequest").click(
            function(e) {
                $("#taxBillNumber").val(
                        $(this).parents("tr").find("#taxBillNum").val());
                $("#transactionNumber")
                        .val(
                                $(this).parents("tr").find(
                                        "#transactionNum").val());
                $("#beforeExpirationDate")
                .val(
                        $.trim($(this).parents("tr").find(
                                "#beforeFinalDate").text()));
                
                $("#afterExpirationDate")
                .val(
                        $.trim($(this).parents("tr").find(
                                "#afterFinalDate").text()));
                
                $("#expirationAvg")
                .val(
                        $.trim($(this).parents("tr").find("#afterFinalDate").attr("expirationAvg"))
                        );

                $("#change_popup").fadeIn("slow");
            });
	
	//확인
	$("#changeOk").click(function() {
	    if(isClicked){          
            return false;          
        }                   
        isClicked = true;    
        var before = $.datepicker.parseDate( 'yy.mm.dd', '2017.12.31');
        alert(before);
        var today = $.datepicker.parseDate( 'yy.mm.dd', '2017.12.31' );
       /*  //if ( today.getHours() >= 17 ){
        //	today.setDate(today.getDate() + 1);
        //} */
      
        today.setHours(0);
        today.setMinutes(0);
        today.setSeconds(0);
        today.setMilliseconds(0);
       
        var after = $.datepicker.parseDate( 'yy.mm.dd', '2017.12.31' );
        if (  Math.ceil((today - before) / (1000 * 60 * 60 * 24)) > 0 ) {
        	alert('변경전 만기일이 당일(17시 이후일 경우 익일)포함 이전의 경우 \r\n 변경 승인 하실수 없습니다.');
        	isClicked = false;
        	return false;
        }
        if (  Math.ceil((today - after) / (1000 * 60 * 60 * 24)) > 0 ) {
        	alert('변경 만기일이 당일(17시 이후일 경우 익일)포함 이전의 경우 \r\n 변경 승인 하실수 없습니다.');
        	isClicked = false;
        	return false;
        }
         var dataObject = ""; 
      
 //       var ajaxUrl = $("#dataForm").attr("action");
          var ajaxUrl=$("#changeJson").val();
 //       var jsonData = $('#dataForm').serialize();
           var jsonData = "jsonData=" +
				(JSON.stringify(dataObject));
         $.ajax({
            url : ajaxUrl,
            type : "post",
            data : jsonData,
            dataType : "json",
            success : function(data) {
                 alert("성공");
               isClicked = false;
                var get_data = eval(data);
 
                $("#unpayTable > tbody:last > tr").remove();
                $("#unpayTable > tbody:last").append
                $("#mask").hide();
                $("#loadingPopup").css("visibility", "hidden");
                $("#dataForm").submit();
            },
            
            error : function(request,status,error)
            {
                isClicked = false;
                
                $("#loadingPopup").css("visibility", "hidden");
                //실패
                $("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : "+request.status + "\n" + "ERROR : "+error);
                $("#ajaxErrorPopup").css("visibility", "visible");
                $("#ajaxErrorPopup").fadeIn("show");
            }
        });
        
        showAlartPopup($("#loadingPopup"));
        $("#loadingPopup").css("visibility", "visible");
        $("#loadingPopup").fadeIn("fast"); 

    });
    //반려 
    $("#rejectItem").click(function() {
    	
        if(isClicked){          
            return false;          
        }                  
        isClicked = true;          
        
        var ajaxUrl = $("#rejectJson").val();
        var jsonData = "jsonData="
                + JSON.stringify($('#dataForm')
                        .serializeObject());
        alert(ajaxUrl);
        $.ajax({
            url : ajaxUrl,
            type : "post",
            data : jsonData,
            dataType : "json",
            success : function(data) {
            	 alert("성공");
     /*            isClicked = false;
                var get_data = eval(data);
 */
                //$("#unpayTable > tbody:last > tr").remove();
                //$("#unpayTable > tbody:last").append
                $("#dataForm").submit();
            },
            error : function(request,status,error){
                isClicked = false;
                $("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : "+request.status + "\n" + "ERROR : "+error);
                $("#ajaxErrorPopup").css("visibility", "visible");
                $("#ajaxErrorPopup").fadeIn("show");
            }
        });
    });
	   //취소요청 클릭
  /*   $("#transactionTable > tbody > tr > td > #cancelRequest").click(
            function(e) {
                $("#cancel_popup").fadeIn("slow");
                
                $("#taxBillNumber").val(
                        $(this).parents("tr").find("#taxBillNum").val());
                $("#transactionNumber")
                        .val(
                                $(this).parents("tr").find(
                                        "#transactionNum").val());
                $("#beforeExpirationDate")
                .val(
                        $.trim($(this).parents("tr").find(
                                "#beforeFinalDate").text()));
                
                $("#afterExpirationDate")
                .val(
                        $.trim($(this).parents("tr").find(
                                "#afterFinalDate").text()));
                
                $("#amountOfMoney")
                .val(
                        $.trim($(this).parents("tr").find(
                                "#money").text()).replace(/,/g, ""));
                
                $("#expirationAvg")
                .val(
                        $.trim($(this).parents("tr").find("#afterFinalDate").attr("expirationAvg"))
                        );

                $("#change_popup").fadeIn("slow");
            }); */

	 $("#cancelOk").click(function() {
		 alert("승인");
/*          if(isClicked){          
             return false;           
         }                   
         isClicked = true;   
         
         
         var before = $.datepicker.parseDate( 'yy.mm.dd', $("#beforeExpirationDate").val() );
         //var today = new Date();
         var today = $.datepicker.parseDate( 'yy.mm.dd', '2018.12.11' );
         
         //if ( today.getHours() >= 17 ){
         //	today.setDate(today.getDate() + 1);
         //}
         
         today.setHours(0);
         today.setMinutes(0);
         today.setSeconds(0);
         today.setMilliseconds(0);
         
         if (  Math.ceil((today - before) / (1000 * 60 * 60 * 24)) > 0 ) {
         	alert('만기일이 당일(17시 이후일 경우 익일)포함 이전의 경우 \r\n 취소 승인 하실 수 없습니다.');
         	isClicked = false;
         	return false;
         }
         
                 var ajaxUrl = $("#cancelJson").val(); //$("#dataForm").attr("action");
                 var jsonData = "jsonData="
                         + JSON.stringify($('#dataForm')
                                 .serializeObject());

                 $.ajax({
                     url : ajaxUrl,
                     type : "post",
                     data : jsonData,
                     dataType : "json",
                     success : function(data) {
                         isClicked = false;
                         var get_data = eval(data);
                         $("#mask").hide();
                         $("#loadingPopup").css("visibility", "hidden");

                         //$("#unpayTable > tbody:last > tr").remove();
                         //$("#unpayTable > tbody:last").append
                         $("#searchForm").submit();
                     },
                     error : function(request,status,error){
                         isClicked = false;
                         $("#mask").hide();
                         $("#loadingPopup").css("visibility", "hidden");
                         
                         $("#ajaxErrorPopup").find("dt").text("<통신 실패>" + "\n" + "CODE : "+request.status + "\n" + "ERROR : "+error);
                         $("#ajaxErrorPopup").css("visibility", "visible");
                         $("#ajaxErrorPopup").fadeIn("show");
                     }
                 });
                 
                 $("#loadingPopup").css("visibility", "visible");
                 $("#loadingPopup").fadeIn("fast"); 
                 showAlartPopup($("#loadingPopup")); */
                 

             });

	
	
	
	
		$(function() {
			// 확인
			$("#acceptButton").click(function() {
			alert("1");
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
			$("#accountCancel").click(function() {
				$("#aa").fadeOut("slow");
				return false;
			});
	
	
	
			//close 버튼
			$("div > #closePopup").click(function() {
				//불투명 처리 해제
				$("#mask").hide();
				$("#requestPopup").fadeOut("slow");
				
				return false;
			});
		});
	</script>