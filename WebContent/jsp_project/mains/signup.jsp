<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ page import="java.sql.*"%>
<%@page import="DBBean.foodingBean" %>
<jsp:useBean id="tempbean" scope="session" class="DBBean.foodingBean"/>

<%

request.setCharacterEncoding("UTF-8");

String zipcode="";
try{
	zipcode=(String)session.getAttribute("zipcode");
	if(zipcode==null){
		zipcode="";
	}
}finally{}

foodingBean foodingbean=new foodingBean();

String nkname = tempbean.getNkname();
String id = tempbean.getId();
String passwd = tempbean.getPasswd();
String repasswd = tempbean.getRepasswd();
String email = tempbean.getEmail();
String addrnum = tempbean.getAddrnum();
String detailaddr = tempbean.getDetailaddr();
String select = tempbean.getSelect();
%>
<script type="text/javascript">
	alert("<%= select%>");
</script>
<%
if(nkname==null){nkname="";}
if(id==null){id="";}
if(passwd==null){passwd="";}
if(repasswd==null){repasswd="";}
if(email==null){email="";}
if(addrnum==null){addrnum="";}
if(detailaddr==null){detailaddr="";}

if(select.equals("inavaid")){
	%>
		<script type="text/javascript">
			alert("중복된 아이디 입니다.");
		</script>
	<%
}else if(select.equals("avaid")){
	%>
		<script type="text/javascript">
			alert("사용 가능한 아이디 입니다.");
		</script>
	<%
}
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
	
	
function Signupcross(select){	
	document.getElementById('select').value = select;
	var register=document.register;
	
	if(select=="id"){
		
		if(register.id.value==""){
			alert("아이디를 입력해주세요");
			register.id.focus();
			return;
		}
		
		register.submit();
	}
	else if(select=="zip"){
		register.submit();
	}
	else{
		
		var exptext=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		
		
		
		if(register.nkname.value==""){
			alert("닉네임을 입력해주세요");
			register.nkname.focus();
			return;
		}
		if(register.id.value==""){
			alert("아이디를 입력해주세요");
			register.id.focus();
			return;
		}
		if(register.passwd.value==""){
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
		if(register.email.value==""){
			alert("이메일을 입력해주세요.");
			register.email.focus();
			return;
		}
		else if(exptext.test(register.email.value)==false){
			alert("이메일 형식이 올바르지 않습니다.");
			register.email.focus();
			return;
		}
		if(register.addrnum.value==""){
			alert("우편번호를 입력해주세요");
			register.addrnum.focus();
			return;
		}
		if(register.detailaddr.value==""){
			alert("상세주소를 입력해주세요");
			register.detailaddr.focus();
			return;
		}

		document.getElementById('select').value = 'zip';
		register.submit();
	}
	
}

function Signupclear(){
	var register=document.register;
	
	register.nkname.value="";
	register.id.value="";
	register.passwd.value="";
	register.repasswd.value="";
	register.email.value="";
	register.addrnum.value="";
	register.detailaddr.value="";
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
					<td colspan="2"><input class="signupinputs" type="text" name="id" maxlength="30" minlength="6" size="40"  value="<%= id%>" onchange="Signupcross('id');"></td>
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
					<td><input type="button" value="우편번호 찾기"  onclick="Signupcross('zip');" class="signupbutton2"  ></td>
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
			<input type="button" value="취소" class="findbutton" onclick="Signupclear();">
			<input type="button" value="확인" class="findbutton" onclick="Signupcross('register');">
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
