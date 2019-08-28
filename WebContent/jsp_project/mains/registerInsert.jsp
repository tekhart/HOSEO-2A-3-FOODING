<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="DBBean.foodingBean" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<body>
	<%	
		String nkname = request.getParameter("nkname");
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String email = request.getParameter("email");
		String addrnum = request.getParameter("AddrNum");
		String detailaddr = request.getParameter("DetailAddr");
		String gender = request.getParameter("gender");
		int mileage = 0;
		
		//signup.jsp 파일의 form태그에서 입력된 값을 저장할 변수 생성, 그리고 form 태그에 있는 값을 저장함 

		foodingBean foodingbean=new foodingBean();
		
		foodingbean.connect();
		
		String sql = "insert into user values("+nkname+","+id+","+passwd+","+email+","+addrnum+","+detailaddr+","+gender+","+mileage+")";
		foodingbean.nonResultQuery(sql);
		//register 테이블에 signup.jsp 파일의 form태그에서 입력된 값을 입력함 
		session.setAttribute("idlogin",id);
		response.sendRedirect("../mains/main.jsp");
		//회원가입이 제대로 됐으면 str의 값이 '회원가입 됐습니다.'로 저장됨
		
		%>
</body>
</html>
