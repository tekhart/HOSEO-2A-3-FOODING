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
			try{
				ResultSet rs = foodingbean.resultQuery(sql1);
				if(rs.next()) {
					String dbid = rs.getString("id");
					String dbpw = rs.getString("passwd");
					if (id.equals(dbid) && pw.equals(dbpw)) {
						session.setAttribute("idlogin",id);
						response.sendRedirect("../mains/main.jsp");
						
					}else{
						%>
							<script type="text/javascript">
								alert("입력하신 정보를 확인해주세요.");
								location.href="signin.jsp";
							</script>
						<%
						foodingbean.DBclose();
					}
				}else{
					%>
						<script type="text/javascript">
							alert("입력하신 정보를 확인해주세요.");
							location.href="signin.jsp";
						</script>
					<%
					foodingbean.DBclose();
				}
			}catch (Exception e) {
				%>
					<script type="text/javascript">
						alert("입력하신 정보를 확인해주세요.");
						location.href("signin.jsp");
					</script>
				<%	
				foodingbean.DBclose();
			}finally{}
				


	%>

</body>
</html>
