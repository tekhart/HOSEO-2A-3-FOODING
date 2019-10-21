<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="../css/common.css">
		<link rel="stylesheet" href="../css/list.css">
		<meta charset="UTF-8">
		<title>Sign Up</title>

		<style>
		
		</style>
		
		<script type="text/javascript"></script>
		
	</head>
	

	
	<body id="body">
		<%@include file="../general_included/topbar.jsp"%>
		<div id="maindiv">
		<div class="writetitle1">마이페이지</div>	
		<br>
		<br>
		<br> 
		<br>
		<form method="post" name="register" action="signcross.jsp" >
		
			<input type="hidden" name="nknamecheck">
			<input type="hidden" name="idcheck">
			<input type="hidden" name="passwdcheck">
			<input type="hidden" name="repasswdcheck">
			<input type="hidden" name="emailcheck">		
			<input type="hidden" name="selected">
			<!--Register 버튼 누를시 registerInsert.jsp로 넘어감  -->
			<center>
				<table>  
					<%	
						request.setCharacterEncoding("UTF-8");
						
						String zipcode="";
						
						
						try{
							zipcode=(String)session.getAttribute("zipcode");
							if(zipcode==null){
								zipcode="";
							}
						}finally{}

						foodingBean foodingbean=new foodingBean();
					
						String findId=request.getParameter("findId");
						if(findId==null){
							findId=idlogin;
						}
						
						String sql="select * from user where ID = '"+findId+"';";
						
						ResultSet rs = foodingbean.resultQuery(sql);
				
						if(rs.next()){
							String nk=rs.getString("nkname");
							String email=rs.getString("email");
							String addrnum=rs.getString("addrnum");
							String address=rs.getString("addrnum");
							String detailaddr=rs.getString("detailaddr");
							String mile=rs.getString("mileage");
								%>	
								<tr>
									<td width="90px">닉네임</td>
									<td colspan="2">
										<%=nk %>
									</td>
								</tr>
								
								<tr>
									<td>이메일</td>
									<td colspan="2">
										<input class="signupinputs" type="text" size="40"><br>
							
									</td>
								</tr>
								
								<tr> 
									<td>우편번호</td>
									<td><%=addrnum%></td>
								</tr>
								<tr><td></td><td>&nbsp;</td></tr>
								<tr>
									<td>주소</td> 
									<td colspan="2"><input class="signupinputs" type="text" size="40"><%=detailaddr%></td>
								</tr>
								<tr>
									<td>성별</td>
									
									
									<td>
									<label class="loginradio"><ruby>남자<rt>&nbsp</rt></ruby>
									  <input type="radio"  id="male"  checked="checked" value="1" >
									  <span class="checkmark"></span>
									</label>
									<label class="loginradio"><ruby>여자<rt>&nbsp</rt></ruby>
									  <input type="radio" id="female"  value="2" >
									  <span class="checkmark"></span>
									</label>
									</td>
								</tr>
							<%} %>
						</table> 
					<br><br>
					<input type="button" value="취소" class="findbutton" onclick="Signupclear();">
					<input type="button" value="확인" class="findbutton" onclick="Signupcross('register');">
					<br><br><br>
				</center>
			</form>
		</div>
<br><br><br>



<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
Create by FOODING<br>
고객문의 1544-XXXX<br>
JSP Project 2019 2A03
</div>

</body>
</html>
