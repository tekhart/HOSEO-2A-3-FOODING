<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.foodingBean"%>
<%@ page import="java.sql.Timestamp"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="article" scope="page" class="DBBean.announceDataBean">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>
<%
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	Timestamp timestamp = java.sql.Timestamp
			.valueOf((String) request.getParameter("string_end_date") + " 00:00:00");

	article.setEnd_date(timestamp);

	foodingBean dbPro = foodingBean.getInstance();
	int check = dbPro.updateannounceArticle(article);
	response.sendRedirect("list.jsp");
%>
