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
<table style="width:1000px; margin:auto;">
<tr><td>

<table border="1" class="asktb0" style="width:1000px; margin:auto; border-collapse:collapse;">
<tr><td>유형</td><td>일반문의</td><td>ID</td><td>jefkjde</td><td>일자</td><td>2019-11-04</td></tr>
</table>
<br>
<table border="1" class="asktb1" width="1000px">
<tr>
<td>제목</td><td>포인트가 없는데 포인트가 써져요</td>
</tr>
<tr>
<td>내용</td><td>죄송해요 구라예요 제가 쓴글 인기글 보내주세요 ㅋㅋㅋㅋㅋㅋㅋ<br>
열심히 썼는데 아무도 안봐요....... ㅠㅠ<br>
제가 이 사이트 가입해서 물건도 많이사고 지금 포인트도 1400이나 있습니다...<br>
근데 인기글은 하나도 없다는거? 주작이죠 </td>
</tr>
<tr>
<td>첨부파일</td>
<td>
첨부파일이 없습니다.<br>
or<br>

<div style="width:200px; height:200px; background-image:url(../img/coffee.jpg); background-size:cover; background-position:center;">
</div>

</td>
</tr>
</table>
</td></tr></table>

<center>
<input type="button" value="확인" class="findbutton" onclick="location.href='asklist.jsp'">
</center>
<%@include file="../general_included/footer.jsp"%>
</body>
</html>
