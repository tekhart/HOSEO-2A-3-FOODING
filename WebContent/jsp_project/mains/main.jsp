<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.foodingBean"%>
<%@ page import="DBBean.BoardDataBean"%>
<%@ page import="DBBean.announceDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>FOODING</title>
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/list.css">
<style>
.eventdiv {
	width: 1300px;
	height: 400px;
	margin: auto;
	border: 10px solid white;
	box-shadow: 5px 5px 5px 5px gray;
	
}

.bgimg {
	height: 100%;
	background-position: center;
	background-size: cover;
	position: relative;
	color: white;
	font-family: "Courier New", Courier, monospace;
	font-size: 25px;
}

.middle {
	position: absolute;
	
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
}

.banblack2{
	position:relative;
	width:1883px;
	height:400px;
	top:453px;
	left:10px;
	z-index:1;
	background-color:rgba(0,0,0,30%);
}

.datestart, .dateend{
	position:relative;
	z-index:2;
}

.middle{
	position:absolute;
	z-index:2;
		margin-top:33px;

	width:400px;
	text-align:center;
	display:inline-block;
	
	display: -webkit-box;
	overflow:hidden;
	word-break:keep-all;
	-webkit-box-orient:vertical;
	-webkit-line-clamp:3;
	text-overflow:ellipsis;
} 

</style>

</head>

<body id="body">

	<%@include file="../general_included/topbar.jsp"%>
	<center>
		<div id="slidediv">
			<%
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				int slidePageSize = 3;
				String slidePageNum = "1";
				int slideCurrentPage = 1;
				int slideFame = 1;
				int slideStartRow = (slideCurrentPage - 1) * slidePageSize + 1;
				List<BoardDataBean> articleList = null;
				foodingBean dbPro = foodingBean.getInstance();

				articleList = dbPro.getArticles(slideStartRow, slidePageSize, slideFame);
				List<announceDataBean> announcearticleList = dbPro.getannounceArticles(1, 3, "0",1);
				for (int i = 0; i < articleList.size(); i++) {
					BoardDataBean article = articleList.get(i);
					String writerid = article.getWriterid();
			%>


			<div class="slideshow">
				<gg href="javascript:;"
						onClick="javascript:location.href='../recipes/content.jsp?num=<%=article.getNum()%>&pageNum=<%=slideCurrentPage%>&fame=<%=slideFame%>'">
					<div class="mySlides fade" style="cursor: pointer;">
						<div
							style="background-image:url('<%=article.getThumbnail()%>');background-size:cover;background-position:center;width:1880px; height:600px;"></div>
						<div class="slide-text">
							<br> <br>
							<%=article.getTitle()%>
						</div>
					</div>
				</gg>
			</div>
			<%
				}
			%>



			<div class="dotdot" style="text-align: right">
				<span class="dot" onclick="currentSlide(1)"></span> <span
					class="dot" onclick="currentSlide(2)"></span> <span class="dot"
					onclick="currentSlide(3)"></span>
			</div>

			<script>
				var slideIndex = 0;
				showSlides(slideIndex);
				timeoutslide();

				function plusSlides(n) {
					showSlides(slideIndex += n);
				}
				function timeoutslide() {
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
					if (n > slides.length) {
						slideIndex = 1
					}
					if (n < 1) {
						slideIndex = slides.length
					}
					for (i = 0; i < slides.length; i++) {
						slides[i].style.display = "none";
					}
					for (i = 0; i < dots.length; i++) {
						dots[i].className = dots[i].className.replace(
								" active", "");
					}
					slides[slideIndex - 1].style.display = "block";
					dots[slideIndex - 1].className += " active";
					slideIndex++;
					if (slideIndex >= 4) {
						slideIndex -= 3
					}
				}
			</script>
		</div>
	</center>

<br><br><br><br>

	<div id="bottomdiv">
		<table id="bottable" cellspacing="0px" style="margin: auto">
			<tr>
				<th class="line" colspan="5">
					<font size="40px">
						<center>
							오늘의 레시피<br> <br>
						</center>
					</font>
				</th>
			</tr>
			<%
				int pageSize = 8;
				String pageNum = "1";
				int currentPage = 1;
				int fame = 0;
				String thumbnail[] = new String[8];
				String title[] = new String[8];
				String wrid[] = new String[8];
				int startRow = (currentPage - 1) * pageSize + 1;
				List<BoardDataBean> recArticleList = null;
				foodingBean recDbPro = foodingBean.getInstance();

				recArticleList = recDbPro.getArticles(startRow, pageSize, fame);

				for (int i = 0; i < recArticleList.size(); i = i + 2) {
					BoardDataBean recarticle1 = recArticleList.get(i);
					BoardDataBean recarticle2 = recArticleList.get(i + 1);
			%>
			<tr>

				<td class='line' rowspan='2' width='300px' style="cursor: pointer;"
					onclick="location.href='../recipes/content.jsp?num=<%=recarticle1.getNum()%>&pageNum=<%=currentPage%>&fame=<%=fame%>'">
					<img src="<%=recarticle1.getThumbnail()%>" width='300px'
					class='adad'>
				</td>
				<td class='line' height='100px' style="cursor: pointer;"
					onclick="location.href='../recipes/content.jsp?num=<%=recarticle1.getNum()%>&pageNum=<%=currentPage%>&fame=<%=fame%>'">
					<p class='pline'><%=recarticle1.getTitle()%></p>
				</td>

				<td>&nbsp;&nbsp;&nbsp;</td>
				<td class='line' rowspan='2' width='300px' style="cursor: pointer;"
					onclick="location.href='../recipes/content.jsp?num=<%=recarticle2.getNum()%>&pageNum=<%=currentPage%>&fame=<%=fame%>'">
					<img src="<%=recarticle2.getThumbnail()%>" width='300px'
					class='adad'>
				</td>
				<td class='line' height='100px' style="cursor: pointer;"
					onclick="location.href='../recipes/content.jsp?num=<%=recarticle2.getNum()%>&pageNum=<%=currentPage%>&fame=<%=fame%>'">
					<p class='pline'><%=recarticle2.getTitle()%></p>
				</td>
			</tr>
			<tr>
				<td class='line' height='50px' style="cursor: pointer;"
					onclick="location.href='../recipes/content.jsp?num=<%=recarticle1.getNum()%>&pageNum=<%=currentPage%>&fame=<%=fame%>'">
					<%=recarticle1.getWriterid()%>
				</td>
				<td></td>
				<td class='line' height='50px' style="cursor: pointer;"
					onclick="location.href='../recipes/content.jsp?num=<%=recarticle2.getNum()%>&pageNum=<%=currentPage%>&fame=<%=fame%>'">
					<%=recarticle2.getWriterid()%>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>

	<div class="banblack2">
	</div>

	<br>
	<br>
	<br>
	<div id="eventdiv" align="center">
		<%
		if(announcearticleList!=null){
			for (int i = 0; i < announcearticleList.size(); i++) {
					announceDataBean announcearticle = announcearticleList.get(i);
					String writerid = announcearticle.getWriterid();
			%>
	
			<div class="maineventdiv"
				onclick="location.href='../announces/content.jsp?num=<%=announcearticle.getNum()%>&pageNum=1'">
				<div class="bgimg"
					style="background-image:url(<%=announcearticle.getThumbnail()%>);">
					<div class="middle">
						<h2><%=announcearticle.getTitle()%></h2>
						<hr>
						<p id="eventTimer<%=announcearticle.getNum()%>" style="font-size: 30px"></p>
					</div>
					<div class="bottomleft datestart">
						<p style="float: left">&nbsp&nbsp<%=sdf.format(announcearticle.getReg_date())%>
							~&nbsp;
						</p>
						<p style="float: left" class="dateend" id="event_endtime<%=announcearticle.getNum()%>"><%=sdf.format(announcearticle.getEnd_date())%></p>
					</div>
				</div>
				<script type="text/javascript">
					var countdownfunction<%=announcearticle.getNum()%>=
						setInterval(function() {event_countdown(<%=announcearticle.getNum()%>);
					}, 1000);
				</script>
			</div>
			<%
			}
		}else{
		%>
		현재 진행중인 이벤트가 존재하지 않습니다...
		<%} %>
	</div>
	<script>
		var countdownfunction = [];
		function parse(str) {
			var y = str.substr(0, 4), m = str.substr(5, 2) - 1, d = str.substr(
					8, 2);
			return new Date(y, m, d);
		}

		function event_countdown(i) {
			var event_endtime = document.getElementById("event_endtime" + i);
			var eventTimer = document.getElementById("eventTimer" + i);
			var countDownDate = parse(event_endtime.innerHTML);
			var now = new Date().getTime();
			var distance = countDownDate - now;
			if (distance < 0) {
				eventTimer.innerHTML = "종료된 이벤트";
			} else {
				var years= Math.floor(distance / (1000 * 60 * 60 * 24 * 365));
				var days = Math.floor((distance % (1000 * 60 * 60 * 24 * 365))
						/ (1000 * 60 * 60 * 24));
				var hours = Math.floor((distance % (1000 * 60 * 60 * 24))
						/ (1000 * 60 * 60));
				var minutes = Math.floor((distance % (1000 * 60 * 60))
						/ (1000 * 60));
				var seconds = Math.floor((distance % (1000 * 60)) / 1000);
				if(years>0){
					eventTimer.innerHTML = years + "y " + days + "d " + hours + "h " + minutes
							+ "m " + seconds + "s ";
				}else{
					eventTimer.innerHTML = days + "d " + hours + "h " + minutes
					+ "m " + seconds + "s ";
				}
			}
		}
	</script>
	<%@include file="../general_included/footer.jsp"%>
</body>
</html>