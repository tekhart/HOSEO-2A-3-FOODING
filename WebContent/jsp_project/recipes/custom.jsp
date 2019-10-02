<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="list.css">
<meta charset="UTF-8">
<title>맞춤 레시피</title>
</head>
<body>
<%@include file="../general_included/topbar.jsp"%>
<br>
<br><br><br>
<table border="1" class="customtb">
<tr><td>상황별 요리</td><td>나라별 요리</td><td>재료별 요리</td><td>조리법별 요리</td><td>도구별 요리</td></tr>
<tr><td>
	<input type="checkbox" value="간식">간식<br>
	<input type="checkbox" value="야식">야식<br>
	<input type="checkbox" value="안주">안주<br>
	<input type="checkbox" value="해장">해장<br>
	<input type="checkbox" value="접대">접대<br>
	<input type="checkbox" value="나들이">나들이<br>
	<input type="checkbox" value="파티">파티<br>
	<input type="checkbox" value="명절">명절<br>
	<input type="checkbox" value="실생활">실생활
</td><td>
	<input type="checkbox" value="한식">한식<br>
	<input type="checkbox" value="중식">중식<br>
	<input type="checkbox" value="일식">일식<br>
	<input type="checkbox" value="동남아/인도">동남아/인도<br>
	<input type="checkbox" value="멕시칸">멕시칸<br>
	<input type="checkbox" value="양식">양식<br>
	<input type="checkbox" value="퓨전">퓨전<br>
	<input type="checkbox" value="이국적인">이국적인
</td><td>
	<input type="checkbox" value="육류">육류<br>
	<input type="checkbox" value="채소류">채소류<br>
	<input type="checkbox" value="해산물">해산물<br>
	<input type="checkbox" value="콩/두부">콩/두부<br>
	<input type="checkbox" value="과일">과일<br>
	<input type="checkbox" value="달걀/유제퓸">달걀/유제퓸<br>
	<input type="checkbox" value="만두">만두<br>
	<input type="checkbox" value="밀가루">밀가루<br>
	<input type="checkbox" value="김치">김치<br>
	<input type="checkbox" value="가공식품">가공식품
</td><td>
	<input type="checkbox" value="밥">밥<br>
	<input type="checkbox" value="면">면<br>
	<input type="checkbox" value="국물">국물<br>
	<input type="checkbox" value="찜/조리/구이">찜/조리/구이<br>
	<input type="checkbox" value="볶음/튀김/부침">볶음/튀김/부침<br>
	<input type="checkbox" value="나물/샐러드">나물/샐러드<br>
	<input type="checkbox" value="김장/절임">김장/절임<br>
	<input type="checkbox" value="베이킹/디저트">베이킹/디저트<br>
	<input type="checkbox" value="양념/소스/잼">양념/소스/잼<br>
	<input type="checkbox" value="음료/차/커피">음료/차/커피
</td><td>
	<input type="checkbox" value="칼">칼<br>
	<input type="checkbox" value="믹서기">믹서기<br>
	<input type="checkbox" value="가스레인지">가스레인지<br>
	<input type="checkbox" value="냄비">냄비<br>
	<input type="checkbox" value="오븐">오븐<br>
	<input type="checkbox" value="전자레인지">전자레인지<br>
	<input type="checkbox" value="냉장고">냉장고<br>
	<input type="checkbox" value="타이머">타이머<br>
</td></tr>


<tr><td colspan="4">여기는 선택된 태그들이 있는곳</td><td><input type="submit" value="검색"></td></tr>


<tr><td colspan="5">

<table style="width:200px; margin:auto;"><tr><td><input type="text" placeholder="아무거나 검색해 보세요!"></td>
<td><input type="submit" value="추가"></td></tr></table>



</td></tr></table>
	


</body>
</html>
