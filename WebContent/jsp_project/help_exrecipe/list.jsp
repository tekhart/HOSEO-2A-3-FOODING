<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.foodingBean"%>
<%@ page import="DBBean.BoardDataBean"%>
<%@ page import="DBBean.commentDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%!int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>

<%
	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	String search = request.getParameter("search");
	String searchtype = request.getParameter("searchtype");
	String difficulty = request.getParameter("difficulty");
	int integerdiff = 0;

	if (pageNum == null) {
		pageNum = "1";
	}

	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;

	List<BoardDataBean> articleList = null;

	foodingBean dbPro = foodingBean.getInstance();
	foodingBean foodingbean = new foodingBean();
	if (search == null) {
		search = "";
	}
	if (searchtype == null) {
		searchtype = "";
	}
	if (difficulty == null) {
		integerdiff = 0;
	} else {
		integerdiff = Integer.parseInt(difficulty);
	}
	count = dbPro.getexrecipeArticleCount(searchtype, search, integerdiff);
	if (count > 0) {
		articleList = dbPro.getexrecipeArticles(startRow, pageSize, searchtype, search, integerdiff);
	}
	String titleddifficulty="";
	if(integerdiff==1){
		titleddifficulty="초급";
	}else if(integerdiff==2){
		titleddifficulty="중급";
	}else if(integerdiff==3){
		titleddifficulty="상급";
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
</style>

<title>초보용 레시피</title>

<script type="text/javascript">
	
</script>

</head>
<body id="body">
	<%@include file="../general_included/topbar.jsp"%>

	<div id="maindiv">
		<div class="writetitle1">
			<%=titleddifficulty %>초보용 레시피(<%=count%>)
		</div>
		<br>
		<center>
			<table class="listtop">
				<tr>
					<td colspan="2">
						<div class="difficultbutton">
							난이도 : 
						</div>
						<div onclick="location.href='list.jsp?pageNum=<%=pageNum%>&search=<%=search%>&searchtype=<%=searchtype%>&difficulty=0'"
								class="difficultbutton">
							전체
						</div>
						<div onclick="location.href='list.jsp?pageNum=<%=pageNum%>&search=<%=search%>&searchtype=<%=searchtype%>&difficulty=1'"
								class="difficultbutton">
							초급
						</div>
						<div onclick="location.href='list.jsp?pageNum=<%=pageNum%>&search=<%=search%>&searchtype=<%=searchtype%>&difficulty=2'"
								class="difficultbutton">
							중급
						</div>
						<div onclick="location.href='list.jsp?pageNum=<%=pageNum%>&search=<%=search%>&searchtype=<%=searchtype%>&difficulty=3'"
								class="difficultbutton">
							상급
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<table class="searchtable">
							<form method="post" action="list.jsp" class="searh">
								<tr>
									<td style="padding-left: 280px;">
										<select name='searchtype'
											style="ime-mode: inactive; padding: .7em .5em; border-radius: 5px 5px 5px 5px; border-color: #ffbb00; font-size: 14pt; font-family: Bauhaus ITC; height: 50px;">
												<option value='제목' selected>제목</option>
												<option value='글쓴이'>글쓴이</option>
												<option value='재료'>재료</option>
												<option value='도구'>도구</option>
										</select>
									</td>
									<td class="searchtd">
										<input type="text" name="search" class="searchbar">
									</td>
									<td class="searchbttd" width="50px">
										<input type="submit" value="검색" class="searchbotton">
									</td>
								</tr>
							</form>
						</table>
					</td>
					<td style="padding-left: 190px;">
						<table align="right">
							<tr>
								<td><input type="button" onclick="location.href='list.jsp'"
									value="목록" class="bt"></td>
								<td><input type="button"
									onclick="location.href='writeForm.jsp'" value="글쓰기" class="bt">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</center>
		<%
			if (count == 0) {
		%>

		<table align="center" class="nogul">
			<tr>
				<td align="center">검색결과가 없습니다<br> 다른걸 검색해주세요! <br>
					<img src="../img/ding.png" height="335px" width="559px">
				</td>
		</table>
		<%
			} else {
		%>
		<br>
		<table class="listtable">
			<tr height="50">
				<td align="center" width="50" class="listcolor">번호</td>
				<td align="center" width="350" class="listcolor">제목</td>
				<td align="center" width="100" class="listcolor">작성자</td>
				<td align="center" width="150" class="listcolor">등록일</td>
				<td align="center" width="50" class="listcolor">조회</td>
				<td align="center" width="50" class="listcolor">댓글수</td>
			</tr>
			<%
				for (int i = 0; i < articleList.size(); i++) {
						BoardDataBean article = articleList.get(i);
						String writerid = article.getWriterid();
						String listeddifficulty="";
						if(article.getDifficulty()==1){
							listeddifficulty="초급";
						}else if(article.getDifficulty()==2){
							listeddifficulty="중급";
						}else if(article.getDifficulty()==3){
							listeddifficulty="상급";
						}
			%>
			<tr class="mouse">
				<td align="center" class="line">
					<%=article.getNum()%>
				</td>
				<td align="left" class="line" style="padding-left: 40px;">
					<a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"
						class="titlelong" style="vertical-align: middle; display: table-cell;">
							[<%=article.getContury()%>/<%=article.getFoodtype()%>/<%=listeddifficulty%>]
							<%
								if (article.getReadcount() >= 20) {
							%>
								<font color="red">HOT</font>
							<%
								}
							%>
							<%=article.getTitle()%>
					</a>
				</td>
				<td align="center" class="line"><a
					href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"
					class="writerlong"> <%=foodingbean.findnkname(writerid)%></a></td>
				<td align="center" width="150" class="line"><%=sdf.format(article.getReg_date())%></td>
				<td align="center" width="50" class="line"><%=article.getReadcount()%></td>
				<td align="center" width="50" class="line"><%=dbPro.getexrecipeCommentArticleCount(article.getNum())%></td>

			</tr>
			<%
				}
			%>
		</table>
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
			<a href="list.jsp?pageNum=<%=startPage - 10%>&search=<%=search%>&searchtype=<%=searchtype%>&difficulty=<%=difficulty%>">[이전]</a>
			<%
				}

					for (int i = startPage; i <= endPage; i++) {
			%>
			<a href="list.jsp?pageNum=<%=i%>&search=<%=search%>&searchtype=<%=searchtype%>&difficulty=<%=difficulty%>">[<%=i%>]
			</a>
			<%
				}

					if (endPage < pageCount) {
			%>
			<a href="list.jsp?pageNum=<%=startPage + 10%>&search=<%=search%>&searchtype=<%=searchtype%>&difficulty=<%=difficulty%>">[다음]</a>
			<%
				}
				}
			%>

		</center>

	</div>
	
	<%@include file="../general_included/footer.jsp"%>
</body>
</html>