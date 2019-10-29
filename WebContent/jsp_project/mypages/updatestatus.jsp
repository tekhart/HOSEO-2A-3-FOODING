<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>

<meta charset="UTF-8">

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
	<form>
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
				<td rowspan="2"><img src="../img/carrot2.png" height="100" width="100"></td>
				</tr>
				
				
				<tr>
				<td class="line" width="70px">비밀번호</td>
				<TD class="line" width="240px">
				
					<input name="currentpw" class="thin3inputs" type="password" placeholder="현재 비밀번호"><br>
					<input name="changepw" class="thin3inputs" type="password" placeholder="변경할 비밀번호"><br>
					<input name="comfirmpw" class="thin3inputs" type="password" placeholder="비밀번호 확인">
				
				</TD>
				</tr>
				
				
				<tr> 
				<td class="line" width="70px">이메일</td><TD class="line" width="240px"><%=email %></TD>
				<td class="line"><input type="button" value="사진 변경" class="findbutton2"></td>
				</tr>
				<tr>
				<td class="line" width="70px">주소</td><TD class="line" width="240px"><%=addr%></TD>
				<td class="line"><input type="button" value="개인정보 관리" class="findbutton2"></td>
				</tr>
				<tr height="70px">  
				<td class="line" width="70px">상세주소</td><TD class="line" width="240px" colspan="2"><%=daddr%></TD>
				<td></td> 
				</tr>   
				
				<tr>
				<td class="line" width="70px">마일리지</td><TD class="line" width="240px"><%= mile %> p</TD>
				<td class="line"><input type="button" value="포인트 관리" class="findbutton2"></td>
				</TR>
				
				<tr>
				<td class="line" width="70px">내가 쓴 글</td><TD class="line" width="240px">n개</TD>  
				<td class="line"><input type="button" value="글 관리" class="findbutton2"></td>
				</TR>
			<%} %>
		</table> 
		
		<input type="reset" value="취소" class="findbutton">
		<input type="submit" value="확인" class="findbutton">
		
		</form>
	
		
	</center>
	
</div> 
<br><br><br>



	<%@include file="../general_included/footer.jsp"%>

</body>
</html>
