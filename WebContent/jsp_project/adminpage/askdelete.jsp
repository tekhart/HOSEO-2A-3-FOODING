<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>

<%request.setCharacterEncoding("UTF-8"); %>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	
	foodingBean dbPro = foodingBean.getInstance();
	dbPro.deleteaskArticle(id);
%>
<script>
	alert("문의 삭제가 완료되었습니다.");
	location.href = "asklist.jsp";
</script>