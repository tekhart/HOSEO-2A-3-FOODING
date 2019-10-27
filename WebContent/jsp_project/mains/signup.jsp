<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="DBBean.foodingBean" %>
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
		<link rel="shortcut icon" href="../img/favicon.ico">
		<link rel="icon" href="../img/favicon.ico">
		<link rel="stylesheet" href="../css/common.css">
		<style>
		
		</style>
		
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js">
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
			var emailexp=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			var nknameexp=/^[가-힣a-zA-Z][가-힣a-zA-Z0-9]+$/;
			var idexp = /^[a-zA-Z][a-zA-Z0-9]+$/;  
			var pwexp = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{8,50}$/;
			var register=register;

			function sendingaddr(addrnum,address){
				register.addrnum.value=addrnum;
				register.address.value=address;
				register.detailaddr.focus();
			}
			function AllcheckNotice(){
				Nknamecheck();
				Idcheck();
				Emailcheck();
				Passwdcheck();
				register.nkname.focus();
			}

			function Nknamecheck() {
				var checked=0;
				if (window.event.keyCode == 13) {
					Signupcross();
			    }
				if(register.nkname.value.length<3||register.nkname.value.length>16){
					document.getElementById('nknamecheck').innerHTML = "문자로 시작하고 공백과 특수문자 없이 3-16자";
					document.getElementById('nknameimg').innerHTML = "<img src='../img/tip2.png' height='30px' width='30px' align='middle'>";
				}else{
					if(nknameexp.test(register.nkname.value)==true){
						i=0;
						while(i<=arraylength){
							if(DBnkArray[i]==register.nkname.value){
								checked=1;
								document.getElementById('nknameimg').innerHTML="<img src='../img/no2.png' height='30px' width='30px' align='middle'>"
								document.getElementById('nknamecheck').innerHTML="중복된 닉네임 입니다"
							}
							i++
						}
						if(checked==0){
							document.getElementById('nknameimg').innerHTML="<img src='../img/yes2.png' height='30px' width='30px' align='middle'>";
							document.getElementById('nknamecheck').innerHTML="사용 가능한 닉네임 입니다";
						}
					}else{
						document.getElementById('nknamecheck').innerHTML = "문자로 시작하고 공백과 특수문자 없이 3자이상";
						document.getElementById('nknameimg').innerHTML = "<img src='../img/tip2.png' height='30px' width='30px' align='middle'>";
					}
					
				}
				if(register.nkname.value=='운영자바보'){
					document.getElementById('nknamecheck').innerHTML = "그런건 안대!";
					document.getElementById('nknameimg').innerHTML = "<img src='../img/angry.png' height='30px' width='30px' align='middle'>";
				}
				
				
			};

			function Idcheck() {
				var checked=0;
				if (window.event.keyCode == 13) {
					Signupcross();
			    }
				if(register.id.value.length<8){
					document.getElementById('idcheck').innerHTML = "문자로 시작하고 공백과 특수문자 없이 8자이상";
					document.getElementById('idimg').innerHTML = "<img src='../img/tip2.png' height='30px' width='30px' align='middle'>";
				}else{
					if(idexp.test(register.id.value)==true){
						i=0;
						while(i<=arraylength){
							if(DBidArray[i]==register.id.value){
								checked=1;
								document.getElementById('idcheck').innerHTML="중복된 아이디 입니다"
									document.getElementById('idimg').innerHTML="<img src='../img/no2.png' height='30px' width='30px' align='middle'>"
							}
							i++
						}
						if(checked==0){
							document.getElementById('idcheck').innerHTML="사용 가능한 아이디 입니다";
							document.getElementById('idimg').innerHTML="<img src='../img/yes2.png' height='30px' width='30px' align='middle'>";
						}
					}else{
						document.getElementById('idcheck').innerHTML="문자로 시작하고 공백과 특수문자 없이 8자이상";
						document.getElementById('idimg').innerHTML="<img src='../img/tip2.png' height='30px' width='30px' align='middle'>";
					}
				}
			};
			function Emailcheck() {
				var checked=0;
				if (window.event.keyCode == 13) {
					Signupcross();
			    }
				if(emailexp.test(register.email.value)==""){
					document.getElementById('emailcheck').innerHTML = "이메일 형식으로 작성해 주십시오.";
					document.getElementById('emailimg').innerHTML = "<img src='../img/tip2.png' height='30px' width='30px' align='middle'>";
				}else if(emailexp.test(register.email.value)==false){
					document.getElementById('emailcheck').innerHTML = "이메일 형식이 맞지 않습니다";
					document.getElementById('emailimg').innerHTML = "<img src='../img/no2.png' height='30px' width='30px' align='middle'>";
				}else{
					i=0;
					while(i<=arraylength){
						if(DBemailArray[i]==register.email.value){
							checked=1;
							document.getElementById('emailcheck').innerHTML="중복된 이메일 입니다"
								document.getElementById('emailimg').innerHTML="<img src='../img/no2.png' height='30px' width='30px' align='middle'>"
						}
						i++
					}
					if(checked==0){
						document.getElementById('emailcheck').innerHTML="사용 가능한 이메일 입니다";
						document.getElementById('emailimg').innerHTML="<img src='../img/yes2.png' height='30px' width='30px' align='middle'>";
					}
				}
			};

			function Passwdcheck() {
				if (window.event.keyCode == 13) {
					Signupcross();
			    }
				if(pwexp.test(register.passwd.value)==false){
					document.getElementById('passwdcheck').innerHTML = "8자 이상, 영문/특수문자/숫자가 하나 이상";
					document.getElementById('passwdimg').innerHTML = "<img src='../img/tip2.png' height='30px' width='30px' align='middle'>";
				}else{
					document.getElementById('passwdcheck').innerHTML="사용 가능한 비밀번호 입니다";
					document.getElementById('passwdimg').innerHTML="<img src='../img/yes2.png' height='30px' width='30px' align='middle'>";
				}
				Repasswdcheck();
			};

			function Repasswdcheck() {
				if (window.event.keyCode == 13) {
					Signupcross();
			    }
				if(register.repasswd.value==""){
					document.getElementById('repasswdcheck').innerHTML="비밀번호와 같아야 합니다";
					document.getElementById('repasswdimg').innerHTML="<img src='../img/tip2.png' height='30px' width='30px' align='middle'>";
				}else if(register.passwd.value==register.repasswd.value){
					document.getElementById('repasswdcheck').innerHTML="비밀번호가 같습니다";
					document.getElementById('repasswdimg').innerHTML="<img src='../img/yes2.png' height='30px' width='30px' align='middle'>";
				}else{
					document.getElementById('repasswdcheck').innerHTML="비밀번호가 다릅니다";
					document.getElementById('repasswdimg').innerHTML="<img src='../img/no2.png' height='30px' width='30px' align='middle'>";
					
				}
			};

			function ZipPopup() { 
				window.open("ZipFinder/ZipinputForm.jsp", "a", "width=400, height=300, left=100, top=50"); 
				register.detailaddr.focus();
			}
				
			function Signupcross(){	

					if(register.nkname.value==""||document.getElementById('nknamecheck').innerHTML!="사용 가능한 닉네임 입니다"){
						alert("닉네임을 확인해주세요");
						register.nkname.focus();
						return;
					}
					if(register.id.value==""||document.getElementById('idcheck').innerHTML!="사용 가능한 아이디 입니다"){
						alert("아이디를 확인해주세요");
						register.id.focus();
						return;
					}
					if(register.passwd.value==""||document.getElementById('passwdcheck').innerHTML!="사용 가능한 비밀번호 입니다"){
						alert("비밀번호를 입력해주세요");
						register.passwd.focus();
						return;
					}
					if(register.repasswd.value==""){
						alert("비밀번호확인을 입력해주세요");
						register.repasswd.focus();
						return;
					}
					if(register.passwd.value!=register.repasswd.value){
						alert("비밀번호가 다릅니다.");
						register.repasswd.focus();
						return;
					}
					if(register.email.value==""){
						alert("이메일을 입력해주세요.");
						register.email.focus();
						return;
					}
					else if(emailexp.test(register.email.value)==false){
						alert("이메일 형식이 올바르지 않습니다.");
						register.email.focus();
						return;
					}
					if(register.addrnum.value==""){
						alert("우편번호를 입력해주세요");
						register.addrnum.focus();
						return;
					}
					if(register.detailaddr.value==""){
						alert("상세주소를 입력해주세요");
						register.detailaddr.focus();
						return;
					}

					register.submit();
				
				
			}

			function Signupclear(){
				
				register.nkname.value="";
				register.id.value="";
				register.passwd.value="";
				register.repasswd.value="";
				register.email.value="";
				register.addrnum.value="";
				register.address.value="";
				register.detailaddr.value="";
			}
					
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

		
		
		<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
 <%@include file="../general_included/footer.jsp"%>

			</div>
	</body>
</html>
