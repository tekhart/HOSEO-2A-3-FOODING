<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID/PW</title>
<style>
																			body {}
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
																		    	{background-color:#EAEAEA;
																		        height:600px;}
</style>
</head>
<body>

<div id="topdiv" style=text-align:center;>
	<table width=100% height=100%>
    <tr><td width=200 nowrap>
		</td><td width=200 nowrap>
		</td><td width=30 nowrap>

		<input type="button" class="button11" value="로그인">
		<input type="button" class="button11" value="회원가입">

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

	<center>
	<insert type="button" value="ID찾기" id="toFindIDbutton"> <%-- 현 페이지 이므로 기능없음. --%>
	<insert type="button" value="PW찾기" onClick="location.href='FINDPW.jsp'" id="toFindPWbutton">
		<br>
		<br>
		<form method="post" action="findIDPro.jsp">
			<H2>Find ID</H2>
			<P>Type your name to find your ID</P>
			<INPUT type="text" name="findName" maxlength="30" /> <input
				type="submit" value="Find" />
		</form>
		<!-- find 버튼을 누르면  findIDPro.jsp로 넘어감  -->
	</center>
</div>
<br><br><br>



<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
Create by FOODING<br>
고객문의 1544-XXXX<br>
JSP Project 2019 2A03
</div>
</body>
</html>
