<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ page import="java.sql.*"%>
<%@page import="DBBean.foodingBean" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	foodingBean foodingbean=new foodingBean();
	String id=request.getParameter("id");
	String passwd = request.getParameter("passwd");
	foodingbean.connect();
	String sql = "update user set passwd='"+passwd+"' where id='"+id+"'";
	foodingbean.nonResultQuery(sql);
	session.invalidate();
%>
<script>
	alert("변경 완료되었습니다. 새로운 비밀번호로 로그인해주세요!");
	location.href="../mains/main.jsp";
</script>