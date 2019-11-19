<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.foodingBean"%>
<%@ page import="DBBean.QuestionDataBean"%>
<%@ page import="DBBean.commentDataBean"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.List"%>
<%!int commentpageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
<%
	try {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		foodingBean dbPro = foodingBean.getInstance();
		QuestionDataBean article = dbPro.getquestionArticle(num);

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
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/list.css">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">

<style>
</style>
<title>게시판</title>

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
	function youreally(){
		if(confirm("한번 삭제된 글은 복구가 불가능 합니다.\n정말 삭제하시겠습니까?")){
			location.href="deletePro.jsp?num=<%=num%>&pageNum=<%=pageNum%>";
		}
	}
</script>
</head>
<body>
	<%@include file="../general_included/topbar.jsp"%>

	<div id="maindiv2">
		<br> <br> <br> <input type="hidden" name="num"
			value="<%=article.getNum()%>"> <input type="hidden"
			name="ref" value="<%=article.getRef()%>"> <input
			type="hidden" name="re_step" value="<%=article.getRe_step()%>">
		<input type="hidden" name="re_level"
			value="<%=article.getRe_level()%>">
		<table style="margin: auto;" class="contenttable">
			<tr>
				<td rowspan="2" width="800px" style="text-align: center;"
					class="orangeline11" height="100px"><h2><%=article.getTitle()%></h2></td>
				<td class="orangeline111" align="right"
					style="color: #9C9C9C; font-size: 25px;"><%=sdf.format(article.getReg_date())%></td>
			<tr>
				<td class="orangeline1" align="right"
					style="color: #9C9C9C; font-size: 25px;"><%=foodingbean.findnkname(article.getWriterid())%></td>
			</tr>
			</tr>
			<tr>

			</tr>
			<tr class="orangeline1">
				<td colspan="2" height="600px"><table width="1000px"
						style="margin: auto; margin-top: 15px; margin-bottom: 15px; table-layout: fixed; word-wrap: break-word; border-collapse: collapse;">
						<tr>
							<td style="vertical-align: text-top;"><pre><%=article.getContent()%></pre>
							</td>
						</tr>
					</table></td>
			</tr>
			<%
				if (article.getWriterid().equals(idlogin)) {
			%>
			<tr>

				<td colspan="2">
					<input type="button" value="글수정"
						class="smallbt"
						onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
					<input type="button" value="글삭제" class="smallbt" onclick="youreally()">
				</td>

			</tr>
			<%
				} else {
			%>

			<%
				}
			%>
			<tr height="60px">
				<td class="orangeline11">
					<%
						if (session.getAttribute("idlogin") != null) {
					%> <input type="button" value="답글쓰기" class="smallbt"
					onclick="document.location.href='writeForm.jsp?num=<%=article.getNum()%>&ref=<%=article.getRef()%>&re_step=<%=article.getRe_step()%>&re_level=<%=article.getRe_level()%>'">
					<%
						}
					%>
				</td>
				<td colspan="2" class="orangeline11"><input type="button"
					value="글목록" class="smallbt"
					style="float: right; border: 1px solid #ffbb00;"
					onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'"></td>
			</tr>
		</table>

		&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;

		</td>
		</tr>

		</table>
		<br>


	</div>



	<%@include file="../general_included/footer.jsp"%>

</body>
</html>
<%
	} catch (Exception e) {
	}
%>