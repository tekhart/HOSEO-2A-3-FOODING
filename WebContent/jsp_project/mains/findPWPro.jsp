<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Password</title>

<style>
																			#body{}
																			#topdiv
																				{background-color:#FFBB00;
																		        height:40px;}
																		 	#menudiv
																		    	{background-color:white;
																		        height:100%;}
																			.button11{
																						background-color:#FFBB00;
																						border:none;
																						margin-right:-4.5px;
																						color:#813D00;
																						}
																			.button2{
																						margin-right:-4.5px;
																						width:250px;
																						height:85px;
																						font-size:20px;
																						background-color:white;
																						border:none;
																						}
																			.button2:hover{background-color:#FFE08C;}
																		 	#maindiv
																		    	{background-color:#EAEAEA;
																		        height:600px;}


</style>

</head>
<body>

<div id="topdiv" style=text-align:center;>
	<table width=100% height=100%>
    <tr><td width=200 nowrap>
		</td><td width=200 nowrap>
		</td><td width=30 nowrap>

		<input type="button" class="button11" value="로그인">
		<input type="button" class="button11" value="회원가입">

		</td></tr>
  	</table>
</div>

<div id="menudiv" style=text-align:center;>
	<table width=100% height=100%>
    <tr><td width=100 nowrap>
		<img src="C:\Users\sol\Desktop\jsp프로젝트\이미지\그림3.png" height="60px" width="100px"></td>
		<td width=150 nowrap><font size="10px">FOODING</font></td><td>

		<input type="button" class="button2" value="레시피">
		<input type="button" class="button2" value="요리도우미">
		<input type="button" class="button2" value="공지사항">
    	<input type="button" class="button2" value="고객센터">
        
		</td></tr>
 	</table>
</div>

<div id="maindiv">

	<%
	String id=request.getParameter("findID");
	//form 태그의 값을 저장
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
		try{
		String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
		String dbId="jspid";
		String dbPass="jsppass";
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		//DB연결
		String sql="select pw from register where id=(select id from register where id = ?);";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		//form 태그 값을 저장한 id 변수를 ?에 넣어 비밀번호를 추출함 
		rs=pstmt.executeQuery();
		while(rs.next()){
			String pw=rs.getString("pw");
	%>
	<span>Your PassWord is </span>	<h4><%=pw %></h4><!-- 추출한 비밀번호를 보여줌 -->
	<% 
		}} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)	try {rs.close();} catch (SQLException sqle) {}
			if (pstmt != null)try {pstmt.close();} catch (SQLException sqle) {}
			if (conn != null)try {conn.close();} catch (SQLException sqle) {}
		}
		%>
</div>
<br><br><br>



<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
Create by FOODING<br>
고객문의 1544-XXXX<br>
JSP Project 2019 2A03
</div>

</body>
</html>
