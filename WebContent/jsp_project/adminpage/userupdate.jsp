<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="admincss.css">
<script type="text/javascript">
	function sendingthumb(thumbname){
              $("#thumbnail").css("background-image","url("+thumbname+")");
              $("#thumbnail").innerhtml="";
              $("#inputthumbnail").val(thumbname);

	}
	function thumbnailupload(){
		window.open("thumbUpload/fileForm.jsp", "a", "width=400, height=300, left=100, top=50"); 
	}
</script>
</head>

<body>
<%@include file="../general_included/topbar.jsp"%>
	<%
		foodingBean dbPro = foodingBean.getInstance();
		userDataBean article = null; 
		
		article=dbPro.getuserArticle(idlogin);

	%>
<br><br><br><br>
<form method="post" action="userupdatePro.jsp" >
	<table border="1" class="usertrtd">
		<tr>
			<td>
				<div onclick="thumbnailupload()" style="background-image:url(<%=article.getUserface()%>);width:200px; height:200px;background-size:cover;background-position:center;">
					현 프로필 사진
				</div>
			</td>
			<td>
				<div onclick="thumbnailupload()" id="thumbnail" style="background-image:url('../img/defaultface.png');width:200px; height:200px;background-size:cover;background-position:center;">
					이후 프로필 사진
				</div>
				<input type="hidden" name="userface" value="../img/defaultface.png">
			</td>
		</tr>
		<tr>
			<td><b>현재 닉네임</b></td>
			<td><%=article.getNkname()%></td>
		</tr>
		<tr>
			<td><b>변경할 닉네임</b></td>
			<td><input type="text" name="nkname" size="20"></td>
		</tr>
		<tr>
			<td><b>아이디</b></td>
			<td><%=article.getId() %></td>
			<input type="hidden" name="id" value="<%=article.getId()%>">
		</tr>
		<tr>
			<td><b>가입일</b></td>
			<td><%=article.getReg_date() %></td>
		</tr>
		<tr>
			<td align="center" colspan="2"><input type="button" value="작성 글 보기" class="findbutton2"></td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<table>
					<tr>
						<td><input type="submit" value="확인" class="findbutton"></td>
						<td><input type="button" value="취소" class="findbutton" onclick="location.href='userlist.jsp'"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
<%@include file="../general_included/footer.jsp"%>
</body>
</html>
