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
		<table cellspacing=5px class="mypagetable"> 
	
	
			<%	
				foodingBean foodingbean=new foodingBean();
			
				foodingbean.connect();
				
				String sql="select * from user where ID = '"+idlogin+"';";
				
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
				<td  class="line" width="70px">닉네임</td><TD  class="line" width="240px"><%=nk %></TD>
				
				</tr>
				
				
				<tr>
				<td class="line" width="70px">비밀번호</td>
				<TD class="line" width="240px">
				
				<%=pw%>
				
				</TD>
				</tr>
				
				
				<tr> 
				<td class="line" width="70px">이메일</td><TD class="line" width="240px"><%=email %></TD>
				
				</tr>
				<tr>
				<td class="line" width="70px">주소</td><TD class="line" width="240px"><%=addr%></TD>
				
				</tr>
				<tr height="70px">  
				<td class="line" width="70px">상세주소</td><TD class="line" width="240px" colspan="2"><%=daddr%></TD>
				<td></td> 
				</tr>   
				
				<tr>
				<td class="line" width="70px">마일리지</td><TD class="line" width="240px"><%= mile %> p</TD>
				
				</TR>
				
				<tr>
				<td class="line" width="70px">내가 쓴 글</td><TD class="line" width="240px">0개</TD>  
				
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
