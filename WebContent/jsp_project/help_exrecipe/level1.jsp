<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초보용 레시피, 초보</title>
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/list.css">

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
		<div class="writetitle1">기초 레시피</div>

		<br>
		<br>
		<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<input type="button" value="뒤로가기" class="findbutton"
			onclick="location.href='level.jsp'">
		<div
			style="width: 700px; margin: auto; text-align: center; margin-top: 80px;">
			<iframe width="560" height="315"
				src="https://www.youtube.com/embed/p7AGOHsTTEQ" frameborder="0"
				allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
				allowfullscreen></iframe>
			<br>
			<h2 style="word-spacing:5px; letter-spacing: 3px;">채썰기</h2>
		</div>
		<div
			style="width: 700px; margin: auto; text-align: center; margin-top: 80px;">
			<iframe width="560" height="315"
				src="https://www.youtube.com/embed/BB8Y91MW_RY" frameborder="0"
				allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
				allowfullscreen></iframe>
			<br>
			<h2 style="word-spacing:5px; letter-spacing: 3px;">칼 사용법</h2>
		</div>
		<div
			style="width: 700px; margin: auto; text-align: center; margin-top: 80px;">
			<iframe width="560" height="315"
				src="https://www.youtube.com/embed/YXSXp28yTBI" frameborder="0"
				allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
				allowfullscreen></iframe>
			<br>
			<h2 style="word-spacing:5px; letter-spacing: 3px;">역대급 계란 후라이</h2>
		</div>
		<div
			style="width: 700px; margin: auto; text-align: center; margin-top: 80px;">
			<iframe width="560" height="315"
				src="https://www.youtube.com/embed/iWxORW_8qxU" frameborder="0"
				allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
				allowfullscreen></iframe>
			<br>
			<h2 style="word-spacing:5px; letter-spacing: 3px;">조미료에 관하여</h2>
		</div>
		<%@include file="../general_included/footer.jsp"%>
</body>
</html>