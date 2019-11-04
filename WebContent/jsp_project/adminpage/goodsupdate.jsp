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
</head>
<body>
<%@include file="../general_included/topbar.jsp"%>
<br><br><br><br>
<table class="goodstb" border="1">
	<tr>
		<td>제목</td><td>믿고 거르는 거름망</td><td><input type="text"></td>
	</tr>
	<tr>
		<td>썸네일</td><td>../img/product/meetger.jpg</td><td><input type="text"></td>
	</tr>
	<tr>
		<td>가격</td><td>5000</td><td><input type="text"></td>
	</tr>
	<tr>
		<td>할인률</td><td>20</td><td><input type="text"></td>
	</tr>
	<tr>
		<td>분류1</td><td>1</td>
		<td>
			<select name="isTool">
			<option value='1'>도구1</option>
			<option value='2'>재료2</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>분류2</td><td>18</td>
		<td>
			<select name="productType">
			<option value='1'>과일</option>
			<option value='2'>채소</option>
			<option value='3'>정육/계란</option>
			<option value='4'>수산물/건어물</option>
			<option value='5'>과자/초콜릿/시리얼</option>
			<option value='6'>면/통조림/가공식품</option>
			<option value='7'>가루/조미료/오일</option>
			<option value='8'>장/소스/드레싱/식초</option>
			<option value='9'>유제품/아이스크림</option>
			<option value='10'>냉장/냉동/간편식</option>
			<option value='11'>주방가전</option>
			<option value='12'>냄비/프라이팬</option>
			<option value='13'>칼/도마</option>
			<option value='14'>테이블웨어</option>
			<option value='15'>밀폐용기</option>
			<option value='16'>주방수납/정리</option>
			<option value='17'>주방조리도구</option>
			<option value='18'>주방잡화</option>
			<option value='19'>일회용품</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>상태</td><td>품절</td>
		<td colspan="2">
			<select name="condition">
			<option value='1'>판매중</option>
			<option value='2'>준비중</option>
			<option value='3'>품절</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="3" align="center">
			<table style="border-collapse:collapse;">
				<tr>
					<td>
					<input type="button" onclick="location.href='#'" value="확인" class="findbutton" >
					</td>
					<td>
					<input type="button" onclick="location.href='goods.jsp'" value="취소" class="findbutton" >
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<%@include file="../general_included/footer.jsp"%>
</body>
</html>
