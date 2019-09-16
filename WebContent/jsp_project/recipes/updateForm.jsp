<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="DBBean.foodingBean" %>
    <%@ page import="DBBean.BoardDataBean" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../css/common.css">
<style>
</style>

<title>Sign in</title>

<script type="text/javascript">
</script>

</head>
<body>
<%@include file="../general_included/topbar.jsp"%>

<div id="maindiv">
<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  int conturyselected=0;
  int foodtypeselected=0;
	try{
		foodingBean dbPro = foodingBean.getInstance(); 
		BoardDataBean article =  dbPro.updateGetArticle(num);
		if(article.getContury().equals("한식")){
			conturyselected=1;
		}else if(article.getContury().equals("양식")){
			conturyselected=2;
		}else if(article.getContury().equals("일식")){
			conturyselected=3;
		}else if(article.getContury().equals("중식")){
			conturyselected=4;
		}else if(article.getContury().equals("퓨전")){
			conturyselected=5;
		}else if(article.getContury().equals("기타")){
			conturyselected=6;
		}
		
		if(article.getFoodtype().equals("밥류")){
			conturyselected=1;
		}else if(article.getFoodtype().equals("빵류")){
			conturyselected=2;
		}else if(article.getFoodtype().equals("반찬류")){
			conturyselected=3;
		}else if(article.getFoodtype().equals("면류")){
			conturyselected=4;
		}else if(article.getFoodtype().equals("국류")){
			conturyselected=5;
		}else if(article.getFoodtype().equals("디저트")){
			conturyselected=6;
		}else if(article.getFoodtype().equals("기타")){
			conturyselected=7;
		}
%>

<p>글수정</p>
<br>
<form method="post" name="writeform" 
action="updatePro.jsp?pageNum=<%=pageNum%>" onsubmit="return writeSave()">
<input type="hidden" name="num" value="<%= num%>">

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
		 style="ime-mode:active;" value=" <%= article.getTitle()%>"></td>
	</tr>
	<tr>
		<td align="center">요리분류</td>
		<td align="left">
			<select name='contury'
				style="ime-mode:inactive;">
    			<option value='한식'
    			<%if(conturyselected==1){
    				%>selected<%}%>
    				>한식</option>
    			<option value='양식'
    			<%if(conturyselected==2){
    				%>selected<%}%>
    				>양식</option>
    			<option value='일식'
    			<%if(conturyselected==3){
    				%>selected<%}%>
    				>일식</option>
    			<option value='중식'
    			<%if(conturyselected==4){
    				%>selected<%}%>
    				>중식</option>
    			<option value='퓨전'
    			<%if(conturyselected==5){
    				%>selected<%}%>
    				>퓨전</option>
    			<option value='기타'
    			<%if(conturyselected==6){
    				%>selected<%}%>
    				>기타</option>
			</select>
			<select name='foodtype'
				style="ime-mode:inactive;">
    			<option value='밥류'
    			<%if(foodtypeselected==1){
    				%>selected<%}%>
    				>밥류</option>
    			<option value='빵류'
    			<%if(foodtypeselected==2){
    				%>selected<%}%>
    				>빵류</option>
    			<option value='반찬류'
    			<%if(foodtypeselected==3){
    				%>selected<%}%>
    				>반찬류</option>
    			<option value='면류'
    			<%if(foodtypeselected==4){
    				%>selected<%}%>
    				>면류</option>
    			<option value='국류'
    			<%if(foodtypeselected==5){
    				%>selected<%}%>
    				>국류</option>
    			<option value='디저트'
    			<%if(foodtypeselected==6){
    				%>selected<%}%>
    				>디저트</option>
    			<option value='기타'
    			<%if(foodtypeselected==7){
    				%>selected<%}%>
    				>기타</option>
			</select>
		</td>
	</tr>
	<tr>
		<td align="center">필요한 재료</td>
		<td align="left">
			<input type="text" size="40" maxlength="30" name="ingredients"
			style="ime-mode:inactive;" value=" <%= article.getIngredients()%>"></td>
	</tr>
	<tr>
		<td align="center">사용되는 도구</td>
		<td align="left">
			<input type="text" size="40" maxlength="30" name="tools"
			style="ime-mode:inactive;" value=" <%= article.getTools()%>"></td>
	</tr>
	<tr>
		<td align="center">내용</td>
		<td align="left">
			<textarea name="content" size="40" rows="13" cols="40"
			style="ime-mode:inactive;"><%= article.getContent()%></textarea></td>
	</tr>
	<tr>
   <td colspan=2  align="center"> 
     <input type="submit" value="글수정" >  
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" 
       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
   </td>
 </tr>
 </table>
</form>
<%
}catch(Exception e){}%>      
      
</div>



<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
<pre>
Create by FOODING
고객문의 1544-XXXX
JSP Project 2019 2A03</pre>
</div>

</body>
</html>