<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<style>
																			#body{}
																			#topdiv
																				{background-color:#FFBB00;
																		        height:40px;}
																		 	#menudiv
																		    	{background-color:white;
																		        height:100%;}
																			.button11{
																						background-color:#FFBB00;
																						border:none;
																						margin-right:-4.5px;
																						color:#813D00;
																						}
																			.button2{
																						margin-right:-4.5px;
																						width:250px;
																						height:85px;
																						font-size:20px;
																						background-color:white;
																						border:none;
																						}
																			.button2:hover{background-color:#FFE08C;}
																		 	#maindiv
																		    	{
																		        height:600px;}


body {
	font-family: 'Oswald', sans-serif;
}
</style>
</head>




<body id="body">

<div id="topdiv" style=text-align:center;>
	<table width=100% height=100%>
    <tr><td width=200 nowrap>
		</td><td width=200 nowrap>
		</td><td width=30 nowrap>

		<input type="button" class="button11" value="로그인" onClick="location.href='signin.jsp'">
		<input type="button" class="button11" value="회원가입" onClick="location.href='signup.jsp'">

		</td></tr>
  	</table>
</div>

<div id="menudiv" style=text-align:center;>
	<table width=100% height=100%>
    <tr><td width=100 nowrap>
		<img src="C:\Users\sol\Desktop\jsp프로젝트\이미지\그림3.png" height="60px" width="100px"></td>
		<td width=150 nowrap><font size="10px">FOODING</font></td><td>

		<input type="button" class="button2" value="레시피">
		<input type="button" class="button2" value="요리도우미">
		<input type="button" class="button2" value="공지사항">
    	<input type="button" class="button2" value="고객센터">
        
		</td></tr>
 	</table>
</div>

<div id="maindiv">
<br>
<br>
<br>
<br>
<form method="post" action="registerInsert.jsp">
	<!--Register 버튼 누를시 registerInsert.jsp로 넘어감  --> 
		<center>
			<table>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="nkName" maxlength="30"></td>
				</tr>
				
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" maxlength="30"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" maxlength="30"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" maxlength="30"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="AddrNum" maxlength="30"></td>
				</tr><tr>
					<td>상세주소</td>
					<td><input type="text" name="DetailAddr" maxlength="30"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input id="male" name="gender" type="radio" value="1" />Male
						<input id="female" name="gender" type="radio" value="2" />Female</td>
				</tr>
				
			</table>
			<input type="submit" value="Register">
		</center>
	</form>
</div>
<br><br><br>



<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
Create by FOODING<br>
고객문의 1544-XXXX<br>
JSP Project 2019 2A03
</div>

</body>
</html>
