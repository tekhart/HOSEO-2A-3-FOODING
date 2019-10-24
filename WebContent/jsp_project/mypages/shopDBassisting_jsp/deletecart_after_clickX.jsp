<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "DBBean.productDataBean" %>
<%
request.setCharacterEncoding("UTF-8");
int deletecartid=0;
foodingBean dbPro = foodingBean.getInstance();
try{
	deletecartid=Integer.parseInt(request.getParameter("deletecartid"));
	dbPro.deletecartArticle(deletecartid);
}catch(Exception e){
	e.printStackTrace();
}
response.sendRedirect("../shopbasket.jsp"); 
%>