<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table class="goodstb" border="1">
	<tr>
		<td>제목</td><td>믿고 거르는 거름망</td>
	</tr>
	<tr>
		<td>썸네일</td><td>../img/product/meetger.jpg</td>
	</tr>
	<tr>
		<td>가격</td><td>5000</td>
	</tr>
	<tr>
		<td>할인률</td><td>20</td>
	</tr>
	<tr>
		<td>분류1</td><td>1</td>
	</tr>
	<tr>
		<td>분류2</td><td>18</td>
	</tr>
	<tr>
		<td>상태</td><td>품절</td>
	</tr>
	<tr>
		<td colspan="3" align="center">
			<table style="border-collapse:collapse;">
				<tr>
					<td>
					<input type="button" onclick="okdelete()" value="삭제">
					</td>
					<td>
					<input type="button" onclick="location.href='goods.jsp'" value="취소">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<script>
function okdelete(){
	confirm('이 상품을 등록 해제 하시겠습니까?');
}
</script>
</body>
</html>