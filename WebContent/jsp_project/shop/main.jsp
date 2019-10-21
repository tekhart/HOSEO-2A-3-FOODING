<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 구매</title>
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/list.css">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<%@include file="../general_included/topbar.jsp"%>
<%@include file="move.jsp"%>
<style>
.card {
    -webkit-transition: 0.3s;
 	 transition: 0.3s;
 	 max-width: 300px;
 	 margin: 28px;
  	 max-height:610px;
   float:left;
     font-family: arial;
 	 text-align: center;
 	 display: inline-block;
 	 box-shadow:0 2px 2px 0 rgba(0,0,0,0.2)
}

.card:hover {
  box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2)
}
</style>
</head>
<body>
<div id="maindiv">
<div class="writetitle1">
재료구매</div>
<br><br><br>
<table style="width:1300px; margin:auto; text-align:center;"><tr><td><img src="../img/fork.png" width="30px" height="30px"></td>
<td>정육</td><td>|</td><td>수산</td><td>|</td><td>과일/채소</td><td>|</td>
<td>유제품</td><td>|</td><td>빵/과자</td><td>|</td><td>조리도구</td></tr></table>

<br><br><br><br><br> 



  <div class="card">
  <img src="../img/cupcakes-1850628_1920.jpg" alt="dang" style="width:100%">
  <h1>컵케이크 만들기 <br> 키트A</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>자세히 보기</button></p></div>


  <div class="card">
  <img src="../img/cake-1914463_1920.jpg" alt="ding" style="width:100%">
  <h1>초코 재료</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>자세히 보기</button></p></div>
  
  
  

<div class="card">
  <img src="../img/fire.png"  alt="angry" style="width:100%">
  <h1>직화구이</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>자세히 보기</button></p></div>
  
  <div class="card">
  <img src="../img/pizza-3007395_420.jpg" alt="dang" style="width:100%">
  <h1>냉동 피자</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>자세히 보기</button></p></div>
  
  <div class="card">
  <img src="../img/top-view-1248955_420.jpg" alt="ding" style="width:100%">
  <h1>샐러드 재료</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>자세히 보기</button></p></div>
  
 
  
<div class="card">
  <img src="../img/yes2.png" alt="angry" style="width:100%">
  <h1>유기농 검증</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>자세히 보기</button></p></div>
  
  <div class="card">
  <img src="../img/grapes-690230_1920.jpg" alt="dang" style="width:100%">
  <h1>포도!</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>자세히 보기</button></p></div>
  
  <div class="card">
  <img src="../img/casserole-dish-2776735_420.jpg" alt="ding" style="width:100%">
  <h1>요리 재료 모음</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>자세히 보기</button></p></div>
  
  
  
  <div class="card">
  <img src="../img/jam.jpg" alt="angry" style="width:100%">
  <h1>잼</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>자세히 보기</button></p></div>
  
  
  <div class="card">
  <img src="../img/squirrel.jpg" alt="ding" style="width:100%">
  <h1>도토리</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>자세히 보기</button></p></div>
  
  
    		<%@include file="../general_included/footer.jsp"%>
    
</body>
</html>
