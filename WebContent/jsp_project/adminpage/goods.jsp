<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<table border="1" width="700px" style="margin:auto">
	<tr>
		<td>제목</td>
		<td>썸네일</td>
		<td>가격</td>
		<td>할인율</td>
		<td>분류1</td>
		<td>분류2</td>
		<td>수정</td>
		<td>삭제</td>
		<td>상태</td>
	</tr>
	<tr>
		<td>초코우유2+2</td>
		<td>../img/product/choco.jpg</td>
		<td>5000</td>
		<td>10</td>
		<td>2</td>
		<td>9</td>
		<td><input type="button" onclick="location.href='goodsupdate.jsp'" value="수정"></td>
		<td><input type="button" onclick="location.href='goodsdelete.jsp'" value="삭제"></td>
		<td>판매중</td>
	</tr>
	<tr>
		<td>믿고 거르는 거름망</td>
		<td>../img/product/meetger.jpg</td>
		<td>5000</td>
		<td>20</td>
		<td>1</td>
		<td>18</td>
		<td><input type="button" onclick="location.href='goodsupdate.jsp'" value="수정"></td>
		<td><input type="button" onclick="location.href='goodsdelete.jsp'" value="삭제"></td>
		<td>품절</td>
	</tr>
	<tr>
		<td>다 썰어버리는 장미칼</td>
		<td>../img/product/rose.jpg</td>
		<td>12000</td>
		<td>20</td>
		<td>1</td>
		<td>13</td>
		<td><input type="button" onclick="location.href='goodsupdate.jsp'" value="수정"></td>
		<td><input type="button" onclick="location.href='goodsdelete.jsp'" value="삭제"></td>
		<td>준비중</td>
	</tr>
	<tr>
		<td>주걱주걱주걱</td>
		<td>../img/product/reaper.jpg</td>
		<td>9000</td>
		<td>5</td>
		<td>1</td>
		<td>17</td>
		<td><input type="button" onclick="location.href='goodsupdate.jsp'" value="수정"></td>
		<td><input type="button" onclick="location.href='goodsdelete.jsp'" value="삭제"></td>
		<td>판매중</td>
	</tr>
</table>
<br>
<table border="1" width="600px" style="margin:auto;">
	<tr>
		<td colspan="6" align="center">참고 표</td></tr>
	<tr>
		<td colspan="3" width="300px" align="center">재료 : 2</td>
		<td colspan="3" width="300px" align="center">도구 : 1</td>
	</tr>
	<tr>
		<td colspan="2">과일</td>
		<td colspan="1">1</td>
		<td colspan="2">주방가전</td>
		<td colspan="1">11</td>
	</tr>
	<tr>
		<td colspan="2">채소</td>
		<td colspan="1">2</td>
		<td colspan="2">냄비/프라이팬</td>
		<td colspan="1">12</td>
	</tr>
	<tr>
		<td colspan="2">축산/계란</td>
		<td colspan="1">3</td>
		<td colspan="2">칼/도마</td>
		<td colspan="1">13</td>
	</tr>
	<tr>
		<td colspan="2">수산물/건어물</td>
		<td colspan="1">4</td>
		<td colspan="2">테이블웨어</td>
		<td colspan="1">14</td>
	</tr>
	<tr>
		<td colspan="2">과자/초콜릿/시리얼</td>
		<td colspan="1">5</td>
		<td colspan="2">밀폐용기</td>
		<td colspan="1">15</td>
	</tr>
	<tr>
		<td colspan="2">면/통조림/가공식품</td>
		<td colspan="1">6</td>
		<td colspan="2">주방수납/정리</td>
		<td colspan="1">16</td>
	</tr>
	<tr>
		<td colspan="2">가루/조미료/오일</td>
		<td colspan="1">7</td>
		<td colspan="2">주방조리도구</td>
		<td colspan="1">17</td>
	</tr>
	<tr>
		<td colspan="2">장/소스/드레싱/식초</td>
		<td colspan="1">8</td>
		<td colspan="2">주방잡화</td>
		<td colspan="1">18</td>
	</tr>
	<tr>
		<td colspan="2">유제품/아이스크림</td>
		<td colspan="1">9</td>
		<td colspan="2">일회용품</td>
		<td colspan="1">19</td>
	</tr>
	<tr>
		<td colspan="2">냉장/냉동/간편식</td>
		<td colspan="1">10</td>
		<td colspan="2"> </td>
		<td colspan="1"> </td>
	</tr>
	<tr>
		<td align="center" colspan="6"><input type="button" value="상품 업로드" onclick="location.href='shopupload.jsp'">
		</td>
	</tr>
</table>
</body>
</html>
