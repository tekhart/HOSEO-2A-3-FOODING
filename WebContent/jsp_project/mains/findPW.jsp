<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<link rel="stylesheet" href="../css/common.css">
<style>
            #currentbtn{
            width:200px;
            height:80px;
            background-color:gray;
            border:none;
            }
            #notcurrentbtn{
            width:200px;
            height:80px;
            background-color:#FFBB00;
            border:none;
            }
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
	<input type="button" value="ID찾기"  onClick="location.href='findID.jsp'" id="notcurrentbtn"> <%-- 현 페이지 이므로 기능없음. --%>
	<input type="button" value="PW찾기" id="currentbtn">
		
		<form method="post" name="findpw" action="findPWPro.jsp">
			<H2>비밀번호 찾기</H2>
			<P>비밀번호를 찾을 계정의 아이디를 입력하세요</P>
			<table>
				<tr>
					<td>
						아이디
					</td>
					<td>
					 : <INPUT type="text" name="id" maxlength="30" />
					</td>
				</tr>
				<tr>
					<td>
						이메일
					</td>
					<td>
					 : <INPUT type="text" name="email" maxlength="30" /> 
					</td>
				</tr>
			</table>
			
			<input type="button" value="찾기" onclick="Findpw();"/>
		</form>
		<!-- find 버튼을 누르면  findPWPro.jsp로 넘어감  -->
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
