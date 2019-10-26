<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "DBBean.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>
<!DOCTYPE html>
<html>
	<head>
	<link rel="stylesheet" href="../css/common.css">
	<link rel="stylesheet" href="../css/list.css">
		<meta charset="UTF-8">
			<title>회원탈퇴</title>
			<script type="text/javascript"></script>
	</head>
	<body id="body">
		<%@include file="../general_included/topbar.jsp"%>
		<div id="maindiv">
			<div style="margin:auto">
				<form action="deleteuserPro.jsp" method="post">
					<div class="deleteuser">
					
					비밀번호 확인  <input id="checkpw" type="password" name="checkpw" style="width:50%"><br>
					<br>
					
					<p id="notice">고객님의 개인정보 보호를 위해 비밀번호를 입력해주세요</p><!-- 글자 굵기 크기 줄이기, 왼쪽 맞춤  : 교수님 피드백  -->
					</div>
					<input type="submit" value="확인"  class ="check">
				</form>
			</div>
		</div>
		<%@include file="../general_included/footer.jsp"%>
		
	</body>
</html>