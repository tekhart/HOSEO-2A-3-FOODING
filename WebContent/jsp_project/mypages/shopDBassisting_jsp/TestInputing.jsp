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
	String[] selCartIdchkbx = request.getParameterValues("CartIdchkbx");
	int intedCartIds[]=new int[selCartIdchkbx.length];
	
	for(int i = 0; i<selCartIdchkbx.length; i++){
		intedCartIds[i]=Integer.parseInt(selCartIdchkbx[i]);
		
	}
	dbPro.SendCartToBuy(intedCartIds);
	response.sendRedirect("../shopbasket.jsp");
}catch(Exception e){
	e.printStackTrace();
}
%>