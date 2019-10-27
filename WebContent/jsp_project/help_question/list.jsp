<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DBBean.foodingBean" %>
<%@ page import = "DBBean.QuestionDataBean" %>
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
  
    List<QuestionDataBean> articleList = null; 
    
    foodingBean dbPro = foodingBean.getInstance();
    foodingBean foodingbean = new foodingBean();
    if(search==null){
    	count = dbPro.getquestionArticleCount();
	}else{
		count = dbPro.getquestionArticleCount(search);
	}
    
    
    
    if (count > 0) {
    	if(search==null){
            articleList = dbPro.getquestionArticles(startRow, pageSize);
    	}else{
            articleList = dbPro.getquestionArticles(startRow, pageSize, search);
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
<link rel="stylesheet" href="../css/list.css">

<style>

</style>

<title>도와줘요!, FOODING</title>

<script type="text/javascript">

</script>

</head>
<body id="body">
<%@include file="../general_included/topbar.jsp"%>
  
<center>
			<table class="listtop">
				<tr>
					<td>
						
	
					</td>
					<td>
						<table class="searchtable">
							<form method="post" action="list.jsp" class="searh">
								<tr>
									<td style="padding-left:280px;">
										<select name='searchtype' style="ime-mode:inactive; padding: .7em .5em; 
										border-radius: 5px 5px 5px 5px; border-color:#ffbb00; font-size:14pt;
										font-family:Bauhaus ITC; height:50px;" >
											<option value='제목' selected>제목</option>
											<option value='글쓴이'>글쓴이</option>
											<option value='재료'>재료</option>
											<option value='도구'>도구</option>
										</select>
									</td>
									<td class="searchtd">
										<input type="text" name="search" class="searchbar">	
									</td>
									<td class="searchbttd" width="50px">
											<input type="submit" value="검색" class="searchbotton">
									</td>
								</tr>
							</form>
						</table>
					</td>
					<td style="padding-left:190px;">
						<table align="right">
							<tr>
								<td>
									<input type="button" onclick="location.href='list.jsp'" value="목록" class="bt">
								</td>
								<td>
									<input type="button" onclick="location.href='writeForm.jsp'" value="글쓰기" class="bt">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</center>
<% if (count == 0) { %>
  
<table align="center" class="nogul">
<tr>
    <td align="center">
              게시판에 저장된 글이 없습니다<br>
              첫 글을 남겨보세요! <br>
              <img src="../img/ding.png" height="335px" width="559px">
    </td>
</table>
<% } else {%>
<div id="maindiv">

<div class="writetitle1">
전체 질문 게시글(<%=count %>)</div>


<br>


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
	   QuestionDataBean article = articleList.get(i);
	   String writerid=article.getWriterid();
%>
   <tr class="mouse">
   <td align="center" class="line">
   
   <%=article.getNum()%>
   </td>
    <td align="left" class="line">       
      <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>" class="titlelong">
      
        	<% if(article.getReadcount()>=20){%>
     		 <font color="red">HOT</font>
			<%}%>
			
			<%if(article.getRe_level()>0){%>
					ㄴ [답글]	<%} %>
	 <%=article.getTitle()%></a>  </td>
    <td align="center" class="line"> 
     	<a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>" class="writerlong">
       	<%=foodingbean.findnkname(writerid)%></a>
    </td>
    <td align="center" width="150" class="line"><%= sdf.format(article.getReg_date())%></td>
    <td align="center" width="50" class="line"><%=article.getReadcount()%></td>
    <td align="center" width="50" class="line"><%=dbPro.getquestionCommentArticleCount(article.getNum())%></td>
	
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
<br>
		<%@include file="../general_included/footer.jsp"%>


</body>
</html>