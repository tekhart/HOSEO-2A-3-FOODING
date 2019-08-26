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
<title>회원가입 완료</title>
</head>
<body>
	<%	
		String nkName = request.getParameter("nkName");
		String id = request.getParameter("id");
		String passWd = request.getParameter("password");
		String email = request.getParameter("email");
		String addrnum = request.getParameter("AddrNum");
		String detailaddr = request.getParameter("DetailAddr");
		String gender = request.getParameter("gender");
		int mileage = 0;
		
		//signup.jsp 파일의 form태그에서 입력된 값을 저장할 변수 생성, 그리고 form 태그에 있는 값을 저장함 

		Connection conn = null;
		PreparedStatement pstmt = null;
		String str = "";
		//회원가입의 상태문장을 보여줄 str 문자열 변수 생성 
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/fooding_db";
			String dbId = "foodingid";
			String dbPass = "foodingpw";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			//DB연결
		
			String sql = "insert into user values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,nkName);
			pstmt.setString(2, id);
			pstmt.setString(3, passWd);
			pstmt.setString(4, email);			
			pstmt.setString(5, addrnum);
			pstmt.setString(6, detailaddr);
			pstmt.setString(7,gender);
			pstmt.setInt(8,mileage);
			pstmt.executeUpdate();
			//register 테이블에 signup.jsp 파일의 form태그에서 입력된 값을 입력함 
			session.setAttribute("idlogin",id);
			response.sendRedirect("../mains/main.jsp");
			//회원가입이 제대로 됬으면 str의 값이 '회원가입 됬습니다.'로 저장됨
		} catch (Exception e) {
			e.printStackTrace();
			str = "회원가입을 못했습니다.";
			//회원가입이 제대로 안되면 str의 값이 '회원가입 됬습니다.'로 저장됨
		} finally {
			if (pstmt != null)try {pstmt.close();} catch (SQLException sqle) {}
			if (conn != null)try {conn.close();} catch (SQLException sqle) {}
			}//자원반환
		%>
	<h2><%=str%>
	<%=nkName %>
	<%=id %>
	<%=passWd %>
	<%=email %>
	<%=addrnum %>
	<%=detailaddr %>
	<%=gender %>
	</h2>
</body>
</html>
