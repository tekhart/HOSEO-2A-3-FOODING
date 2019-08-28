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
<title>Login</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("passwd");
		//form 태그의 값을 저장
		foodingBean foodingbean=new foodingBean();
		
		foodingbean.connect();
			String sql1 = "select ID,PASSWD from user where id="+id+";";
			ResultSet rs = foodingbean.resultQuery(sql1);

			if(rs.next()) {
				String dbid = rs.getString("id");
				String dbpw = rs.getString("passwd");
				if (id.equals(dbid) && pw.equals(dbpw)) {
				
	%>
<span>로그인 되셨습니다.</span>
	<%
					session.setAttribute("idlogin",id);
					response.sendRedirect("../mains/main.jsp");
				}
				else {
	%>
		<span>로그인 안 되셨습니다.</span>
		<script>
			alert("로그아웃 되었습니다.");
		</script>
	<%	
					response.sendRedirect("../mains/signin.jsp");
				}
			}


	%>

</body>
</html>
