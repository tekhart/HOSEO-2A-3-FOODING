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
				int id = Integer.parseInt(request.getParameter("id"));
				
				foodingBean dbPro = foodingBean.getInstance();
				dbPro.deleteaskArticle(id);
			%>
				<div class="deleteuser">사용자 탈퇴가 완료되었습니다.</div>
				<input type="button" value="메인으로" class="check"
					onclick="javascript:location.href='../mains/main.jsp'">
			</div>
	<%@include file="../general_included/footer.jsp"%>
</body>
</html>