<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="DBBean.foodingBean" %>
    <%@ page import="java.sql.Timestamp" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    
<jsp:useBean id="comment" scope="page" class="DBBean.commentDataBean">
	<jsp:setProperty name="comment" property="*"/>
</jsp:useBean>    

<%

	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	comment.setReg_date(new Timestamp(System.currentTimeMillis()));
	
	foodingBean dbPro = foodingBean.getInstance();
	dbPro.insertCommentsArticle(comment,num);
%>
<script>
location.href="content.jsp?num=<%=num%>%>&pageNum=<%=pageNum%>";
</script>

