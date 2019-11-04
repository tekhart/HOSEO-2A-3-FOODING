<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DBBean.*" %>
<%@ page import = "java.util.List" %>
<%@ page import="java.sql.*"%>

<%request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html>
<html>
	<head>
	<link rel="stylesheet" href="../css/common.css">
	<link rel="stylesheet" href="../css/list.css">
	<link rel="shortcut icon" href="../img/favicon.ico">
	<link rel="icon" href="../img/favicon.ico">
		<meta charset="UTF-8">
			<title>회원탈퇴</title>
			<script type="text/javascript"></script>
	</head>
	<body id="body">
		<%@include file="../general_included/topbar.jsp"%>
		<div id="maindiv">
			<div style="margin:auto">
				<%
		String id = (String)session.getAttribute("idlogin");
		
		String checkpw = request.getParameter("checkpw");
		
		foodingBean dbPro = foodingBean.getInstance();
		
		userDataBean article=null;
		article=dbPro.getuserArticle(id);
		if(article.getPasswd().equals(checkpw)){
			
			int check = dbPro.userWannaLeft(id);
			if(check==1){
				session.invalidate();
			%>
						<div class="deleteuser">
							탈퇴가 완료되었습니다. 
							
						</div>
						<input type="button" value="메인으로"  class ="check"
						onclick="javascript:location.href='../mains/main.jsp'">
				</div>	
				<%}else{ %>
				<script type="text/javascript">      
	         alert("비밀번호가 맞지 않습니다");
	         history.go(-1);
	  				 </script>
	
			</div>
			
			<%} 
		}else{%>
		<script type="text/javascript">      
	         alert("비밀번호가 맞지 않습니다");
	         history.go(-1);
	  	</script>
		<%} %>
		<%@include file="../general_included/footer.jsp"%>
	</body>
</html>