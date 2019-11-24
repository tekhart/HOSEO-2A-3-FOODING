<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.foodingBean"%>
<%@ page import="java.sql.Timestamp"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="article" scope="page" class="DBBean.askDataBean">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>

<%
	if(request.getParameter("atteched").equals("")){
		article.setAtteched("파일 없음");
	}
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	
	foodingBean dbPro = foodingBean.getInstance();
	dbPro.insertaskArticle(article);
%>
<script>
	alert("문의가 성공적으로 발송 되었습니다.");
	location.href = "ask.jsp";
</script>

