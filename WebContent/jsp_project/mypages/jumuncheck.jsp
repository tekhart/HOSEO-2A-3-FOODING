<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>


<!DOCTYPE html>
<html>
<head>

<title>주문 조회</title>
<link rel="stylesheet" href="../jsp_project/css/common.css">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="../css/list.css">
<style>
.jumuntb{
border-collapse:collapse;
width:1200px;
margin:auto;
padding:100px;
top:100px;
position:relative;
}

.cc{width:100px;} 

.jumuntb td {
	height:60px;
	width:150px;
	text-align:center;
}

.tooltip {
	position: relative;
}

.tooltip .tooltiptext {
	visibility: hidden;
	width: 320px;
	background-color: #555;
	color: #fff;
	text-align: center;
	border-radius: 6px;
	padding: 5px 0;
	position: absolute;
	z-index: 1;
	bottom: 125%;
	left: 50%;
	margin-left: -127px;
	opacity: 0;
	transition: opacity 0.3s;
}	

.tooltip .tooltiptext::after {
	content: "";
	position: absolute;
	top: 100%;
	left: 50%;
	margin-left: -5px;
	border-width: 5px;
	border-style: solid;
	border-color: #555 transparent transparent transparent;
}

.tooltip:hover .tooltiptext {
	visibility: visible;
	opacity: 1;
}

.jumuntr1 td{
	background-color:#FFCD12;
	color:white;
	border-top:2px solid #CCA63D;
	border-bottom:2px solid #CCA63D;
}

.jumuntr2 td{
	border-bottom:1px solid #eaeaea;
}


</style>
</head>
<body  id="body">
<%@include file="../general_included/topbar.jsp"%>

<div id="maindiv">
<div class="writetitle1">
주문조회</div>
	<%@include file="sidemenu.jsp"%>
	
<table class="jumuntb">
	<tr class="jumuntr1"><td class="cc">주문번호</td><td>주문일</td>
	<td class="tooltip">결제금액<img src="../img/what2.png" width="25px" height="25px" style="vertical-align:middle;">
	<span class="tooltiptext">할인 / 사용 포인트가 적용된 금액입니다</span></td><td class="cc">주문내용</td>
	<td>주문상태</td><td>상세정보</td></tr>
	<tr class="jumuntr2"><td>171006-236746782</td><td>2019-10-22</td><td>37,800</td><td>곰곰 소중한 우리 쌀 현미와 백미, 10kg, 1개 외3</td><td>결제확인</td><td>신용카드</td></tr>
	<tr class="jumuntr2"><td>236806-857855322</td><td>2019-10-11</td><td>45,800</td><td>냄비, 후라이팬 세트</td><td>배송출하</td><td>무통장입금</td></tr>
	<tr class="jumuntr2"><td>235746-827643478</td><td>2019-10-05</td><td>12,000</td><td>소고기 갈비살</td><td>배송완료</td><td>신용카드</td></tr>
	<tr class="jumuntr2"><td>176794-237856482</td><td>2019-09-08</td><td>46,000</td><td>후라이팬</td><td>주문보류</td><td>신용카드</td></tr>
	<tr class="jumuntr2"><td>573596-674929058</td><td>2019-09-01</td><td>1,600</td><td>이쑤시개</td><td>결제확인중</td><td>무통장입금</td></tr>
	
</table>


<%@include file="../general_included/footer.jsp"%>
</body>
</html>
