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
<link rel="stylesheet" href="style.css">

<style>





</style>
<title>게시판</title>

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
<body>
<%@include file="../general_included/topbar.jsp"%>

<div id="maindiv2">
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

<table class="contenttable" border="1"> 
<tr><td width="800px"><%=article.getTitle()%></td><td><%=foodingbean.findnkname(article.getWriterid())%></td></tr>
<tr><td><%= sdf.format(article.getReg_date())%></td><td><%=article.getReadcount()%>view</td></tr>
<tr><td colspan="2">사용재료</td></tr>
<tr><td colspan="2">사용도구</td></tr>
<tr><td colspan="2" height="600px"><%=article.getContent()%></td></tr>
<tr><td>#<%=article.getContury()%> #<%=article.getFoodtype()%></td><td>

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
        
        </td></tr>
<tr><td></td><td>목록</td></tr>

				</table>

	<br><br><br>
	<form  style="margin:auto;" method="post" name="commentform" 
					action="commentspro.jsp" >
			
		<table style="margin:auto;">	
			<tr><td>
			댓글 수 : <%=count%></td>
			<td class="content1" align="right">
				<input type="submit"  value="댓글쓰기" class="bt2">
			</td>
			</tr>
		</table>
		<%if(session.getAttribute("idlogin")==null){ %>
			로그인을 하셔야 댓글을 쓸수 있습니다.
		<%}else{ %>
		
		 <table width="1010px" style="margin:auto;">
			<input type="hidden" name="num" value="0">
			<input type="hidden" name="rootin" value="<%=num %>">
			<input type="hidden" name="pageNum" value="<%=pageNum %>">
			<input type="hidden" name="writerid" value="<%=idlogin %>">
			<input type="hidden" name="ref"  value="1">
			<input type="hidden" name="re_step"  value="0">
			<input type="hidden" name="re_level"  value="0">
			<input type="hidden" name="selected" value="0">
			
			<tr>
				<td colspan="3" width="0" style="margin:auto;">
					<textarea name="content" size="40" rows="5" cols="40" class="signupinput2"
							style="ime-mode:inactive;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="3" width="150">
							
				</td>
			</tr>
			
		</table>
	<%} %>
	</form>

<% if (count == 0) { %>

 <table>
		<tr>
		    <td align="center">
		             댓글이 없습니다.
		    </td>
		</tr>
</table>

<% } else {%>

<form method="post" name="iregularcommentform" 
		action="commentspro.jsp" >
	<input type="hidden" name="num" value="0">
	<input type="hidden" name="rootin" value="<%=num %>">
	<input type="hidden" name="pageNum" value="<%=pageNum %>">
	<input type="hidden" name="writerid" value="<%=idlogin %>">
	<input type="hidden" name="ref" value="1">
	<input type="hidden" name="re_step" value="0">
	<input type="hidden" name="re_level" value="0">
	<input type="hidden" name="selected" value="0">
<%  
	for (int i = 0 ; i < commentList.size() ; i++) {
		commentDataBean comments = commentList.get(i);

	int wid=0; 
	if(comments.getRe_level()>0){
	   wid=15*(comments.getRe_level());
	}

%>

	
		<table class="commentbase" style="margin-left:<%=wid %>px;">
		
			<tr height="30">
				<%if(comments.getRe_level()>0){%>
					<td width="20" rowspan="3">ㄴ</td>
				<%} %>
				<td width="353"><%=foodingbean.findnkname(comments.getWriterid())%></td>
			    <td width="353"><%= sdf.format(comments.getReg_date())%></td>
			</tr>
			<tr height="70">
				<td colspan="2" width="600" >
					<p style="width:900px; word-break:break-all"><%=comments.getContent()%></p>
				</td>
			</tr>
			<tr>
				<td align="right" colspan="2">
									<input type="button" value="답글" class="bt2" onclick=
							"AnsUpdDelComment('<%=comments.getNum()%>','<%=comments.getContent()%>',
							'<%=comments.getRef()%>','<%=comments.getRe_step()%>',
							'<%=comments.getRe_level()%>',<%= i %>,'tagged')">
						<%if(idlogin!=null){ %>
							<input type="button" value="변경" class="bt2" onclick=
								"AnsUpdDelComment('<%=comments.getNum()%>','<%=comments.getContent()%>',
								'<%=comments.getRef()%>','<%=comments.getRe_step()%>',
								'<%=comments.getRe_level()%>',<%= i %>,'changed')">
							<input type="button" value="삭제" class="bt2" onclick=
								"AnsUpdDelComment('<%=comments.getNum()%>','<%=comments.getContent()%>',
								'<%=comments.getRef()%>','<%=comments.getRe_step()%>',
								'<%=comments.getRe_level()%>',<%= i %>,'deleted')">
						<%} %>
						<div class="commentchangeform" id="testid"></div>
				</td>
			</tr>
			 <hr width="790" size="8px" color="white">
		 </table>
	 

<%
				}
%>
	</form>
	
<%
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