<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>파일 업로드 예제</title>
</head>
<body>
   <form name="fileForm" method="post" 
      enctype="multipart/form-data" action="fileUpload.jsp">
	파일명: 
	<input type="file" name="uploadFile"><br>
	<input type="submit" value="파일 올리기"><br>
</form>
</body>
</html>