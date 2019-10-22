<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 조회</title>
<link rel="stylesheet" href="../jsp_project/css/common.css">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<style>
.jumuntb{
border-collapse:collapse;
width:1000px;
margin:auto;
margin-top:100px;
}

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

.ok[value=""] { color: red; }

</style>
</head>
<body>
<%@include file="../general_included/topbar.jsp"%>

<table class="jumuntb">
<tr class="jumuntr1"><td>주문번호</td><td>주문일</td>
<td class="tooltip">결제금액<img src="../img/what2.png" width="25px" height="25px" style="vertical-align:middle;">
<span class="tooltiptext">할인 / 사용 포인트가 적용된 금액입니다</span></td>
<td>주문상태</td></tr>
<tr class="jumuntr2"><td>171006-820356782</td><td>2019-10-22</td><td>37,800</td><td>결제확인</td></tr>
<tr class="jumuntr2"><td>171006-820356782</td><td>2019-10-22</td><td>37,800</td><td>배송출하</td></tr>
<tr class="jumuntr2"><td>171006-820356782</td><td>2019-10-22</td><td>37,800</td><td>배송완료</td></tr>
<tr class="jumuntr2"><td>171006-820356782</td><td>2019-10-22</td><td>37,800</td><td>주문보류</td></tr>
<tr class="jumuntr2"><td>171006-820356782</td><td>2019-10-22</td><td>37,800</td><td>결제확인중</td></tr>
</table>



</body>
</html>
