<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String storeplace=request.getParameter("storeplace");
%>
<html>
<head>
<title>파일 업로드</title>
<style>
.findbutton {
	position:fixed;
	background-color: white;
	font-size: 15px;
	border-color: #ffbb00;
	height: 35px;
	margin: 5px;
	border-style: solid;
	cursor: pointer;
	width: 100px;
	border-radius:3px;
	top:230px;
	left:60px;
}

.fufudiv{
	position:fixed;
	top:120px;
	right:40px;
}


.file_input label{
position:relative;
cursor:pointer;
display:inline-block;
vertical-align:middle;
overflow:hidden;
width:100px;
height:30px;
background:#FFBB00;
color:#fff;
text-align:center;
line-height:30px;
}

.file_input label input{
position:absolute;
width:0;
height:0;
overflow:hidden;
} 

.file_input input[type=text]{
vertical-align:middle;
display:inline-block;
width:260px;
height:28px;
line-height:28px;
font-size:11px;
padding:0;
border:0;
border:1px solid orange;
}

</style>
</head>
<body>
	<form name="fileForm" method="post" enctype="multipart/form-data"
		action="fileUpload.jsp?storeplace=<%=storeplace %>">
		
		<div class="file_input">
		<input type="text" readonly="readonly" id="file_route">
		<label>
		파일 찾기
		<input type="file" name="uploadFile" onchange="javascript:document.getElementById('file_route').value=this.value">
		</label>
		</div>
		
		<input type="submit" value="파일 올리기" class="findbutton"><br>
		
		<div class="fufudiv">
		<img src="../../img/fufu.png" width="168px" height="173px">
		</div>
		
	</form>
</body>
</html>