<%@ page import = "DBBean.foodingBean" %>
<%@ page import = "DBBean.BoardDataBean" %>
<%@ page import = "DBBean.userDataBean" %>   
<%@ page import = "java.util.List" %>
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>

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

<%

Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs = null;

try{
	con = dbPro.connect();
	String sql="select * from members where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			String passwd = rs.getString("passwd");
			String nkname = rs.getString("nkname");
			Timestamp reg_date = rs.getTimestamp("reg_date");

%>

<form name="userupdateform" method="post" action="updateok.jsp">
<table>
	<tr>
		<td>닉네임</td>
		<td><%=nkname %><input type="hidden" name="nkname" value="<%=nkname%>"></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><%=id %></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%=passwd %></td>
	</tr>
	<tr>
		<td>가입일</td>
		<td><%=reg_date %></td>
	</tr>
	<tr>
		<td><input type="button" value="save" onclick="userupdateform.submit();"></td>
		<td><input type="button" value="cancel" onclick="location.href='userban';"></td>
	</tr>
</table>
</form>



<%}catch(Exception e){e.printStackTrace();} %>

<script>
function update(){
	document.userupdateform.submit();
}
function userban(){
	location.herf="userban.jsp";
}
</script>

</body>
</html>
