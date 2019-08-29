<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보</title>


<link rel="stylesheet" href="../css/common.css">
<style>
	body{	font-family:"Bauhaus ITC";
		color:black;}
		
#title{
	text-decoration:none;
	
}
</style>

</head>

<body id="body">
	<%@include file="../general_included/topbar.jsp"%>
	<div id="maindiv">
	<center>
		<table>
	
	
			<%	
				foodingBean foodingbean=new foodingBean();
			
				foodingbean.connect();
				
				String sql="select * from user where ID = "+idlogin+";";
				
				ResultSet rs = foodingbean.resultQuery(sql);
		
				if(rs.next()){
					String nk=rs.getString("nkname");
					String id=rs.getString("id");
					String pw=rs.getString("passwd");
					String email=rs.getString("email");
					String addr=rs.getString("addrnum");
					String daddr=rs.getString("detailaddr");
					String mile=rs.getString("mileage");
					
					
			%>
				<tr>
				<td width="100">닉네임</td><TD width="100"><%=nk %></TD>
				</tr>
				<tr>
				<td width="100" >ID</td><TD width="100"><%=id %></TD>
				</tr>
				<tr>
				<td width="100">비밀번호</td><TD width="100"><%=pw %></TD>
				</tr>
				<tr>
				<td width="150">이메일</td><TD width="150"><%=email %></TD>
				</tr>
				<tr>
				<td width="50">주소</td><TD width="150"><%=addr%></TD>
				</tr>
				<tr>
				<td width="200">상세주소</td><TD width="200"><%=daddr%></TD>
				</tr>
				<tr>
				<td width="100">마일리지</td><TD width="100"><%= mile %></TD>
				</TR>
			<%} %>
		</table> 
	</center>
	
</div>
<br><br><br>



<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
Create by FOODING<br>
고객문의 1544-XXXX<br>
JSP Project 2019 2A03
</div>

</body>
</html>
