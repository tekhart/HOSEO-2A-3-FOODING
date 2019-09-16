<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ page import="java.sql.*"%>
<%@page import="DBBean.foodingBean" %>
<jsp:useBean id="tempbean" scope="session" class="DBBean.foodingDataBean"/>

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
	
	String nknamecheck=request.getParameter("nknamecheck");
	String idcheck=request.getParameter("idcheck");
	String passwdcheck=request.getParameter("passwdcheck");
	String repasswdcheck=request.getParameter("repasswdcheck");
	String emailcheck=request.getParameter("emailcheck");
	
	String selected=request.getParameter("selected");
	tempbean.setAll(nkname, id, passwd, repasswd, email, addrnum, address, detailaddr,
			nknamecheck, idcheck, passwdcheck, repasswdcheck, emailcheck);

%>
	<form method="post" name="register" action="signup.jsp" ></form>
<%


	int mileage = 0;
	
	if(selected.equals("zipload")){
		response.sendRedirect("../mains/signup.jsp");
	}else{
		foodingbean.connect();
		
		String sql = "insert into user values('"+nkname+"','"+id+"','"+passwd+"','"+email+"','"+addrnum+"','"+address+"','"+detailaddr+"','"+gender+"',"+mileage+")";
		foodingbean.nonResultQuery(sql);
		session.setAttribute("idlogin",id);
		response.sendRedirect("../mains/main.jsp");
	}
%>


