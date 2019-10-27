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
<title>아이디 찾기</title>
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="list.css">
<link rel="stylesheet" href="style.css">

<style>
	

</style>

</head>
<body>
<%@include file="../general_included/topbar.jsp"%>
<div id="maindiv">

	<hr style="border: solid 2px #ffbb00; align:center;
		width:2000px;">
		
	<%
		String nkname = request.getParameter("nkname");
		String email = request.getParameter("email");
		String id="";
		
		foodingBean foodingbean=new foodingBean();
		
		foodingbean.connect();
		
		String sql = "select id from user where nkname='"+nkname+"' and email='"+email+"';";
		ResultSet rs = foodingbean.resultQuery(sql);
		try{
			if(rs.next()) {
				id = rs.getString("id");	
	%>
	
	<br><br>
	<center>
	<br><br>
		<div style="font-size:18pt; background-color: " >가입된 ID는 다음과 같습니다.</div>
		<table width="500px" height="280px" style="text-align:center; font-size:20pt; border-color:#ffbb00; border-width:3px;
		border-style:solid; font-family:Bauhaus ITC";" >
		<tr><td>
		<span>회원님의 아이디는 </span></td></tr>
		<tr><td>
		<h4><%=id%></h4></td></tr>
			<tr><td>입니다<!-- 추출한 ID를 보여줌 --></td></tr><br><br><br><br> </table>
			
			<br><br><br><br>
			<span class="idpasswd"><a href="findID.jsp">아이디</a> / <a href="findPW.jsp">비밀번호 찾기</a></span>
	</center>
	
	<%
			}else{
				%>
					<script type="text/javascript">
						alert("입력하신 정보를 확인해주세요.");
						location.href="findID.jsp";
					</script>
				<%
				foodingbean.DBclose();
			}
		}catch(Exception e){
			foodingbean.DBclose();
		}
	%>

</div>
<br><br><br>
<%@include file="../general_included/footer.jsp"%>

</body>
</html>
