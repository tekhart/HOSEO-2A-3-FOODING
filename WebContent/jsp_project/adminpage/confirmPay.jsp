<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DBBean.foodingBean" %>
<%
	request.setCharacterEncoding("UTF-8");
	foodingBean dbPro = foodingBean.getInstance();
	int buyref = Integer.parseInt(request.getParameter("buyref"));
	int buytotalprice = Integer.parseInt(request.getParameter("buytotalprice"));
	int buypointused = Integer.parseInt(request.getParameter("buypointused"));
	String buytitle = request.getParameter("buytitle");
	dbPro.confirmPay(buyref,buytotalprice,buypointused,buytitle);
%>
<script>
	alert("결제 확인 완료 되었습니다.");
</script>
<%
	response.sendRedirect("adminjumuncheck.jsp");
%>

