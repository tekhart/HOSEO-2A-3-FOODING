<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/list.css">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<meta charset="UTF-8">
<title>제품 목록삭제</title>
<script type="text/javascript"></script>
</head>
<body id="body">
	<%
		int productid = Integer.parseInt(request.getParameter("productid"));

		foodingBean dbPro = foodingBean.getInstance();
		dbPro.deleteproductArticle(productid);
	%>
	<script type="text/javascript">
		alert("삭제를 완료했습니다");
		location.href = "goods.jsp";
	</script>
</body>
</html>