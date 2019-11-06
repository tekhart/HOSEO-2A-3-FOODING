<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="DBBean.foodingBean"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="list.css">
<link rel="stylesheet" href="style.css">

<style>
</style>
<script type="text/javascript">
	var pwexp = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
	function Passwdcheck() {
		if (pwexp.test(register.passwd.value) == false) {
			document.getElementById('passwdcheck').innerHTML = "8자 이상, 영문/특수문자/숫자가 하나 이상";
			document.getElementById('passwdimg').innerHTML = "<img src='../img/tip2.png' height='30px' width='30px' align='middle'>";
		} else {
			document.getElementById('passwdcheck').innerHTML = "사용 가능한 비밀번호 입니다";
			document.getElementById('passwdimg').innerHTML = "<img src='../img/yes2.png' height='30px' width='30px' align='middle'>";
		}
		if (register.passwd.value == register.repasswd.value) {
			document.getElementById('repasswdcheck').innerHTML = "비밀번호가 같습니다";
			document.getElementById('repasswdimg').innerHTML = "<img src='../img/yes2.png' height='30px' width='30px' align='middle'>";
		} else {
			document.getElementById('repasswdcheck').innerHTML = "비밀번호가 다릅니다";
			document.getElementById('repasswdimg').innerHTML = "<img src='../img/no2.png' height='30px' width='30px' align='middle'>";
		}
	};

	function Repasswdcheck() {
		if (register.passwd.value == register.repasswd.value) {
			document.getElementById('repasswdcheck').innerHTML = "비밀번호가 같습니다";
			document.getElementById('repasswdimg').innerHTML = "<img src='../img/yes2.png' height='30px' width='30px' align='middle'>";
		} else {
			document.getElementById('repasswdcheck').innerHTML = "비밀번호가 다릅니다";
			document.getElementById('repasswdimg').innerHTML = "<img src='../img/no2.png' height='30px' width='30px' align='middle'>";
		}
	};
	function check() {
		var register = document.register;
		if (register.passwd.value == ""
				|| document.getElementById('passwdcheck').innerHTML != "사용 가능한 비밀번호 입니다") {
			alert("비밀번호를 입력해주세요");
			register.passwd.focus();
			return;
		}
		if (register.repasswd.value == "") {
			alert("비밀번호확인을 입력해주세요");
			register.repasswd.focus();
			return;
		}
		if (register.passwd.value != register.repasswd.value) {
			alert("비밀번호가 다릅니다.");
			register.repasswd.focus();
			return;
		}
		register.submit();

	}
</script>
</head>
<body>
	<%@include file="../general_included/topbar.jsp"%>

	<div id="maindiv">
		<hr style="border: solid 2px #ffbb00; align: center; width: 1900px;">
		<%
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			String pw = "";

			foodingBean foodingbean = new foodingBean();

			foodingbean.connect();

			String sql = "select passwd,isLeft from user where id='" + id + "' and email='" + email + "';";
			ResultSet rs = foodingbean.resultQuery(sql);
			try {
				if (rs.next()) {
					if (rs.getInt("isLeft") == 0) {
						pw = rs.getString("passwd");
		%>

		<center>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>

			<form action=findPWProPro.jsp method="post" name="register">
				<div>
					<input type="hidden" name="id" value="<%=id%>"> <input
						class="logininputs" type="password" placeholder="새 비밀번호 "
						name="passwd" onkeyup="Passwdcheck();"><br> <span
						id="passwdimg"></span><span id="passwdcheck"></span><br> <input
						class="logininputs" type="password" placeholder="새 비밀번호 확인"
						name="repasswd" onkeyup="Repasswdcheck();"><br> <span
						id="repasswdimg"></span><span id="repasswdcheck"></span><br>
					<button class="loginbutton" type="button" onclick="check();">확인</button>
				</div>
			</form>
			<br>
			<br> <span class="idpasswd"><a href="findID.jsp">아이디</a>
				/ <a href="findPW.jsp">비밀번호 찾기</a></span>
		</center>
	</div>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("입력하신 정보를 확인해주세요.");
		location.href = "findPW.jsp";
	</script>
	<%
		}
			} else {
	%>
	<script type="text/javascript">
		alert("입력하신 정보를 확인해주세요.");
		location.href = "findPW.jsp";
	</script>
	<%
		foodingbean.DBclose();
			}
		} catch (Exception e) {
	%>
	<script type="text/javascript">
		alert("입력하신 정보를 확인해주세요.");
	</script>
	<%
		response.sendRedirect("../mains/findPW.jsp");
			foodingbean.DBclose();
		}
	%>


	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<%@include file="../general_included/footer.jsp"%>

</body>
</html>
