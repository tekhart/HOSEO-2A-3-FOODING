<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="../css/common.css">
<style>
	
</style>

<script type="text/javascript">
function Findid(){
	
	var findid=document.findid;
	
	if(findid.nkname.value==""){
		alert("닉네임을 입력해주세요");
		findid.nkname.focus();
		return;
	}
	
	if(findid.email.value==""){
		alert("이메일을 입력해주세요");
		findid.email.focus();
		return;
	}
	
	findid.submit();
}
</script>

</head>
<body>

<%@include file="../general_included/topbar.jsp"%>

<div id="maindiv">

	<center>
		<br>
		<br>
	
	<input type="button" value="ID찾기" id="currentbtn"> <%-- 현 페이지 이므로 기능없음. --%>
	<input type="button" value="PW찾기" onClick="location.href='findPW.jsp'" id="notcurrentbtn">
		
		<form method="post" name="findid" action="findIDPro.jsp">
			<br><br>
			<P class="idpwp">회원정보에 등록한 닉네임과 이메일을 입력해주세요</P>
			<br>
			<table>
				<tr>
					
					<td>
					<INPUT class="findinputs" type="text" name="nkname" maxlength="30" placeholder="닉네임"/> 
					</td>
				</tr>
				<tr>
					
					<td>
					  <INPUT class="findinputs" type="text" name="email" maxlength="30" placeholder="이메일" /> 
					</td>
				</tr>
			</table>
			
			 <br>
			<input class="findbutton" type="button" value="찾기" onclick="Findid();"/>
		</form>
		<!-- find 버튼을 누르면  findIDPro.jsp로 넘어감  -->
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
