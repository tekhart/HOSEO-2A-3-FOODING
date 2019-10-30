<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="DBBean.foodingBean" %>
<%@page import="DBBean.userDataBean" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script type="text/javascript">
	function loginsuccesed(){
		alert("성공적으로 로그인 완료되었습니다.");
		location.href="../mains/main.jsp";
	}
	function loginfailed(){
		alert("입력하신 정보를 확인해주세요.");
		location.href="signin.jsp";
	}
</script>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		//form 태그의 값을 저장
		foodingBean dbPro = foodingBean.getInstance();
		userDataBean userArticle=null;
			try{
				userArticle=dbPro.getuserArticle(id);
				if(userArticle.getId().equals(id)&&userArticle.getPasswd().equals(passwd)&&userArticle.getIsLeft()==0){
					session.setAttribute("idlogin",userArticle.getId());
					%>
						<script>
							loginsuccesed()
						</script>
					<%
				}else{
					%>
						<script>
							loginfailed()
						</script>
					<%
				}
			}catch (Exception e) {
				%>
					<script>
						loginfailed()
					</script>
				<%
			}finally{}
				


	%>

</body>
</html>
