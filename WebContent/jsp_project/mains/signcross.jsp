<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ page import="java.sql.*"%>
<%@page import="DBBean.foodingBean" %>
<%
	request.setCharacterEncoding("UTF-8");
	foodingBean foodingbean=new foodingBean();
	
	String nkname = request.getParameter("nkname");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String repasswd = request.getParameter("repasswd");
	String email = request.getParameter("email");
	String addrnum = request.getParameter("addrnum");
	String address = request.getParameter("address");
	String detailaddr = request.getParameter("detailaddr");
	String gender=request.getParameter("gender");
	
	int mileage = 0;

	foodingbean.connect();
	
	try{
		String sql = "insert into user values('"+nkname+"','"+id+"','"+passwd+"','"+email+"','"+addrnum+"','"+address+"','"+detailaddr+"','"+gender+"',"+mileage+")";
		foodingbean.nonResultQuery(sql);
		session.setAttribute("idlogin",id);
		response.sendRedirect("../general_included/thanks_for_register.jsp");
	}catch(Exception e){
		response.sendRedirect("../general_included/sorry_errer.jsp");
	}
%>


