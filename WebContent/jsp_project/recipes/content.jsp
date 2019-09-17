<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DBBean.foodingBean" %>
<%@ page import = "DBBean.BoardDataBean" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="style.css">

<style>





</style>
<title>게시판</title>

<script type="text/javascript">

</script>

</head>
<body>
<%@include file="../general_included/topbar.jsp"%>

<div id="maindiv">
<%
	int num = Integer.parseInt(request.getParameter("num"));
   String pageNum = request.getParameter("pageNum");

   SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
   foodingBean foodingbean = new foodingBean();

   try{
	   foodingBean dbPro = foodingBean.getInstance(); 
      BoardDataBean article =  dbPro.getArticle(num);
%>
<div class="writetitle">전체레시피
</div>

<form>
<center>
<table id="contenttable" >
  <tr height="30" >
    <td class="contentline2" align="left" width="725px" colspan="4">[<%=article.getContury()%>/<%=article.getFoodtype()%>]&nbsp;<%=article.getTitle()%></td>
  </tr>
  
    
 
  <tr>
  <td align="center" width="125px" id="extraline"><%=foodingbean.findnkname(article.getWriterid())%></td>
    <td align="center" width="750px" height="50px" align="center" id="extraline"></td>
	<td align="center" width="200px" id="extraline"> <%= sdf.format(article.getReg_date())%></td>
    <td align="center" width="150px" id="extraline"> 조회수 : <%=article.getReadcount()%></td>
  </tr>
  <tr height="30">
    
    <td align="center" width="125" >필요한재료</td>
    <td align="center" width="125" height="60" colspan="3" ><%=article.getIngredients()%></td>
  </tr>
  
  <tr>
  	<td align="center" width="125" >사용되는 도구</td>
    <td align="center" width="125" height="30" colspan="3"><%=article.getTools()%></td>
  </tr>
 
  <tr>
    <td align="center" width="125" colspan="4"></td>
  </tr>
  <tr>
    <td  align="left" width="375" height="300" colspan="4">
           <pre><%=article.getContent()%></pre></td>
  </tr>
  <tr height="30">      
    <td colspan="4"  align="right" class="contentline2"> 
    <%
    if(article.getWriterid().equals((String)session.getAttribute("idlogin"))){
        %>
        	<input type="button" value="글수정" id="button123"
           		onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
    	   		&nbsp;&nbsp;&nbsp;&nbsp;
    	  <input type="button" value="글삭제" id="button123"
           		onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
        <%
        }
        %>
	  
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="button" value="글목록" id="button123"
       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
    </td>
  </tr>
</table>
</center>
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