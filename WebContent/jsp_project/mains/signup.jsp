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
foodingbean.connect();

String nkname = tempbean.getNkname();
String id = tempbean.getId();
String passwd = tempbean.getPasswd();
String repasswd = tempbean.getRepasswd();
String email = tempbean.getEmail();
String addrnum = tempbean.getAddrnum();
String address = tempbean.getAddress();
String detailaddr = tempbean.getDetailaddr();
String slct = tempbean.getSlct();

if(nkname==null){nkname="";}
if(id==null){id="";}
if(passwd==null){passwd="";}
if(repasswd==null){repasswd="";}
if(email==null){email="";}
if(addrnum==null){addrnum="";}
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
var DBnkArray=[];
var DBidArray=[];
var DBemailArray=[];
var i=0;
<% 

	ResultSet rs=foodingbean.resultQuery("select nkname,id,email from user");
	int i=0;
	while(rs.next()){
		String nknameArray = rs.getString("nkname");	
		String idArray = rs.getString("id");	
		String emailArray = rs.getString("email");	
		%>
		DBnkArray[<%=i%>]="<%=nknameArray%>";
		DBidArray[<%=i%>]="<%=idArray%>";
		DBemailArray[<%=i%>]="<%=emailArray%>";
		<%
		i++;
	}
	%>
var arraylength=<%=i %>
var exptext=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
var nknameexp=/^[가-힣a-zA-Z][가-힣a-zA-Z0-9]+$/;


function Nknamecheck() {
	var checked=0;
	if(register.nkname.value.length<3){
		document.getElementById('nknamecheck').innerHTML = "tip! 문자로 시작하고 중복하지않으며 공백과 특수문자 없이 3자이상";
	}else{
		i=0;
		while(i<=arraylength){
			if(DBnkArray[i]==register.nkname.value){
				checked=1;
				document.getElementById('nknamecheck').innerHTML="중복된 닉네임 입니다."
			}
			i++
		}
		if(checked==0){
			document.getElementById('nknamecheck').innerHTML="사용 가능한 닉네임 입니다.";
		}
	}
};

function Idcheck() {
	var checked=0;
	if(register.id.value.length<8){
		document.getElementById('idcheck').innerHTML = "tip! 문자로 시작하고 중복하지않으며 공백과 특수문자 없이 8자이상";
	}else{
		i=0;
		while(i<=arraylength){
			if(DBidArray[i]==register.id.value){
				checked=1;
				document.getElementById('idcheck').innerHTML="중복된 아이디 입니다."
			}
			i++
		}
		if(checked==0){
			document.getElementById('idcheck').innerHTML="사용 가능한 아이디 입니다.";
		}
	}
};
function Emailcheck() {
	var checked=0;
	if(exptext.test(register.email.value)==false){
		document.getElementById('emailcheck').innerHTML = "이메일 형식이 맞지 않습니다.";
	}else{
		i=0;
		while(i<=arraylength){
			if(DBemailArray[i]==register.email.value){
				checked=1;
				document.getElementById('emailcheck').innerHTML="중복된 이메일 입니다."
			}
			i++
		}
		if(checked==0){
			document.getElementById('emailcheck').innerHTML="사용 가능한 이메일 입니다.";
		}
	}
};

function ZipPopup() { 
	window.open("ZipFinder/ZipinputForm.jsp", "a", "width=400, height=300, left=100, top=50"); 
}
	
function Signupcross(slct){	
	document.getElementById('slct').value = slct;

	var register=document.register;
	
	
	if(slct=="nkname"){
		
		if(register.nkname.value==""||document.getElementById('nknamecheck').value!="사용 가능한 닉네임 입니다."){
			alert("닉네임을 확인해주세요");
			register.nkname.focus();
			return;
		}
		register.submit();
	}else if(slct=="id"){
		
		if(register.id.value==""){
			alert("아이디를 입력해주세요");
			register.id.focus();
			return;
		}
		
		register.submit();
	}else if(slct=="email"){
	
		if(register.email.value==""){
			alert("email을 입력해주세요");
			register.email.focus();
			return;
		}
	
		register.submit();
	}
	else{

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
	<input type="hidden" value="" name="slct" id="slct">
	<!--Register 버튼 누를시 registerInsert.jsp로 넘어감  -->
	<center>
	<fieldset>
	
	<legend align="center" class="welcome">WELCOME<img src="../img/carrot2.png" width="50px" height="50px"></legend>
	 
		<center>
			<table>  
				<tr>
					<td>닉네임</td>
					<td colspan="2">
						<input class="signupinputs" type="text" id="nk" name="nkname"size="40" value="<%= nkname%>" onkeyup="Nknamecheck();"><br>
						<span id="nknamecheck"> </span>
					</td>
				</tr>
				
				<tr>
					<td>아이디</td>
					<td colspan="2">
						<input class="signupinputs" type="text" name="id"size="40"  value="<%= id%>" onkeyup="Idcheck();"><br>
						<span id="idcheck"> </span>
					</td>
				</tr>
				<tr> 
					<td>비밀번호</td>
					<td colspan="2"><input class="signupinputs" type="password" name="passwd"size="40"  value="<%= passwd%>"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td colspan="2"><input class="signupinputs" type="password" name="repasswd"size="40"  value="<%= repasswd%>"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td colspan="2">
						<input class="signupinputs" type="text" name="email"size="40"  value="<%= email%>" onkeyup="Emailcheck();"><br>
						<span id="emailcheck"> </span>
					</td>
				</tr>
				<tr> 
					<td>우편번호</td>
					<td><input class="addrnuminputs" type="text" name="addrnum" value="<%=addrnum%>" onclick="ZipPopup();"></td>
					<td><input class="addressinputs" type="text" name="address" value="<%=address%>" onclick="ZipPopup();"></td>
				</tr><tr>
					<td>주소</td> 
					<td colspan="2"><input class="signupinputs" type="text" name="detailaddr" size="40"  value="<%= detailaddr%>"></td>
				</tr>
				<tr>
					<td>성별</td>
					
					
					<td>
					<label class="loginradio">남자
					  <input type="radio"  id="male"  checked="checked" name="gender" value="1" >
					  <span class="checkmark"></span>
					</label>
					<label class="loginradio">여자
					  <input type="radio" name="gender"  id="female"  value="2" >
					  <span class="checkmark"></span>
					</label>
					</td>


				</tr>
				
			</table> 
			<br><br>
			<input type="button" value="취소" class="findbutton" onclick="Signupclear();">
			<input type="button" value="확인" class="findbutton" onclick="Signupcross('register');">
			<br><br><br>
		</center>
		
		</fieldset>
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
	<%
		if(slct.equals("inavankname")){
			%>
				<script type="text/javascript">
					alert("중복된 닉네임 입니다.");
					register.nkname.value="";
					register.nkname.focus();
				</script>
			<%
		}else if(slct.equals("avankname")){
			%>
				<script type="text/javascript">
					alert("사용 가능한 닉네임 입니다.");
					register.id.focus();
				</script>
			<%
		}else if(slct.equals("inavaid")){
			%>
				<script type="text/javascript">
					alert("중복된 아이디 입니다.");
					register.id.value="";
					register.id.focus();
				</script>
			<%
		}else if(slct.equals("avaid")){
			%>
				<script type="text/javascript">
					alert("사용 가능한 아이디 입니다.");
					register.passwd.focus();
				</script>
			<%
		}else if(slct.equals("inavaemail")){
			%>
			<script type="text/javascript">
				alert("중복된 이메일 입니다.");
				register.email.value="";
				register.email.focus();
			</script>
		<%
		}else if(slct.equals("avaemail")){
			%>
				<script type="text/javascript">
					alert("사용 가능한 이메일 입니다.");
				</script>
			<%
		}
	%>
</body>
</html>
