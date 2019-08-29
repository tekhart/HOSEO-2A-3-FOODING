<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String ID="";
%>
<%
		String cpw = request.getParameter("curPW");
		String npw = request.getParameter("newPW");
		
		//form 태그의 값을 저장
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs = null;
		try {
			ID=(String)session.getAttribute("idlogin");
			String jdbcUrl = "jdbc:mysql://localhost:3306/fooding_db";
			String dbId = "foodingid";
			String dbPass = "foodingpw";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			//DB연결
			String sql1 = "select PASSWD from user where ID = ?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, ID);
			//form 태그 값을 저장한 id 변수를 ?에 넣어 id와 비밀번호를 추출함 
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String sqlpw = rs.getString("PASSWD");
				if (cpw.equals(sqlpw)) {
					sql1="update user set PASSWD = ? where ID = ?";
					pstmt1=conn.prepareStatement(sql1);
					pstmt1.setString(1,npw);
					pstmt1.setString(2,ID);
					pstmt1.executeUpdate();		
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
				}else
					out.println("비밀번호가 틀립니다.");
				}else
					out.println("오류");	
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