<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>

function check(){

	var exptext=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	var email = document.getElementById("email").value;
	if(email==''){
		alert("이메일을 입력해주세요.");
		document.email.focus();
		return false;
	}
	else if(exptext.test(email)==false){
			alert("이메일 형식이 올바르지 않습니다.");
			document.email.focus();
			return false;
	}
}
</script>
<body>
<form>
<input type="text" name="email" id="email"/><br>
<input type="button" onclick="check();"value="Register">
</form>
</body>
</html>