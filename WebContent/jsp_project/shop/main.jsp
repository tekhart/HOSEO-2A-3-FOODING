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
	.button134 {
  border: none; 
  outline: 0;
  padding: 12px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
  margin-right:10px;
}

.detail td{padding:5px;
border-bottom:1px solid orange;
}

.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 750px;
  
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.card {
    -webkit-transition: 0.3s;
 	 transition: 0.3s;
 	 max-width: 300px;
 	 margin: 28px;
  	 max-height:690px;
   float:right;
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
  <p><button id="myBtn">자세히 보기</button></p></div>


  <div class="card">
  <img src="../img/cake-1914463_1920.jpg" alt="ding" style="width:100%">
  <h1>초코 재료</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button id="myBtn">자세히 보기</button></p></div>
  
  
  

<div class="card">
  <img src="../img/fire.png"  alt="angry" style="width:100%">
  <h1>직화구이</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button id="myBtn">자세히 보기</button></p></div>
  
  <div class="card">
  <img src="../img/pizza-3007395_420.jpg" alt="dang" style="width:100%">
  <h1>냉동 피자</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button id="myBtn">자세히 보기</button></p></div>
  
  <div class="card">
  <img src="../img/top-view-1248955_420.jpg" alt="ding" style="width:100%">
  <h1>샐러드 재료</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button id="myBtn">자세히 보기</button></p></div>
  
 
  
<div class="card">
  <img src="../img/yes2.png" alt="angry" style="width:100%">
  <h1>유기농 검증</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button id="myBtn">자세히 보기</button></p></div>
  
  <div class="card">
  <img src="../img/grapes-690230_1920.jpg" alt="dang" style="width:100%">
  <h1>포도!</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button id="myBtn">자세히 보기</button></p></div>
  
  <div class="card">
  <img src="../img/casserole-dish-2776735_420.jpg" alt="ding" style="width:100%">
  <h1>요리 재료 모음</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button id="myBtn">자세히 보기</button></p></div>
  
  
  
  <div class="card">
  <img src="../img/jam.jpg" alt="angry" style="width:100%">
  <h1>잼</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button id="myBtn">자세히 보기</button></p></div>
  
  
  <div class="card">
  <img src="../img/squirrel.jpg" alt="ding" style="width:100%">
  <h1>도토리</h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button id="myBtn">자세히 보기</button></p></div>
  
  
    		<%@include file="../general_included/footer.jsp"%>
    		
    	
    	
<div id="myModal" class="modal">
 
  <div class="modal-content">
    <span class="close">&times;</span>
    <table class="detail" style="border-spacing:0px;">
<tr><td rowspan="3">
<img src="../img/casserole-dish-2776735_420.jpg" width="400px" height="400px" ></td><td>
[제목]<br>요리 재료 모음</td><tr><td>[가격]<br><del>12000</del><br>
8900</td></tr><tr><td>[설명]<br>기본적인 요리 재료 모음입니다<br>구성품 : 토마토, 버섯, 고추, 피망, 양파, 마늘</td>
</tr><tr><td colspan="2" style="border-bottom:4px solid white;"><input type="button" class="button134" value="+ 장바구니에 추가"></td></tr></table>
  </div>

</div>
    	
    	
    		
<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
    		
    
</body>
</html>
