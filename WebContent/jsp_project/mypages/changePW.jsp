<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

#change {
	color:white;
	background-color:#FFBB00;
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
<%@include file="../general_included/topbar.jsp"%>
<<<<<<< HEAD

<div id="maindiv">
<center>
<form method="post" action="PWchanged.jsp">
<div>
<input type="password" placeholder="현재 비밀번호" name="curPW"><br>
<input type="password" placeholder="새 비밀번호" name="newPW">
<button id="change" type="submit">변경</button>
</div>
</form>
</center>
</div>
<br><br><br>
=======
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
	<br>
	<br>
	<br>
>>>>>>> refs/remotes/origin/master



	<%@include file="../general_included/footer.jsp"%>
</body>
</html>