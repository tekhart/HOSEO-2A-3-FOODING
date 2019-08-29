<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String ID="";
%>
<%
		String nNK = request.getParameter("newNK");

		//form 태그의 값을 저장
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			ID=(String)session.getAttribute("idlogin");
			String jdbcUrl = "jdbc:mysql://localhost:3306/fooding_db";
			String dbId = "foodingid";
			String dbPass = "foodingpw";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			//DB연결 

					String sql1="update user set nickName = ? where ID = ?";
					pstmt=conn.prepareStatement(sql1);
					pstmt.setString(1,nNK);
					pstmt.setString(2,ID);
					pstmt.executeUpdate();		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>

	<span>변경되었습니다.</span>
<%
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					if (rs != null)try {rs.close();} catch (SQLException sqle) {}
					if (pstmt != null)try {pstmt.close();} catch (SQLException sqle) {}
					if (conn != null)try {conn.close();} catch (SQLException sqle) {}
				}
%>
</body>
</html>