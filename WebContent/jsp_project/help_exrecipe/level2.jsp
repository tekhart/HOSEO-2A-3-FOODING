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
		<div class="writetitle1">초보 레시피</div>

	<br>
	<br>
	<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	<input type="button" value="뒤로가기" class="findbutton"
		onclick="location.href='level.jsp'">
	<div
		style="width: 700px; margin: auto; text-align: center; margin-top: 80px;">
		<iframe width="560" height="315"
			src="https://www.youtube.com/embed/Bz92P-leaJs" frameborder="0"
			allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen></iframe>
		<br>
		<h2 style="word-spacing:5px; letter-spacing: 3px;">고기 재우기</h2>
	</div>
	<div
		style="width: 700px; margin: auto; text-align: center; margin-top: 80px;">
		<iframe width="560" height="315"
			src="https://www.youtube.com/embed/tHkbJgBUaiI" frameborder="0"
			allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen></iframe>
		<br>
		<h2 style="word-spacing:5px; letter-spacing: 3px;">전부치기</h2>
	</div>
	<div
		style="width: 700px; margin: auto; text-align: center; margin-top: 80px;">
		<iframe width="560" height="315"
			src="https://www.youtube.com/embed/YR_RTyOkoao" frameborder="0"
			allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen></iframe>
		<br>
		<h2 style="word-spacing:5px; letter-spacing: 3px;">국 끓이기</h2>
	</div>
	<div
		style="width: 700px; margin: auto; text-align: center; margin-top: 80px;">
		<iframe width="560" height="315"
			src="https://www.youtube.com/embed/WOdPj3PN32Y" frameborder="0"
			allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen></iframe>
		<br>
		<h2 style="word-spacing:5px; letter-spacing: 3px;">파스타 만들기</h2>
	</div>

	<%@include file="../general_included/footer.jsp"%>
</body>


</html>