<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="DBBean.foodingBean" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<%
		String addrnum = request.getParameter("reqaddrnum");
		String address = request.getParameter("reqaddress");
	%>
	
	<script type="text/javascript">
        window.opener.sendingaddr("<%=addrnum%>","<%=address%>")
        window.close();
	</script>
</body>
</html>

		