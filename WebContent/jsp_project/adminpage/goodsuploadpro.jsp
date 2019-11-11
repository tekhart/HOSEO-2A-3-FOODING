<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.foodingBean"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="article" scope="page" class="DBBean.productDataBean">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>

<%
	
	foodingBean dbPro = foodingBean.getInstance();
	dbPro.insertproductArticle(article);
	response.sendRedirect("goods.jsp");
%>
