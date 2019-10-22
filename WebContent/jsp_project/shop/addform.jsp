<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니에 추가</title>
<link rel="stylesheet" href="../css/common.css">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="ddiyong.css">

<style>
.long td{
	width:200px;
	display:inline-block;
	white-space:nowrap;
	overflow:hidden;
	text-overflow:ellipsis;
	}
</style>
</head>
<body>
<%@include file="../general_included/topbar.jsp"%>
<br><br><br><br><br>

<div class="nemo" id="msn" style="float:left;">
<%@include file="sidemenu2.jsp"%>
</div>

<br>

<div>
<table style="width:900px; margin-left:300px; position:relative" border="1"><tr><td>
<img src="../img/defaultthumb.png" width="300px" height="300px">
</td><td>
도넛,도넛,도넛,도넛
</td></tr><tr><td>
9900원 [15%할인] = 8400
</td><td>
<input type="number" min="1" placeholder="수량">
</td></tr><tr><td colspan="2">
8400 * 수량 = ***
</td></tr></table></div>

<div style="float:right; margin-right:100px;">
<table border="1" class="long"><tr><td>
장바구니
</td></tr><tr><td>
1. 현대농산 국내외산 찰오곡밥 1kg(500g*2) 2세트구매시 사은품증정, 1개, (500g*2)
</td></tr><tr><td>
2. 농가정보서비스 (6+1) 찰진남매 프리미엄 잡곡 선물세트 B
</td></tr><tr><td>
3. 연희식품 고추씨(연희 1K)X5/식자재용/풋고추씨/식자재/업소용/식당
</td></tr><tr><td>
4. 상미씨네 선물세트3호[현미+귀리+찰흑미], 3개입
</td></tr><tr><td>
5. 김두원의 웰빙혼합잡곡 16곡*18봉+ 발아현미*2봉(총20봉 12kg), 없음
</td></tr><tr><td>
합계 : *****원
</td></tr></table></div>


<input type="submit" value="확인 및 추가">






<br><br><br><br><br><br> 
<%@include file="../general_included/footer.jsp"%>
<script>

</script>
</body>
</html>
