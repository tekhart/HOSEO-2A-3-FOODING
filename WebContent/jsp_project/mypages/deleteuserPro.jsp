<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DBBean.BoardDataBean" %>
<%@ page import = "DBBean.foodingBean" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "java.util.List" %>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>


<%--
	String id;
	id=(String)session.getAttribute("idlogin");

	String checkpw = request.getParameter("checkpw");
	
	foodingBean dbPro = foodingBean.getInstance();
	
	dbPro.deleteUser(id,checkpw);
--%>
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
				
					<div class="deleteuser">
						탈퇴가 완료되었습니다.
					</div>
					<input type="button" value="메인으로"  class ="check"
					onclick="javascript:location.href='../mains/main.jsp'">
			</div>
		</div>
		<%@include file="../general_included/footer.jsp"%>
		
	</body>
</html>