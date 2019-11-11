<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.foodingBean"%>
<%@ page import="DBBean.BoardDataBean"%>
<%@ page import="DBBean.commentDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%!int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>

<%
	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	String search = request.getParameter("search");

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
		count = dbPro.getcookhelpArticleCount();
	} else {
		count = dbPro.getcookhelpArticleCount(search);
	}

	if (count > 0) {
		if (search == null) {
			articleList = dbPro.getcookhelpArticles(startRow, pageSize);
		} else {
			articleList = dbPro.getcookhelpArticles(startRow, pageSize, search);
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
</style>

<title>전체 레시피, FOODING</title>

<script type="text/javascript">
	
</script>

</head>
<body id="body">
	<%@include file="../general_included/topbar.jsp"%>
	<div id="maindiv">

		<div class="writetitle1">
			요리 강의(<%=count%>)
		</div>
		<br>
		<center>
			<table class="listtop">
				<tr>
					<td>
						<table class="searchtable">
							<form method="post" action="list.jsp" class="searh">
								<tr>
									<td class="searchtd" border="1" style="padding-left: 350px;">
										<input type="text" name="search" class="searchbar">
									</td>
									<td class="searchbttd" width="50px"><input type="submit"
										value="검색" class="searchbotton"></td>
									<td style="padding-left: 225px;"><input type="button"
										onclick="location.href='list.jsp'" value="목록" class="bt">
									</td>
									<td>
										<%
											if (isAdmin == 1) {
										%> <input type="button"
										onclick="location.href='writeForm.jsp'" value="글쓰기" class="bt">
										<%
											}
										%>
									</td>
								</tr>
							</form>
						</table>
					</td>
				</tr>
			</table>
		</center>
		<br>




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


		<table class="listtable">
			<tr height="50">
				<td align="center" class="listcolor">번호</td>
				<td align="center" class="listcolor" colspan="3">제목</td>
				<td align="center" class="listcolor">작성자</td>
				<td align="center" class="listcolor">등록일</td>
				<td align="center" class="listcolor">조회</td>
			</tr>
			<%
				for (int i = 0; i < articleList.size(); i++) {
						BoardDataBean article = articleList.get(i);
						String writerid = article.getWriterid();
			%>
			<tbody class="mouse">
				<tr
					onclick="location.href='content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>'">
					<td align="center" class="line" rowspan="2" width="100"><%=article.getNum()%>
					</td>
					<td align="left" class="line" rowspan="2" width="200px">
						<div
							style="background-image:url('<%=article.getThumbnail()%>');background-size:cover;background-position:center;width:200px;height:112px;">
						</div>
					</td>
					<td align="left" style="padding-left: 40px;" colspan="2"
						width="300px" class="line"><a
						href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"
						class="titlelong"
						style="vertical-align: middle; display: table-cell;"> <%
 	if (article.getTools() != null) {
 %> [<%=article.getTools()%> 을 이용한 강의] <%
 	}
 %> <%
 	if (article.getReadcount() >= 20) {
 %> <font color="red">HOT</font> <%
 	}
 %> <%=article.getTitle()%>
					</a></td>
					<td class="line" align="right" width="150px"
						style="text-align: center;"><%=foodingbean.findnkname(writerid)%>
					</td>
					<td width="150px" class="line" align="center"><%=sdf.format(article.getReg_date())%>
					</td>

					<td align="center" width="50" class="line" rowspan="2"><%=article.getReadcount()%>
					</td>
				</tr>



			</tbody>

			<%
				}
			%>
		</table>
		<%
			}
		%>
		<br>
		<center>

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


	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<%@include file="../general_included/footer.jsp"%>


</body>
</html>