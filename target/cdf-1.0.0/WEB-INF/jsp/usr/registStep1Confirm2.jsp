<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : registStep1Confirm.jsp
  * @Description : 회원가입여부확인 화면
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
<title>회원가입여부확인
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
    
    var currMenuId = '0000_01';
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

$(function()
{
    // - 찍어주기
    init();
    
    $("#userRegist").click(function()
    {
        //validate check
        
        //DATA SETTING
        $("#user #businessNo").val( $("#businessNo").val() );   
        $("#user").submit();
    });
});

function init()
{
    var businessNo = new String( $("#businessNo").val() );
    
    var first = businessNo.substring( 0, 3 );
    var second = businessNo.substring( 3, 5 );
    var third = businessNo.substring( 5, 10 );
    
    $("#businessNumberEx").val( first + "-" + second + "-" + third );
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
                                            ※ 해당 사업자등록번호는 (주)KG이니시스 회원으로 등록되어 있지 않습니다.
    <br />
                                            ※ 회원가입을 원하시면 아래의 회원가입 버튼을 클릭해 주십시오.
    </p>
    <div class="member_reg mt15">
        <dl>
            <dt>사업자등록번호</dt>
            <dd>
                <input type="text" style="width:150px; color: gray; text-align: center; font-weight: bold;" name="input18" id="businessNumberEx" class="input" readonly="readonly"/>
                <input type = "hidden" id = "businessNo" value="<c:out value="${loginVO.businessNo}"/>">   
                <span class="btn btn_normal ml5"><a style="width:80px;" href="#" id = "userRegist">회원가입</a></span>
            
            </dd>
        </dl>
    </div>
    
    

        
        
        

<!-- jsonUrl -->

<form id="user" action="<c:url value='/usr/registStep2.do'/>" method="post">
    <input id="businessNo" name="businessNo" type="hidden" value="<c:out value="${loginVO.businessNo}"/>"/>
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

