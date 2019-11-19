<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.foodingBean"%>
<%@ page import="DBBean.announceDataBean"%>
<%@ page import="DBBean.commentDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%!int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>

<%
	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	String search = request.getParameter("search");
	String isevent = request.getParameter("isEvent");
	if (isevent == null) {
		isevent = "2";
	}
	if (pageNum == null) {
		pageNum = "1";
	}

	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;

	List<announceDataBean> articleList = null;

	foodingBean dbPro = foodingBean.getInstance();
	foodingBean foodingbean = new foodingBean();
	if (search == null) {
		count = dbPro.getannounceArticleCount(isevent);
	} else {
		count = dbPro.getannounceArticleCount(search, isevent);
	}

	if (count > 0) {
		if (search == null) {
			articleList = dbPro.getannounceArticles(startRow, pageSize, isevent,0);
		} else {
			articleList = dbPro.getannounceArticles(startRow, pageSize, search, isevent,0);
		}
	}

	number = count - (currentPage - 1) * pageSize;
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	margin-top: 40px;
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

hr {
	margin: auto;
	width: 70%;
}
</style>

<title>공지사항, FOODING</title>

</head>
<body id="body">

	<%@include file="../general_included/topbar.jsp"%>
	<div id="maindiv">

		<div class="writetitle1">
			공지사항(<%=count%>)
		</div>
		<br>
		<form method="post" action="list.jsp" class="searh">
			<table class="listtop" style="margin: auto">
				<tr>
					<td>
						<table class="searchtable">
							<tr>
								<td class="searchtd" border="1" style="padding-left: 350px;">
									<input type="text" name="search" class="searchbar">
								</td>
								<td class="searchbttd" width="50px"><input type="submit"
									value="검색" class="searchbotton">
								<td style="padding-left: 225px;"><input type="button"
									onclick="location.href='list.jsp'" value="목록" class="bt">
								</td>
								<td>
									<%
										if (isAdmin == 1) {
									%> <input type="button" onclick="location.href='writeForm.jsp'"
									value="글쓰기" class="bt"> <%
 	}
 %>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
		<br> <br> <br>
		<%
			if (count == 0) {
		%>


		<table align="center" class="nogul">
			<tr>
				<td align="center">게시판에 저장된 글이 없습니다<br> 첫 글을 남겨보세요! <br>
					<img src="../img/ding.png" height="335px" width="559px">
				</td>
		</table>
		<%
			} else {
		%>
		<%
			for (int i = 0; i < articleList.size(); i++) {
					announceDataBean article = articleList.get(i);
					String writerid = article.getWriterid();
		%>

		<div class="eventdiv"
			onclick="location.href='content.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
			<div class="bgimg"
				style="background-image:url(<%=article.getThumbnail()%>);">
				<div class="middle">
					<h1><%=article.getTitle()%></h1>
					<hr>
					<p id="eventTimer<%=article.getNum()%>" style="font-size: 30px"></p>
				</div>
				<div class="bottomleft">
					<p style="float: left"><%=sdf.format(article.getReg_date())%>
						~&nbsp;
					</p>
					<p style="float: left" id="event_endtime<%=article.getNum()%>"><%=sdf.format(article.getEnd_date())%></p>
				</div>
			</div>
			<script type="text/javascript">
				var countdownfunction<%=article.getNum()%>
				= setInterval(function(){event_countdown(<%=article.getNum()%>);
				}, 1000);
			</script>
		</div>
		<%
			}
		%>

		<center>
			<br>
			<%
				if (count > 0) {
						int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
						int startPage = 1;

						if (currentPage % 10 != 0)
							startPage = (int) (currentPage / 10) * 10 + 1;
						else
							startPage = ((int) (currentPage / 10) - 1) * 10 + 1;

						int pageBlock = 10;
						int endPage = startPage + pageBlock - 1;
						if (endPage > pageCount)
							endPage = pageCount;

						if (startPage > 10) {
			%>
			<a href="list.jsp?pageNum=<%=startPage - 10%>">[이전]</a>
			<%
				}

						for (int i = startPage; i <= endPage; i++) {
			%>
			<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]
			</a>
			<%
				}

						if (endPage < pageCount) {
			%>
			<a href="list.jsp?pageNum=<%=startPage + 10%>">[다음]</a>
			<%
				}
					}
			%>
		</center>
		<%
			}
		%>

	</div>
	<script>
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
				var days = Math.floor(distance / (1000 * 60 * 60 * 24));
				var hours = Math.floor((distance % (1000 * 60 * 60 * 24))
						/ (1000 * 60 * 60));
				var minutes = Math.floor((distance % (1000 * 60 * 60))
						/ (1000 * 60));
				var seconds = Math.floor((distance % (1000 * 60)) / 1000);
				eventTimer.innerHTML = days + "d " + hours + "h " + minutes
						+ "m " + seconds + "s ";
			}
		}
	</script>
	<%@include file="../general_included/footer.jsp"%>

</body>
</html>