<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.foodingBean"%>
<%
	request.setCharacterEncoding("UTF-8");
	foodingBean dbPro = foodingBean.getInstance();
	int buyref = Integer.parseInt(request.getParameter("buyref"));
	String buystatus = request.getParameter("buystatus");
	dbPro.changebuystatus(buyref,buystatus);
%>
<script>
	alert("성공적으로 변경되었습니다.");
</script>
<%
	response.sendRedirect("adminjumuncheck.jsp");
%>

