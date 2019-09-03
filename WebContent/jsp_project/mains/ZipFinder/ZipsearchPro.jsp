<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="DBBean.foodingBean" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="tempbean" scope="session" class="DBBean.foodingBean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<%
		String reqaddrnum = request.getParameter("reqaddrnum");
		String reqaddress = request.getParameter("reqaddress");
		tempbean.setAddrnum(reqaddrnum);
		tempbean.setAddress(reqaddress);

	%>
	
	<script type="text/javascript">
		opener.location.href="../signup.jsp";
		self.close();
	</script>
</body>
</html>

		