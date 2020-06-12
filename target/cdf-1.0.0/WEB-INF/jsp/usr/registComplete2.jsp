<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : registComplete.jsp
  * @Description : 회원가입완료 화면
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
<title>회원가입완료
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
    
    var currMenuId = '0000_05';
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
                      
        












<!-- step -->
<ul class="step4_wrap on4 mb40">
    <li class="first">
        <p class="tit">회원가입여부</p>
    </li>
    <li>
        <p class="tit">이용약관동의</p>
    </li>
    <li>
        <p class="tit">기업정보등록</p>
    </li>
    <li class="on">
        <p class="tit">회원가입완료</p>
    </li>
</ul>
<!--// step -->
<br/>
<div class="member_fin">
    <p><img src="<c:url value='/images/common/txt_member_fin.gif'/>" alt="회원가입이 완료되었습니다." /></p>
    <ul>
        <!-- li>고객센터 팩스 (<strong>02-6455-9321</strong>)로 사업자등록증 사본을 전송해 주시면 관리자 승인 후 정상적인 사용이 가능 합니다.</li -->
        <li>문의사항은 고객센터 (<strong>1566-9321</strong>)로 연락주시기 바랍니다.</li>
    </ul>
</div>  
        




        <br/><br/><br/>
        </div>
    </div>
</div>












<!-- footer -->
<c:import url="../inc/footer.jsp" />
<!--// footer -->
    
            
</body>
</html>

