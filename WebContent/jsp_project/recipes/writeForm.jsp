<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../css/common.css">
<style>





</style>

<title>글 쓰기</title>


<script type="text/javascript" src="script.js"></script>

</head>
<body>
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
<p>글쓰기</p>
<form method="post" name="writeform" 
	action="writePro.jsp" onsubmit="return writeSave()">
<input type="hidden" name="num" value="<%=num %>">
<input type="hidden" name="writerid" value="<%=idlogin %>">

<table>
	<tr>
		<td align="right" colspan="2">
		<a href="list.jsp">글목록</a>
		</td>
	</tr>
	<tr>
		<td width="100" align="center">제목</td>
		<td width="330" align="left">
		<input type="text" size="40" maxlength="50" name="title"
		 style="ime-mode:active;"></td>
	</tr>
	<tr>
		<td align="center">요리분류</td>
		<td align="left">
			<select name='contury'
				style="ime-mode:inactive;">
				<option value='' selected disabled hidden >-- 선택 --</option>
    			<option value='한식'>한식</option>
    			<option value='양식'>양식</option>
    			<option value='일식'>일식</option>
    			<option value='중식'>중식</option>
    			<option value='퓨전'>퓨전</option>
    			<option value='기타'>기타</option>
			</select>
			<select name='foodtype'
				style="ime-mode:inactive;">
				<option value='' selected disabled hidden>-- 선택 --</option>
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
		<td align="center">필요한 재료</td>
		<td align="left">
			<input type="text" size="40" maxlength="30" name="ingredients"
			style="ime-mode:inactive;"></td>
	</tr>
	<tr>
		<td align="center">사용되는 도구</td>
		<td align="left">
			<input type="text" size="40" maxlength="30" name="tools"
			style="ime-mode:inactive;"></td>
	</tr>
	<tr>
		<td align="center">내용</td>
		<td align="left">
			<textarea name="content" size="40" rows="13" cols="40"
			style="ime-mode:inactive;"></textarea></td>
	</tr>
	
	<tr>
		<td colspan=2 align="center">
			<input type="submit" value="글쓰기">
			<input type="reset" value="다시 작성">
			<input type="button" value="목록보기" OnClick="window.location='../recipes/list.jsp'">
		</td>
	</tr>
</table>
<%
	}catch(Exception e){}
%>
</form>
</div>



<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
<pre>
Create by FOODING
고객문의 1544-XXXX
JSP Project 2019 2A03</pre>
</div>

</body>
</html>
