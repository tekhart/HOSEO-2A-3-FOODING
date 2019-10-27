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


<hr>


<table width="1000px" style="margin:auto; font-size:20px; padding:10px;"><tr>
<td rowspan="2"><img src="../img/fooding.png" id="logo"  /></td>
<td><a href="../mains/ask.jsp">고객센터</a></td>
<td><a href="https://github.com/tekhart/HOSEO-2A-3-FOODING" target="_blank">GIT</a></td>
<td><a href="https://blog.naver.com/fooding2019_2a03" target="_blank">블로그</a></td>
</tr>
<tr>
<td colspan="3"><table width="100%" style="padding:10px;"><tr>
<td>Create by FOODING<br>JSP Project 2019_2A03</td>
<td>Email<br>fooding2019_2a03@naver.com</td>
</tr></table></td>
</tr></table>

</footer>
</body>
</html>