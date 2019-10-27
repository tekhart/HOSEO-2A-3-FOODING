<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#footer{
 font-family :'Bauhaus ITC';
}
#footer {

left: 0;
right: 0;
    bottom:0px;
    width:100%;
}

#footerbody {

margin: 0;

padding: 0;

}
li {
list-style-type: none;
}
a {
text-decoration: none;
}

#footer {
margin: 0;
padding:150px 0px 0px 0px;
text-align: center;
}

.horizontal-menu {
display: inline-block;
overflow: hidden;
}

.horizontal-menu li {
float: left;
margin-left:40px;
margin-right:40px;
}

.horizontal-menu a {
display: block;
height: 50px;
line-height: 50px;
color: #000000;
padding: 0 35px;
}
#footnav{
position:relative;
width:100%;
font-size:22px;
}

#leftside {
position:left;
	padding: 5px;
	float: left;
	margin-left: 20%;
	width:34%;
	text-align:right;
}

#logo{
width:100px;
height: auto;
}

#footerlp{
text-align:left;
}

#rightside{ 
float:left;
height:30%;
text-align:center;
width:28%;
margin-top:80px;
}

</style>
</head>
<body id="footerbody">

<footer>
<div id="footer">
<div id="footnav">
<ul class="horizontal-menu">
	<li><a href="#">고객센터</a></li>
	<li><a href="#">홈페이지 소개</a></li>
	<li><a href="https://blog.naver.com/fooding2019_2a03" target="_blank">블로그</a></li>
</ul>
</div>
<hr>
	<div id="leftside">
		<img src="../img/fooding.png" id="logo"  />
		<p id="footerp">Create by FOODING<br>JSP Project 2019 2A03</p>
	</div>

	<div id="rightside">
		
		<p style="vertical-align:bottom;">Email : fooding2019_2a03@naver.com</p>
	</div>
</footer>
</body>
</html>
