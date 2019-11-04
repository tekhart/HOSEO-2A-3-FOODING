<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="DBBean.foodingBean" %>
    <%@ page import="java.sql.Timestamp" %>
    
    <% request.setCharacterEncoding("utf-8"); %>

<%

	int rootin = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pagenum"));
	
	foodingBean dbPro = foodingBean.getInstance();
	dbPro.deleteCommentArticle(rootin);
%>
<script>
	location.href='content.jsp?num=<%=rootin%>&pageNum=<%=pageNum%>';
</script>

