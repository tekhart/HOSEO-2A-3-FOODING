<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 .usertrtd td{padding:10px;}
.usertrtd{position:relative; top:130px; left:300px;}
</style>
</head>
<body>
<table border="1" class="usertrtd">
	<tr>
		<td><b>현재 닉네임</b></td>
		<td>새웈</td>
	</tr>
	<tr>
	<tr>
		<td><b>아이디</b></td>
		<td>qkrtpals1234</td>
	</tr>
	<tr>
		<td><b>가입일</b></td>
		<td>2008-12-31 00:00:00.0</td>
	</tr>
	<tr>
		<td align="center" colspan="2"><input type="button" value="작성 글 보기"></td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<table border="1">
				<tr>
					<td><input type="button" value="삭제" onclick="okdelete()"></td>
					<td align="center"><input type="button" value="취소" onclick="location.href='userban.jsp'"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<script>
function okdelete(){
	confirm('정말 해당 유저를 탈퇴처리 하시겠습니까?');
}
</script>
</body>
</html>
