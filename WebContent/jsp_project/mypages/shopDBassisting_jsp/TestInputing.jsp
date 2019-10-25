<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "DBBean.productDataBean" %>
<%
request.setCharacterEncoding("UTF-8");
int addproductid=0;
int addproductcount=0;
foodingBean dbPro = foodingBean.getInstance();
try{
	String selCartIdchkbx = request.getParameter("CartIdchkbx[]");
	String[] arrCartIdchkbx = selCartIdchkbx.split(",");
	int[] intarrCartIdchkbx = null;
	
	for(int i = 0; i<arrCartIdchkbx.length; i++){
		intarrCartIdchkbx[i] = Integer.parseInt(arrCartIdchkbx[i]);
	}
	
	dbPro.SendCartToBuy(intarrCartIdchkbx);
}catch(Exception e){
	e.printStackTrace();
}
response.sendRedirect("../shopbasket.jsp"); 
%>