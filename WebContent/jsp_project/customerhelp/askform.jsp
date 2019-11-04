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
.askf td{
	height:25px;
	padding:5px;
	border-bottom:1px solid #ffe699;
}

.askf2 td{
	height:25px;
	padding:5px;
	border-bottom:2px solid orange;
}

.askf3 td{
	border-top:1px solid #ffe699;
}

.askf5 {
	border-right:1px solid #ffe699;
}

.whiteinput{
	border-color:white;
	width:800px;
	border-style:solid;"
}


</style>
</head>
<body>
<%@include file="../general_included/topbar.jsp"%>
 
<table style="border-spacing:0px; margin:auto;" width="1000px">
<tr class="askf2"><td></td><td><p style="text-align:right;">* 표시가 있는 항목은 필수입력 사항입니다.</p></td></tr>
<tr class="askf"><td class="askf5">&nbsp제목</td><td><input type="text" class="whiteinput"></td></tr>
<tr class="askf"><td class="askf5">*이메일</td><td><input type="text" class="whiteinput" placeholder="예시) fooding@food.net"></td></tr>
<tr class="askf"><td class="askf5">*문의유형</td><td>
	<select style="padding:10px;">
	<option value='' selected disabled hidden >유형</option>
	<option value='일반문의'>일반문의</option>
	<option value='개선제안'>개선제안</option>
	<option value='게시판'>게시판</option>
	<option value='검색'>검색</option>
	<option value='탈퇴문의'>탈퇴문의</option>
	</select>
	</td></tr>
<tr class="askf"><td class="askf5">*내용</td><td><textarea style="resize: none; border:white;" rows="30" cols="110"></textarea></td></tr>
<tr class="askf2"><td class="askf5">&nbsp파일첨부</td><td><input type="button" value="파일 찾기" class="findbutton"></td></tr>
<tr><td class="askf2"></td><td>
<br><br>
개인정보 수집/이용에 대한 안내<br>
필수 수집/이용 항목(문의 접수와 처리, 회신을 위한 최소한의 개인정보입니다.)
<br><br>
<table style="border-spacing:0px;">
<tr class="askf askf3"><td>수집항목</td><td>목적</td><td>보유기간</td></tr>
<tr class="askf"><td>이메일 주소</td><td>고객 문의 및 상담요청에 대한 회신,<br>상담을 위한 서비스 이용기록 조회</td><td>문의 접수 후 3개월간 보관</td></tr>
</table>
<br><br>
<input type="checkbox">위 내용에 동의합니다.
</td></tr>

</table>

<div style="float:right; margin-right:500px;">
<input type="button" value="작성완료" class="findbutton" onclick="location.href='../mypages/loading.jsp'">
<input type="button" value="취소" class="findbutton">
</div>

<%@include file="../general_included/footer.jsp"%>
</body>
</html>
