<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : registStep3Confirm.jsp
  * @Description : 가입내용 확인 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2018.11.14            최초 생성
  *
  * author CDF Team
  * since 2018.11.14
  *
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>가입내용 확인
</title>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>" />

<script type="text/javascript" src="http://ie.kis.v2.scr.kaspersky-labs.com/5DB3B557-5A7B-A84E-8DDA-D84F5A61BFB3/main.js" charset="UTF-8"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.easing.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.bxslider.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/select.js'/>"></script>

</head>
<div id = "mask"></div>

<body>













<script type="text/javascript">

$(function() {
	    
    //closeAlartPopup($("#loadingPopup"));
    
    $("#seller_service_menu > a").click(function(){
        showAlartPopup($("#loadingPopup"));
    });
    $("#service_menu > a").click(function(){
        showAlartPopup($("#loadingPopup"));
    });
    
    var currMenuId = '0000_04';
    var memberClass = '';
    
    if ( memberClass == 'B' )
        $(".header .service_menu li.s_btn > a[menuId = "+currMenuId+"]").addClass("menu_selected");
    else
        $(".header .seller_service_menu li.s_btn > a[menuId = "+currMenuId+"]").addClass("menu_selected");
    
    
    
    
});
</script>
<!-- header -->
<div id="header">
    <div class="header">        
        
            
            
            
            	<h1>
		            <a href="<c:url value='/login.do'/>">
		                <img src="<c:url value='/images/common/h1_logo.gif'/>" alt="KG IniB2B" /> 
		            </a>
		        </h1>
                <!-- global menu -->
                <ul class="global_menu">
                    <li><a href="<c:url value='/login.do'/>">로그인</a></li>
                    <li class="on"><a href="<c:url value='/usr/registStep1.do'/>">회원가입</a></li>
                </ul>
                <!--// global menu -->     
            
        

        <!--// service_menu -->
    </div>
</div>
<!--// header -->

<div id="wrap">
    <div id="container">
        <div id="contents">      
        
        <!-- title -->
        <h2><img src="<c:url value='/images/title/h2_sign_up.gif'/>" alt="회원가입" /></h2>
        <!--// title -->
                      
        












<script type="text/javascript">
var isClicked = false;
$(function()
{
    init();
    $("#registNext").click(function()
    {
        if(isClicked){              
            return false;           
        }                   
        isClicked = true;           
        
        $("#user").attr( "action", $("#completeUrl").val() );
        $("#user").submit();
    });
    
    $("#registPrev").click(function()
    {
        $("#user").attr( "action", $("#modifyUrl").val() );
        $("#user").submit();
        
        //$.history.load() $.history.back(-1)
    });
});

function init()
{
    if ( $("#user #ceoName").val() != "" )
    {
        //사업자번호
        
        //전화번호
        var phoneNumber = new String( $("#user #companyPhone").val() );
        var localPhoneNumber = phoneNumber.charAt( 1 );
        var firstPhoneNumber = "";
        var secondPhoneNumber = "";
        
        if ( phoneNumber.length > 4 )
        {
            if ( localPhoneNumber == "2" )
                localPhoneNumber = phoneNumber.substring( 0, 2 );
            else
                localPhoneNumber = phoneNumber.substring( 0, 3 );
            
            firstPhoneNumber = phoneNumber.substring( localPhoneNumber.length, ( phoneNumber.length - 4 ) );
            secondPhoneNumber = phoneNumber.substring( ( phoneNumber.length - 4 ), phoneNumber.length );
            
            //SETTING
            $("#companyPhoneFirst").text( localPhoneNumber );
            $("#companyPhoneSecond").text( firstPhoneNumber );
            $("#companyPhoneThird").text( secondPhoneNumber );
        }
        
        //팩스번호
        var faxNumber = new String( $("#user #companyFax").val() );
        var localFaxNumber = faxNumber.charAt( 1 );
        var firstFaxNumber = "";
        var secondFaxNumber = "";
        
        if ( faxNumber.length > 4 )
        {
            if ( localFaxNumber == "2" )
                localFaxNumber = faxNumber.substring( 0, 2 );
            else
                localFaxNumber = faxNumber.substring( 0, 3 );
            
            firstFaxNumber = faxNumber.substring( localFaxNumber.length, ( faxNumber.length - 4 ) );
            secondFaxNumber = faxNumber.substring( ( faxNumber.length - 4 ), faxNumber.length );
            
            //SETTING
            $("#companyFaxFirst").text( localFaxNumber );
            $("#companyFaxSecond").text( firstFaxNumber );
            $("#companyFaxThird").text( secondFaxNumber );
        }
        
		var mobileNumber = new String( $("#user #companyMobile").val() );
        
        if ( mobileNumber.length > 10 ) {
        	$("#companyMobileFirst").text( mobileNumber.substring( 0, 3 ) );
        	if ( mobileNumber.length == 10 ) {
                $("#companyMobileSecond").text( mobileNumber.substring( 3, 6 ) );
                $("#companyMobileThird").text( mobileNumber.substring( 6, 10 ) );
        	} else if ( mobileNumber.length == 11 ) {
                $("#companyMobileSecond").text( mobileNumber.substring( 3, 7 ) );
                $("#companyMobileThird").text( mobileNumber.substring( 7, 11 ) );
        	}
        }
    } 
}

</script>

<!-- step -->
<ul class="step4_wrap on3 mb20">
    <li class="first">
        <p class="tit">회원가입여부</p>
    </li>
    <li>
        <p class="tit">이용약관동의</p>
    </li>
    <li class="on">
        <p class="tit">기업정보등록</p>
    </li>
    <li>
        <p class="tit">회원가입완료</p>
    </li>
</ul>
<!--// step -->

<h3>기본정보</h3> 
<table id = "basicInfoTable" summary="" class="tbl_regist_view2 mb15 mt15">
    <caption>기본정보</caption>
    <colgroup>
        <col width="67" />
        <col width="320" />
        <col width="67" />
        <col width="320" />
    </colgroup>
    <tbody>
        <tr>
            <th scope="row">아이디</th>
            <td><div class = "desc"><c:out value='${registVO.userId}'/></div></td>
        </tr>
    </tbody>
</table>
 
<h3 class="mt20">개인정보</h3>
<table summary="" class="tbl_regist_view2">
    <caption>개인정보</caption>
    <colgroup>
        <col width="170" />
        <col width="320" />
        <col width="170" />
        <col width="320" />
    </colgroup>
    <tbody>
        <tr>
            <th scope="row">기업형태</th>
            <td>
                    <div class = "desc">
                    <c:choose>
						<c:when test="${registVO.companyGbn eq 'C'}">법인사업자</c:when>
						<c:when test="${registVO.companyGbn eq 'B'}">개인사업자</c:when>
					 </c:choose>
                    </div>
            </td>
            <th scope="row">거래처형태</th>
            <td>
                    <div class = "desc">
                    <c:choose>
						<c:when test="${registVO.membClass eq 'S'}">품목점</c:when>
						<c:when test="${registVO.membClass eq 'B'}">대리점</c:when>
					 </c:choose>
                    </div>
            </td>
        </tr>
        <tr>
            <th scope="row">대표자명</th>
            <td><div class = "desc"><c:out value="${registVO.ceoName}"/></div></td>
            <th scope="row">회사명</th>
            <td><div class = "desc"><c:out value="${registVO.companyName}"/></div></td>
        </tr>
        <tr>
            <th scope="row">전화번호</th>
            <td>
                <span class = "desc" id = "companyPhoneFirst"></span>-<span class = "desc" id = "companyPhoneSecond"></span>-<span class = "desc" id = "companyPhoneThird"></span>
            </td>
            <th scope="row">팩스번호</th>
            <td>
                <span class = "desc" id = "companyFaxFirst"></span>-<span class = "desc" id = "companyFaxSecond"></span>-<span class = "desc" id = "companyFaxThird"></span>
            </td>
        </tr>
        <tr>
            <th scope="row">휴대전화</th>
            <td>
                <span class = "desc" id = "companyMobileFirst"></span>-<span class = "desc" id = "companyMobileSecond"></span>-<span class = "desc" id = "companyMobileThird"></span>
            </td>
            <td></td>
            <td>
            </td>
        </tr>
        <tr>
            <th scope="row">업태</th>
            <td><div class = "desc"><c:out value="${registVO.companyStatus}"/></div></td>
            <th scope="row">업종</th>
            <td><div class = "desc"><c:out value="${registVO.companyItem}"/></div></td>
        </tr>
        <tr>
            <th scope="row">주소</th>
            <td colspan="3">
                <div class = "desc"><c:out value="${registVO.companyAddress}"/></div>
            </td>
        </tr>
        <tr>
            <th scope="row">E-MAIL</th>
            <td colspan="3">
                <div class = "desc"><c:out value="${registVO.officesName}"/></div>
            </td>
        </tr>
    </tbody>
</table>



<div class="ac mt30">
    <span class="btn btn_normal2"><a href="#" id = "registPrev" style="width:70px;">이전</a></span>
    <span class="btn btn_normal2"><a href="#" id = "registNext" style="width:70px;">다음</a></span>
</div>

<!-- Url -->


<input type = "hidden" id = "modifyUrl" value = "<c:url value='/usr/registStep3.do'/>" >
<input type = "hidden" id = "completeUrl" value = "<c:url value='/usr/registComplete.do'/>" >
<form id="user" action="<c:url value='/usr/registStep3Confirm.do'/>" method="post">
    <input id="businessNo" name="businessNo" type="hidden" value="<c:out value='${registVO.businessNo}'/>"/>
    <input id="companyGbn" name="companyGbn" type="hidden" value="<c:out value='${registVO.companyGbn}'/>"/>
    <input id="membClass" name="membClass" type="hidden" value="<c:out value='${registVO.membClass}'/>"/>
    <input id="ceoName" name="ceoName" type="hidden" value="<c:out value='${registVO.ceoName}'/>"/>
    <input id="companyName" name="companyName" type="hidden" value="<c:out value='${registVO.companyName}'/>"/>
    <input id="companyPhone" name="companyPhone" type="hidden" value="<c:out value='${registVO.companyPhone}'/>"/>
    <input id="companyMobile" name="companyMobile" type="hidden" value="<c:out value='${registVO.companyMobile}'/>"/>
    <input id="companyFax" name="companyFax" type="hidden" value="<c:out value='${registVO.companyFax}'/>"/>
    <input id="companyStatus" name="companyStatus" type="hidden" value="<c:out value='${registVO.companyStatus}'/>"/>
    <input id="companyItem" name="companyItem" type="hidden" value="<c:out value='${registVO.companyItem}'/>"/>
    <input id="companyAddress" name="companyAddress" type="hidden" value="<c:out value='${registVO.companyAddress}'/>"/>
    <input id="officesName" name="officesName" type="hidden" value="<c:out value='${registVO.officesName}'/>"/>
    <input id="userId" name="userId" type="hidden" value="<c:out value='${registVO.userId}'/>"/>
    <input id="userPw" name="userPw" type="hidden" value="<c:out value='${registVO.userPw}'/>"/>
</form>


        <br/><br/><br/>
        </div>
    </div>
</div>












<!-- footer -->
<c:import url="../inc/footer.jsp" />
<!--// footer -->
    
            
</body>
</html>

