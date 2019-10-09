

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
        new SimpleDateFormat("yyyy-MM-dd");
%>

<%
	request.setCharacterEncoding("UTF-8");
    String pageNum = request.getParameter("pageNum");
	String search=request.getParameter("search");
	String searchtype=request.getParameter("searchtype");
	int fame=0;
	if(request.getParameter("fame")!=null){
		fame=Integer.parseInt(request.getParameter("fame"));
	}else{
		fame=0;
	}

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
    	count = dbPro.getArticleCount(fame);
	}else{
		count = dbPro.getArticleCount(searchtype,search,fame);
	}
    
    
    
    if (count > 0) {
    	if(search==null){
            articleList = dbPro.getArticles(startRow, pageSize,fame);
    	}else{
            articleList = dbPro.getArticles(startRow, pageSize, searchtype,search,fame);
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
<%if (fame==1){ %>
<title>인기 레시피, FOODING</title>
<%}else{ %>
<title>전체 레시피, FOODING</title>
<%}%>
<script type="text/javascript">

</script>

</head>
<body id="body">
<%@include file="../general_included/topbar.jsp"%>
     

<div id="maindiv">
<div class="writetitle1">
	<%if (fame==1){ %>
		인기 레시피
	<%}else{ %>
		전체 레시피
	<%}%>
	(<%=count %>)
</div>
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
        검색결과가 없습니다.<br>
         다른 걸 검색해 보세요! <br>
              <img src="../img/ding.png" height="335px" width="559px">
    </td>
</table>
<% } else {%>

<br>



<%  
   for (int i = 0 ; i < articleList.size(); i++) {
	   BoardDataBean article = articleList.get(i);
	   String writerid=article.getWriterid();
%>

<div class="card1" style=" cursor: pointer;" onclick="location.href='content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>&fame=<%=fame%>';">
<table width="100%"><tr><td  style="text-align:left;">
<%= sdf.format(article.getReg_date())%></td><td style="text-align:right;">#<%=article.getContury()%> #<%=article.getFoodtype()%></td></tr></table>
<br>
<img src="../img/cereal-563796_420.jpg" style="width:100%"> 
<br><br>
<table><tr><td  class="titlelong">
          
        	<% if(article.getReadcount()>=50){%>
     		 <img src="../img/fire1.png" width="20px" height="25px" align="middle">
			<%}%>
	 <%=article.getTitle()%></td></tr></table>
	<br><br>
<table width="100%"><tr><td class="writerlong" style="text-align:left;">
       	<%=foodingbean.findnkname(writerid)%></td><td style="align:right;"><%=article.getReadcount()%>view</tr></table></table></p>
<p></p>
<p></p>
</div>



	<%

   }%>

<%}%>



</div> 
<center>


<%
    if (count > pageSize) {
        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage =1;
		
		if(currentPage % 10 != 0)
           startPage = (int)(currentPage/10)*10 + 1;
		else
           startPage = ((int)(currentPage/10)-1)*10 + 1;

		int pageBlock = 10;
        int endPage = startPage + pageBlock - 1;
        if (endPage > pageCount) endPage = pageCount;
        
        %>
          	<a href="list.jsp?pageNum=<%= startPage - 1 %>&fame=<%=fame%>"><img src="../img/ff.png" width="23px" height="24px" align="middle"></a>
		<%
        
        for (int i = startPage ; i <= endPage ; i++) {
        	if(currentPage==i){
        		%>
        			<a href="list.jsp?pageNum=<%= i %>&fame=<%=fame%>"><img src="../img/redoo.png" width="23px" height="24px" align="middle"></a>
        		<%
        	}else{
        		%>
           			<a href="list.jsp?pageNum=<%= i %>&fame=<%=fame%>"><img src="../img/yeloo.png" width="23px" height="24px" align="middle"></a>
				<%
			}
       }
		
        %>
        	<a href="list.jsp?pageNum=<%= startPage + 1 %>&fame=<%=fame%>"><img src="../img/dd.png" width="23px" height="24px" align="middle">
        	<img src="../img/ii.png" width="20px" height="24px" align="middle">
        	<img src="../img/nn.png" width="23px" height="24px" align="middle">
        	<img src="../img/gg.png" width="23px" height="24px" align="middle"></a>
		<%

 }
%>


</center>

</body>
</html>