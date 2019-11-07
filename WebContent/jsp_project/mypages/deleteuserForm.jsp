<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.BoardDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/list.css">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script type="text/javascript"></script>
</head>
<body id="body">
	<%@include file="../general_included/topbar.jsp"%>
	<div id="maindiv">
		<div style="margin: auto">
			<form action="deleteuserPro.jsp" method="post">
				<div class="deleteuser">
					<table style="text-align: left; width: 600px; margin: auto; position:relative; top:-50px;">
						<tr>
							<td colspan="2"><p id="notice"
									style="font-weight: 100; text-align: left;">고객님의 개인정보 보호를
									위해 비밀번호를 입력해주세요</p></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td>비밀번호 확인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="checkpw"
								type="password" name="checkpw" style="width: 50%"></td>
						</tr>
						<tr>
						<td>
						<br></td></tr>
						<tr>
							<td style="font-size:22px;">※ 회원 탈퇴 주의사항 ※<br>
							1. 탈퇴 후에 작성 하셨던 글, 댓글 등 모든 기록들이 삭제되지는 않습니다.<br>
							2. 사용하시던 아이디로 재가입이 불가능합니다.<br>
							3. 확인을 누르시면 바로 회원 탈퇴가 됩니다.
							</td>
						</tr>
					</table>

				</div>
				<br><br><br>
				<table align="right" style="margin-right:550px;"><tr><td>
				<input type="button" value="취소" class="check2" onclick="location.href='profile.jsp'"></td><td>
				<input type="submit" value="확인" class="check"></td></tr></table>
			</form>
		</div>
	</div>
	<%@include file="../general_included/footer.jsp"%>

</body>
</html>