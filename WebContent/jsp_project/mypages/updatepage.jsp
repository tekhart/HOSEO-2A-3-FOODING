<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>
<jsp:useBean id="tempbean" scope="session" class="DBBean.foodingDataBean"/>
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
	<center>
	<fieldset>
	
	
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
			
			<table>
				<tr>
				<td width="90px" height="50px" style="font-size:16pt">닉네임</td>
							<td  class="signupinputs" width="240px" style="font-size:16pt"><%=nk %></td>
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
				<tr> 
				<td width="70px" style="font-size:16pt">우편번호</td><TD class="signupinputs" width="240px" style="font-size:16pt"><%=addr %></TD>
				</tr>
				<tr>
				<td width="70px">주소</td><TD  width="240px"><%=addre%></TD>
				<td><input type="button" value="개인정보 관리" class="findbutton2"></td>
				</tr>
				<tr height="70px">  
				<td  width="70px">상세주소</td><TD class="line" width="240px" colspan="2"><%=daddr%></TD>
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
		
		</fieldset>
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
