<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
	String idlogin="";
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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

form {
	width: 50%
}

input[type=text], input[type=password] {
	width: 50%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color:#FFBB00;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 50%;
}

span.idpasswd {
	float: right;
	padding-top: 16px;
}

@media screen and (max-width: 300px) {
	span.idpasswd {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 50%;
	}
}

</style>
<title>비밀번호 변경</title>
</head>
<body>
<div id="topdiv" style=text-align:center;>
	<table width=100% height=100%>
    <tr><td width=200 nowrap>
		</td><td width=200 nowrap>
		</td><td width=30 nowrap>
<%
		try{
			idlogin=(String)session.getAttribute("idlogin");
			
			if(idlogin==null||idlogin.equals("")){
				%>
				<input type="button" class="button11" value="로그인" onClick="location.href='signin.jsp'">
				<input type="button" class="button11" value="회원가입" onClick="location.href='signup.jsp'">
				<%
			}else{
				%>
				<%=idlogin %>님 <input type="button" value="로그아웃">
				<%
			}
		}finally{}
		
		
		%>
		</td></tr>
  	</table>
</div>

<div id="menudiv" style=text-align:center;>
	<table width=100% height=100%>
    <tr><td width=100 nowrap>
		<img src="../img/fooding.png" height="60px" width="100px"></td>
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
<form method="post" action="PWchanged.jsp">
<div>
<input type="password" placeholder="현재 비밀번호" name="curPW"><br>
<input type="password" placeholder="새 비밀번호" name="newPW">
<button type="submit">변경</button>
</div>
</form>
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