<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 확인</title>
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="admincss.css">

</head>
<body>
<%@include file="../general_included/topbar.jsp"%>
<br><br>
<table class="adminstb4" border="1">
<tr>
<td>선택</td>
<td>유형</td>
<td>제목</td>
<td>내용 미리보기</td>
<td>ID</td>
<td>일자</td>
</tr>

<tr>
<td><input type="checkbox"></td>
<td>일반문의</td>
<td><a href="askdetail.jsp">포인트가 없는데 포인트가 써져요</a></td>
<td>죄송해요 구라예요 제가 쓴글 인기글 보내주세요 ㅋㅋㅋㅋㅋㅋㅋ</td>
<td>jefkjde</td>
<td>2019-11-04</td>
</tr>

<tr>
<td><input type="checkbox"></td>
<td>게시판</td>
<td><a href="askdetail.jsp">dhsjd가 쓴 글이 이상합니다.</a></td>
<td>파리바게트에서 케이크 사다가 자기가 만들었다고 우기네요</td>
<td>asdfase</td>
<td>2019-10-17</td>
</tr>

<tr>
<td><input type="checkbox"></td>
<td>게시판</td>
<td><a href="askdetail.jsp">지금 서버 터진건가요?</a></td>
<td>글 작성누르면 계속 팅기는데 ..</td>
<td>asdhhhe</td>
<td>2019-10-09</td>
</tr>

<tr>
<td><input type="checkbox"></td>
<td>일반문의</td>
<td><a href="askdetail.jsp">포인트 문의예요</a></td>
<td>제가 20000짜리 컵을 샀는데 2포인트밖에 안 쌓였습니다.</td>
<td>fkhkrrr</td>
<td>2019-09-27</td>
</tr>
</table>

<br>
<center>
<input type="button" value="선택 삭제"  class="findbutton">
</center>

<%@include file="../general_included/footer.jsp"%>
</body>
</html>
