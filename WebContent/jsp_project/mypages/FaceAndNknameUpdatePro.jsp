<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBBean.foodingBean"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	foodingBean foodingbean = new foodingBean();
	String id = request.getParameter("id");
	String userface = request.getParameter("userface");
	String nkname = request.getParameter("nkname");
	foodingbean.connect();
	String sql = "update user set userface='" + userface + "' , nkname='" + nkname + "' where id='" + id + "'";
	foodingbean.nonResultQuery(sql);
%>
<script>
	alert("변경 완료되었습니다. 새로운 프로필이에요!");
	location.href = "profile.jsp";
</script>