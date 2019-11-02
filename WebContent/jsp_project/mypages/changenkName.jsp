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

button {
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
a{
		text-decoration:none;
		}
		
</style>
<title>닉네임 변경</title>
	<link rel="shortcut icon" href="../img/favicon.ico">
	<link rel="icon" href="../img/favicon.ico">
	<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/list.css">
</head>
<body>
<%@include file="../general_included/topbar.jsp"%>
<div id="maindiv">
<center>
<form method="post" action="NKchanged.jsp">
<div>
<input type="text" placeholder="변경하려는 닉네임 입력" name="newNK">
<button type="submit">변경</button>
</div>
</form>
</center>
</div>
<br><br><br>



 <%@include file="../general_included/footer.jsp"%>

</body>
</html>