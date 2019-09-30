<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="DBBean.foodingBean" %>
    <%@ page import="java.sql.Timestamp" %>
    
    <% request.setCharacterEncoding("utf-8"); %>
    
<jsp:useBean id="comment" scope="page" class="DBBean.commentDataBean">
	<jsp:setProperty name="comment" property="*"/>
</jsp:useBean>    

<%

	int rootin = Integer.parseInt(request.getParameter("rootin"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	comment.setReg_date(new Timestamp(System.currentTimeMillis()));
	
	foodingBean dbPro = foodingBean.getInstance();
	dbPro.insertannounceCommentsArticle(comment,rootin);
%>
<script>
	location.href='content.jsp?num=<%=rootin%>&pageNum=<%=pageNum%>';
</script>

