<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	request.setCharacterEncoding("UTF-8");
	%>
<% 
String zipcode="";
try{
	zipcode=(String)session.getAttribute("zipcode");
	if(zipcode==null){
		zipcode="";
	}
}finally{}

String nkname = request.getParameter("nkname");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String repasswd = request.getParameter("repasswd");
String email = request.getParameter("email");
String detailaddr = request.getParameter("detailaddr");

if(nkname==null){nkname="";}
if(id==null){id="";}
if(passwd==null){passwd="";}
if(repasswd==null){repasswd="";}
if(email==null){email="";}
if(detailaddr==null){detailaddr="";}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>

<link rel="stylesheet" href="../css/common.css">
<style>

</style>

<script type="text/javascript">

function IdDupcheck(){
	
	var register=document.register;
	
	if(register.id.value==""){
		alert("아이디를 입력해주세요");
		register.id.focus();
		return;
	}
	
	document.getElementById('select').value = 'id';
	register.submit();
}


function Zipcodeload(){
	
	var register=document.register;
	
	

	document.getElementById('select').value = 'zip';
	register.submit();
}

</script>

</head>




<body id="body">

<%@include file="../general_included/topbar.jsp"%>

<div id="maindiv">
<br>
<br>
<br>
<br> 
<br>
<form method="post" name="register" action="signcross.jsp" >
	<input type="hidden" value="" name="select" id="select">
	<!--Register 버튼 누를시 registerInsert.jsp로 넘어감  --> 
		<center>
			<table>  
				<tr>
					<td>닉네임</td>
					<td colspan="2"><input class="signupinputs" type="text" name="nkname" maxlength="30" minlength="6" size="40"  autofocus  value="<%= nkname%>"></td>
				</tr>
				
				<tr>
					<td>아이디</td>
					<td><input class="signupinputs" type="text" name="id" maxlength="30" minlength="6" size="40"  value="<%= id%>"></td>
					<td><input type="button" value="중복 확인" onclick="IdDupcheck();" class="signupbutton2"></td>
				</tr>
				<tr> 
					<td>비밀번호</td>
					<td colspan="2"><input class="signupinputs" type="password" name="passwd" maxlength="30" minlength="6" size="40"  value="<%= passwd%>"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td colspan="2"><input class="signupinputs" type="password" name="repasswd" maxlength="30" minlength="6" size="40"  value="<%= repasswd%>"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td colspan="2"><input class="signupinputs" type="text" name="email" maxlength="30" size="40"  value="<%= email%>"></td>
				</tr>
				<tr> 
					<td>우편번호</td>
					<td><input class="signupinputs" type="text" name="addrnum" value="<%=zipcode %>" ></td>
					<td><input type="button" value="우편번호 찾기"  onclick="Zipcodeload();" class="signupbutton2"  ></td>
				</tr><tr>
					<td>주소</td> 
					<td colspan="2"><input class="signupinputs" type="text" name="detailaddr" maxlength="30" size="40"  value="<%= detailaddr%>"></td>
				</tr>
				<tr>
					<td>성별</td>
					
					
					<td>
					<label class="loginradio">남자
					  <input type="radio"  id="male"  checked="checked" name="radio" value="1" >
					  <span class="checkmark"></span>
					</label>
					<label class="loginradio">여자
					  <input type="radio" name="radio"  id="female"  value="2" >
					  <span class="checkmark"></span>
					</label>
					</td>


				</tr>
				
			</table> 
			<br><br><br><br><br>
			<input type="reset" value="취소" class="findbutton">
			<input type="submit" value="확인" class="findbutton">
		</center>
	</form>
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
