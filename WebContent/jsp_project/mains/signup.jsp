<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@page import="DBBean.foodingBean" %>
<meta charset="UTF-8">
<%

	request.setCharacterEncoding("UTF-8");
	
	String zipcode="";
	
	
	try{
		if(zipcode==null){
			zipcode="";
		}
	}finally{}

	foodingBean foodingbean=new foodingBean();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Sign Up</title>
		
		<link rel="stylesheet" href="../css/common.css">
		<style>
		
		</style>
		
		<script type="text/javascript">
			var DBnkArray=[];
			var DBidArray=[];
			var DBemailArray=[];
			var i=0;
			<% 
			
				ResultSet rs=foodingbean.resultQuery("select nkname,id,email from user");
				int i=0;
				try{
					while(rs.next()){
						String nknameArray = rs.getString("nkname");	
						String idArray = rs.getString("id");	
						String emailArray = rs.getString("email");	
						%>
						DBnkArray[<%=i%>]="<%=nknameArray%>";
						DBidArray[<%=i%>]="<%=idArray%>";
						DBemailArray[<%=i%>]="<%=emailArray%>";
						<%
						i++;
					}

				}catch(Exception e){
					
				}finally{}
				foodingbean.DBclose();
			%>
			var arraylength=<%=i %>

					
		</script>
		<script type="text/javascript" src="../js/commonJs.js"></script>
		
	</head>
	
	
	
	
	<body id="body" onload="AllcheckNotice()">
		<%@include file="../general_included/topbar.jsp"%>
		<hr style="border: solid 2px #ffbb00; align:center;
		width:1900px;">
		
		<div id="maindiv">
		<br>
		<br>
		<br> 
		<br>
		<form method="post" name="register" action="signcross.jsp" >
			<!--Register 버튼 누를시 registerInsert.jsp로 넘어감  -->
			<center>
			<fieldset>
			
			<legend align="center" class="welcome">WELCOME<img src="../img/carrot2.png" width="50px" height="50px"></legend>
			 
				<center>
					<table>  
						<tr>
							<td width="90px">닉네임</td>
							<td colspan="2">
								<input class="signupinputs" type="text" name="nkname"size="40" onkeyup="Nknamecheck();">
							</td>
						</tr><tr>
							<td></td>
							<td colspan="2" height="30px">
								<span id="nknameimg"></span><span id="nknamecheck"></span>
							</td>
						</tr>
						
						<tr>
							<td>아이디</td>
							<td colspan="2">
								<input class="signupinputs" type="text" name="id"size="40" onkeyup="Idcheck();">
							</td>
						</tr>
						<tr>
							<td></td>
							<td colspan="2" height="30px">
								<span id="idimg"></span><span id="idcheck"></span>
							</td>
						</tr>
						<tr> 
							<td>비밀번호</td>
							<td colspan="2">
								<input class="signupinputs" type="password" name="passwd"size="40" onkeyup="Passwdcheck();"><br>
								
							</td>
						</tr>
						<tr>
							<td></td>
							<td colspan="2" height="30px">
								<span id="passwdimg"></span><span id="passwdcheck"></span>
							</td>
						</tr>
						
						<tr>
							<td>비밀번호 확인</td>
							<td colspan="2">
								<input class="signupinputs" type="password" name="repasswd"size="40" onkeyup="Repasswdcheck();"><br>
								
							</td>
						</tr>
						<tr>
							<td></td>
							<td colspan="2" height="30px">
								<span id="repasswdimg"></span><span id="repasswdcheck"></span>
							</td>
						</tr>
						
						<tr>
							<td>이메일</td>
							<td colspan="2">
								<input class="signupinputs" type="text" name="email"size="40" onkeyup="Emailcheck();"><br>
								
							</td>
						</tr>
						<tr>
							<td></td>
							<td colspan="2" height="30px">
											<span id="emailimg"></span><span id="emailcheck"></span>
							</td>
						</tr>
						
						<tr> 
							<td>우편번호</td>
							<td><input class="addrnuminputs" type="text" name="addrnum" onclick="ZipPopup();" onfocus="ZipPopup()" readonly></td>
							<td><input class="addressinputs" type="text" name="address" onclick="ZipPopup();" onfocus="ZipPopup()" readonly></td>
						</tr>
						<tr><td></td><td>&nbsp;</td></tr>
						<tr>
							<td>주소</td> 
							<td colspan="2"><input class="signupinputs" type="text" name="detailaddr" size="40"></td>
						</tr>
						<tr>
							<td>성별</td>
							
							
							<td>
							<label class="loginradio"><ruby>남자<rt>&nbsp</rt></ruby>
							  <input type="radio"  id="male"  checked="checked" name="gender" value="1" >
							  <span class="checkmark"></span>
							</label>
							<label class="loginradio"><ruby>여자<rt>&nbsp</rt></ruby>
							  <input type="radio" name="gender"  id="female"  value="2" >
							  <span class="checkmark"></span>
							</label>
							</td>
		
		
						</tr>
						
					</table> 
					<br><br>
					<input type="button" value="취소" class="findbutton" onclick="Signupclear();">
					<input type="button" value="확인" class="findbutton" onclick="Signupcross();">
					<br><br><br>
				</center>
				
				</fieldset>
				</center>
			</form>
		</div>
		<br><br><br>
		<br><br><br>
		<br><br><br>

		
		
		<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
 <%@include file="../general_included/footer.jsp"%>

			</div>
	</body>
</html>
