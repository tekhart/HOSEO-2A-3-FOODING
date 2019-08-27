<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("passwd");
		//form 태그의 값을 저장
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
			String sql1 = "select ID,PASSWD from user where id=(select ID from user where ID = ?);";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, id);
			//form 태그 값을 저장한 id 변수를 ?에 넣어 id와 비밀번호를 추출함 
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String sqlid = rs.getString("ID");
				String sqlpw = rs.getString("PASSWD");
				if (id.equals(sqlid) && pw.equals(sqlpw)) {
				//id와 비밀번호를 입력한게 sql의 값과 같으면 등록된 회원 테이블을 보여줌
	%>
<%--<jsp:forward page="report_bean.jsp"/> --%>
<!-- 회원 테이블을 보여주는 페이지를 포워딩해서 보여줌 -->
<span>로그인 되셨습니다.</span>
	<%
					session.invalidate();
					session.setAttribute("idlogin",id);
					response.sendRedirect("../mains/main.jsp");
				} else {%>
	<span>로그인 안 되셨습니다.</span>
	<%
		}}} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)try {rs.close();} catch (SQLException sqle) {}
			if (pstmt != null)try {pstmt.close();} catch (SQLException sqle) {}
			if (conn != null)try {conn.close();} catch (SQLException sqle) {}
		}
		//자원 반환
	%>

</body>
</html>
