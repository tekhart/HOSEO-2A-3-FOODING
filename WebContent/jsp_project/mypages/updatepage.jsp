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
<link rel="stylesheet" href="../css/list.css">
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
<div class="writetitle1">
마이페이지</div>

	<div class="sidebar">
		<div class="sideleft"></div><a href="#" > 개인정보 관리</a>
		<div class="sideleft"></div><a href="#" >포인트 관리</a>
		<div class="sideleft"></div><a href="#" >게시글 관리</a>
		<div class="sideleft"></div><a href="#" > 주문조회</a>
		<div class="sideleft"></div><a href="../mypages/shopbasket.jsp" > 장바구니</a>
</div>

	<center>

	
	
	
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
					String addre=rs.getString("address");
					String daddr=rs.getString("detailaddr");
					String mile=rs.getString("mileage");
					
					
			%>
			<br>
		<fieldset  >
			<legend class="welcome2">개인정보 관리</legend>
			<table width="500px">
				<tr>
				<td width="120px" height="50px" style="font-size:16pt;">닉네임</td>
							<td  class="signupinputs" width="350px" style="font-size:16pt"><%=nk %></td>
				<!--<td rowspan="2"><img src="../img/carrot2.png" height="100" width="100"></td> -->
				</tr>
				<td height="25px;">
				</td>
				
				<tr>
				<td width="70px" style="font-size:16pt;">비밀번호</td>
					<td><input name="currentpw" class="signupinputs" type="password" style="font-size:12pt;" placeholder="현재 비밀번호"></td>
				<tr>
				<td style="padding-bottom:80px;">
				</td>
				<td>
					<input name="changepw" class="signupinputs" type="password" style="font-size:12pt" placeholder="변경할 비밀번호"></td>
				</tr>
				<tr>
				<td>
				</td>
				<td>	
					<input name="comfirmpw" class="signupinputs" type="password" style="font-size:12pt" placeholder="비밀번호 확인"></td>
				</tr>				
				
				
				<td height="25px;">
				</td>
				
				<tr> 
				<td width="70px" style="font-size:16pt">이메일</td><TD class="signupinputs" width="240px" style="font-size:16pt"><%=email %></TD>
				<!-- <td class="line"><input type="button" value="사진 변경" class="findbutton2"></td> -->
				</tr>
				<td height="25px;">
				</td>
				
				<tr> 
				<td width="70px" style="font-size:16pt">우편번호</td><TD class="signupinputs" width="240px" style="font-size:16pt"><%=addr %></TD>
				</tr>
				<td height="25px;">
				</td>
				
				<tr>
				<td width="70px" style="font-size:16pt">주소</td><TD  width="240px" class="signupinputs" style="font-size:16pt"><%=addre%></TD>
				<td ><input type="button" value="주소 찾기" class="findbutton2"></td>
				</tr>
				<td height="25px;">
				</td>
				
				<tr height="70px">  
				<td  width="70px" style="font-size:16pt">상세주소</td><td class="signupinputs" width="240px" colspan="2" style="font-size:16pt"><%=daddr%></TD>
				<td></td> 
				</tr>   
				
				<tr>
				<td width="70px" style="font-size:16pt">마일리지</td><TD class="line" width="240px" style="font-size:16pt"><%= mile %> p</TD>
				<td ><input type="button" value="포인트 관리" class="findbutton2"></td>
				</TR>
				
				<tr>
				<td width="70px" style="font-size:16pt">내가 쓴 글</td><TD class="line" width="240px" style="font-size:16pt">n개</TD>  
				<td ><input type="button" value="글 관리" class="findbutton2"></td>
				</TR>
				<td height="50px;">
				</td>
			<%} %>
		</table> 
		</fieldset>
		
		<br><br><br>
		
		<input type="reset" value="수정" class="findbutton">
		<input type="submit" value="확인" class="findbutton">
		
		
		</form>
	
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
