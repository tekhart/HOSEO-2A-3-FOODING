<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<link rel="stylesheet" href="../jsp_project/css/common.css">
<link rel="stylesheet" href="../jsp_project/css/list.css">
<link rel="stylesheet" href="ask.css">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">

<style>

.askdiv1{
	width:1200px; 
	margin:auto; 
	height:450px;
	background-color:white;
	border:2px solid orange;
	padding:30px; 
}

.askdiv2{
	width:1200px; 
	margin:auto; 
	height:350px;
	background-color:white;
	border:2px solid orange;
	padding:30px;
}

.askbody{
	font-family:Easop;
}

.place, .warning{
	float:left;
	width:500px;
	margin-left:80px;
	margin-top:30px;
	
}

.asktd1{
	border-bottom:2px solid orange;
	 padding:10px;
}

.asktd2{
	border-bottom:1px solid #ffe699; 
	 padding:20px;
}

</style>

</head>
<body class="askbody">
<%@include file="../general_included/topbar.jsp"%>


<br><br><br>
<div class="askdiv1">
<h3 style="text-align:center; margin-top:0px;">문제 해결 방법</h3>
<br><br><br>

<div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
		<br><br><br><br>01 개발자를 찾아보세요!
    </div>
    <div class="flip-card-back">
<pre style="line-height:1.8em">

푸딩 제작자를 통해
보다 직접적이고 정확한
상담을 제공합니다.
푸딩 페이지 맨 밑의
블로그를 참고해주세요.</pre>
    </div>
  </div>
</div>

<div class="flip-card2">
  <div class="flip-card-inner2">
    <div class="flip-card-front2">
		<br><br><br><br>02 자주하는 질문을<br>참고해보세요! 
    </div>
    <div class="flip-card-back2">
<pre style="line-height:1.8em">



거기에 찾던것이
있을수 있습니다.</pre>
    </div>
  </div>
</div>

<div class="flip-card3">
  <div class="flip-card-inner3">
    <div class="flip-card-front3">
		<br><br><br><br>03 문의를 접수해주세요!
    </div>
    <div class="flip-card-back3">
<pre style="line-height:1.8em">

어느 방법으로도 문제를
해결 할 수 없었다면
제공되는 양식에 따라
저희에게 문의해주세요.
최대한 빠르게
답변해드리겠습니다.</pre>
    </div>
  </div>
</div>

</div>


<div class="flip-card4">
  <div class="flip-card-inner4">
    <div class="flip-card-front4">
		
    </div>
    <div class="flip-card-back4">
  	 	<img src="../img/homemadeding.png" width="100px" height="100px">
    </div>
  </div>
</div>


<br><br><br><br><br> 

<div class="askdiv2">
<h3 style="text-align:center; margin-top:0px;">방문 문의</h3>

<div class="place">
<table style="border-spacing:0px;"><tr><td class="asktd1" colspan="2">위치 및 운영시간</td><td></td></tr><tr>
<td class="asktd2">주소</td><td class="asktd2">서울특별시 강서구 등촌3동 강서로 420</td></tr><tr>
<td class="asktd2">운영시간</td><td class="asktd2">매주 평일 10:00~20:00<br>공휴일, 주말 및 야간에는 운영하지 않습니다.</td></tr></table>
</div>


<div class="warning">
<table style="border-spacing:0px;"><tr class="asktr1"><td class="asktd1">
고객센터를 이용하시기 전에 확인해주세요!
</td></tr><tr class="placetr2"><td class="asktd2">
1. 고객센터에서는 FOODING ID 관련 문의, 컨텐츠 등의 <br>&nbsp&nbsp&nbsp문의를 신속히 도움드릴 수 있습니다.
</td></tr><tr class="placetr2"><td class="asktd2">
2. 개발자를 찾아오실때는 간식을 들고오세요.<br>&nbsp&nbsp&nbsp정확한 상담을 드릴 수 있습니다.
</td></tr></table>
</div>

</div>

<br><br><br><br>
<div style="float:right; margin-right:315px;">
<input type="button" value="문의하기" class="findbutton" onclick="location.href='askform.jsp'">
</div>


<%@include file="../general_included/footer.jsp"%>
</body>
</html>
