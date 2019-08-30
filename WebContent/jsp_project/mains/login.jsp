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
			String sql1 = "select id,passwd from user where id='"+id+"';";
			ResultSet rs = foodingbean.resultQuery(sql1);
			
			try{
				if(rs.next()) {
					String dbid = rs.getString("id");
					String dbpw = rs.getString("passwd");
					if (id.equals(dbid) && pw.equals(dbpw)) {
						session.setAttribute("idlogin",id);
						response.sendRedirect("../mains/main.jsp");
					}
					else {
	%>
		<script>
			alert("로그아웃 되었습니다.");
		</script>
	<%	
						response.sendRedirect("../mains/signin.jsp");
					}
				}
			}catch (Exception e) {
				%>
					<script>
						alert("찾을 수 없었습니다.");
						location.href("signin.jsp");
					</script>
				<%	
			}finally{}
				


	%>

</body>
</html>
