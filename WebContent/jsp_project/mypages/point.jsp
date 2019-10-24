<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "DBBean.productDataBean" %>
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
</head> 

		<body id="body">
		<%@include file="../general_included/topbar.jsp"%>
		
		<div id="maindiv">
		<div class="writetitle1">
		포인트 관리</div>
			<%@include file="sidemenu.jsp"%> 
			
			<center>
				<div class="row2">
						<span class="forkspace"><img id="forkimage" src="../img/fork.png" rotate="90"></span>
					<div class="forkpoint">
							<div class="forkpoint2"><h3>포크 포인트</h3></div>
							<div  class="forkpoint3">0 P</div>
					</div>
				</div>
			
			
			
			
			
			
			

</body>
</html>
