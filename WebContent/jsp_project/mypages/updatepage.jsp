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
	<link rel="shortcut icon" href="../img/favicon.ico">
	<link rel="icon" href="../img/favicon.ico">
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

	<%@include file="sidemenu.jsp"%>

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
							<td  class="signupinputs" style="font-size:16pt;  width:260px;"><%=nk %></td>
				<!--<td rowspan="2"><img src="../img/carrot2.png" height="100" width="100"></td> -->
				</tr>
				<td height="25px;">
				</td>
				
				<tr>
				<td width="50px" style="font-size:16pt;">비밀번호</td>
					<td><input name="currentpw" class="signupinputs" type="password" style="width:260px; font-size:12pt;" placeholder="현재 비밀번호"></td>
				<tr>
				<td style="padding-bottom:80px;">
				</td>
				<td>
					<input name="changepw" class="signupinputs" type="password" style="width:260px; font-size:12pt" placeholder="변경할 비밀번호"></td>
				</tr>
				<tr>
				<td>
				</td>
				<td>	
					<input name="comfirmpw" class="signupinputs" type="password" style="width:260px; font-size:12pt" placeholder="비밀번호 확인"></td>
				</tr>				
				
				
				<td height="25px;">
				</td>
				
				<tr> 
				<td width="70px" style="font-size:16pt">이메일</td><TD class="signupinputs" style="font-size:16pt; width:260px;"><%=email %></TD>
				<!-- <td class="line"><input type="button" value="사진 변경" class="findbutton2"></td> -->
				</tr>
				<td height="25px;">
				</td>
				
				<tr> 
				<td width="70px" style="font-size:16pt">우편번호</td><TD class="signupinputs" width="240px" style="font-size:16pt; width:340px;"><%=addr %></TD>
				</tr>
				<td height="25px;">
				</td>
				
				<tr>
				<td width="70px" style="font-size:16pt">주소</td><TD  width="240px" class="signupinputs" style="font-size:16pt; width:340px;"><%=addre%></TD>
				</tr>
				<td height="25px;">
				</td>
				
				<tr height="70px">  
				<td  width="70px" style="font-size:16pt">상세주소</td><td class="signupinputs" width="240px" colspan="2" style="font-size:16pt; width:340px;"><%=daddr%></TD>
				</tr>   
				
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



<%@include file="../general_included/footer.jsp"%>

</body>
</html>
