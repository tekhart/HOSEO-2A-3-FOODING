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
<link rel="stylesheet" href="list.css">

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

<form>
<table class="contenttable" border="1"> 
<tr><td width="800px">글제목</td><td>작성자</td></tr>
<tr><td>날짜</td><td>조회수</td></tr>
<tr><td colspan="2" height="600px">내용</td></tr>
<tr><td>태그</td><td>수정/삭제</td></tr>
<tr><td></td><td>목록</td></tr>

				</table>

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


	<%if(session.getAttribute("idlogin")==null){ %>
		로그인을 하셔야 댓글을 쓸수 있습니다.
	<%}else{ %>
		 <table border="1">
			<form method="post" name="commentform" 
					action="commentspro.jsp" >
				<input type="hidden" name="num" value="<%=num %>">
				<input type="hidden" name="writerid" value="<%=idlogin %>">
				<input type="hidden" name="ref"  value="0">
				<input type="hidden" name="re_step"  value="0">
				<input type="hidden" name="re_level"  value="0">
				<tr>
					<td colspan="3" width="0">
						<textarea name="content" size="40" rows="5" cols="40" class="signupinput"
								style="ime-mode:normal;"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="3" width="150">
								<input type="submit"  value="댓글 쓰기">
					</td>
				</tr>
			</form>
		</table>
	<%} %>

	
<% if (count == 0) { %>

 <table border="1">
		<tr>
		    <td align="center">
		              게시판에 저장된 글이 없습니다.
		    </td>
		</tr>
</table>

<% } else {%>

<%  
	for (int i = 0 ; i < commentList.size() ; i++) {
		commentDataBean comments = commentList.get(i);

	int wid=0; 
	if(comments.getRe_level()>0){
	   wid=5*(comments.getRe_level());
	}

%>

<table border="1" margin-left="<%=wid%>">
	<tr height="30">
		<td width="380"><%=foodingbean.findnkname(comments.getWriterid())%></td>
	    <td width="400"><%= sdf.format(comments.getReg_date())%></td>
	</tr>
	<tr height="60">
		<td colspan="2">
			<%=comments.getContent()%>
		</td>
	</tr>
	<tr>
		<td align="right" colspan="2">
			<input type="button">
			<input type="button">
		</td>
	</tr>

 </table>
<%
				}

			}
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