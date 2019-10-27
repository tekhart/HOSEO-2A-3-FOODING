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

<link rel="stylesheet" href="../css/list.css">



<link rel="stylesheet" href="list.css">
<link rel="stylesheet" href="style.css">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">

<style>





</style>
<title>게시판, 글 보기</title>


	
	
<script type="text/javascript">
	function AnsUpdDelComment(num,content,ref,re_step,
			re_level,counter,selected){
		 var form=document.iregularcommentform;
		 var commentchangeform = document.getElementsByClassName("commentchangeform");
		 
		 form.num.value=num;
		 form.ref.value=ref;
		 form.re_step.value=re_step;
		 form.re_level.value=re_level;
		 form.selected.value=selected;
		 
		 for (i = 0; i < commentchangeform.length; i++) {
			 commentchangeform[i].innerHTML="";
         }
		 commentchangeform[counter].innerHTML="<textarea name='content' size='40' rows='5' cols='40' class='signupinput' style='ime-mode:inactive;'></textarea><input type='submit'  value='답글쓰기' class='bt2'>";

	}

</script>
</head>
<body id="body" onload="initComparisons()">
<%@include file="../general_included/topbar.jsp"%>

<div id="maindiv2">
<%
   try{
	   int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
	    foodingBean dbPro = foodingBean.getInstance();
     	BoardDataBean article =  dbPro.getcookhelpArticle(num);
		
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
	    count = dbPro.getcookhelpCommentArticleCount(num);
	    
	    if (count > 0) {
	        commentList = dbPro.getcookhelpCommentsArticles(startRow, commentpageSize,num);
	    }
	    
%> 

<table  class="contenttable" style="margin:auto;" >   
	<tr>
		<td width="500px" rowspan="2" height="100px" align="center" class="orangeline11"
			style="text-align:center;"><%=article.getTitle()%></td>
		<td width="100px" class="orangeline111" style="text-align:right;
			color:#e0e0e0; font-size:20px;"><%= sdf.format(article.getReg_date())%></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:right;
			color:#e0e0e0; font-size:20px;"><%=foodingbean.findnkname(article.getWriterid()) %></td>
	</tr>

		<tr	class="orangeline">
						<td colspan="2"	height="600px" >
							<table width="1150px"
									style="margin:auto;
									margin-top:15px;
									margin-bottom:15px;
									table-layout: fixed;
									word-wrap:break-word;
									border-collapse:collapse;">
								<tr>
									<td style="vertical-align:text-top;">
										<pre><%=article.getContent()%></pre>
									</td>
								</tr>
							</table>
						</td>
						
	</tr>
    <tr class="orangeline">
    	<td style="padding-left:10px;"> 조회수 : <%=article.getReadcount()%> </td>
		<td align="right" style="text-align:left;">일자
			<%
			    if(article.getWriterid().equals((String)session.getAttribute("idlogin"))){
	        %>
				<input type="button" value="글수정" 
				  		onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제" class="smallbt"
                            onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">	
		    <%
		    	} 
		    %>
       	</td>
    </tr>
    <tr	class="orangeline">
						<td colspan="2" height="400px">
						
							<div align="center" style="margin-bottom:15px;"></div>
							<div class="img-comp-container">
								<div class="img-comp-img">
									<div class="divdiv1"><%=article.getIngredients() %></div>
								</div>
								<div class="img-comp-img img-comp-overlay">
									<div class="divdiv2"> <%=article.getTools() %></div>
								</div>
							</div>
						#<%=article.getContury()%> #<%=article.getFoodtype()%>
					</td>
				</tr>
	<tr><td></td><!-- <td colspan="2">목록</td></tr>  -->
	
</table>

	<!--    &nbsp;&nbsp;&nbsp;&nbsp;
	   &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="button" value="글목록" 
       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'"> --> 
    </td>
  </tr>

</table>
	<br>
	<form method="post" name="commentform" action="commentspro.jsp">
	
		
			
		<table>	
			<tr>
				<td>
					
				</td>
				<td>
					
				</td>
			
			</tr>
		</table>
		<%if(session.getAttribute("idlogin")==null){ %>
			로그인을 하셔야 댓글을 쓸수 있습니다.
		<%}else{ %>
		
		
<%
			}
		}catch(Exception e){} 
 %>
</div>



<%@include file="../general_included/footer.jsp"%>
<script>

</script>
</body>
</html>