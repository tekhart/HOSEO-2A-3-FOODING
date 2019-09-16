<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="DBBean.foodingBean" %>
    <%@ page import="java.sql.Timestamp" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    
<jsp:useBean id="article" scope="page" class="DBBean.BoardDataBean">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean>    

<%
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	
	foodingBean dbPro = foodingBean.getInstance();
	dbPro.insertArticle(article);
	response.sendRedirect("list.jsp");
%>
