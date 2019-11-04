<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>프로필 사진/닉네임 변경</title>
		<link rel="stylesheet" href="../css/common.css">
		<link rel="stylesheet" href="../css/list.css">
		<link rel="shortcut icon" href="../img/favicon.ico">
		<link rel="icon" href="../img/favicon.ico">
		<link rel=stylesheet type=text/css
			href="../../daumeditor/css/editor.css" charset=utf-8 />
		<script type="text/javascript">
			function sendingthumb(thumbname){
		              $("#thumbnail").css("background-image","url("+thumbname+")");
		              $("#thumbnail").innerhtml="";
		              $("#inputthumbnail").val(thumbname);
		
			}
			function thumbnailupload(){
				window.open("faceUpload/fileForm.jsp", "a", "width=400, height=300, left=100, top=50"); 
			}
		</script>
	</head>
	<body>
		<%@include file="../general_included/topbar.jsp"%>
		<%
			foodingBean dbPro = foodingBean.getInstance();
			userDataBean article = null; 
			
			article=dbPro.getuserArticle(idlogin);
			
			String nk=article.getNkname();
		%>
		<div id="maindiv">
			<%@include file="sidemenu.jsp"%>
			<div class="writetitle1">프로필 사진/닉네임 변경</div>
			<form method="post" action="FaceAndNknameUpdatePro.jsp" >
				<fieldset style="margin:auto;">
					<legend>프로필</legend>
					<input type="hidden" name="id" value="<%=idlogin %>">
					<input type="hidden" name="userface" value="<%=article.getUserface() %>" id="inputthumbnail">
					
					<table width="80%" height="250px" style="font-size:25px; text-align:center;">
						<tr>
							<td colspan="2">다른 사람들에게 보여지는 정보입니다<br>&nbsp;</td>
						</tr>
						<tr>			
							<td width="50%">
								<div onclick="thumbnailupload()" id="thumbnail";
									style="width:200px; height:200px; border-radius:50%; border:3px solid orange; background-image:url(<%=article.getUserface() %>); background-size:cover; background-position:center;"/>
							</td>
							<td>
								<b>닉네임 </b><br>
								<input type="text" class="signupinputs" name="nkname" value="<%=nk %>">
							</td>
						</tr>
					</table>
					<input type="submit" value="수정" class="findbutton">
				</fieldset>
			</form>
			
		</div>
	</body>
</html>
