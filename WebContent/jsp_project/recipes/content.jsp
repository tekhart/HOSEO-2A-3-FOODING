<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DBBean.foodingBean" %>
<%@ page import = "DBBean.BoardDataBean" %>
<%@ page import = "DBBean.commentDataBean" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.List" %>
<%!
    int commentpageSize = 10;
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%		
			
		    
%>

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
   try{
	   int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
	    foodingBean dbPro = foodingBean.getInstance();
     	BoardDataBean article =  dbPro.getArticle(num);
		
		foodingBean foodingbean = new foodingBean();

	 	String commnetpageNum = request.getParameter("commnetpageNum");

	    if (commnetpageNum == null) {
	    	commnetpageNum = "1";
	    }
	    int currentPage = Integer.parseInt(commnetpageNum);
	    int startRow = (currentPage - 1) * commentpageSize + 1;
	    int endRow = currentPage * commentpageSize;
	    int count = 0;
	    List<commentDataBean> commentList = null;
	    count = dbPro.getCommentArticleCount(num);
	    
	    if (count > 0) {
	        commentList = dbPro.getCommentsArticles(startRow, commentpageSize,num);
	    }
	    
%>

<p>글내용 보기</p>

<form>
<table> 
<tr height="30">
    <td align="center" width="125" >글제목</td>
    <td align="center" width="375" align="center" colspan="3">
	     <%=article.getTitle()%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" >분류</td>
    <td align="center" width="125" align="center">
	     <%=article.getContury()%></td>
	<td align="center" width="125" align="center">
	     <%=article.getFoodtype()%></td>
	<td align="center" width="125" >조회수<%=article.getReadcount()%>회</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" >작성자</td>
    <td align="center" width="125" align="center">
	     <%=foodingbean.findnkname(article.getWriterid())%></td>
    <td align="center" width="125"  >작성일</td>
    <td align="center" width="125" align="center">
	     <%= sdf.format(article.getReg_date())%></td>
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

<p>댓글 수:<%=count%></p>
 <table>
	<form method="post" name="commentform" 
			action="commentspro.jsp" >
		<input type="hidden" name="num" value="<%=num %>">
		<input type="hidden" name="writerid" value="<%=idlogin %>">
		<input type="hidden" name="ref"  value="0">
		<input type="hidden" name="re_step"  value="0">
		<input type="hidden" name="re_level"  value="0">
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
		<% if (count == 0) { %>

		<tr>
		    <td align="center">
		              게시판에 저장된 글이 없습니다.
		    </td>
		</tr>

<% } else {%>
<%  
   for (int i = 0 ; i < commentList.size() ; i++) {
		commentDataBean comments = commentList.get(i);
%>
   <tr height="30">
    <td  width="250" align="left" rowspan="3">
    <%=comments.getNum()%>
	<%
		int wid=0; 
		if(comments.getRe_level()>0){
		   wid=5*(comments.getRe_level());
		}
	%>
		<div width="<%=wid%>" height="16">&nbsp;</div> 
	<%if(wid==0){%>
		ㄴ
	<%} %>
	
	</td>
    <td width="150"><%= sdf.format(article.getReg_date())%></td>
  </tr>

<%}}%>
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