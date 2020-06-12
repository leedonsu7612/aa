<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : registStep1.jsp
  * @Description : 회원가입여부조회 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2018.11.14            최초 생성
  *  2018.11.29            수정
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
<title>회원가입여부조회
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
//숫자만 일력된다.
$(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});

$(function() {
	    
    //closeAlartPopup($("#loadingPopup"));
    
    $("#seller_service_menu > a").click(function(){
        showAlartPopup($("#loadingPopup"));
    });
    $("#service_menu > a").click(function(){
        showAlartPopup($("#loadingPopup"));
    });
    
    var currMenuId = '0000_00';
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
                    <li class="on">회원가입</li>
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

$(function()
{
    $("#inquiry").click(function()
    {
        //validate check
        if ( $("#businessNo1").val().length < 3 )
        {
            $("#bizNumError").find("dt").text("첫번째 사업자 번호 3자리를 입력하세요.");
            $("#bizNumError").css("visibility", "visible");
            $("#bizNumError").fadeIn("slow");
            
            return false;
        }
        if ( $("#businessNo2").val().length < 2 )
        {
            $("#bizNumError").find("dt").text("두번째 사업자번호 2자리를 입력하세요.");
            $("#bizNumError").css("visibility", "visible");
            $("#bizNumError").fadeIn("slow"); 
            
            return false;
        }
        if ( $("#businessNo3").val().length < 5 )
        {
            $("#bizNumError").find("dt").text("세번째 사업자번호 5자리를 입력하세요.");
            $("#bizNumError").css("visibility", "visible");
            $("#bizNumError").fadeIn("slow");
            
            return false;
        }
        
        //DATA SETTING
        $("#user #businessNo").val( $("#businessNo1").val() + $("#businessNo2").val() + $("#businessNo3").val() );   
        $("#user").submit();
    });
    
    $("#businessNo3").keydown(function(e)
    {
        if ( e.keyCode == '13' )
            $("#inquiry").trigger( "click" );    
    });
    
    $("#btn_bizNumErrorOk").click(function(){
        $("#bizNumError").fadeOut("slow");
    });
});

function enterKey(e)
{
    if ( e.keyCode == '13' )
        $("#inquiry").trigger( "click" );
}

</script>

<!-- step -->
<ul class="step4_wrap on1 mb20">
    <li class="first on">
        <p class="tit">회원가입여부</p>
    </li>
    <li>
        <p class="tit">이용약관동의</p>
    </li>
    <li>
        <p class="tit">기업정보등록</p>
    </li>
    <li>
        <p class="tit">회원가입완료</p>
    </li>
</ul>
<!--// step -->

<p class="desc mt35">
    * (주)KG이니시스 B2B서비스의 회원가입여부를 확인합니다.
    <br />
    * 사업자등록번호 입력 후 조회하기를 클릭해 주십시오.
</p>
<div class="member_reg mt15">
    <dl>
        <dt>사업자등록번호</dt>
        <dd>
            <input type="text" style="width:100px;" title="" name="input18" id="businessNo1" class="input" maxlength="3" numberonly="true"/>   
            -   
            <input type="text" style="width:100px;" title="" name="input19" id="businessNo2" class="input" maxlength="2" numberonly="true"/>   
            -
            <input type="text" style="width:100px;" title="" name="input20" id="businessNo3" class="input" maxlength="5" onkeyup="enterKey(this)" numberonly="true"/>   
        
            <span class="btn btn_normal ml5"><a style="width:80px;" href="#" id = "inquiry">조회하기</a></span>
        
        </dd>
    </dl>
</div>
<div id="bizNumError" class="alert_popup" style="visibility: hidden">
    <dl>
        <dt>첫번째 사업자 번호 3자리를 입력하세요.</dt>
        <dd>
            <span class="btn btn_normal"><a id="btn_bizNumErrorOk" href="#" style="width:80px;">확인</a></span>
        </dd>
    </dl>
</div>


<!-- jsonUrl -->

<form id="user" action="<c:url value='/usr/registStep1Confirm.do'/>" method="post">
    <input id="businessNo" name="businessNo" type="hidden" value=""/>
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

