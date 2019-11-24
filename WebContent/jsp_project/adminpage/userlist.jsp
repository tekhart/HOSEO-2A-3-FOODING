<%@ page import="DBBean.foodingBean"%>
<%@ page import="DBBean.userDataBean"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	foodingBean dbPro = foodingBean.getInstance();
	try {
		List<userDataBean> userArticle = dbPro.getuserArticles();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="admincss.css">
<script type="text/javascript">
	function okdelete(userid) {
		if (confirm('정말 해당 유저를 탈퇴처리 하시겠습니까?')) {
			if (prompt('관리자 비밀번호를 입력하세요') == "hh") {
				alert('미국간 계정+1');
				location.href = "userban.jsp?userid=" + userid + "";
			}
		} else {
			return;
		}
	}
</script>
</head>
<body>
	<%@include file="../general_included/topbar.jsp"%>
	<table class="adminstb" border="1">
		<tr>
			<td>닉네임</td>
			<td>ID</td>
			<td>비밀번호</td>
			<td>가입일</td>
			<td>수정</td>
			<td>탈퇴</td>
		</tr>

		<%
			for (int i = 0; i < userArticle.size(); i++) {
					userDataBean ua = userArticle.get(i);
		%>
		<tr>
			<td><%=ua.getNkname()%></td>
			<td><%=ua.getId()%></td>
			<td><%=ua.getPasswd()%></td>
			<td><%=ua.getReg_date()%></td>
			<td><a href="userupdate.jsp?userid=<%=ua.getId()%>">수정</a></td>
			<td onclick="okdelete('<%=ua.getId()%>')">탈퇴</td>
		</tr>

		<%
			}

			} catch (Exception e) {
				e.printStackTrace();
			}
		%>


	</table>
	<%@include file="../general_included/footer.jsp"%>
</body>
</html>
