<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<link rel="stylesheet" href="../css/common.css">
<style>
												

</style>

</head>
<body>

<div id="topdiv" style=text-align:center;>
	<table width=100% height=100%>
    <tr><td width=200 nowrap>
		</td><td width=200 nowrap>
		</td><td width=30 nowrap>

		<input type="button" class="button11" value="로그인" onClick="location.href='signin.jsp'">
		<input type="button" class="button11" value="회원가입" onClick="location.href='signup.jsp'">

		</td></tr>
  	</table>
</div>

<div id="menudiv" style=text-align:center;>
	<table width=100% height=100%>
    <tr><td width=100 nowrap>
				<a href=../mains/main.jsp><img src="../img/fooding.png" height="60px" width="100px"></a>
			</td>
			<td width=150 nowrap><font size="10px"><a href=../mains/main.jsp id="title">FOODING</a></font></td>
			<td>
				<center>
					<table id="menutable">
						<tr>
							<td><center>
								<div class="dropdown">
			
	            					<button class="dropbtn">레시피</button>
	            
	            					<div class="dropdown-content">
	            						<center>
		        							<a href="#">전체 레시피</a>
							        		<a href="#">인기 레시피</a>
							        		<a href="#">맞춤 레시피</a>
							       			<a href="#">레시피 작성</a>
						       			</center>
						       		</div>
	       						</div>
	       						</center>
	        				</td>
	        
	       					<td><center>
	        					<div class="dropdown">
	            					<button class="dropbtn">요리도우미</button>
	            					<div class="dropdown-content">
	            						<center>
		            						<a href="#">요리 강의</a>
									        <a href="#">초보용 레시피</a>
									        <a href="#">재료구매</a>
	            						</center>
						        	</div>
						        </div></center>
	        				</td>	
	        				<td><center>
						        <div class="dropdown">
						            <button class="dropbtn">공지사항</button>
						            <div class="dropdown-content">
							            <center>
							            	<a href="#">푸딩규칙</a>
									        <a href="#">이벤트</a>
							            </center>
						        	</div>
						        </div></center>
					        </td>
	        				<td><center>
	        					<div class="dropdown">
						            <button class="dropbtn">고객센터</button>
						            <div class="dropdown-content">
							            <center>
							             	<a href="#">자주하는 질문</a>
									        <a href="#">문의사항</a>
							            </center>
						        	</div>
						        </div></center>
	        				</td>
	        			</tr>
	        		</table>
				</center>
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
		String sql="select pw from register where id=?;";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		//form 태그 값을 저장한 id 변수를 ?에 넣어 비밀번호를 추출함 
		rs=pstmt.executeQuery();
		while(rs.next()){
			String pw=rs.getString("pw");
	%>
	<span><%=id %>님의 비밀번호는 </span>	<h4><%=pw %></h4>입니다.<!-- 추출한 비밀번호를 보여줌 -->
	<% 
		}} catch (Exception e) {
			e.printStackTrace();
			%>
				<script type="text/javascript">
					alert("아이디가 올바르지 않습니다.");
					location.href="findID.jsp";
				</script>
			<%
		} finally {
			if (rs != null)	try {rs.close();} catch (SQLException sqle) {}
			if (pstmt != null)try {pstmt.close();} catch (SQLException sqle) {}
			if (conn != null)try {conn.close();} catch (SQLException sqle) {}
		}
		%>
</div>
<br><br><br>
<br><br><br>
<br><br><br>
<br><br><br>
<br><br><br>



<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
<pre>
Create by FOODING
고객문의 1544-XXXX
JSP Project 2019 2A03</pre>
</div>

</body>
</html>
