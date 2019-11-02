<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBBean.foodingBean" %>
<%

	request.setCharacterEncoding("UTF-8");
	
	String zipcode="";
	
	
	try{
		if(zipcode==null){
			zipcode="";
		}
	}finally{}

	foodingBean foodingbean=new foodingBean();
	foodingBean dbPro = foodingBean.getInstance();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>프로필 사진/닉네임 변경</title>
		<link rel="stylesheet" href="../css/common.css">
		<link rel="stylesheet" href="../css/list.css">
		<link rel="shortcut icon" href="../img/favicon.ico">
		<link rel="icon" href="../img/favicon.ico">
		<link rel=stylesheet type=text/css
			href="../../daumeditor/css/editor.css" charset=utf-8 />
		<script type="text/javascript">
		var emailexp=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var DBemailArray=[];
		var i=0;
		<% 
		
			ResultSet rs=foodingbean.resultQuery("select email from user");
			int i=0;
			try{
				while(rs.next()){
						
					String emailArray = rs.getString("email");	
					%>
					DBemailArray[<%=i%>]="<%=emailArray%>";
					<%
					i++;
				}

			}catch(Exception e){
				
			}finally{}
			foodingbean.DBclose();
		%>
		var arraylength=<%=i %>
		function Emailcheck() {
			var checked=0;
			if (window.event.keyCode == 13) {
				Signupcross();
		    }
			if(emailexp.test(document.getElementById("inputemail").value)==""){
				document.getElementById('emailcheck').innerHTML = "이메일 형식으로 작성해 주십시오.";
				document.getElementById('emailimg').innerHTML = "<img src='../img/tip2.png' height='30px' width='30px' align='middle'>";
			}else if(emailexp.test(document.getElementById("inputemail").value)==false){
				document.getElementById('emailcheck').innerHTML = "이메일 형식이 맞지 않습니다";
				document.getElementById('emailimg').innerHTML = "<img src='../img/no2.png' height='30px' width='30px' align='middle'>";
			}else{
				i=0;
				while(i<=arraylength){
					if(DBemailArray[i]==document.getElementById("inputemail").value){
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
		function ZipPopup() { 
			window.open("ZipFinder/ZipinputForm.jsp", "a", "width=400, height=300, left=100, top=50"); 
			document.getElementById("inputdetailaddr").focus();
		}
		function sendingaddr(addrnum,address){
			document.getElementById("inputaddrnum").value=addrnum;
			document.getElementById("inputaddress").value=address;
			document.getElementById("inputdetailaddr").focus();
		}
		</script>
	</head>
	<body>
		<%@include file="../general_included/topbar.jsp"%>
		<%
			userDataBean article = null; 
			
			article=dbPro.getuserArticle(idlogin);
			
			String nk=article.getNkname();
			String id=article.getId();
			String pw=article.getPasswd();
			String email=article.getEmail();
			String addr=article.getAddrnum();
			String addre=article.getAddress();
			String daddr=article.getDetailaddr();
			String returnStr="";
			for(int j=0; j<pw.length();j++){
			   	if(j<3)returnStr=returnStr+pw.substring(j,j+1);
					else returnStr=returnStr+"*";
			   	}
		%>
		<div id="maindiv">
			<div class="writetitle1">프로필 이메일/주소 변경</div>
			<%@include file="sidemenu.jsp"%>
			<form method="post" action="EmailAndZipUpdatePro.jsp" >
				<fieldset style="margin:auto;">
					<legend>프로필</legend>
					<input type="hidden" name="id" value="<%=idlogin %>">
					
					<table width="80%" height="250px" style="font-size:25px; text-align:center;">
						<tr>
							<td colspan="2">다른 사람들에게 보여지는 정보입니다<br>&nbsp;</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2">
								<input class="signupinputs" type="text" name="email" id="inputemail" size="40" onkeyup="Emailcheck();"><br>
								
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
							<td></td>
						</tr>
						<tr>
							<td colspan="2">
								<input class="addrnuminputs" type="text" name="addrnum" id="inputaddrnum" onclick="ZipPopup();" onfocus="ZipPopup()" readonly>
								<input class="addressinputs" type="text" name="address" id="inputaddress" onclick="ZipPopup();" onfocus="ZipPopup()" readonly>
							</td>
						</tr>
						<tr><td></td><td>&nbsp;</td></tr>
						<tr>
							<td>주소</td>
						</tr>
						<tr>
							<td colspan="2">
								<input class="signupinputs" type="text" name="detailaddr" id="inputdetailaddr" size="40">
							</td>
						</tr>
					</table>
					<input type="submit" value="수정" class="findbutton">
				</fieldset>
			</form>
			
		</div>
	</body>
</html>
