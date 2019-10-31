  
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>
<%@page import="DBBean.userDataBean" %>
<%@ page import = "java.util.List" %>

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
개인정보 관리</div>

	<%@include file="sidemenu.jsp"%>

	<center>

	
	
	
			<%	
	    		foodingBean dbPro = foodingBean.getInstance();
				userDataBean articleList = null; 
				
	    		articleList=dbPro.getuserArticle(idlogin);
	    		
				String nk=articleList.getNkname();
				String id=articleList.getId();
				String pw=articleList.getPasswd();
				String email=articleList.getEmail();
				String addr=articleList.getAddrnum();
				String addre=articleList.getAddress();
				String daddr=articleList.getDetailaddr();
				int mile=articleList.getMileage();
				
				   String returnStr="";
				   for(int i=0; i<pw.length();i++){
				   if(i<3)returnStr=returnStr+pw.substring(i,i+1);
				   else returnStr=returnStr+"*";
				   }
			
			%>
			<br>
			
			<fieldset>
			<legend>프로필</legend>
			<table width="80%" height="250px" style="font-size:25px; text-align:center;"><tr>
			<td colspan="2">다른 사람들에게 보여지는 정보입니다<br>&nbsp</td></tr><tr>			
			<td width="50%"><div style="width:200px; height:200px; border-radius:50%; border:3px solid orange; background-image:url(../img/userface/default_face.png); background-size:cover; background-position:center;"/></td><td><b>닉네임 </b><%=nk %></td></tr>
			</table>
			<input type="button" value="수정" class="findbutton">
			</fieldset>
			
			<br><br><br>
			
			<fieldset>
			<legend>내 계정</legend>
			<table width="80%" height="250px" style="font-size:25px; text-align:center;"><tr>
			<td width="50%"><b>아이디</b></td><td style="text-align:left;"><%=id %></td></tr><tr>
			<td><b>비밀번호</b></td><td style="text-align:left;"><%=returnStr %></td></tr></table>
			<input type="button" value="수정" class="findbutton">
			</fieldset>
			
			<br><br><br> 
			
			<fieldset>
			<legend>주소 및 배송지</legend>
			<table width="80%"  height="250px" style="font-size:25px; text-align:center;"><tr>
			<td width="30%"><b>이메일</b></td><td style="text-align:left;"><%=email %></td></tr><tr>
			<td><b>주소</b></td><td style="text-align:left;"><%=addre %><%=daddr %></td></tr></table>
			<input type="button" value="수정" class="findbutton">
			</fieldset>
		
		<br><br><br>
	
		
		</form>
	
	</center>
	
</div> 
<br><br><br>



<%@include file="../general_included/footer.jsp"%>

</body>
</html>