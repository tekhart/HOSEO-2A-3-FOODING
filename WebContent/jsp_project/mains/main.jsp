<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DBBean.foodingBean" %>
<%@ page import = "DBBean.BoardDataBean" %>    
<%@ page import = "java.util.List" %>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>FOODING</title>
<link rel="stylesheet" href="../css/common.css">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
	<link rel="stylesheet" href="../css/common.css">
	<link rel="stylesheet" href="../css/list.css">
<style>

</style>

</head>

<body id="body">

<%@include file="../general_included/topbar.jsp"%>
<center>


<div id="slidediv">
<%
int slidePageSize = 3;
String slidePageNum="1";
int slideCurrentPage = 1;
int slideFame=1;
int slideStartRow = (slideCurrentPage - 1) * slidePageSize + 1;
List<BoardDataBean> articleList = null;
foodingBean dbPro = foodingBean.getInstance();

        articleList = dbPro.getArticles(slideStartRow, slidePageSize,slideFame);

for (int i = 0 ; i < articleList.size(); i++) {
	   BoardDataBean article = articleList.get(i);
	   String writerid=article.getWriterid();%>


    <div class="slideshow">
	<a href="../recipes/content.jsp?num=<%=article.getNum()%>&pageNum=<%=slideCurrentPage%>&fame=<%=slideFame%>">
		<div class="mySlides fade"style=" cursor: pointer;" >
  			<img src="<%=article.getThumbnail() %>" style="width:1880px; height:600px;">
  			<div class="slide-text"><br><br>
  			<%= article.getTitle()%>
       		</div>
		</div>
		</a>
	</div>
    <%
}
%>
	
	

	<div class="dotdot"style="text-align:right">
  	<span class="dot" onclick="currentSlide(1)"></span> 
  	<span class="dot" onclick="currentSlide(2)"></span> 
  	<span class="dot" onclick="currentSlide(3)"></span> 
	</div>

    <script>
        var slideIndex = 0;
        showSlides(slideIndex);
        timeoutslide();
        
        function plusSlides(n) {
          showSlides(slideIndex += n);
        }
		function timeoutslide(){
	        showSlides(slideIndex);
	       setTimeout(timeoutslide, 4000); 
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
        }

    </script>
</div>
</center>  


<div id="bottomdiv">

<center>
최신 레시피<br>
    	<!-- 
    	<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
    	<td class="line" rowspan="2"><img src="../img/pizza-3007395_420.jpg" class="adad"></td><td  class="line" height="80px">팬케이크 먹기</td></tr>
    	<tr><td class="line"> heyjin </td><td></td><td class="line">sol</td></tr>
    	 
    	<tr><td class="line" rowspan="2"><img src="../img/salad-2756467_420.jpg" class="adad"></td><td class="line" height="80px">샐러드 만들기</td>
    	<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
    	<td class="line" rowspan="2"><img src="../img/top-view-1248955_420.jpg" class="adad"></td><td  class="line" height="80px">샐러드 먹기</td></tr>
    	<tr><td class="line"> tokki </td><td></td><td class="line">height</td></tr>
    	
    	<tr><td class="line" rowspan="2"><img src="../img/casserole-dish-2776735_420.jpg" class="adad"></td><td class="line" height="80px">맛있는 토마토 피자 만들기</td>
    	<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
    	<td class="line" rowspan="2"><img src="../img/cereal-563796_420.jpg" class="adad"></td><td  class="line" height="80px">맛없는 토마토 피자 만들기</td></tr>
    	<tr><td class="line"> asasasas </td><td></td><td class="line">14ssss</td></tr> -->
    	
        
       
    
				<%
		int pageSize = 8;
		String pageNum="1";
		int currentPage = 1;
		int fame=0;
		String thumbnail [] = new String [8];
		String title [] = new String [8];
		String wrid [] = new String [8];
		int startRow = (currentPage - 1) * pageSize + 1;
		List<BoardDataBean> recArticleList = null;
		foodingBean recDbPro = foodingBean.getInstance();
		
		        recArticleList = recDbPro.getArticles(startRow, pageSize,fame);
		
		for (int i = 0 ; i < recArticleList.size(); i++) {
			BoardDataBean recarticle = recArticleList.get(i);
			   String writerid=recarticle.getWriterid();
		%>
			<div class="card1">
			<a href="../recipes/content.jsp?num=<%=recarticle.getNum()%>&pageNum=<%=currentPage%>&fame=<%=0%>">
			<br>
			<div style="background-image:url('<%=recarticle.getThumbnail() %>');background-size:290px;width:290px;height:163px;"></div>
			<br><br>
			<table>
				<tr><td  class="titlelong">
			   		<% if(recarticle.getReadcount()>=50){%>
						<img src="../img/fire1.png" width="20px" height="25px" align="middle">
					<%}%>
					<%=recarticle.getTitle()%>
				</td></tr>
			</table>
			<table width="100%">
				<tr>
					<td class="writerlong" style="text-align:left;">
						<%=recDbPro.findnkname(writerid)%></td>
					<td style="align:right;"><%=recarticle.getReadcount()%> view</td>
				</tr>
			</table>
			</a>
		</div><%} %>
			<%-- BoardDataBean recarticle = recArticleList.get(i);
			thumbnail[i]=recarticle.getThumbnail();	   
			title[i]=recarticle.getTitle();
			wrid[i]=recarticle.getWriterid();
		
			   --%>
			   
    	<%--
    		out.println("<tr><td class='line' rowspan='2' width='300px' height='300px'><img src="+thumbnail[0]+" width='300px' class='adad' ></td><td class='line' height='80px' height='80px'>"+title[0]+"</td>");
	    	out.println("<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>");
    		out.println("<tr><td class='line' rowspan='2'></td><img src="+thumbnail[1]+" width='300px' class='adad'><td class='line' height='80px'>"+title[1]+"</td>");
    		out.println("<tr><td class='line'>"+wrid[0]+"</td><td></td><td class='line'>"+wrid[1]+"</td></tr>");
    	--%>

    </center>

</div>



<div id="eventdiv" >

	<img src="../img/cake-1971556_1920.jpg" width="850px" height="300px">
	
</div>





<%@include file="../general_included/footer.jsp"%>
</body>
</html>