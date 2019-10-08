<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
 font-family :'Bauhaus ITC';
}
#footer {
position: absolute;
left: 0;
right: 0;
    bottom:0px;
    width:100%;
}

body, ul {

margin: 0;

padding: 0;

}
li {
list-style-type: none;
}
a {
text-decoration: none;
}
body {
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
font-size:26px;
}
#leftside
{
padding:5px;
float:left;
margin-left:20%;
}
#logo{
width:100px;
height: auto;
}
#footerlp{
text-align:left;
}
#rightside{
positon:relative;
float:right;
margin-right:10%;
margin-top:2%;
}
</style>
</head>
<body>
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
		<p>Email : fooding2019_2a03@naver.com</p>
	</div>
</div>
</body>
</html>
