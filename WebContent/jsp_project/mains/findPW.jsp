<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<link rel="stylesheet" href="../css/common.css">
<style>
           
</style>

<script type="text/javascript">

function Findpw(){
	
	var findpw=document.findpw;
	
	if(findpw.id.value==""){
		alert("아이디를 입력해주세요");
		findpw.id.focus();
		return;
	}
	
	if(findpw.email.value==""){
		alert("이메일을 입력해주세요");
		findpw.email.focus();
		return;
	}
	
	findpw.submit();
}
</script>

</head>
<body>
<%@include file="../general_included/topbar.jsp"%>

<div id="maindiv">
		<br>
		<br>
	<center>
	<input type="button" value="ID찾기"  onClick="location.href='findID.jsp'" id="notcurrentbtn2">
	<input type="button" value="PW찾기" id="currentbtn2">
		
		<form method="post" name="findpw" action="findPWPro.jsp">
			<br><br>
			<P>= 비밀번호를 찾고자 하는 아이디와 이메일을 입력해 주세요 =</P>
			<br>
			<table>
				<tr>
					<td>
						아이디
					</td>
					<td>
					 <INPUT class="findinputs" type="text" name="id" maxlength="30" autofocus/>
					</td>
				</tr>
				<tr>
					<td>
						이메일
					</td>
					<td>
					 <INPUT class="findinputs" type="text" name="email" maxlength="30" /> 
					</td>
				</tr>
			</table>
			
			<input class="findbutton" type="button" value="찾기" onclick="Findpw();"/>
		</form>
	</center>
</div>


<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
<pre>
Create by FOODING
고객문의 1544-XXXX
JSP Project 2019 2A03</pre>
</div>
</body>
</html>
