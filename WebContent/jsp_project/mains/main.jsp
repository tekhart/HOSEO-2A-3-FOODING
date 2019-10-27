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
	<gg href="javascript:;"
	onClick="javascript:location.href='../recipes/content.jsp?num=<%=article.getNum()%>&pageNum=<%=slideCurrentPage%>&fame=<%=slideFame%>'">
		<div class="mySlides fade"style=" cursor: pointer;" >
			<div style="background-image:url('<%=article.getThumbnail() %>');background-size:cover;background-position:center;width:1880px; height:600px;"></div>
  			<div class="slide-text"><br><br>
  			<%= article.getTitle()%>
       		</div>
		</div>
		</gg>
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

    	
    	<table id="bottable" cellspacing="0px">
    	<tr><th class="line" colspan="5"><font size="40px"><center>오늘의 레시피<br><br></center></font></th></tr>
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
		
		for (int i = 0 ; i < recArticleList.size(); i=i+2) {
			BoardDataBean recarticle1 = recArticleList.get(i);
			BoardDataBean recarticle2 = recArticleList.get(i+1);
			  
		%>
			<tr>
			
				<td class='line' rowspan='2' width='300px' style=" cursor: pointer;"onclick="location.href='../recipes/content.jsp?num=<%=recarticle1.getNum()%>&pageNum=<%=currentPage%>&fame=<%=fame%>'">
					<img src="<%=recarticle1.getThumbnail() %>" width='300px' class='adad' >
				</td>
				<td class='line' height='80px' style=" cursor: pointer;"onclick="location.href='../recipes/content.jsp?num=<%=recarticle1.getNum()%>&pageNum=<%=currentPage%>&fame=<%=fame%>'">
					<p class='pline'><%=recarticle1.getTitle() %></p>
				</td>
				
	    		<td>
	    			&nbsp&nbsp&nbsp
	    		</td>
	    		<td class='line' rowspan='2' width='300px' style=" cursor: pointer;"onclick="location.href='../recipes/content.jsp?num=<%=recarticle2.getNum()%>&pageNum=<%=currentPage%>&fame=<%=fame%>'">
   					<img src="<%=recarticle2.getThumbnail() %>" width='300px' class='adad'>
   				</td>
   				<td class='line' height='80px' style=" cursor: pointer;"onclick="location.href='../recipes/content.jsp?num=<%=recarticle2.getNum()%>&pageNum=<%=currentPage%>&fame=<%=fame%>'">
   					<p class='pline'><%=recarticle2.getTitle() %></p>
   				</td>
			</tr>
    		<tr>
    			<td class='line' style=" cursor: pointer;"onclick="location.href='../recipes/content.jsp?num=<%=recarticle1.getNum()%>&pageNum=<%=currentPage%>&fame=<%=fame%>'">
    				<%=recarticle1.getWriterid() %>
    			</td>
   				<td>
    			</td>
   				<td class='line' style=" cursor: pointer;"onclick="location.href='../recipes/content.jsp?num=<%=recarticle2.getNum()%>&pageNum=<%=currentPage%>&fame=<%=fame%>'">
    				<%=recarticle2.getWriterid() %>
    			</td>
   			</tr>
			<%} %>
			</table>
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
	<%--<div class="card1">
			<a href="../recipes/content.jsp?num=<%=recarticle.getNum()%>&pageNum=<%=currentPage%>&fame=<%=0%>">
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
		</div> --%>
    </center>
</div>




<div id="eventdiv" align="center" >

	<img src="../img/cake-1971556_1920.jpg" width="850px" height="300px">
	
</div>





<%@include file="../general_included/footer.jsp"%>
</body>
</html>