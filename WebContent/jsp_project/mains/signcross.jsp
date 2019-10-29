<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ page import="java.sql.*"%>
<%@page import="DBBean.foodingBean" %>
<%@ page import="java.sql.Timestamp" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="article" scope="page" class="DBBean.userDataBean">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean> 
<%
	try{
		article.setReg_date(new Timestamp(System.currentTimeMillis()));
		foodingBean dbPro = foodingBean.getInstance();
		if(dbPro.insertUserArticle(article)==1){
			session.setAttribute("idlogin",article.getId());
		}
		response.sendRedirect("../general_included/thanks_for_register.jsp");
	}catch(Exception e){
		response.sendRedirect("../general_included/sorry_errer.jsp");
	}
%>


