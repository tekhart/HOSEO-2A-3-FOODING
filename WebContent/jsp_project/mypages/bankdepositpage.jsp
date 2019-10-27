<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "DBBean.productDataBean" %>

<!--  달력기능 넣어보려했는데 잘 모르겠음
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
-->
<meta charset="UTF-8">


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>접수 완료</title>
			<link rel="stylesheet" href="../css/common.css">
			<link rel="stylesheet" href="../css/list.css">
			


	<style>
		
		body{	font-family:"Bauhaus ITC";
		color:black;}
		
		#title{
		text-decoration:none;
	
		}
	</style>
	
	<script>
	
</script>


</head> 
 
		<body id="body">
		<%@include file="../general_included/topbar.jsp"%>
		
		<div id="maindiv">
		<div class="writetitle1">
		</div>
		<%@include file="sidemenu.jsp"%>   
			
			<center>  
				<div class="row2"> 
					<div class="jumungamsa">주문 감사드립니다(접수 완료)</div>
					<p> 총 입금하실 금액을 확인하시고, 은행에 입금하여 주세요.</p>
					<table class="jugamtable">
						<tr><td>주문번호</td>
							<td>주문일</td>
					</table>
			<br><br> 
					 <p class="bankinfo" >입금하실 은행정보</p>
					<table style="border:3px solid #c0c0c0; border-width: thin;  border-collapse: collapse;">
						<tr><td class="bankallprice">총 입금하실 금액</td>
							<td class="banking">55,000원</td>
						<td class="bankallprice">계좌번호</td>
							<td class="banking">302-1133-2090-11</td>
						<tr><td class="bankallprice">입금은행</td>
							<td class="banking">농협</td>
						<td class="bankallprice"> 입금기한</td>
							<td class="banking">주문일로부터 3일간</td> 
					</table>
						<div style="text-align:center; margin-top:40px;">
							<input type="button" value="확인" class="tkdyd4" onclick="location.href='../mypages/jumuncheck.jsp'">
						</div>
				</div>
			
			
			</center>
			
<%@include file="../general_included/footer.jsp"%>
	<br><br>
</body>
</html>
