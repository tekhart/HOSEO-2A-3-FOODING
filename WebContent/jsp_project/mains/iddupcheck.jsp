<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
String nkname = request.getParameter("nkname");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String repasswd = request.getParameter("repasswd");
String email = request.getParameter("email");
String addrnum = request.getParameter("addrnum");
String detailaddr = request.getParameter("detailaddr");

if(nkname==null){nkname="";}
if(id==null){id="";}
if(passwd==null){passwd="";}
if(repasswd==null){repasswd="";}
if(email==null){email="";}
if(detailaddr==null){detailaddr="";}

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/fooding_db";
			String dbId = "foodingid";
			String dbPass = "foodingpw";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			//DB연결
			String sql = "select id from user where id=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			//form 태그 값을 저장한 name 변수를 ?에 넣어 ID를 추출함 
			rs = pstmt.executeQuery();
			while (rs.next()) {
			String dbid = rs.getString("id");
	%>
	<%
		}} catch (Exception e) {
			e.printStackTrace();
			%>
				<form method="post" name="datareturn" action="signup.jsp">
					<input type="text" name="nkName" maxlength="30" value="<%= nkname%>">
					<input type="text" name="id" maxlength="30" value="<%= id%>">
					<input type="password" name="passwd" maxlength="30" value="<%= passwd%>">
					<input type="password" name="repasswd" maxlength="30" value="<%= repasswd%>">
					<input type="password" name="email" maxlength="30" value="<%= email%>">
					<input type="text" name="DetailAddr" maxlength="30" value="<%= detailaddr%>">
				</form>
				<script type="text/javascript">
					alert("중복되어 사용할 수 없습니다.");
					var datareturn=document.datareturn;
					datareturn.submit();
				</script>
			<%	
		}
		finally {
			if (rs != null)try {rs.close();} catch (SQLException sqle) {}
			if (pstmt != null)try {pstmt.close();} catch (SQLException sqle) {}
			if (conn != null)try {conn.close();} catch (SQLException sqle) {}
		}//자원반환
	%>