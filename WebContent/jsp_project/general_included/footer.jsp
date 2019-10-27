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
}

#logo{
width:100px;
height: auto;
}

#footerlp{
text-align:left;
}
<<<<<<< HEAD
#footerhr {
  margin: auto;
  width:100%;
}
=======

#footerp{
font-size:12px; 
}

>>>>>>> refs/remotes/origin/master
#rightside{
position:relative;
float:right;
margin-right:10%;
margin-top:2%;
}

</style>
</head>
<body id="footerbody">

<footer>
<div id="footer">

<hr>
<div id="footnav">
<ul class="horizontal-menu">
<li><div id="leftside">
		<img src="../img/fooding.png" id="logo"  />
		<p id="footerp">Create by FOODING<br>JSP Project 2019_2A03</p>
	</div></li>
	<li><a href="../mains/ask.jsp">고객센터</a></li>
	<li><a href="#">홈페이지 소개</a></li>
	<li><a href="https://blog.naver.com/fooding2019_2a03" target="_blank">블로그</a></li>
	<li><div id="rightside">
		<p>Email : fooding2019_2a03@naver.com</p>
	</div></li>
</ul>
</div>
</div>
</footer>
</body>
</html>
