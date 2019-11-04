<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="admincss.css">
</head>

<body>
<%@include file="../general_included/topbar.jsp"%>
<br><br><br><br>
<table border="1" class="usertrtd">
	<tr>
		<td><b>현재 닉네임</b></td>
		<td>새웈</td>
	</tr>
	<tr>
		<td><b>변경할 닉네임</b></td>
		<td><input type="text" size="20"></td>
	</tr>
	<tr>
		<td><b>아이디</b></td>
		<td>qkrtpals1234</td>
	</tr>
	<tr>
		<td><b>가입일</b></td>
		<td>2008-12-31 00:00:00.0</td>
	</tr>
	<tr>
		<td align="center" colspan="2"><input type="button" value="작성 글 보기" class="findbutton2"></td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<table>
				<tr>
					<td><input type="button" value="확인" class="findbutton"></td>
					<td><input type="button" value="취소" class="findbutton" onclick="location.href='userban.jsp'"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<%@include file="../general_included/footer.jsp"%>
</body>
</html>
