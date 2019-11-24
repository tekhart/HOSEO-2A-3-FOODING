<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.foodingBean"%>
<%@ page import="DBBean.askDataBean"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%!SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
<%
	try {
		int id = Integer.parseInt(request.getParameter("id"));
		foodingBean dbPro = foodingBean.getInstance();
		askDataBean article = dbPro.getaskArticle(id);
		foodingBean foodingbean = new foodingBean();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 확인</title>
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="admincss.css">
</head>
<body>
	<%@include file="../general_included/topbar.jsp"%>
	<br>
	<br>
	<table style="width: 1000px; margin: auto;">
		<tr>
			<td>

				<table border="1" class="asktb0"
					style="width: 1000px; margin: auto; border-collapse: collapse;">
					<tr>
						<td>유형</td>
						<td><%=article.getAsktype()%></td>
						<td>ID</td>
						<td><%=article.getWriterid()%></td>
						<td>일자</td>
						<td><%=sdf.format(article.getReg_date())%></td>
					</tr>
				</table> <br>
				<table border="1" class="asktb1" width="1000px">
					<tr>
						<td>제목</td>
						<td><%=article.getTitle() %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<%=article.getContent() %>
						</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td>
							<%=article.getAtteched() %>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<center>
		<input type="button" value="확인" class="findbutton" onclick="location.href='asklist.jsp'">
	</center>
	<%@include file="../general_included/footer.jsp"%>
</body>
</html>
<%
	} catch (Exception e) {
	}
%>
