<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String idlogin="";
	session.setAttribute("zipcode","");
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>FOODING</title>
<link rel="stylesheet" href="../css/common.css">
<style>
	
		
</style>

</head>

<body id="body">

<div id="topdiv" style=text-align:center;>
	<table width=100% height=100%>
    <tr><td width=200 nowrap>
		</td><td width=200 nowrap>
		</td><td width=30 nowrap>
		<%
		try{
			idlogin=(String)session.getAttribute("idlogin");
			
			if(idlogin==null||idlogin.equals("")){
				%>
				<input type="button" class="button11" value="로그인" onClick="location.href='signin.jsp'">
				<input type="button" class="button11" value="회원가입" onClick="location.href='signup.jsp'">
				<%
			}else{
				%>
				<%=idlogin %>님 <input type="button" class="button11" value="로그아웃" onClick="location.href='logout.jsp'">
				<%
			}
		}finally{}
		
		
		%>
		</td></tr>
  	</table>
</div>

<div id="menudiv" style=text-align:center;>
	<table width=100% height=100%>
    	<tr>
    		<td width=100 nowrap>
				<a href=../mains/main.jsp><img src="../img/fooding.png" height="60px" width="100px"></a>
			</td>
			<td width=150 nowrap><font size="10px"><a href=../mains/main.jsp id="title">FOODING</a></font></td>
			<td>
				<center>
					<table id="menutable">
						<tr>
							<td><center>
								<div class="dropdown">
			
	            					<button class="dropbtn">레시피</button>
	            
	            					<div class="dropdown-content">
	            						<center>
		        							<a href="#">전체 레시피</a>
							        		<a href="#">인기 레시피</a>
							        		<a href="#">맞춤 레시피</a>
							       			<a href="#">레시피 작성</a>
						       			</center>
						       		</div>
	       						</div>
	       						</center>
	        				</td>
	        
	       					<td><center>
	        					<div class="dropdown">
	            					<button class="dropbtn">요리도우미</button>
	            					<div class="dropdown-content">
	            						<center>
		            						<a href="#">요리 강의</a>
									        <a href="#">초보용 레시피</a>
									        <a href="#">재료구매</a>
	            						</center>
						        	</div>
						        </div></center>
	        				</td>	
	        				<td><center>
						        <div class="dropdown">
						            <button class="dropbtn">공지사항</button>
						            <div class="dropdown-content">
							            <center>
							            	<a href="#">푸딩규칙</a>
									        <a href="#">이벤트</a>
							            </center>
						        	</div>
						        </div></center>
					        </td>
	        				<td><center>
	        					<div class="dropdown">
						            <button class="dropbtn">고객센터</button>
						            <div class="dropdown-content">
							            <center>
							             	<a href="#">자주하는 질문</a>
									        <a href="#">문의사항</a>
							            </center>
						        	</div>
						        </div></center>
	        				</td>
	        			</tr>
	        		</table>
				</center>
        	</td>
        </tr>
    </table>
</div>

<div id="maindiv">
	
    
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
        }
    </script>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

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