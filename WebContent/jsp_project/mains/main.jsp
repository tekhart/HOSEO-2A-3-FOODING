<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>FOODING</title>
<link rel="stylesheet" href="../css/common.css">
<style>
	body{	font-family:"Bauhaus ITC";
		color:black;}
		
#title{
	text-decoration:none;
	
}
</style>

</head>

<body id="body">
<%@include file="../general_included/topbar.jsp"%>

<center>
<div id="slidediv">
	
    
    <div class="slideshow">

		<div class="mySlides fade">
  			<img src="../img/cake-1914463_1920.jpg" style="width:1880px; height:600px;">
  			<div class="slide-text"><br><br>
  			겨울느낌의 초코 파이
    	  	</div>
		</div>

		<div class="mySlides fade">
  			<img src="../img/egg-sandwich-2761894_1920.jpg"" style="width:1880px; height:600px;">
  			<div class="slide-text"><br><br>
  			계란과 토마토마토 토스트스트
       		</div>
		</div>

		<div class="mySlides fade">
  			<img src="../img/cupcakes-1850628_1920.jpg" style="width:1880px; height:600px;">
  			<div class="slide-text"><br><br>
  			예쁜 컵케잌과 말랑말랑 마쉬멜롱
        	</div>
		</div>

	</div>
    
	
	

	<div class="dotdot"style="text-align:right">
  	<span class="dot" onclick="currentSlide(1)"></span> 
  	<span class="dot" onclick="currentSlide(2)"></span> 
  	<span class="dot" onclick="currentSlide(3)"></span> 
	</div>

    <script>
        var slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
          showSlides(slideIndex += n);
        }

        function currentSlide(n) {
          showSlides(slideIndex = n);
        }

        function showSlides(n) {
          var i;
          var slides = document.getElementsByClassName("mySlides");
          var dots = document.getElementsByClassName("dot");
          if (n > slides.length) {slideIndex = 1}    
          if (n < 1) {slideIndex = slides.length}
          for (i = 0; i < slides.length; i++) {
              slides[i].style.display = "none";  
          }
          for (i = 0; i < dots.length; i++) {
              dots[i].className = dots[i].className.replace(" active", "");
          }
          slides[slideIndex-1].style.display = "block";  
          dots[slideIndex-1].className += " active";
          slideIndex++;
          if(slideIndex>=4){slideIndex-=3}
          setTimeout(showSlides, 3000); 
        }

    </script>
</div>
</center>

<div id="bottomdiv">
	<table id="bottable" border="1" cellspacing=1 bordercolor="#ffbb00">
		<tr><th><font  color="black">오늘의 레시피 TOP 5</font></th><th><font  color="black">작성자</font></th></tr>
    	<tr><td><font  color="black">맛있는 토마토 피자 만들기</font></td><td><font  color="black">domino</font></td></tr>
        <tr><td><font  color="black">생일상에 빠질 수 없는 초코케이크!</font></td><td><font  color="black">bird2</font></td></tr>
        <tr><td><font  color="black">집에서 즐기는 미국의 맛~</font></td><td><font  color="black">trump</font></td></tr>
        <tr><td><font  color="black">연어덕후 소리질러~!</font></td><td><font  color="black">hihello</font></td></tr>
    </table>
</div>

<div id="eventdiv" >

	<img src="../img/cake-1971556_1920.jpg" width="940px" height="300px">
	
</div>

</div>


<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
<pre>
Create by FOODING
고객문의 1544-XXXX
JSP Project 2019 2A03</pre>
</div>

</html>