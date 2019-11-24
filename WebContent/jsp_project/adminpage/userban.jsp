<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>

<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script type="text/javascript"></script>
</head>
<body id="body">
	<%@include file="../general_included/topbar.jsp"%>
	<div id="maindiv">
		<div style="margin: auto">
			<%
				String id = request.getParameter("userid");
				
				foodingBean dbPro = foodingBean.getInstance();
				int check = dbPro.userWannaLeft(id);
				if(check==1){
			%>
				<script>
					alert("사용자 탈퇴가 완료되었습니다.");
					location.href = "userlist.jsp";
				</script>
		<%}else{ %>
			<script type="text/javascript">      
	        	alert("사용자 탈퇴 처리에 실패했습니다");
	        	history.go(-1);
	  		</script>
		</div>
	<%} %>
	<%@include file="../general_included/footer.jsp"%>
</body>
</html>