<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.foodingBean"%>
<%@ page import="DBBean.announceDataBean"%>
<%@ page import="DBBean.commentDataBean"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%!int commentpageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
<%
	
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/list.css">

<style>
</style>
<title>게시판, 글 보기</title>

<script type="text/javascript">
	function AnsUpdDelComment(num, content, ref, re_step, re_level, counter,
			selected) {
		var form = document.iregularcommentform;
		var commentchangeform = document
				.getElementsByClassName("commentchangeform");

		form.num.value = num;
		form.ref.value = ref;
		form.re_step.value = re_step;
		form.re_level.value = re_level;
		form.selected.value = selected;

		for (i = 0; i < commentchangeform.length; i++) {
			commentchangeform[i].innerHTML = "";
		}
		commentchangeform[counter].innerHTML = "<textarea name='content' size='40' rows='5' cols='40' class='signupinput' style='ime-mode:inactive;'></textarea><input type='submit'  value='답글쓰기' class='bt2'>";

	}
</script>
</head>
<body>
	<%@include file="../general_included/topbar.jsp"%>

	<div id="maindiv2">
		<%
			try {
				int num = Integer.parseInt(request.getParameter("num"));
				String pageNum = request.getParameter("pageNum");
				foodingBean dbPro = foodingBean.getInstance();
				announceDataBean article = dbPro.getannounceArticle(num);

				foodingBean foodingbean = new foodingBean();

				String commnetpageNum = request.getParameter("commnetpageNum");

				if (commnetpageNum == null) {
					commnetpageNum = "1";
				}
				int currentPage = Integer.parseInt(commnetpageNum);
				int startRow = (currentPage - 1) * commentpageSize + 1;
				int endRow = currentPage * commentpageSize;
				int count = 0;
				List<commentDataBean> commentList = null;
				count = dbPro.getannounceCommentArticleCount(num);

				if (count > 0) {
					commentList = dbPro.getannounceCommentsArticles(startRow, commentpageSize, num);
				}
		%>
		<table class="contenttable" border="1">
			<tr>
				<td class="orangeline11" rowspan="2" width="1000px" height="100px"
					align="center"><h2><%=article.getTitle()%></h2></td>
				<td class="orangeline111" align="right"
					style="color: #e0e0e0; font-size: 30px;"><%=foodingbean.findnkname(article.getWriterid())%>
				</td>
			</tr>
			<tr class="orangeline1">
				<td align="right" style="color: #e0e0e0; font-size: 30px;"><%=article.getReadcount()%>
					view</td>
			</tr>
			<tr class="orangeline">
				<td colspan="2" height="600px">
					<table width="1150px"
						style="margin: auto; margin-top: 15px; margin-bottom: 15px; table-layout: fixed; word-wrap: break-word; border-collapse: collapse;">
						<tr>
							<td style="vertical-align: text-top;"><pre><%=article.getContent()%></pre>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr class="orangeline"><!-- 여기서 오류가 남 -->
	
					 	<%
						if (article.getWriterid().equals(idlogin)) {
					%>
					<td>
					<input type="button" value="글수정"
					onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
					<input type="button" value="글삭제"
					onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
					</td>
					<td>일자 : <%=article.getReg_date()%></td>
					<%
						}else{%>
							<td></td>
							<td>일자 : <%=article.getReg_date()%></td>
						<%}%>
				
				
			</tr>
<%
			} catch (Exception e) {
				
			}
		%>
		
		</table>


		
	</div>
	<%@include file="../general_included/footer.jsp"%>

</body>
</html>