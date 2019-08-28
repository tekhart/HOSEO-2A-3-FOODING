<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../css/common.css">
<style>



form {
	width: 50%
}

input[type=text], input[type=password] {
	width: 50%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

.button {
	background-color:#FFBB00;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 50%;
	border-radius:3px; 
}

span.idpasswd {
	float: right;
	padding-top: 16px;
}

@media screen and (max-width: 300px) {
	span.idpasswd {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 50%;
	}
}
input[type=text], input[type=password] {
  width: 500px;
  padding: 15px;
  display: inline-block;
  border-color:#ffbb00;
  background: white;
   border-style:solid;
    border-width: thin; 
    border-radius: 3px;
}

</style>
<link rel="stylesheet" href="../css/common.css">

<title>Sign in</title>

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
</script>

</head>
<body>
<%@include file="../general_included/topbar.jsp"%>
<div id="maindiv">
<center>
		<form method="post" name="login" action="login.jsp">
		<br><br><br><br><br><br><br>
			<div class="container">
				<input type="text" placeholder="아이디 " name="id"><br>
				<input type="password" placeholder="비밀번호" name="passwd"><br>
			<button class="button" type="button" onclick="Login();">로그인</button>
			</div>
			<span class="idpasswd"><a href="findID.jsp">아이디</a> / <a href="findPW.jsp">비밀번호 찾기</a></span>
			
			</div>
		</form>
	</center>
</div>
<br><br><br>
<br><br><br>
<br><br><br>
<br><br><br>
<br><br><br>


<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
<pre>
Create by FOODING
고객문의 1544-XXXX
JSP Project 2019 2A03</pre>
</div>

</body>
</html>