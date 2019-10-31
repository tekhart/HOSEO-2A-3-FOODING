<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../css/common.css">
<style>





</style>

<title>Sign in</title>
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<script type="text/javascript">
function Login(){
	
	var login=document.login;
	
	if(login.id.value==""){
		alert("아이디를 입력해주세요");
		login.id.focus();
		return;
	}
	
	if(login.passwd.value==""){
		alert("비밀번호를 입력해주세요");
		login.passwd.focus();
		return;
	}
	
	login.submit();
}
function enterkey() {
    if (window.event.keyCode == 13) {

         // 엔터키가 눌렸을 때 실행할 내용
         Login();
    }
}
</script>

</head>
<body id="body">
<%@include file="../general_included/topbar.jsp"%>
<hr style="border: solid 2px #ffbb00; align:center;
		width:1900px;">
<center>
		<form method="post" name="login" action="login.jsp">
		<br><br><br><br><br><br><br><br><br>
			<div>
				<input class="logininputs" type="text" placeholder="아이디 " name="id" onkeyup="enterkey();"><br><br>
				<input class="logininputs" type="password" placeholder="비밀번호" name="passwd" onkeyup="enterkey();"><br><br>
			<button class="loginbutton" type="button" onclick="Login();">로그인</button>
			</div><br><br>
			<span class="idpasswd"><a class="logina" href="findID.jsp">아이디</a> / <a class="logina" href="findPW.jsp">비밀번호 찾기</a></span>
			
			</div>
		</form>
	</center>
</div>
<br><br><br>
<br>

<%@include file="../general_included/footer.jsp"%>
</body>
</html>