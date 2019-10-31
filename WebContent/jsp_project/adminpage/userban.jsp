<%@ page import = "DBBean.foodingBean" %>
<%@ page import = "DBBean.BoardDataBean" %>
<%@ page import = "DBBean.userDataBean" %>   
<%@ page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
foodingBean dbPro = foodingBean.getInstance();
try{
	List<userDataBean> userArticle =dbPro.getuserArticles();	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<td>닉네임</td>
		<td>ID</td>
		<td>비밀번호</td>
		<td>가입일</td>
		<td>수정</td>
		<td>삭제</td>
	</tr>

<%
for (int i = 0 ; i < userArticle.size(); i++) {	
	userDataBean ua= userArticle.get(i);
%>
	<tr>
		<td><%=ua.getNkname() %></td>
		<td><%=ua.getId() %></td>
		<td><%=ua.getPasswd() %></td>
		<td><%=ua.getReg_date() %></td>
		<td><a href="update.jsp?<%=ua.getId()%>">수정</a></td>
		<td><a href="delete.jsp?<%=ua.getId()%>">삭제</a></td>
		</tr>
		
		<%} %>

<%}catch(Exception e){e.printStackTrace();} %>


</table>
</body>
</html>
