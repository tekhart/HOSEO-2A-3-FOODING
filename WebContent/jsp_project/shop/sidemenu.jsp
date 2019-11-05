<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="../css/list.css">
<style>
body {
font-family: 'Nanum Gothic', sans-serif;
}

/* Fixed sidenav, full height */
.sidenav {
float:left;
	height: 1000px;
	width: 230px;
	background-color: white;
	padding-top: 20px;
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 20px;
	
	display: block;
	border: none;
	back.ground: none;
	width: 100%;
	text-align: left;
	cursor: pointer;
	outline: none;
}

/* On mouse-over */
.sidenav a:hover, .dropdown-btn:hover {
	color: gray;
}

/* Main content */
.main {
	margin-left: 200px; /* Same as the width of the sidenav */
	font-size: 20px; /* Increased text to enable scrolling */
	padding: 0px 10px;
}

/* Add an active class to the active dropdown button */
.active {
	background-color: green;
	color: white;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
	display: none;
}

.dropdown-btn{font-size:30px;}
.apsb2 a:not(.wofyehrn){background-color:white;}
.wofyehrn{background-color:orange; height:50px; line-height:40px;}
.wofyehrnp{ color:white; font-size:30px;}

/* Optional: Style the caret down icon */
.fa-caret-down {
	float: right;
	padding-right: 8px;
}

/* Some media queries for responsiveness */
@media screen and (max-height: 450px) {
	.sidenav {padding-top: 15px;}
	.sidenav a {font-size: 18px;}
}
</style>
</head>
<body>

<div class="sidenav">

<button class="dropdown-btn" id="apsb">메뉴
<i class="fa fa-caret-down"></i>
</button>
	<div id="apsb2">
		<a href="main.jsp">상점 메인</a>
		<a href="../mypages/point.jsp">내 포인트</a>
		<a href="../mypages/shopbasket.jsp">장바구니</a>
		<a class="wofyehrn" href="main.jsp?isTool=2"><span class="wofyehrnp">재료</span></a>
		<a href="main.jsp?productType=1">과일</a> 
		<a href="main.jsp?productType=2">채소 </a>
		<a href="main.jsp?productType=3">축산/계란</a> 
		<a href="main.jsp?productType=4">수산물/건어물</a> 
		<a href="main.jsp?productType=5">과자/초콜릿/시리얼</a> 
		<a href="main.jsp?productType=6">면/통조림/가공식품</a> 
		<a href="main.jsp?productType=7">가루/조미료/오일</a> 
		<a href="main.jsp?productType=8">장/소스/드레싱/식초</a> 
		<a href="main.jsp?productType=9">유제품/아이스크림</a> 
		<a href="main.jsp?productType=10">냉장/냉동/간편식</a>
		<a class="wofyehrn" href="main.jsp?isTool=1"><span class="wofyehrnp">도구</span></a>
		<a href="main.jsp?productType=11">주방가전</a> 
		<a href="main.jsp?productType=12">냄비/프라이팬</a> 
		<a href="main.jsp?productType=13">칼/도마</a> 
		<a href="main.jsp?productType=14">테이블웨어</a> 
		<a href="main.jsp?productType=15">밀폐용기</a> 
		<a href="main.jsp?productType=16">주방수납/정리</a> 
		<a href="main.jsp?productType=17">주방조리도구</a> 
		<a href="main.jsp?productType=18">주방잡화</a> 
		<a href="main.jsp?productType=19">일회용품</a>
	</div>
</div>

<script>
/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
	dropdown[i].addEventListener("click", function() {
	this.classList.toggle("active");
	var dropdownContent = this.nextElementSibling;
	if (dropdownContent.style.display === "block") {
	dropdownContent.style.display = "none";
	} else {
	dropdownContent.style.display = "block";
	}
	});
}


</script>

</body>
</html> 
