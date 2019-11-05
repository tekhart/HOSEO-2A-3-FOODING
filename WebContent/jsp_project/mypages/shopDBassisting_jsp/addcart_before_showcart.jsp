<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "DBBean.productDataBean" %>
<html>
	<head>
	</head>
	<body>
		<%@include file="../../general_included/topbar.jsp"%>
	</body>
</html>
<%
request.setCharacterEncoding("UTF-8");
int addproductid=0;
int addproductcount=0;
foodingBean dbPro = foodingBean.getInstance();
try{
	addproductid=Integer.parseInt(request.getParameter("addproductid"));
	addproductcount=Integer.parseInt(request.getParameter("addproductcount"));
	dbPro.insertcartArticle(addproductid,addproductcount,(String)session.getAttribute("idlogin"));
}catch(Exception e){
	e.printStackTrace();
}
response.sendRedirect("../../shop/main.jsp"); 
%>