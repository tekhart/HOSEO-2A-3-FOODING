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
					<td><input type="button" class="findbutton" value="삭제" onclick="okdelete()"></td>
					<td align="center"><input type="button" class="findbutton" value="취소" onclick="location.href='userban.jsp'"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<script>
function okdelete(){
	if(confirm('정말 해당 유저를 탈퇴처리 하시겠습니까?')){
		if(prompt('관리자 비밀번호를 입력하세요')=="hh"){
			alert('미국간 계정+1');
		}
	}else{
		return;
	}
}

</script>
<%@include file="../general_included/footer.jsp"%>
</body>
</html>
