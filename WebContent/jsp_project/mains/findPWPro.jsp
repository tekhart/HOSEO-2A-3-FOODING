<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="DBBean.foodingBean" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<link rel="stylesheet" href="../css/common.css">
<style>
												

</style>

</head>
<body>
<%@include file="../general_included/topbar.jsp"%>

<div id="maindiv">

	<%
	String id=request.getParameter("id");
	String email=request.getParameter("email");
	String pw="";
		
		foodingBean foodingbean=new foodingBean();
		
		foodingbean.connect();
		
		String sql = "select passwd from user where id='"+id+"' and email='"+email+"';";
		ResultSet rs = foodingbean.resultQuery(sql);
		try{
			if(rs.next()) {
				pw = rs.getString("passwd");	
	%>
	<br><br>
	<center>
		<span>회원님의 비밀번호는 </span><h4><%=pw%></h4>입니다.<!-- 추출한 ID를 보여줌 -->
	</center>
	
	<%
			}
		}catch(Exception e){
			%>
			<script>
			alert("입력하신 정보를 확인해주세요.");
			</script>
			<%
			response.sendRedirect("../mains/findPW.jsp");
		}
	%>
		
			
</div>

<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
<pre>
Create by FOODING
고객문의 1544-XXXX
JSP Project 2019 2A03</pre>
</div>

</body>
</html>
