<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="DBBean.foodingBean" %>
    <%@ page import="DBBean.announceDataBean" %>
	<%@ page import = "java.text.SimpleDateFormat" %>
	<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="style.css">

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
		announceDataBean article =  dbPro.updateannounceGetArticle(num);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    Calendar cal=Calendar.getInstance();
	    cal.setTime(article.getReg_date());
	    cal.add(Calendar.DATE,article.getPeriode());
%>
<div class="writetitle">
		글수정
</div>

<div id="space">


<form method="post" name="writeform" 
action="updatePro.jsp?pageNum=<%=pageNum%>" onsubmit="return writeSave()">
<input type="hidden" name="num" value="<%= num%>">

<table id="writetable" align="center" border-spacing="10px">
	<tr>
		<td align="right" colspan="2" >
		
		</td>
	</tr>
	<tr>
		<td width="180" align="center" id="writespace">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
		<td width="330" align="left">
		<input type="text" size="40" maxlength="50" name="title" class="signupinput"
		 style="ime-mode:active;" value=" <%= article.getTitle()%>"></td>
	</tr>
	<tr>
		<td width="180" align="center" id="writespace">효용&nbsp;&nbsp;&nbsp;&nbsp;시간</td>
		<td width="330" align="left">
		<input type="text" size="40" maxlength="50" name="periode" class="signupinput"
		 style="ime-mode:active;" value=" <%= article.getTitle()%>"></td>
	</tr>
	
	<tr><td></td>
   <td align="left">  
     <input type="submit" value="확인" id="button123">  
     <input type="reset" value="다시작성" id="button123">
     <input type="button" value="글목록" id="button123"
       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
   </td>
 </tr>
 </table>

<%
}catch(Exception e){}%>      
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