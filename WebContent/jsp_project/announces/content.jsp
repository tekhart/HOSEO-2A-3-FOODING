<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DBBean.foodingBean"%>
<%@ page import="DBBean.announceDataBean"%>
<%@ page import="DBBean.commentDataBean"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%!int commentpageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>
<%
	try {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		foodingBean dbPro = foodingBean.getInstance();
		announceDataBean article = dbPro.getannounceArticle(num);

		foodingBean foodingbean = new foodingBean();
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
	function youreally(){
		if(confirm("한번 삭제된 글은 복구가 불가능 합니다.\n정말 삭제하시겠습니까?")){
			location.href="deletePro.jsp?num=<%=num%>&pageNum=<%=pageNum%>
	"
		}
	}
</script>
</head>
<body>
	<%@include file="../general_included/topbar.jsp"%>

	<div id="maindiv2">

		<table class="contenttable">
			<tr>
				<td class="orangeline11" rowspan="2" width="1000px" height="100px"
					align="center"><h2><%=article.getTitle()%></h2></td>
				<td class="orangeline111" align="right"
					style="color: #9C9C9C; font-size: 25px; width: 100px;"><%=foodingbean.findnkname(article.getWriterid())%>
				</td>
			</tr>
			<tr class="orangeline1">
				<td align="right"
					style="color: #9C9C9C; font-size: 25px; width: 100px;"><%=article.getReadcount()%>
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
			<tr class="orangeline">

				<%
					if (isAdmin == 1) {
				%>
				<td width="350px" height="55px"><input type="button"
					value="글수정" class="bt2"
					onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
					<input type="button" value="글삭제" class="bt2" onclick="youreally()">
				</td>
				<td width="800px">일자 : <%=article.getReg_date()%></td>
				<%
					} else {
				%>
				<td width="1150px" style="text-align: right;" height="55px"
					colspan="2">일자 : <%=article.getReg_date()%></td>
				<%
					}
				%>


			</tr>


		</table>



	</div>
	<%@include file="../general_included/footer.jsp"%>

</body>
</html>
<%
	} catch (Exception e) {

	}
%>