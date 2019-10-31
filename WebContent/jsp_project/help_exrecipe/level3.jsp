<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초보용 레시피, 초보</title>
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/list.css">

</head>
<style>
body {
	font-family: "Bauhaus ITC";
	color: black;
}

#title {
	text-decoration: none;
}
</style>
</head>
<body id="body">

	<%@include file="../general_included/topbar.jsp"%>
	<div id="maindiv">
		<div class="writetitle1">심화 레시피</div>
<br>
<br>
<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<input type="button" value="뒤로가기" class="findbutton"
	onclick="location.href='level.jsp'">
<div
	style="width: 700px; margin: auto; text-align: center; margin-top: 80px;">
	<iframe width="560" height="315"
		src="https://www.youtube.com/embed/ZDuOWriz7o0" frameborder="0"
		allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
		allowfullscreen></iframe>
	<br>
	<h2 style="word-spacing:5px; letter-spacing: 3px;">간 맞추기</h2>
</div>
<div
	style="width: 700px; margin: auto; text-align: center; margin-top: 80px;">
	<iframe width="560" height="315"
		src="https://www.youtube.com/embed/NiEz2y_SBAM" frameborder="0"
		allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
		allowfullscreen></iframe>
	<br>
	<h2 style="word-spacing:5px; letter-spacing: 3px;">겉멋 강좌</h2>
</div>
<div
	style="width: 700px; margin: auto; text-align: center; margin-top: 80px;">
	<iframe width="560" height="315"
		src="https://www.youtube.com/embed/S59h9-tqwmE" frameborder="0"
		allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
		allowfullscreen></iframe>
	<br>
	<h2 style="word-spacing:5px; letter-spacing: 3px;">요리 꿀팁</h2>
</div>
<div
	style="width: 700px; margin: auto; text-align: center; margin-top: 80px;">
	<iframe width="560" height="315"
		src="https://www.youtube.com/embed/vlPQyLl3gyQ" frameborder="0"
		allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
		allowfullscreen></iframe>
	<br>
	<h2 style="word-spacing:5px; letter-spacing: 3px;">팬 돌리기</h2>
</div>

<%@include file="../general_included/footer.jsp"%>
</body>
</html>