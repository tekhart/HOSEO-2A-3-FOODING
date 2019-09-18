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

<p>글내용 보기</p>

<form>
<table>  
  <tr height="30">
    <td align="center" width="125" >조회수</td>
    <td align="center" width="125" align="center">
	     <%=article.getReadcount()%></td>
	<td align="center" width="125" >조회수</td>
    <td align="center" width="125" align="center">
	     <%=article.getReadcount()%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" >작성자</td>
    <td align="center" width="125" align="center">
	     <%=foodingbean.findnkname(article.getWriterid())%></td>
    <td align="center" width="125"  >작성일</td>
    <td align="center" width="125" align="center">
	     <%= sdf.format(article.getReg_date())%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" >글제목</td>
    <td align="center" width="375" align="center" colspan="3">
	     <%=article.getTitle()%></td>
  </tr>
  <tr>
    <td align="center" width="125" >글내용</td>
    <td align="left" width="375" colspan="3">
           <pre><%=article.getContent()%></pre></td>
  </tr>
  <tr height="30">      
    <td colspan="4"  align="right" > 
    <%
    if(article.getWriterid().equals((String)session.getAttribute("idlogin"))){
        %>
        	<input type="button" value="글수정" 
           		onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
    	   		&nbsp;&nbsp;&nbsp;&nbsp;
    	  <input type="button" value="글삭제" 
           		onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
        <%
        }
        %>
	  
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="button" value="글목록" 
       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
    </td>
  </tr>
</table>
</form>      

 <table>
	<form method="post" name="commentform" 
			action="commentspro.jsp" >
	<input type="hidden" name="num" value="<%=num %>">
	<input type="hidden" name="writerid" value="<%=idlogin %>">
	  <tr>
 		<td>
		 <textarea name="content" size="40" rows="5" cols="40" class="signupinput"
					style="ime-mode:inactive;"></textarea>
		</td>
	  </tr>
	  <tr>
	  	<td>
					<input type="submit"  value="댓글 쓰기">
		</td>
		</tr>
		 </form>
		 
 </table>
 <%
 }catch(Exception e){} 
 %>
</div>



<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
<pre>
Create by FOODING
고객문의 1544-XXXX
JSP Project 2019 2A03</pre>
</div>

</body>
</html>