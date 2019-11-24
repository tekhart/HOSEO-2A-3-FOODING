<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.foodingBean"%>
<%@ page import="DBBean.askDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%!SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
<%
	foodingBean dbPro = foodingBean.getInstance();
	try {
		List<askDataBean> Articles = dbPro.getaskArticles("","");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 확인</title>
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="admincss.css">
<script type="text/javascript">
	function deleteask(userid) {
		if (confirm('해당 문의를 삭제 하시겠습니까?')) {
			location.href = "askdelete.jsp?id=" + userid + "";
		} else {
			return;
		}
	}
</script>
</head>
<body>
	<%@include file="../general_included/topbar.jsp"%>
	<br>
	<br>
	<table class="adminstb4" border="1">
		<tr>
			<th>유형</th>
			<th>제목</th>
			<th>내용 미리보기</th>
			<th>ID</th>
			<th>일자</th>
			<th>삭제</th>
		</tr>
		<%
			for (int i = 0; i < Articles.size(); i++) {
					askDataBean article = Articles.get(i);
		%>
			<tr>
				<td><%=article.getAsktype() %></td>
				<td><a href="askdetail.jsp?id=<%=article.getId() %>"><%=article.getTitle() %></a></td>
				<td><%=article.getContent() %></td>
				<td><%=article.getWriterid() %></td>
				<td><%=sdf.format(article.getReg_date())%></td>
				<td onclick="deleteask('<%=article.getId()%>')">삭제</td>
			</tr>
		<%} %>
	</table>
	<br>
	<%@include file="../general_included/footer.jsp"%>
</body>
</html>
<%
	} catch (Exception e) {
		e.printStackTrace();
	}
%>