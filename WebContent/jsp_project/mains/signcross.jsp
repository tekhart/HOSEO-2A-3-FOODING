<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.sql.*"%>
<%
String nkname = request.getParameter("nkname");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String repasswd = request.getParameter("repasswd");
String email = request.getParameter("email");
String detailaddr = request.getParameter("detailaddr");

String select = request.getParameter("select");
select="id";

if(nkname==null){nkname="";}
if(id==null){id="";}
if(passwd==null){passwd="";}
if(repasswd==null){repasswd="";}
if(email==null){email="";}
if(detailaddr==null){detailaddr="";}


if(select.equals("id")){
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
			if(dbid.equals(id)){
				%>
				<form method="post" name="idreturn" action="signup.jsp">
					<input type="hidden" value="<%=nkname %>" name="nkname">
					<input type="hidden" value="<%=id %>" name="id">
					<input type="hidden" value="<%=passwd %>" name="passwd">
					<input type="hidden" value="<%=repasswd %>" name="repasswd">
					<input type="hidden" value="<%=email %>" name="email">
					<input type="hidden" value="<%=detailaddr %>" name="detailaddr">
				</form>
				<script type="text/javascript">
					
					var idreturn=document.idreturn;
					idreturn.submit();

				</script>
				<%
			}
		}
	}
	catch (Exception e) {
			e.printStackTrace();		
	}
	finally{
		if (rs != null)try {rs.close();} catch (SQLException sqle) {}
		if (pstmt != null)try {pstmt.close();} catch (SQLException sqle) {}
		if (conn != null)try {conn.close();} catch (SQLException sqle) {}
	}//자원반환
}
%>

