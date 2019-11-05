<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String storeplace=request.getParameter("storeplace");
%>
<html>
<head>
<title>파일 업로드 예제</title>
</head>
<body>
   <form name="fileForm" method="post" 
      enctype="multipart/form-data" action="fileUpload.jsp?storeplace=<%=storeplace %>">
	파일명: 
	<input type="file" name="uploadFile"><br>
	<input type="submit" value="파일 올리기"><br>
</form>
</body>
</html>