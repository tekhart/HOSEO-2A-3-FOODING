<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.foodingBean"%>
<%@ page import="java.sql.Timestamp"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="article" scope="page" class="DBBean.BoardDataBean">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>
<%
	String pageNum = request.getParameter("pageNum");
	foodingBean dbPro = foodingBean.getInstance();
	int check = dbPro.updateexrecipeArticle(article);
	if (check == 1) {
%>
<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>">
<%
	} else {
%>
<script type="text/javascript">
	
</script>
<%
	}
%>
