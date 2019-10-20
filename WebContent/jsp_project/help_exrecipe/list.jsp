<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DBBean.foodingBean" %>
<%@ page import = "DBBean.BoardDataBean" %>
<%@ page import = "DBBean.commentDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="color.jsp"%>

<%!
    int pageSize = 10;
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
	request.setCharacterEncoding("UTF-8");
    String pageNum = request.getParameter("pageNum");
	String search=request.getParameter("search");

    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number = 0;
  
    List<BoardDataBean> articleList = null; 
    
    foodingBean dbPro = foodingBean.getInstance();
    foodingBean foodingbean = new foodingBean();
    if(search==null){
    	count = dbPro.getexrecipeArticleCount();
	}else{
		count = dbPro.getexrecipeArticleCount(search);
	}
    
    
    
    if (count > 0) {
    	if(search==null){
            articleList = dbPro.getexrecipeArticles(startRow, pageSize);
    	}else{
            articleList = dbPro.getexrecipeArticles(startRow, pageSize, search);
    	}
    }
	
  
	number = count-(currentPage-1)*pageSize;
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="list.css">

<style>





</style>

<title>전체 레시피, FOODING</title>

<script type="text/javascript">

</script>

</head>
<body>
<%@include file="../general_included/topbar.jsp"%>

<div id="maindiv">


     

<% if (count == 0) { %>

<table align="right"><tr><td>
  <a href="list.jsp">목록</a></td><td>
  <a href="writeForm.jsp">글쓰기</a></td></tr></table>
  <br><br><br>
  
<table align="center" class="nogul">
<tr>
    <td align="center">
              게시판에 저장된 글이 없습니다<br>
              첫 글을 남겨보세요! <br>
              <img src="../img/ding.png" height="335px" width="559px">
    </td>
</table>
<% } else {%>



<table class="listtop"><tr><td>

<font class="writetitle">
전체 레시피(<%=count %>)</font>


</td><td>
<table class="searchtable"><tr><td class="searchtd">


  			<form method="post" action="list.jsp" class="searh">
			<input type="text" name="search" class="searchbar">	
</td><td class="searchbttd" width="50px">
			<input type="submit" value="검색" class="searchbotton">
			</form>
	
	
	
</td></tr></table>
</td><td><table align="right"><tr><td>

<input type="button" onclick="location.href='list.jsp'" value="목록" class="bt">
<input type="button" onclick="location.href='writeForm.jsp'" value="글쓰기" class="bt">
  </td></tr></table></td></tr></table>








<table class="listtable"> 
    <tr height="50"> 
	  <td align="center"  width="50" class="listcolor">번호</td>
      <td align="center"  width="350" class="listcolor">제목</td> 
      <td align="center"  width="100" class="listcolor">작성자</td>
      <td align="center"  width="150" class="listcolor">등록일</td> 
      <td align="center"  width="50" class="listcolor">조회</td> 
      <td align="center"  width="50" class="listcolor">댓글수</td> 
    </tr>
<%  
   for (int i = 0 ; i < articleList.size(); i++) {
	   BoardDataBean article = articleList.get(i);
	   String writerid=article.getWriterid();
%>
   <tr class="mouse">
   <td align="center" class="line">
   <%=article.getNum()%>
   </td>
    <td align="left" class="line">       
      <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>" class="titlelong">
      
          [<%=article.getContury()%>/<%=article.getFoodtype()%>]
        	<% if(article.getReadcount()>=20){%>
     		 <font color="red">HOT</font>
			<%}%>
	 <%=article.getTitle()%></a>  </td>
    <td align="center" class="line"> 
     	<a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>" class="writerlong">
       	<%=foodingbean.findnkname(writerid)%></a>
    </td>
    <td align="center" width="150" class="line"><%= sdf.format(article.getReg_date())%></td>
    <td align="center" width="50" class="line"><%=article.getReadcount()%></td>
    <td align="center" width="50" class="line"><%=dbPro.getexrecipeCommentArticleCount(article.getNum())%></td>
	
  </tr>
<%}%>
</table>
<%}%>

<center>

<%
    if (count > 0) {
        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage =1;
		
		if(currentPage % 10 != 0)
           startPage = (int)(currentPage/10)*10 + 1;
		else
           startPage = ((int)(currentPage/10)-1)*10 + 1;

		int pageBlock = 10;
        int endPage = startPage + pageBlock - 1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) { %>
          <a href="list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        
        for (int i = startPage ; i <= endPage ; i++) {  %>
           <a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%      }
        
        if (endPage < pageCount) {  %>
        <a href="list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
        }
    }
%>

  </center>


</div>

<br>
<br><br><br><br><br><br><br><br><br><br><br>

		<%@include file="../general_included/footer.jsp"%>


</body>
</html>