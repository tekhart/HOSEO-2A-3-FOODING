<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<link rel="stylesheet" href="../jsp_project/css/common.css">
<link rel="stylesheet" href="../jsp_project/css/list.css">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<style>
.askf td {
	height: 25px;
	padding: 5px;
	border-bottom: 1px solid #ffe699;
}

.askf2 td {
	height: 25px;
	padding: 5px;
	border-bottom: 2px solid orange;
}

.askf3 td {
	border-top: 1px solid #ffe699;
}

.askf5 {
	border-right: 1px solid #ffe699;
}

.whiteinput {
	border-color: white;
	width: 800px;
	border-style: solid;
	"
}
</style>
<script>
function thumbnailupload(){
	window.open("../general_included/thumbUpload/fileForm.jsp?storeplace=uploaded", "a", "width=400, height=300, left=100, top=50"); 
}

var close = document.getElementsByClassName("close");
var i;
for (i = 0; i < close.length; i++) {
	close[i].onclick = function() {
		var div = this.parentElement;
		div.remove();
	}
}

//Create a new list item when clicking on the "Add" button
function sendingthumb(thumbname) {
	var li = document.createElement("div");
	document.getElementById("attached").appendChild(li);
	
	var image_detail = document.createElement("a");
	image_detail.setAttribute("target","_blank");
	image_detail.setAttribute("href",thumbname);
	li.appendChild(image_detail);
	
	var attacheimg = document.createElement("img");
	attacheimg.src=thumbname;
	attacheimg.style.cssText="width:175px";
	image_detail.appendChild(attacheimg);
	var span = document.createElement("SPAN");
	var txt = document.createTextNode("\u00D7");
	span.className = "close";
	span.appendChild(txt);
	li.appendChild(span);
	
	for (i = 0; i < close.length; i++) {
		close[i].onclick = function() {
			var div = this.parentElement;
			div.remove();
		}
	}
}
</script>
</head>
<body>
	<%@include file="../general_included/topbar.jsp"%>
	<form method="post" action="askPro.jsp" name="askform">
		<input type="hidden" name="writerid" value="<%=idlogin %>">
		<input type="hidden" name="atteched" value="<%=idlogin %>">
		<table style="border-spacing: 0px; margin: auto;" width="1000px">
			<tr class="askf2">
				<td></td>
				<td><p style="text-align: right;">* 표시가 있는 항목은 필수입력 사항입니다.</p></td>
			</tr>
			<tr class="askf">
				<td class="askf5">&nbsp;제목</td>
				<td><input type="text" name="title" class="whiteinput"></td>
			</tr>
			<tr class="askf">
				<td class="askf5">*문의유형</td>
				<td>
					<select style="padding: 10px;" name="asktype">
						<option selected disabled hidden>유형</option>
						<option value='일반문의'>일반문의</option>
						<option value='개선제안'>개선제안</option>
						<option value='게시판'>게시판</option>
						<option value='검색'>검색</option>
						<option value='탈퇴문의'>탈퇴문의</option>
					</select>
				</td>
			</tr>
			<tr class="askf">
				<td class="askf5">*내용</td>
				<td><textarea style="resize: none; border: white;" rows="30" name="content"
						cols="110"></textarea></td>
			</tr>
			<tr class="askf2">
				<td class="askf5">&nbsp;파일첨부</td>
				<td>
					<div id="attached"></div>
					<input type="button" value="파일 찾기" class="findbutton" onclick="thumbnailupload()">
				</td>
			</tr>
			<tr>
				<td class="askf2"></td>
				<td><br> <br> 개인정보 수집/이용에 대한 안내<br> 필수 수집/이용
					항목(문의 접수와 처리, 회신을 위한 최소한의 개인정보입니다.) <br> <br>
					<table style="border-spacing: 0px;">
						<tr class="askf askf3">
							<td>수집항목</td>
							<td>목적</td>
							<td>보유기간</td>
						</tr>
						<tr class="askf">
							<td>이메일 주소</td>
							<td>고객 문의 및 상담요청에 대한 회신,<br>상담을 위한 서비스 이용기록 조회
							</td>
							<td>문의 접수 후 3개월간 보관</td>
						</tr>
					</table> <br> <br> <input type="checkbox">위 내용에 동의합니다.</td>
			</tr>
	
		</table>
	
		<div style="float: right; margin-right: 500px;">
			<input type="button" value="작성완료" class="findbutton" onclick="writeEnd()">
			<input type="button" value="취소" class="findbutton">
		</div>
	</form>
	<%@include file="../general_included/footer.jsp"%>

	<script>
		var checkload = true;
		jQuery(document).ready(function($) {
		    $("#btn_submit").click(function () {
		        checkload = false;
		    });
		    $(window).on("beforeunload", function () {
		        if (checkload == true) return "정말로 나가시겠습니까?";
		    });
		});
		function writeEnd(){
			if(document.askform.title.value==""){
				alert("제목을 입력해 주세요");
				document.askform.title.focus();
			}else if(document.askform.asktype.value=="유형"){
				alert("문의 유형을 선택해 주세요");
				document.askform.asktype.focus();
			}else if(document.askform.content.value==""){
				alert("내용을 입력해 주세요");
				document.askform.content.focus();
			}else{
				checkload=false;
				document.askform.atteched.value=document.getElementById("attached").innerHTML;
				document.askform.submit();
			}
		}
	</script>
</body>
</html>
