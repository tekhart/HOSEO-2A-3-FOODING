<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="DBBean.foodingBean" %>
<%request.setCharacterEncoding("UTF-8"); %>
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
	if(pwexp.test(register.passwd.value)==false){
		document.getElementById('passwdcheck').innerHTML = "8자 이상, 영문/특수문자/숫자가 하나 이상";
		document.getElementById('passwdimg').innerHTML = "<img src='../img/tip2.png' height='30px' width='30px' align='middle'>";
	}else{
		document.getElementById('passwdcheck').innerHTML="사용 가능한 비밀번호 입니다";
		document.getElementById('passwdimg').innerHTML="<img src='../img/yes2.png' height='30px' width='30px' align='middle'>";
	}
	if(register.passwd.value==register.repasswd.value){
		document.getElementById('repasswdcheck').innerHTML="비밀번호가 같습니다";
		document.getElementById('repasswdimg').innerHTML="<img src='../img/yes2.png' height='30px' width='30px' align='middle'>";
	}else{
		document.getElementById('repasswdcheck').innerHTML="비밀번호가 다릅니다";
		document.getElementById('repasswdimg').innerHTML="<img src='../img/no2.png' height='30px' width='30px' align='middle'>";
	}
};

function Repasswdcheck() {
		if(register.passwd.value==register.repasswd.value){
			document.getElementById('repasswdcheck').innerHTML="비밀번호가 같습니다";
			document.getElementById('repasswdimg').innerHTML="<img src='../img/yes2.png' height='30px' width='30px' align='middle'>";
		}else{
			document.getElementById('repasswdcheck').innerHTML="비밀번호가 다릅니다";
			document.getElementById('repasswdimg').innerHTML="<img src='../img/no2.png' height='30px' width='30px' align='middle'>";
		}
};
function check(){	
	var register=document.register;
		if(register.passwd.value==""||document.getElementById('passwdcheck').innerHTML!="사용 가능한 비밀번호 입니다"){
			alert("비밀번호를 입력해주세요");
			register.passwd.focus();
			return;
		}
		if(register.repasswd.value==""){
			alert("비밀번호확인을 입력해주세요");
			register.repasswd.focus();
			return;
		}
		if(register.passwd.value!=register.repasswd.value){
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
	<%@include file="sidemenu.jsp"%>
	<br><br><br><br>
	<fieldset style="margin:auto;">
		<form action=PasswdUpdatePro.jsp method="post" name="register">
				<legend>계정 비밀번호 변경</legend>
				<input type="hidden" value="<%=idlogin %>" name="id">
				<table width="80%" height="250px" style="font-size:25px; text-align:center;">
					<tr>
						<td width="50%">
							<b>새 비밀번호</b><br>
							<input class="signupinputs" type="password" placeholder="새 비밀번호 " name="passwd" onkeyup="Passwdcheck();">
						</td>
					</tr>
					<tr>
						<td style="text-align:left;">
							<span id="passwdimg"></span><span id="passwdcheck"></span>
						</td>
					</tr>
					<tr>
						<td>
							<b>새 비밀번호 확인</b><br>
							<input class="signupinputs" type="password" placeholder="새 비밀번호 확인" name="repasswd" onkeyup="Repasswdcheck();">
						</td>
					</tr>
					<tr>
						<td style="text-align:left;">
							<span id="repasswdimg"></span><span id="repasswdcheck"></span>
						</td>
					</tr>
				</table>
				<input  type="button" onclick="check();" value="수정" class="findbutton">
			</form>
		</fieldset>

</div>

</div>
<br><br><br>
<br><br><br>

<%@include file="../general_included/footer.jsp"%>

</body>
</html>
