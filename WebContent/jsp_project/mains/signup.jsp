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
									


.bon4{
width:100px;
height:35px;
font-size:13px;
background-color:#ffbb00;
margin-left:35px;       
border-color:orange; 
border-style:solid;
color:white;    
}

.button3{
				margin:5px;  
				
				width:80px;
				height:40px;
				font-size:15px;
				background-color:white;
				border-color:#ffbb00; 
				border-style:solid;
				 
				
				}
				
			.button3:hover{background-color:#FFE08C;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  display: inline-block;
  border-color:#ffbb00;
  background: white;
   border-style:solid;
    border-width: thin; 
    border-radius: 3px;
}



.container {
  display: block;
  position: relative;
  padding-left: 35px;
 margin:13px;
 margin-left:5px; 
  cursor: pointer;
  font-size: 15px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
}

.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color:#EAEAEA;
  border-radius: 50%;
}

.container:hover input ~ .checkmark {
  background-color: #ccc;
}

.container input:checked ~ .checkmark {
  background-color: #ffbb00;
}

.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

.container input:checked ~ .checkmark:after {
  display: block;
}
.container .checkmark:after {
 	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}



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
					<td colspan="2"><input type="text" name="nkname" maxlength="30" minlength="6" size="40"  autofocus  value="<%= nkname%>"></td>
				</tr>
				
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" maxlength="30" minlength="6" size="40"  value="<%= id%>"></td>
					<td><input type="button" value="중복 확인" onclick="IdDupcheck();" class="bon4"></td>
				</tr>
				<tr> 
					<td>비밀번호</td>
					<td colspan="2"><input type="password" name="passwd" maxlength="30" minlength="6" size="40"  value="<%= passwd%>"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td colspan="2"><input type="password" name="repasswd" maxlength="30" minlength="6" size="40"  value="<%= repasswd%>"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td colspan="2"><input type="text" name="email" maxlength="30" size="40"  value="<%= email%>"></td>
				</tr>
				<tr> 
					<td>주소</td>
					<td><input type="text" name="addrnum" value="<%=zipcode %>" ></td>
					<td><input type="button" value="우편번호 찾기"  onclick="Zipcodeload();" class="bon4"  ></td>
				</tr><tr>
					<td>상세주소</td> 
					<td colspan="2"><input type="text" name="detailaddr" maxlength="30" size="40"  value="<%= detailaddr%>"></td>
				</tr>
				<tr>
					<td>성별</td>
					
					
					<td>
					<label class="container">남자
					  <input type="radio"  id="male"  checked="checked" name="radio" value="1" >
					  <span class="checkmark"></span>
					</label>
					<label class="container">여자
					  <input type="radio" name="radio"  id="female"  value="2" >
					  <span class="checkmark"></span>
					</label>
					</td>


				</tr>
				
			</table> 
			<br><br><br><br><br>
			<input type="reset" value="취소" class="button3">
			<input type="submit" value="확인" class="button3">
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
