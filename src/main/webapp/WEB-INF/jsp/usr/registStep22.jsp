<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : registStep2.jsp
  * @Description : 이용약관동의 화면
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
<title>이용약관동의
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
    
    var currMenuId = '0000_02';
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
    $("#nextStep").click(function()
    {
        //validate check
        if ( $("#agree1").prop( "checked" ) == false )
        {
            $("#bizNumError").find("dt").text("KG이니시스 이용약관동의에 체크해 주십시오.");
            $("#bizNumError").css("visibility", "visible");
            $("#bizNumError").fadeIn("slow");
            
            return false;
        }
        if ( $("#agree2").prop( "checked" ) == false )
        {
            $("#bizNumError").find("dt").text("KG이니시스 개인정보보호정책 동의에 체크해 주십시오.");
            $("#bizNumError").css("visibility", "visible");
            $("#bizNumError").fadeIn("slow");
            
            return false;
        }
        if ( $("#agree3").prop( "checked" ) == false )
        {
            $("#bizNumError").find("dt").text("이용약관 동의에 체크해 주십시오.");
            $("#bizNumError").css("visibility", "visible");
            $("#bizNumError").fadeIn("slow");
            
            return false;
        }
        
        //DATA SETTING
        $("#user").submit();
    });
    
    $("#btn_bizNumError").click(function()
    {
        $("#bizNumError").fadeOut("slow");
    });
});

</script>

<!-- step -->
<ul class="step4_wrap on2 mb20">
    <li class="first">
        <p class="tit">회원가입여부</p>
    </li>
    <li class="on">
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

<h3> 이용약관</h3> 
<div class="agree_wrap">
    
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:굴림;
	panose-1:2 11 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"맑은 고딕";
	panose-1:2 11 5 3 2 0 0 2 0 4;}
@font-face
	{font-family:"\@굴림";
	panose-1:2 11 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"\@맑은 고딕";
	panose-1:2 11 5 3 2 0 0 2 0 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	text-autospace:none;
	word-break:break-hangul;
	font-size:10.0pt;
	font-family:"맑은 고딕";}
h1
	{mso-style-link:"제목 1 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:1.0pt;
	font-family:굴림;}
h2
	{mso-style-link:"제목 2 Char";
	margin-top:7.5pt;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:0cm;
	margin-bottom:.0001pt;
	font-size:18.0pt;
	font-family:굴림;}
p.MsoHeader, li.MsoHeader, div.MsoHeader
	{mso-style-link:"머리글 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	layout-grid-mode:char;
	text-autospace:none;
	word-break:break-hangul;
	font-size:10.0pt;
	font-family:"맑은 고딕";}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{mso-style-link:"바닥글 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	layout-grid-mode:char;
	text-autospace:none;
	word-break:break-hangul;
	font-size:10.0pt;
	font-family:"맑은 고딕";}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-link:"풍선 도움말 텍스트 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	text-autospace:none;
	word-break:break-hangul;
	font-size:9.0pt;
	font-family:"맑은 고딕";}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:40.0pt;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	text-autospace:none;
	word-break:break-hangul;
	font-size:10.0pt;
	font-family:"맑은 고딕";}
span.1Char
	{mso-style-name:"제목 1 Char";
	mso-style-link:"제목 1";
	font-family:굴림;
	font-weight:bold;}
span.2Char
	{mso-style-name:"제목 2 Char";
	mso-style-link:"제목 2";
	font-family:굴림;
	font-weight:bold;}
span.Char
	{mso-style-name:"풍선 도움말 텍스트 Char";
	mso-style-link:"풍선 도움말 텍스트";
	font-family:"맑은 고딕";}
span.Char0
	{mso-style-name:"머리글 Char";
	mso-style-link:머리글;}
span.Char1
	{mso-style-name:"바닥글 Char";
	mso-style-link:바닥글;}
 /* Page Definitions */
 @page WordSection1
	{size:595.3pt 841.9pt;
	margin:3.0cm 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
 /* List Definitions */
 ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
-->
</style>

<div class=WordSection1>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><b><span lang=EN-US style='font-size:1.0pt;font-family:
굴림;color:#444444'>&nbsp;</span></b></p>

<p class=MsoNormal><b><span lang=EN-US style='color:#444444'>1 </span></b><b><span
style='color:#444444'>장 총칙</span></b></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>1</span>조<span
lang=EN-US> (</span>목적<span lang=EN-US>) </span></span></p>

<p class=MsoNormal style='text-indent:5.0pt'><span style='color:#444444'>이 약관은<span
lang=EN-US> (</span>주<span lang=EN-US>)</span>케이지이니시스<span lang=EN-US>(</span>이하<span
lang=EN-US> &quot;</span>회사<span lang=EN-US>&quot;</span>라 한다<span lang=EN-US>.)</span>가
인터넷을 통해 운영하는<span lang=EN-US> Market Place(</span>이하<span lang=EN-US> &quot;</span></span><span
lang=EN-US style='color:black'> </span><span style='color:black'>매출채권 팩토링 서비스</span><span
style='color:#444444'> <span lang=EN-US>&quot;</span>이라 한다<span lang=EN-US>)</span>의
이용조건<span lang=EN-US>, </span>절차<span lang=EN-US>, </span>기타 필요한 사항을 규정함을 목적으로 한다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>2</span>조<span
lang=EN-US> (</span>약관의 효력 및 변경<span lang=EN-US>) </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>①</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>이 약관의 내용은 매출채권 팩토링 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력이
발생한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>②</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
lang=EN-US style='color:#444444'>&nbsp;&nbsp;</span><span style='color:#444444'>회사는
필요한 경우 이 약관을 변경할 수 있으며<span lang=EN-US>, </span>약관이 변경되는 경우에는 그 시행일의 최소한<span
lang=EN-US> 7</span>일전에<span lang=EN-US> 1</span>항과 같은 방법으로 공시한다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>③</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
lang=EN-US style='color:#444444'>&nbsp;&nbsp;</span><span style='color:#444444'>매출채권
팩토링 서비스 안에 새로운 서비스가 개설될 경우 별도의 명시된 설명이 없는 한 이 약관에 따라 제공된다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>3</span>조<span
lang=EN-US> (</span>약관 외 준칙<span lang=EN-US>) </span></span></p>

<p class=MsoNormal style='text-indent:5.0pt'><span style='color:#444444'>이 약관에 명시되지
않은 사항은 전기통신기본법<span lang=EN-US>, </span>전기통신사업법 및 기타 관련법령의 규정에 따른다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>4</span>조<span
lang=EN-US> (</span>정의<span lang=EN-US>) </span></span></p>

<p class=MsoNormal><span style='color:#444444'>이 약관에서 사용하는 용어의 정의는 다음과 같다<span
lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>1.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>회원<span lang=EN-US> (Member) : </span>서비스 이용
계약을 체결한 개인<span lang=EN-US>, </span>법인 또는 이에 준하는 단체</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>2.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>아이디<span lang=EN-US> (ID) : </span>회원식별과 회원의
서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 문자와 숫자의 조합</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>3.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>비밀번호<span lang=EN-US> (Password) : </span>회원의
비밀 보호를 위해 회원 자신이 설정한 문자와 숫자의 조합</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>4.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>판매기업 <span lang=EN-US>(Seller) : </span></span><span
style='color:black'>품목지원센타<span lang=EN-US>”</span>로<span lang=EN-US> “</span>대리점<span
lang=EN-US>”</span>에게 물품 등을 공급하고<span lang=EN-US>, </span>금융회사와 결제제도 이용약정을 체결하고
거래대금을 전자방식 매출채권으로 결제 받는 기업</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>5.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>구매기업<span lang=EN-US> (Buyer) : </span></span><span
lang=EN-US style='color:black'>“</span><span style='color:black'>대리점<span
lang=EN-US>”</span>으로 <span lang=EN-US>“</span>품목지원센타<span lang=EN-US>”</span>로부터
물품을 구매하는 기업</span><span style='color:black'> </span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>6.&nbsp; </span><span style='color:black'>매출채권<span
lang=EN-US> : </span></span><span style='color:black'>판매기업이 구매기업에게 물품 등을 공급한 후 구매기업이
판매기업의 채권명세를 금융회사에 통보함으로써 판매기업이 확정적으로 취득하는 매출채권을 말하며 사업목적에 부합하는 경상적 영업활동에 따라 발생한
채권</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>7.&nbsp; </span><span style='color:black'>물품<span
lang=EN-US> : </span></span><span style='color:black'>판매기업이 구매기업에게 공급하는 일체의 재화 및
용역 등</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>8 . Market Place : </span><span
style='color:black'>대리점과 판매기업과 물품 등을 거래함에 있어 세금계산서 발행 및 매출채권 정보를 취급하여 금융회사로 전달하는
전산시스템을 운영<span lang=EN-US>, </span>유지하는 회사</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>9. MP</span><span style='color:black'>시스템<span
lang=EN-US>: </span>매출채권 팩토링 결제제도 운영을 위하여 <span lang=EN-US>“</span>구매기업<span
lang=EN-US>”</span>과 <span lang=EN-US>“</span>판매기업<span lang=EN-US>”</span>이 전자적
방식을 통해 세금계산서 및 매출채권 정보를 취급할 수 있도록 구축된 시스템</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>10. </span><span style='color:black'>매출채권 팩토링<span
lang=EN-US> : </span>품목지원센터와 대리점간의 매출채권을 바탕으로 조기 현금화하는 금융상품으로<span lang=EN-US>,
</span>품목지원센터가 현대커머셜에 매출채권할인신청 후 현대커머셜로부터 대출받고<span lang=EN-US>, </span>만기시에 대리점에서
현대커머셜에 대출만기 결제를 하는 상품</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>11. </span><span style='color:black'>금융회사<span
lang=EN-US> : </span>현대커머셜</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>12.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span
style='color:black'>책임<span lang=EN-US> : </span>민<span lang=EN-US>.</span>형사상의
모든 법적 책임</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>.</span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>5</span>조<span
lang=EN-US> (</span>서비스의 구분<span lang=EN-US>) </span></span></p>

<p class=MsoNormal><span style='color:#444444'>회사가 회원에게 제공하는 서비스는 </span><span
style='color:black'>매출채권 팩토링 서비스 </span><span style='color:#444444'>등의 상거래서비스와 정보
컨텐츠 제공 및 그 외 부가서비스로 구분한다 </span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><b><span style='color:#444444'>제<span lang=EN-US> 2 </span>장
이용계약체결</span></b></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>6</span>조<span
lang=EN-US> (</span>이용계약의 성립<span lang=EN-US>)</span></span></p>

<p class=MsoNormal style='margin-left:20.0pt;text-indent:-20.0pt'><span
style='color:#444444'>①</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp; </span><span
lang=EN-US style='color:#444444'>&quot;</span><span style='color:#444444'>매출채권 팩토링
서비스<span lang=EN-US>&quot;</span>를 이용하기 위해서는 회사와 이용계약을 체결하여야 한다<span
lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:20.0pt;text-indent:-20.0pt'><span
style='color:#444444'>②</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>이용계약은 회원으로 가입하고자 하는 개인<span lang=EN-US>, </span>법인 또는 단체가
본 이용약관에 동의하고 회원 가입을 위한 제반절차를 거쳐 가입신청을 한 후 회사의 승인을 받아야 한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:20.0pt;text-indent:-20.0pt'><span
style='color:#444444'>③</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>약관에 대한 동의는 동의 버튼을 클릭하는 것으로 완료되며 회사의 승인 절차는<span
lang=EN-US> e-mail </span>및<span lang=EN-US> SMS</span>를 통하여 통지한다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:20.0pt;text-indent:-20.0pt'><span
style='color:#444444'>④</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>이용계약은 가입의 승낙을 위한<span lang=EN-US> e-mail </span>및<span
lang=EN-US> SMS</span>가 발송된 때부터 성립한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>7</span>조<span
lang=EN-US> (</span>회원가입 및 승낙<span lang=EN-US>) </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>①</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회원가입은 회사가 지시하는 양식에 회원신청인이 제<span lang=EN-US>7</span>조<span
lang=EN-US> 5</span>항에서 정하는 방법에 따라 자신의 정보를 입력하여 이용신청을 하고 회사가 이에 승인함으로써 성립된다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>②</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회원신청자는 “매출채권 팩토링 서비스”의 회원등록란에서 등록 양식을 작성하여 제출함으로써 회원 자격을 신청할
수 있다<span lang=EN-US>. Fax</span>를 이용하여 관련 서류를 회사에 송부하여도 동일한 효력을 발휘한다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>③</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>다음과 같은 경우 회원신청자의 회원 가입 신청 승낙을 제한할 수 있고<span lang=EN-US>, </span>이
사유가 해소될 때까지 승낙을 유보 또는 거절 할 수 있다<span lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>1.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>이미 가입된 회원의 사업자등록번호와 동일한 경우</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>2.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>서비스 관련 설비 용량이 부족한 경우</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>3.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>기술상 문제가 있는 경우</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>4.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>기타 부득이한 사정이 있는 경우</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>5.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>이용신청자가 제공한 정보가 부정확하거나 현재의 사실과 일치하지 않는 경우</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>6.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>7.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>기타 회사가 제공하는 서비스의 운영을 방해할 의도로 신청한 경우 </span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>④</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
lang=EN-US style='color:#444444'>&nbsp;</span><span style='color:#444444'>회원 가입
신청자는 다음 사항을 준수하여야 한다<span lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>1.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>가입신청 양식에는 실명을 사용할 것</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>2.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>가입신청 양식의 내용은 현재의 사실과 일치할 것<span lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>3.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>사회의 안녕<span lang=EN-US>, </span>질서 또는 미풍양속을 저해할
목적으로 신청하지 않을 것</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>4.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>등록 양식 또는 그 내용에 변경이 생긴 경우 현재의 사실과 일치하는 완전한 정보로
갱신할 것<span lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>⑤</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
lang=EN-US style='color:#444444'>&nbsp;</span><span style='color:#444444'>회원으로 가입하고자
하는 자는 회사가 온라인으로 제공하는 회원등록란에 다음 사항을 사실과 다름없이 정확하게 기재하여야 한다<span lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>1. </span><span style='color:black'>기업형태</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>2. </span><span style='color:black'>거래처형태</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>3. </span><span style='color:black'>대표자명</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>4. </span><span style='color:black'>회사명</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>5. </span><span style='color:black'>전화번호</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>6. </span><span style='color:black'>팩스번호</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>7. </span><span style='color:black'>업태</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>8. </span><span style='color:black'>업종 </span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>9. </span><span style='color:black'>주소</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>10. </span><span style='color:black'>이메일</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>11.</span><span lang=EN-US style='color:black'>&nbsp;</span><span
style='color:black'>로그인<span lang=EN-US> ID </span>및 비밀번호</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>12.</span><span lang=EN-US style='color:black'>&nbsp;</span><span
style='color:black'>기타 회사에서 정한 내용</span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>⑥</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
lang=EN-US style='color:#444444'>&nbsp;</span><span style='color:#444444'>회원가입은
회원 단위로 체결하는 것을 원칙으로 한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span style='color:#444444'>동일 회원사가 사용자를 추가하고자 할 때는 회원자체를 새로
등록하는 것이 아니라 사용자 아이디<span lang=EN-US>(ID)</span>를 추가하는 것으로 한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>* </span><span
style='color:#444444'>회원의 조직이 지사나 부서로 구분되어 있고 구분된 조직별로 별도로 전자상거래 관리를 해야 할 경우 회원은
회사에 요청하여 별도로 아이디<span lang=EN-US>(ID)</span>를 부여받을 수 있다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>8</span>조<span
lang=EN-US> (</span>회원<span lang=EN-US>ID</span>변경<span lang=EN-US>) </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>①</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>다음의 경우 회사는 직권으로 회원<span lang=EN-US> ID</span>를 변경하도록 요구하거나<span
lang=EN-US>, </span>회원의 신청에 의해 회원<span lang=EN-US> ID</span>를 변경할 수 있다<span
lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>1.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>회원<span lang=EN-US> ID</span>가 회원의 전화번호 등으로 등록되어
회원 사생활 침해의 우려가 있는 경우</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>2.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>타인에게 혐오감을 주거나 미풍양속에 저해되는 경우</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>3.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>기타 회사 소정의 합리적인 이유가 있는 경우 </span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>9</span>조<span
lang=EN-US> (</span>회원탈퇴 및 자격상실<span lang=EN-US>) </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>①</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회원이 자유롭게 회사에 탈퇴의사를<span lang=EN-US> E-mail, Fax, </span>기타의
방법으로 통지함으로써 탈퇴할 수 있고 회사는 회원의 탈퇴의사를 확인하기 위하여 필요한 확인작업을 진행할 수 있다<span lang=EN-US>.
</span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>②</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회사는 아래에 해당하는 사유가 회원에게 발생하거나 확인된 경우에는 회원자격을 상실 시킬 수 있다<span
lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>1.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>타인의 아이디<span lang=EN-US>(ID) </span>및 비밀번호를 도용하거나
회원자신의 아이디<span lang=EN-US>(ID) </span>및 비밀번호를 타인에게 제공하였을 경우</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>2.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>허위사실을 기재한 회원임이 밝혀진 경우</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>3.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>회사가 제공하는 서비스의 원활한 진행을 방해하는 경우</span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>③</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회사가 회원의 자격을 상실 시킬 경우에는 회원에게<span lang=EN-US> E-mail, Fax,
</span>전화 등 기타의 방법으로 해지 사유 및 의사를 통지하며<span lang=EN-US>, </span>회원자격은 회사가 해지의사를 회원에게
통지한 시점부터 종료된다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>④</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회사로부터 회원 자격을 상실 당한 회원이 재가입을 신청하여도 회사는 가입을 거부할 수 있다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>10</span>조<span
lang=EN-US> (</span>회원 정보 사용에 대한 동의<span lang=EN-US>) </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>①</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회사가 이용 신청서에 기재를 요구하는 회원 정보는 본 이용계약을 이행하고 이용계약상 서비스 제공을 위한
목적으로 이용한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>②</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회원이 회사 및 제휴업체의 서비스를 편리하게 사용할 수 있도록 하기 위해 회원 정보를 회사 및 제휴 업체에
제공할 수 있다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>③</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>전기통신사업법 등 법률 규정에 의해 국가 기관의 요구가 있는 경우<span lang=EN-US>, </span>수사상
목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우 또는 기타 관계법령 절차에 따른 정보제공 요청이 있는 경우 회원 정보를 제공할 수 있다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>④</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회사는 업무와 관련하여 회원전체 또는 일부의 개인 및 회사 정보에 관한 통계자료를 작성하여 사용하거나 이를
다른 기관에 제공할 수 있다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>⑤</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회원은 언제든지 본인의 개인 및 회사 정보를 열람하고 변경사항을 정정할 수 있으며 회원이 약관의 내용에
동의하지 않고 등록을 취소 하는 경우 회사는 회원의 정보를 삭제한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>⑥</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회사는 보증 또는 부진정거래 모니터링의 목적으로 구매자와 판매자의 거래내역을 해당 금융회사에 통보할 수
있다<span lang=EN-US>. </span>단<span lang=EN-US>, </span>금융회사에 통보되는 거래내역을 보증 및 부진정거래
모니터링의 목적으로만 사용한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>11</span>조<span
lang=EN-US> (</span>회원 정보의 보호<span lang=EN-US>) </span></span></p>

<p class=MsoNormal><span style='color:#444444'>회원의 등록정보 및 회원에 관한 기타 다른 정보에 대하여<span
lang=EN-US>, </span>회사는 정보통신부에서 제정한<span lang=EN-US> &quot;</span>정보통신망이용촉진에 관한
법률<span lang=EN-US>&quot;, &quot;</span>개인정보보호지침<span lang=EN-US>&quot; </span>및<span
lang=EN-US> &quot;</span>신용정보의 이용 및 보호에 관한 법률<span lang=EN-US>&quot;</span>을 준수한다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><b><span style='color:#444444'>제<span lang=EN-US> 3 </span>장
서비스 이용 </span></b></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>12</span>조<span
lang=EN-US> (</span>서비스의 이용 시간<span lang=EN-US>) </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>①</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>“매출채권 팩토링 서비스”는 연중무휴<span lang=EN-US> 1</span>일<span
lang=EN-US> 24 </span>시간 운영된다<span lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>②</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>“매출채권 팩토링 서비스”의 유지<span lang=EN-US>, </span>보수<span
lang=EN-US>, </span>장비 교체 및 업그레이드 등을 위하여 회사는 “매출채권 팩토링 서비스”의 전체 또는 일부 서비스를 일정 시간
동안 사전 예고를 거쳐 정지시킬 수 있다<span lang=EN-US>. </span>단<span lang=EN-US>, </span>부득이 한
경우 사전예고 없이 사후에 서비스의 중지 사유를 공지할 수 있다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>③</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>천재 지변 및 재해<span lang=EN-US>, </span>재난<span lang=EN-US>, </span>그리고
회사의 통제 범위를 벗어난 돌발 상황 발생으로 인해 “매출채권 팩토링 서비스” 가 정지되어 거래<span lang=EN-US> System</span>이
모두 종료될 경우 회사는 이로 인해 발생하는 손해에 대해서 책임을 지지 아니한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>④</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>단<span lang=EN-US>, B2B </span>결제시스템 이용을 위한 전문전송 가능시간은 평일<span
lang=EN-US>(</span>월요일<span lang=EN-US>~</span>금요일<span lang=EN-US>) </span>오전<span
lang=EN-US>8</span>시부터 오후<span lang=EN-US>10</span>시까지이다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>13</span>조<span
lang=EN-US> (</span>서비스의 내용<span lang=EN-US>) </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:black'>①</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>회사가 대리점 제공하는 서비스는 다음과 같다<span lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>1.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>지급현황<span lang=EN-US>(</span>종합<span
lang=EN-US>)</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>2.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>지급내역<span lang=EN-US>(</span>상세<span
lang=EN-US>)</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>3.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>기타지급 승인</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>4.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>채권만기일 지정</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>5.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>결제 내역 조회</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>6.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>세금계산서 조회</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>7.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>그 외 다양한 부가 서비스</span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:black'>②</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>회사가 대리점에게 제공하는 서비스의 정의는 다음과 같다<span
lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>1.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>지급현황 조회<span lang=EN-US>(</span>종합<span
lang=EN-US>)</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt'><span style='color:black'>회사가 인터넷
사이트<span lang=EN-US>(www.mobis.inib2b.com)</span>를 통해 구매기업<span lang=EN-US>(</span>대리점<span
lang=EN-US>)</span>과 거래이력이 있는 판매기업<span lang=EN-US>(</span>품목지원센터<span
lang=EN-US>)</span>에 대해 지급내역 및 지급대상금액을 조회하는 서비스를 말한다</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>2.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>지급내역<span lang=EN-US>(</span>상세<span
lang=EN-US>)</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt'><span style='color:black'>회사가 인터넷
사이트<span lang=EN-US>(www.mobis.inib2b.com)</span>를 통해 구매기업<span lang=EN-US>(</span>대리점<span
lang=EN-US>)</span>이 조회한 판매기업<span lang=EN-US>(</span>품목지원센터<span lang=EN-US>)</span>에
대해 월별 매입 및 지급내역을 조회하는 서비스를 말한다</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>3.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>채권만기일 지정<span lang=EN-US>(</span>매출채권 생성<span
lang=EN-US>)</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt'><span style='color:black'>회사가 인터넷
사이트<span lang=EN-US>(www.mobis.inib2b.com)</span>를 통해 구매기업<span lang=EN-US>(</span>대리점의<span
lang=EN-US>) </span>판매기업<span lang=EN-US>(</span>품목지원센터<span lang=EN-US>)</span>에서
매입한 내역에 대하여 매출채권 생성하는 서비스를 말한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>4.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>기타지급 승인</span></p>

<p class=MsoNormal style='margin-left:38.0pt'><span style='color:black'>회사가 인터넷
사이트<span lang=EN-US>(www.mobis.inib2b.com)</span>를 통해 구매기업<span lang=EN-US>(</span>대리점<span
lang=EN-US>)</span>이 판매기업<span lang=EN-US>(</span>품목지원센터<span lang=EN-US>)</span>으로부터
매출채권 외의 행위로 지급이 일어날 경우 내역정리를 위하여 사용하는 서비스를 말한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>5.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>결제내역조회</span></p>

<p class=MsoNormal style='margin-left:38.0pt'><span style='color:black'>회사가 인터넷
사이트<span lang=EN-US>(www.mobis.inib2b.com)</span>을 통해 구매기업<span lang=EN-US>(</span>대리점<span
lang=EN-US>)</span>이 본인이 지급하여야 하거나 지급한 내역에 대하여 조회하는 서비스를 말한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>6.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>세금계산서 조회</span></p>

<p class=MsoNormal style='margin-left:38.0pt'><span style='color:black'>회사가 인터넷
사이트<span lang=EN-US>(www.mobis.inib2b.com)</span>를 통해 판매기업이 발행한 세금계산서에 대하여 구매기업이
출력하는 서비스를 말한다<span lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>7.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>그 외 다양한 부가서비스</span></p>

<p class=MsoNormal style='margin-left:38.0pt'><span style='color:black'>회사가 회원들간
거래의 편리성을 돕거나 정보를 제공하기 위한 부가서비스를 말한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:black'>&nbsp;</span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>&nbsp;</span><span style='color:black'>③</span><span
lang=EN-US style='color:black'>&nbsp;&nbsp; </span><span style='color:black'>회사가
품목점에 제공하는 서비스는 다음과 같다<span lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>1.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>수금</span><span style='color:black'>현황<span
lang=EN-US>(</span>종합<span lang=EN-US>)</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>2.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>수금</span><span style='color:black'>내역<span
lang=EN-US>(</span>상세<span lang=EN-US>)</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>3.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>채권만기일 변경승인</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>4.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>기타수금 요청</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>5.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>세금계산서 발행</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>6.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>대출 가능 채권조회</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>7.&nbsp;&nbsp;&nbsp; </span><span
style='color:black'>거래처 한도 조회</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>8.&nbsp;&nbsp;&nbsp; </span><span
style='color:black'>수금내역 조회</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>9.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>그 외 다양한 부가 서비스</span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:black'>④</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>회사가 품목점 제공하는 서비스의 정의는 다음과 같다<span lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>1.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>수금</span><span style='color:black'>현황<span
lang=EN-US>(</span>종합<span lang=EN-US>)</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt'><span style='color:black'>회사가 인터넷
사이트<span lang=EN-US>(www.mobis.inib2b.com)</span>를 통해 </span><span
style='color:black'>판매기업<span lang=EN-US>(</span>품목지원센터<span lang=EN-US>)</span>과
거래이력이 있는 구매기업<span lang=EN-US>(</span>대리점<span lang=EN-US>)</span>에<span
lang=EN-US>&nbsp; </span>대해 매출내역 및 </span><span style='color:black'>수금현황을 조회하는 서비스를
말한다</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>2.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>수금</span><span style='color:black'>내역<span
lang=EN-US>(</span>상세<span lang=EN-US>)</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt'><span style='color:black'>회사가 인터넷
사이트<span lang=EN-US>(www.mobis.inib2b.com)</span>를 통해 </span><span
style='color:black'>판매기업<span lang=EN-US>(</span>품목지원센터<span lang=EN-US>)</span>이
조회한 구매기업<span lang=EN-US>(</span>대리점<span lang=EN-US>)</span>에 대해<span
lang=EN-US>&nbsp; </span>월별 매출 및 수금내역을 </span><span style='color:black'>상세히 조회 하는
서비스를 말한다</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>3.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>채권만기일 변경승인</span></p>

<p class=MsoNormal style='margin-left:38.0pt'><span style='color:black'>회사가 인터넷
사이트<span lang=EN-US>(www.mobis.inib2b.com)</span>를 통해 </span><span
style='color:black'>구매기업이 발행한 매출채권에 대하여 만기일 변경 또는 매출채권의 취소 요청 시 </span><span
style='color:black'>승인 및 반려를 할 수 있는 서비스를 말한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>4.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>기타지급 요청</span></p>

<p class=MsoNormal style='margin-left:38.0pt'><span style='color:black'>회사가 인터넷
사이트<span lang=EN-US>(www.mobis.inib2b.com)</span>를 통해 </span><span
style='color:black'>판매기업이 구매기업으로부터 매출채권 이외 다른 방법으로 수금을 진행한 경우 </span><span
style='color:black'>구매기업에게 확인 요청하는 서비스를 말한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>5.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>세금계산서 발행</span></p>

<p class=MsoNormal style='margin-left:38.0pt'><span style='color:black'>회사가 인터넷
사이트<span lang=EN-US>(www.mobis.inib2b.com)</span>을 통해 판매기업에 본인이 일어난 매출에 대하여 세금계산서를
발행하는 서비스를 말한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>6.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>대출 가능 채권조회 </span></p>

<p class=MsoNormal style='margin-left:38.0pt'><span style='color:black'>회사가 인터넷
사이트<span lang=EN-US>(www.mobis.inib2b.com)</span>를 통해 구매기업이 발행한 매출채권 중 판매기업이 대출이
가능한 채권을 조회하는 서비스를 말한다<span lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>7.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>거래처 한도 조회</span></p>

<p class=MsoNormal style='margin-left:38.0pt'><span style='color:black'>회사가 인터넷
사이트<span lang=EN-US>(www.mobis.inib2b.com)</span>을 통해 구매기업 별 해당월에 거래를 할 수 있는 한도를
조회하는 서비스를 말한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>8.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>수금내역 조회</span></p>

<p class=MsoNormal style='margin-left:38.0pt'><span style='color:black'>회사가 인터넷
사이트<span lang=EN-US>(www.mobis.inib2b.com)</span>를 통해 구매기업이 발행한 매출채권에 대하여 진행상태 별로
조회 하는 서비스를 말한다<span lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:black'>9.</span><span lang=EN-US style='color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:black'>그 외 다양한 부가서비스</span></p>

<p class=MsoNormal style='text-indent:40.0pt'><span style='color:black'>회사가 회원들간
거래의 편리성을 돕거나 정보를 제공하기 위한 부가서비스를 말한다</span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>14</span>조<span
lang=EN-US> (</span>거래의 종료<span lang=EN-US>) </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&quot;</span><span
style='color:#444444'>매출채권 팩토링 서비스<span lang=EN-US>&quot; </span>이용한 거래는 결제대금이 판매사가
지정한 계좌로 입금이 완료된 때에 종료된다 </span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>15</span>조<span
lang=EN-US> (</span>거래상의 분쟁 해결<span lang=EN-US>) </span></span></p>

<p class=MsoNormal><span style='color:#444444'>회사는<span lang=EN-US>, </span>거래 도중
발생한 분쟁에 아무런 책임이 없으며 그 책임은 그 귀책사유가 있는 회원에 있다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span style='color:#444444'>단<span lang=EN-US>, </span>회사는 분쟁의
해결을 위해 적극 중재에 나설 수 있으며 필요 시 공정한 제<span lang=EN-US>3</span>의 기관을 중재 기관으로 추천 할 수 있다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>16</span>조<span
lang=EN-US> (</span>거래의 공정성<span lang=EN-US>) </span></span></p>

<p class=MsoNormal><span style='color:#444444'>각 회원은 거래의 진행에 있어서 공정한 방법으로 거래를 진행하여
한다<span lang=EN-US>. </span>만약 불공정한 방법으로 거래를 진행한 사실이 있을 경우 불공정 행위에 대한 책임이 있는 회원에
대하여는 회사의 직권으로 회원자격을 박탈 할 수 있으며<span lang=EN-US>, </span>그 회원은 이로 인해 발생하는 피해에 대해
손해를 배상할 책임이 있다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><b><span style='color:#444444'>제<span lang=EN-US> 4 </span>장
정보관리 </span></b></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>17</span>조<span
lang=EN-US> (</span>정보의 제공 및 광고의 게재<span lang=EN-US>) </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>①</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회사는 “매출채권 팩토링 서비스”의 운영과 관련하여 서비스 화면<span lang=EN-US>, </span>홈페이지<span
lang=EN-US>, </span>전자우편 등 회사에서 지정하는 위치에 광고 등을 게재할 수 있다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>②</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회사는 “매출채권 팩토링 서비스”를 운영함에 있어서 각종 정보를 게시판 등에 게재하는 방법으로 회원에게
제공할 수 있다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>18</span>조<span
lang=EN-US> (</span>게시물 또는 내용물의 삭제<span lang=EN-US>) </span></span></p>

<p class=MsoNormal><span style='color:#444444'>회원은 “매출채권 팩토링 서비스”의 게시판에 회원 임의로 글을
게시할 수 있으나 그 내용이 규정에 위반되거나 게시 기간을 초과하는 경우 회사는 사전 통지나 동의 없이 이를 보완 또는 삭제 할 수 있다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>19</span>조<span
lang=EN-US> (</span>서비스 제공의 중지<span lang=EN-US>) </span></span></p>

<p class=MsoNormal><span style='color:#444444'>회사는<span lang=EN-US>, </span>회사의
필요에 따라 언제든지 본 서비스의 전부 또는 일부를 수정하거나 중단 할 수 있으며<span lang=EN-US>, </span>이 경우 회사는
전자우편 또는 인터넷 홈페이지 등을 통하여 회원에게 즉시 이를 고지한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>20</span>조<span
lang=EN-US> (</span>정보의 관리<span lang=EN-US>) </span></span></p>

<p class=MsoNormal><span style='color:#444444'>“매출채권 팩토링 서비스” 내의 거래 시스템을 이용하여 회원이
올리는 거래 조건 정보에 대하여 회사는 진위 여부를 확인하지 않으며<span lang=EN-US>, </span>그 정보와 관련된 어떤 종류의
책임도 지지 않는다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>21</span>조<span
lang=EN-US> (</span>게시물에 대한 권리 및 책임<span lang=EN-US>) </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>①</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>“매출채권 팩토링 서비스”의 운영 시스템과 관련하여 자체 개발한 프로그램 및 그에 수반된 애플리케이션<span
lang=EN-US>, </span>운영 솔루션 그리고 “매출채권 팩토링 서비스”의<span lang=EN-US> Design </span>등은
회사의 배타적 지적 재산권에 속하므로<span lang=EN-US>, </span>회원은 회사의 사전 허락 없이 무단 사용 및 무단 복제할 수
없다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>②</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>“매출채권 팩토링 서비스” 운영 중에 회사가 수집 분석한 거래 관련 통계 정보 및 직접 수집 가공한 기타
정보에 대하여 회사는 배타적이고 독점적인 권리를 보유한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US> 5 </span>장 의무
</span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>22</span>조<span
lang=EN-US> (</span>회사의 의무<span lang=EN-US>) </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>①</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회사는 특별한 사유가 없는 한 “매출채권 팩토링 서비스” 운영을 위한 설비를 항상 운용 가능한 상태로 유지
보수하여야 하며<span lang=EN-US>, </span>안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다하여야 한다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>②</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회사는 “매출채권 팩토링 서비스”와 관련한 회원의 불만사항이 접수되는 경우 이를 즉시 처리하도록 노력해야
하며<span lang=EN-US>, </span>즉시 처리가 곤란한 경우 그 사유와 처리일정을 “매출채권 팩토링 서비스”에 공지 또는 전자우편을
통하여 동 회원에게 통지하여야 한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>23</span>조<span
lang=EN-US> (</span>회원의 의무<span lang=EN-US>) </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>①</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회원은 관계 법령<span lang=EN-US>, </span>본 약관의 규정<span
lang=EN-US>, </span>이용안내 및 “매출채권 팩토링 서비스”에 공지한 주의사항<span lang=EN-US>, </span>회사가
통지하는 사항을 준수하여야 하며<span lang=EN-US>, </span>기타 회사의 업무에 방해되는 행위를 하여서는 아니 된다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>②</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회원은 자신의<span lang=EN-US> ID, </span>비밀번호를 유지 관리할 책임이 있으며 자신의<span
lang=EN-US> ID</span>와 비밀번호의 분실이나 도용으로 인하여 발생하는 모든 결과에 대해 전적인 책임이 있다<span
lang=EN-US>. </span>또한 자신의<span lang=EN-US> ID</span>와 비밀번호가 자신의 승낙 없이 사용되었을 경우
즉시 회사에 통보하여야 한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>③</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회원은 회원 상호간 체결된 거래에 대해 성실하게 체결 내용을 이행하여야 한다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>④</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회원은 “매출채권 팩토링 서비스”와 관련하여 다음 사항을 하여서는 아니 된다<span
lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>1.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>“매출채권 팩토링 서비스”를 이용하여 얻은 정보를 회사의 사전 승낙 없이 복사<span
lang=EN-US>, </span>복제<span lang=EN-US>, </span>변경<span lang=EN-US>, </span>번역<span
lang=EN-US>, </span>출판<span lang=EN-US>, </span>방송 기타의 방법으로 사용하거나 이를 타인에게 제공하는 행위</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>2.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>타인의 명예를 훼손하거나 모욕하는 행위<span lang=EN-US>, </span>타인의
지적재산권 등의 권리를 침해하는 행위</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>3.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>해킹 또는 컴퓨터 바이러스를 유포하는 일<span lang=EN-US>, </span>타인의
의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>4.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>다른 회원<span lang=EN-US> ID</span>를 부정 사용하는 행위</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>5.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>회사 직원<span lang=EN-US>, </span>포럼 리더 등을 포함한 타인을
사칭하는 행위</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>6.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>“매출채권 팩토링 서비스”를 통해 전송된 컨텐츠의 발신인을 위조하는 행위</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>7.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>“매출채권 팩토링 서비스”의 운영에 지장을 주거나 줄 우려가 있는 일체의 행위 및
기타 관계 법령에 위배되는 행위</span></p>

<p class=MsoNormal style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>8.</span><span lang=EN-US style='font-size:
7.0pt;font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style='color:#444444'>회원 상호간 거래 체결 전 상호확인 행위 </span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>24</span>조<span
lang=EN-US> (</span>부당거래 금지<span lang=EN-US>)</span></span></p>

<p class=MsoListParagraph style='margin-left:38.0pt;text-indent:-18.0pt'><span
lang=EN-US style='color:#444444'>②<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
</span></span><span lang=EN-US style='font-size:7.0pt;font-family:"Times New Roman","serif";
color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp; </span><span style='color:#444444'>“회원”은
“회사”가 관련 보증기관 및 금융기관과 연계하여 제공하는 매출채권 팩토링 서비스를 이용함에 있어 금융회사가 정한 업무프로세스 및 거래규정을 준수하여야
한다<span lang=EN-US>.</span></span></p>

<p class=MsoNormal style='margin-left:20.0pt;text-indent:-20.0pt'><span
style='color:#444444'>②</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>“회사”는<span lang=EN-US> 1</span>항의 금융회사가 정한 업무프로세스를 “회사”가 운영하는
사이트에 적용하며 “회원”이 준수할 거래규정을 본 약관 및 사이트에 게시한다<span lang=EN-US>.</span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>25</span>조<span
lang=EN-US> (</span>양도금지<span lang=EN-US>) </span></span></p>

<p class=MsoNormal><span style='color:#444444'>회원은 “매출채권 팩토링 서비스”의 이용 권한<span
lang=EN-US>, </span>기타 이용 계약상 지위를 타인에게 양도<span lang=EN-US>, </span>증여할 수 없으며<span
lang=EN-US>, </span>이를 담보로 제공할 수 없다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>26</span>조<span
lang=EN-US> (</span>계약해지 및 이용제한<span lang=EN-US>) </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>①</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회원이 약관의 내용을 위반할 경우 회사는 소정의 기간 이내에 이를 해소할 것을 통보하거나 즉시 해지할 수
있다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>②</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회사는 제<span lang=EN-US>1</span>항에 의해 해지된 회원이 다시 이용신청을 하는 경우
일정기간 그 승낙을 제한할 수 있다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>③</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 “매출채권 팩토링 서비스” 또는 전자우편을 통하여
해지신청을 할 수 있다<span lang=EN-US>. </span>이 경우 회사는 즉시 이용계약을 해지한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>27</span>조<span
lang=EN-US> (</span>손해배상<span lang=EN-US>) </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>①</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회사가 제공하는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 회사의 과실에 의한 경우를 제외하고
이에 대하여 책임을 부담하지 않는다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>②</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회원 상호간 거래도중 어느 한쪽이 입은 손해에 대해서는 그 귀책사유가 있는 회원이 손해배상의 책임이 있다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>28</span>조<span
lang=EN-US> (</span>면책 조항<span lang=EN-US>) </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>①</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회사는 회원이 “매출채권 팩토링 서비스”를 통해 게재 또는 전송한 정보<span lang=EN-US>,
</span>자료<span lang=EN-US>, </span>사실의 정확성<span lang=EN-US>, </span>신뢰성 등 내용에 관하여
어떠한 보증도하지 아니하며 회원의 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해 책임을 지지 아니 한다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>②</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회사는 제<span lang=EN-US>3</span>의 부가서비스 제공사업자가 “매출채권 팩토링 서비스”를
통해 제공하는 서비스 자료의 정확성<span lang=EN-US>, </span>신뢰성 등 내용에 관하여 어떠한 보증도 하지 아니하며<span
lang=EN-US>, </span>회원의 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대한 책임을 지지 아니한다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>③</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회사는 회원이 서비스를 이용하여 기대하는 손익이나 “매출채권 팩토링 서비스”를 통하여 얻은 자료로 인 한
손해에 관하여 책임을 지지 아니 한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>④</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회사는 회원 상호간 또는 회원과 제<span lang=EN-US>3</span>자 상호간에 “매출채권 팩토링
서비스”를 매개로 발생한 분쟁에 대해서는 개입할 의무가 없으며 이로 인한 손해를 배상할 책임이 없다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>⑤</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회사는<span lang=EN-US>, </span>회원의 귀책사유로 인하여 매출채권 팩토링 서비스” 이용
상에 장애가 발생한 경우 책임이 면제된다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>⑥</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회원이 본 약관을 위반함으로써 회사에 손해를 끼칠 경우 그 회원은 회사의 손해를 배상하여야 한다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>29</span>조<span
lang=EN-US> (</span>분쟁의 해결<span lang=EN-US>) </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>①</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>회사와 회원은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 한다<span
lang=EN-US>. </span></span></p>

<p class=MsoNormal style='margin-left:18.0pt;text-indent:-18.0pt'><span
style='color:#444444'>②</span><span lang=EN-US style='font-size:7.0pt;
font-family:"Times New Roman","serif";color:#444444'>&nbsp;&nbsp;&nbsp; </span><span
style='color:#444444'>모든 노력에도 불구하고 소송이 제기될 경우<span lang=EN-US>, </span>서울지방법원을 그
전속 관할로 한다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>30</span>조<span
lang=EN-US> (</span>법률의 적용<span lang=EN-US>) </span></span></p>

<p class=MsoNormal><span style='color:#444444'>회원의 서비스 사용으로 발생되는 모든 법적 문제는 대한민국
관계법령의 적용을 받는다<span lang=EN-US>.</span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:black'>제<span lang=EN-US>31</span>조<span
lang=EN-US> (</span>쿠키의 운용 및 활용<span lang=EN-US>)</span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:black'>&nbsp;</span><span
style='color:black'>회사는 회원에게 적합하고 유용한 서비스를 제공하기 위해서 회원의 정보를 저장하고 수시로 불러오는 쿠키<span
lang=EN-US>(cookie)</span>를 사용합니다<span lang=EN-US>.</span>또한 회사는 업무와 관련하여 회원의 사전동의
하에 회원전체 또는 일부의 개인정보에 관한 통계자료를 작성하여 이를 사용할 수 있으며<span lang=EN-US>, </span>서비스를 통하여
회원의 컴퓨터에 쿠키를 전송할 수 있습니다<span lang=EN-US>.</span>이 경우 회원은 선택권을 가지고 있어 쿠키의 수신을 거부하거나
쿠키의 수신에 대하여 경고하도록 사용하는 컴퓨터 브라우저의 설정을 변경할 수 있습니다<span lang=EN-US>.</span>단<span
lang=EN-US>, </span>쿠키의 저장을 거부할 경우 로그인이 필요한 모든 서비스를 이용할 수 없게 됨으로써 발생되는 문제에 대한 책임은
회원에게 있습니다<span lang=EN-US>.</span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><b><span style='color:#444444'>부 칙 </span></b></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>1</span>조<span
lang=EN-US> (</span>약관의 시행<span lang=EN-US>) </span></span></p>

<p class=MsoNormal><span style='color:#444444'>본 개정 약관은<span lang=EN-US> 2015</span>년
<span lang=EN-US>09</span>월<span lang=EN-US> 01</span>일부터 적용한다<span lang=EN-US>.
</span></span></p>

<p class=MsoNormal><span lang=EN-US style='color:#444444'>&nbsp;</span></p>

<p class=MsoNormal><span style='color:#444444'>제<span lang=EN-US>2</span>조<span
lang=EN-US> (</span>경과조치<span lang=EN-US>) </span></span></p>

<p class=MsoNormal><span style='color:#444444'>이 약관의 시행일 이전에 가입한 회원은 이 약관에 의한 규정에
따라 가입한 회원으로 본다<span lang=EN-US>. </span></span></p>

<p class=MsoNormal><span style='color:#444444'>다만<span lang=EN-US>, </span>이 약관에
동의하지 아니하는 기존의 회원은 회원의 선택에 따라 회원자격의 유지여부를 결정할 수 있다<span lang=EN-US>. </span></span></p>
</div>


</div>
<p class="agree_txt">
    <input type="checkbox" class="check" id="agree1" name="agree1" title="" />
    <label for="agree1">KG이니시스 이용약관에 동의합니다.</label>
</p> 


<h3 class="mt40">제3자 제공현황</h3> 
<div class="agree_wrap">
          
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"맑은 고딕";
	panose-1:2 11 5 3 2 0 0 2 0 4;}
@font-face
	{font-family:굴림체;
	panose-1:2 11 6 9 0 1 1 1 1 1;}
@font-face
	{font-family:"\@맑은 고딕";
	panose-1:2 11 5 3 2 0 0 2 0 4;}
@font-face
	{font-family:"\@굴림체";
	panose-1:2 11 6 9 0 1 1 1 1 1;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	text-autospace:none;
	word-break:break-hangul;
	font-size:10.0pt;
	font-family:"맑은 고딕";}
p.MsoHeader, li.MsoHeader, div.MsoHeader
	{mso-style-link:"머리글 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	layout-grid-mode:char;
	text-autospace:none;
	word-break:break-hangul;
	font-size:10.0pt;
	font-family:"맑은 고딕";}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{mso-style-link:"바닥글 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	layout-grid-mode:char;
	text-autospace:none;
	word-break:break-hangul;
	font-size:10.0pt;
	font-family:"맑은 고딕";}
pre
	{mso-style-link:"미리 서식이 지정된 HTML Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:굴림체;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-link:"풍선 도움말 텍스트 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	text-autospace:none;
	word-break:break-hangul;
	font-size:9.0pt;
	font-family:"맑은 고딕";}
span.HTMLChar
	{mso-style-name:"미리 서식이 지정된 HTML Char";
	mso-style-link:"미리 서식이 지정된 HTML";
	font-family:굴림체;}
span.Char
	{mso-style-name:"풍선 도움말 텍스트 Char";
	mso-style-link:"풍선 도움말 텍스트";
	font-family:"맑은 고딕";}
span.Char0
	{mso-style-name:"머리글 Char";
	mso-style-link:머리글;}
span.Char1
	{mso-style-name:"바닥글 Char";
	mso-style-link:바닥글;}
 /* Page Definitions */
 @page WordSection1
	{size:595.3pt 841.9pt;
	margin:3.0cm 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
-->
</style>

<div class=WordSection1>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'>제<span lang=EN-US>3</span>자 제공현황 </p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>1. </span>회사는 원칙적으로 고객의 개인정보를 제<span
lang=EN-US>1</span>조에서 명시한 목적 범위 내에서 처리하며<span lang=EN-US>, </span>고객의사전동의 없이는 본래의
범위를 초과하여 이용하거나 제<span lang=EN-US>3</span>자에게 제공하지 않습니다<span lang=EN-US>. </span>단<span
lang=EN-US>, </span>다음 각호의 경우에는 고객 또는 제<span lang=EN-US>3</span>자의 이익을 부당하게 침해할
우려가 있을 때를 제외 하고는 개인정보를 목적 외의 용도로 이용하거나 이를 제<span lang=EN-US>3</span>자에게 제공할 수 있습니다<span
lang=EN-US>.</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>① </span>고객이 사전에 제<span lang=EN-US>3</span>자
제공 및 공개에 동의한 경우</p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>② </span>다른 법률에 특별한 규정에 의거하거나<span
lang=EN-US>, </span>수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>③ </span>고객 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나<span
lang=EN-US>, </span>주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 고객 또는 제<span lang=EN-US>3</span>자의
급박한 생명<span lang=EN-US>, </span>신체<span lang=EN-US>, </span>재산의 이익 을위하여 필요하다고 인정되는
경우<span lang=EN-US>(</span>다만<span lang=EN-US>, </span>이 경우 당해 사유가 해소된 때에는 개인정보의
처리를 즉시 중단하고<span lang=EN-US>, </span>사전 동의 없이 개인정보를 수집 또는 이용한 사실<span
lang=EN-US>, </span>그 사유와 이용 내역을 통지합니다<span lang=EN-US>.)</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>④ </span>통계작성 및 학술연구 등의 목적을 위하여 필요한 경우로서 특정
개인을 알아볼 수 없는 형태로 개인정보를 제공하는 경우</p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>2. </span>회사는 아래와 같이 개인정보를 제공하고 있습니다<span
lang=EN-US>.</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>1) </span>공공기관에 대한 제공</p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;</span>ㄱ<span lang=EN-US>) </span>제공받는
자</p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;&nbsp; - </span>금융감독원</p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;&nbsp; - </span>지방자치단체<span
lang=EN-US>&nbsp;&nbsp; </span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;&nbsp; - </span>법원</p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;&nbsp; - </span>신용회복위원회<span
lang=EN-US>, </span>국민행복기금</p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;&nbsp; - </span>수사기관<span
lang=EN-US> (</span>경찰서 등<span lang=EN-US>) </span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;</span>ㄴ<span lang=EN-US>) </span>제공목적</p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;&nbsp; - </span>금융감독원<span
lang=EN-US> (</span>감독업무<span lang=EN-US>)</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;&nbsp; - </span>지방자치단체<span
lang=EN-US> (</span>정책 자료 활용<span lang=EN-US>)&nbsp;&nbsp; </span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;&nbsp; - </span>법원<span lang=EN-US>
(</span>개인회생 및 파산의 지원 및 관리<span lang=EN-US>)</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;&nbsp; - </span>신용회복위원회<span
lang=EN-US>, </span>국민행복기금<span lang=EN-US> (</span>신용회복 지원<span lang=EN-US>)</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;&nbsp; - </span>수사기관<span
lang=EN-US> (</span>경찰서 등<span lang=EN-US>) (</span>금융사고 조사<span lang=EN-US>, </span>분쟁해결<span
lang=EN-US>, </span>범죄의 고소 및 고발<span lang=EN-US>)</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'>ㄷ<span lang=EN-US>) </span>제공항목</p>

<p class=MsoNormal style='text-indent:15.0pt;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>- </span>개인식별정보<span lang=EN-US>(</span>성명<span
lang=EN-US>, </span>성별<span lang=EN-US>, </span>주소<span lang=EN-US>, </span>전화번호<span
lang=EN-US>, </span>직업 등<span lang=EN-US>)-</span><span lang=EN-US> </span>신용거래정보<span
lang=EN-US>(</span>본 거래 이전 및 이후의 </p>

<p class=MsoNormal style='text-indent:20.0pt;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'>실적을 포함한 거래내용<span lang=EN-US>)</span></p>

<p class=MsoNormal style='text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp; &nbsp;- </span>거래정보</p>

<p class=MsoNormal style='text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp; &nbsp;- </span>그 외 계약과 관련하여 고객에게 취득한
고객에 관한 정보</p>

<p class=MsoNormal style='margin-left:30.0pt;text-indent:-30.0pt;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span lang=EN-US>&nbsp; &nbsp;-
</span>채무불이행정보<span lang=EN-US>(</span>연체<span lang=EN-US>, </span>대위변제<span
lang=EN-US>, </span>대지급<span lang=EN-US>, </span>부도<span lang=EN-US>, </span>관련인
발생 사실 등<span lang=EN-US>)</span>는 신용정보법 제<span lang=EN-US>32</span>조 제<span
lang=EN-US>1</span>항에 의하여 동의 없이 신용정보집중기관 및 신용조회 당사에게 제공 </p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;&nbsp; - </span>그 외 계약과 관련하여 고객에게 취득한
고객에 관한 정보</p>

<p class=MsoNormal align=left style='margin-left:20.0pt;text-align:left;
text-indent:-20.0pt;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;&nbsp; - </span>채무불이행정보<span
lang=EN-US>(</span>연체<span lang=EN-US>, </span>대위변제<span lang=EN-US>, </span>대지급<span
lang=EN-US>, </span>부도<span lang=EN-US>, </span>관련인 발생 사실 등<span lang=EN-US>)</span>는
신용정보법 제<span lang=EN-US>32</span>조 제<span lang=EN-US>1</span>항에 의하여 동의 없이 신용정보집중기관
및 신용조회 당사에게 제공 </p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;</span>ㄹ<span lang=EN-US>) </span>보유
및 이용기간</p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;&nbsp; - </span>개인<span lang=EN-US>(</span>신용<span
lang=EN-US>)</span>정보는 제공된 날로부터 동의 철회시 또는 제공된 목적을 달성할 때까지 보유 </p>

<p class=MsoNormal align=left style='margin-left:20.0pt;text-align:left;
text-autospace:ideograph-numeric ideograph-other;word-break:keep-all'>이용됩니다<span
lang=EN-US>. </span>해당<span lang=EN-US>(</span>금융<span lang=EN-US>)</span>거래 종료후에는
위에 기재된 이용목적과 관련된 금융사고 조사<span lang=EN-US>, </span>분쟁해결<span lang=EN-US>, </span>민원처리
및 법령상 의무이행을 위하여 필요한 범위 내에서만 보유 이용됩니다<span lang=EN-US>.</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;</span></p>

<pre><span lang=EN-US style='font-size:10.0pt;font-family:"맑은 고딕"'>2) </span><span
style='font-size:10.0pt;font-family:"맑은 고딕"'>제휴회사에 개인정보 제공<span lang=EN-US> (</span>자금 대출에 대한 정보 제공<span
lang=EN-US>)</span></span></pre><pre><span lang=EN-US style='font-size:10.0pt;
font-family:"맑은 고딕"'>&nbsp;</span></pre><pre><span lang=EN-US style='font-size:
10.0pt;font-family:"맑은 고딕"'> </span><span style='font-size:10.0pt;font-family:
"맑은 고딕"'>ㄱ<span lang=EN-US>) </span>제공받는 자</span></pre><pre><span lang=EN-US
style='font-size:10.0pt;font-family:"맑은 고딕"'>&nbsp;&nbsp; - </span><span
style='font-size:10.0pt;font-family:"맑은 고딕"'>현대커머셜</span></pre><pre><span
lang=EN-US style='font-size:10.0pt;font-family:"맑은 고딕"'>&nbsp;</span></pre><pre><span
lang=EN-US style='font-size:10.0pt;font-family:"맑은 고딕"'> </span><span
style='font-size:10.0pt;font-family:"맑은 고딕"'>ㄴ<span lang=EN-US>) </span>제공목적</span></pre><pre><span
lang=EN-US style='font-size:10.0pt;font-family:"맑은 고딕"'>&nbsp;&nbsp; - </span><span
style='font-size:10.0pt;font-family:"맑은 고딕"'>자금 대출에 대한 정보 제공</span></pre><pre><span
lang=EN-US style='font-size:10.0pt;font-family:"맑은 고딕"'>&nbsp;</span></pre><pre><span
lang=EN-US style='font-size:10.0pt;font-family:"맑은 고딕"'> </span><span
style='font-size:10.0pt;font-family:"맑은 고딕"'>ㄷ<span lang=EN-US>) </span>제공항목</span></pre><pre
style='text-indent:15.0pt'><span lang=EN-US style='font-size:10.0pt;font-family:
"맑은 고딕"'>- </span><span style='font-size:10.0pt;font-family:"맑은 고딕"'>개인식별정보<span
lang=EN-US>(</span>성명<span lang=EN-US>, </span>성별<span lang=EN-US>, </span>주소<span
lang=EN-US>, </span>전화번호 등<span lang=EN-US>)</span></span></pre>

<p class=MsoNormal style='text-indent:10.0pt;text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp;-</span><span lang=EN-US> </span>신용거래정보<span
lang=EN-US>(</span>본 거래 이전 및 이후의 실적을 포함한 거래내용<span lang=EN-US>)</span></p>

<p class=MsoNormal style='text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp; &nbsp;- </span>거래정보</p>

<p class=MsoNormal style='text-autospace:ideograph-numeric ideograph-other;
word-break:keep-all'><span lang=EN-US>&nbsp; &nbsp;- </span>그 외 계약과 관련하여 고객에게 취득한
고객에 관한 정보</p>

<p class=MsoNormal style='margin-left:30.0pt;text-indent:-30.0pt;text-autospace:
ideograph-numeric ideograph-other;word-break:keep-all'><span lang=EN-US>&nbsp; &nbsp;-
</span>채무불이행정보<span lang=EN-US>(</span>연체<span lang=EN-US>, </span>대위변제<span
lang=EN-US>, </span>대지급<span lang=EN-US>, </span>부도<span lang=EN-US>, </span>관련인
발생 사실 등<span lang=EN-US>)</span>는 신용정보법 제<span lang=EN-US>32</span>조 제<span
lang=EN-US>1</span>항에 의하여 동의 없이 신용정보집중기관 및 신용조회 당사에게 제공 </p>

<pre><span lang=EN-US style='font-size:10.0pt;font-family:"맑은 고딕"'>&nbsp;</span></pre><pre><span
lang=EN-US style='font-size:10.0pt;font-family:"맑은 고딕"'> </span><span
style='font-size:10.0pt;font-family:"맑은 고딕"'>ㄹ<span lang=EN-US>) </span>보유 및 이용기간</span></pre><pre
style='margin-left:25.0pt;text-indent:-25.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"맑은 고딕"'>&nbsp;&nbsp; - </span><span
style='font-size:10.0pt;font-family:"맑은 고딕"'>개인<span lang=EN-US>(</span>신용<span
lang=EN-US>)</span>정보는 제공된 날로부터 동의 철회시 또는 제공된 목적을 달성할 때까지 보유 이용됩니다<span
lang=EN-US>. </span>해당<span lang=EN-US>(</span>금융<span lang=EN-US>)</span>거래 종료 후에는 위에 기재된 이용목적과 관련된 금융사고 조사<span
lang=EN-US>, </span>분쟁해결<span lang=EN-US>, </span>민원처리 및 법령상 의무이행을 위하여 필요한 범위 내에서만 보유 이용됩니다<span
lang=EN-US>.</span></span></pre>
</div>

 
</div>

<p class="agree_txt">
    <input type="checkbox" class="check" id="agree2" name="agree2" title="" />
    <label for="agree2">제3자 제공현황에 동의합니다.</label>
</p>  

<h3 class="mt40">부도시 세금계산서 채권만기일 지정에 따른 동의</h3> 
<div class="agree_wrap" style="font-weight:bold;">
<p>
  대리점이 매출채권 만기일자에 미결재시(연체) 자동으로 연체 유예기간이 20일 동안 부여됩니다.<br>
  이에 대리점은 연체 전까지 발생된 매출전표에 의해 발행된 세금계산서에 대해 채권 만기일 지정을 하여 승인을 해야만 합니다.<br>
  만약, 자동연체 유예기간(20일)동안 세금계산서 채권만기일 지정이 안됬을 경우 20일 초과 시점 D + 2일로 <br>
 자동만기일 지정은 승인한 것으로 간주합니다.
  
</p>                  
</div>

<p class="agree_txt">
    <input type="checkbox" class="check" id="agree3" name="agree3" title="" />
    <label for="agree3">부도시 세금계산서 채권만기일 지정에 따른 동의에 동의합니다.</label>
</p>  


<div class="ac mt30">
    <span class="btn btn_normal2"><a href="#" id = "nextStep" style="width:130px;">다음단계로</a></span>
</div>

<div id="bizNumError" class="alert_popup" style="visibility: hidden">
    <dl>
        <dt>첫번째 사업자 번호 3자리를 입력하세요.</dt>
        <dd>
            <span class="btn btn_normal"><a id="btn_bizNumError" href="#" style="width:80px;">승인</a></span>
        </dd>
    </dl>
</div>          

<!-- jsonUrl -->

<form id="user" action="<c:url value='/usr/registStep3.do'/>" method="post">
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

