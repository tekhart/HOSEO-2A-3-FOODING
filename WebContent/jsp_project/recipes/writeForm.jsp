<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet" href="../css/common.css">
<style>
	

	#maindiv{	font-family:"Bauhaus ITC";
		font-size:22px;
		color:black;
		border-top:5px solid #ffbb00;
		
		}	
	.writetitle {
		margin-left:140px;
		padding:30px;	
		font-size:25px;
		}
	#writetable{
		margin:auto;
		padding:40px;

		
		}
	#space{
		width:100%;
		height:100%;
		background-color:#F2F2F2;
	}
	#writespace{
		padding:20px;
	}
	.signupinput{
		width:750px;
		padding: 15px;
		display: inline-block;
		border-color:black;
		background: white;
		border-style:solid;
		border-width: thin; 
		border-radius: 3px;
	}
	
	#button123{
		font-family:"Bauhaus ITC";
		font-size:22px;
		width:10%;
		padding: 15px;
		display: inline-block;
		border-color:black;
		background: white;
		border-style:solid;
		border-width: thin; 
		border-radius: 3px;
		margin-bottom:35px;
	}

</style>


<script type="text/javascript" src="script.js"></script>

</head>
<body id="writebody">
<%@include file="../general_included/topbar.jsp"%>

<div id="maindiv">
<%
	int num = 0;
	String strV="";
	try{
		if(request.getParameter("num")!=null){
			num=Integer.parseInt(request.getParameter("num"));
		}
		if(session.getAttribute("idlogin")==null){
			out.println("<script>alert('로그인을 먼저 하셔야합니다.');</script>");
			response.sendRedirect("../mains/main.jsp");
		}
		idlogin=(String)session.getAttribute("idlogin");
%>
<div class="writetitle">
	레시피 작성
</div>

<div id="space">



<form method="post" name="writeform" 
	action="writePro.jsp" onsubmit="return writeSave()">
<input type="hidden" name="num" value="<%=num %>">
<input type="hidden" name="writerid" value="<%=idlogin %>">
<center>
<table id="writetable" align="center" border-spacing="10px">
	<tr>
		<td align="right" colspan="2">
		
		</td>
	</tr>
	<tr>
		<td width="180" align="center" id="writespace">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
		<td width="330" align="left">
		<input type="text" size="40" maxlength="50" name="title" class="signupinput"
		 style="ime-mode:active;"></td>
	</tr>
	<tr>
		<td align="center" id="writespace">요리&nbsp;&nbsp;분류</td>
		<td align="left">
			<select name='contury'
				style="ime-mode:inactive;">
				<option value='' selected>-- 선택 --</option>
    			<option value='한식'>한식</option>
    			<option value='양식'>양식</option>
    			<option value='일식'>일식</option>
    			<option value='중식'>중식</option>
    			<option value='퓨전'>퓨전</option>
    			<option value='기타'>기타</option>
			</select>
			<select name='foodtype'
				style="ime-mode:inactive;">
				<option value='' selected>-- 선택 --</option>
    			<option value='밥류'>밥류</option>
    			<option value='빵류'>빵류</option>
    			<option value='반찬류'>반찬류</option>
    			<option value='면류'>면류</option>
    			<option value='국류'>국류</option>
    			<option value='디저트'>디저트</option>
    			<option value='기타'>기타</option>
			</select>
		</td>
	</tr>
	<tr>
		<td align="center" id="writespace">필요한 재료</td>
		<td align="left">
			<input type="text" size="40" maxlength="30" name="ingredients" class="signupinput"
			style="ime-mode:inactive;"></td>
	</tr>
	<tr>
		<td align="center" id="writespace">사용되는 도구</td>
		<td align="left">
			<input type="text" size="40" maxlength="30" name="tools" class="signupinput"
			style="ime-mode:inactive;"></td>
	</tr>
	<tr>
		<td align="center" id="writespace">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
		<td align="left">
			<textarea name="content" size="40" rows="30" cols="40" class="signupinput"
			style="ime-mode:inactive;"></textarea></td>
	</tr>
	
</table>
	
	<tr>
		<td colspan=2 align="center" >
			<input type="submit" id="button123" value="확인">
			<input type="reset" id="button123" value="다시 작성">
			<input type="button" id="button123" value="글목록" OnClick="window.location='../recipes/list.jsp'">
		</td>
	</tr>
	

</center>
<%
	}catch(Exception e){}
%>
</form>
</div>
</div>


<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
<pre>
Create by FOODING
고객문의 1544-XXXX
JSP Project 2019 2A03</pre>
</div>

</body>
</html>
