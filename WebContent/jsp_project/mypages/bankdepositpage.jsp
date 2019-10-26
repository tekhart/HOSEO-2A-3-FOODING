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
	<title>포인트 관리</title>
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
		포인트 관리</div>
		<%@include file="sidemenu.jsp"%>   
			
			<center>  
				<div class="row2"> 
					<div class="jumungamsa">주문 감사드립니다(접수 완료)</div>
					<p> 총 입금하실 금액을 확인하시고, 은행에 입금하여 주세요.</p>
					<table class="jugamtable" border="1">
						<tr><td>주문번호</td>
							<td>주문일</td>
					</table>
					
					<table border="1" style="border-color:">
						<tr><td collapse="4">
						<tr><td>총 입금하실 금액</td><td></td><td>계좌번호</td><td></td>
						<tr><td>입금은행</td><td></td><td>입금기한</td><td></td>
					</table>
				
				</div>
			
			
			
			
<%@include file="../general_included/footer.jsp"%>
	<br><br>
</body>
</html>
