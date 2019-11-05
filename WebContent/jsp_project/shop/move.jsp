<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
#mydiv22{
  top:600px;
  left:1500px;
  z-index: 500;
  background-color: #f1f1f1;
  text-align: center;
  width:100px;
  height:180px;
  border: 1px solid #d3d3d3;
  position: fixed;
}

#mydivheader {
  padding: 10px;
  cursor: move;
  z-index: 10;
  background-color: #ffbb00;
  color: #fff;
}

.triangle-up {
	width:0;
	height: 0;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
	border-bottom: 10px solid #555;
	margin-left:13px;
}

.sprout{
	width:20px;
	height:20px;
	position:absolute;
	top:-20px;
	right:1px;
}
.sproutdiv{
	background-color:white;
	
}

</style>
<body>

<div id="mydiv22">
<div class="sproutdiv"><img class="sprout" src="../img/sprout.png"></div>
  <div id="mydivheader">간편 메뉴</div>
  
  <p><a href="../shop/main.jsp">상점메인</a></p>
  <p><a href="../mypages/point.jsp">내포인트</a></p>
  <p><a href="../mypages/shopbasket.jsp">장바구니</a></p>
  
</div>

<script>
//Make the DIV element draggagle:
dragElement(document.getElementById("mydiv22"));

function dragElement(elmnt) {
  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  if (document.getElementById(elmnt.id + "header")) {
    /* if present, the header is where you move the DIV from:*/
    document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
  } else {
    /* otherwise, move the DIV from anywhere inside the DIV:*/
    elmnt.onmousedown = dragMouseDown;
  }

  function dragMouseDown(e) {
    e = e || window.event;
    e.preventDefault();
    // get the mouse cursor position at startup:
    pos3 = e.clientX;
    pos4 = e.clientY;
    document.onmouseup = closeDragElement;
    // call a function whenever the cursor moves:
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    e = e || window.event;
    e.preventDefault();
    // calculate the new cursor position:
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    // set the element's new position:
    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
  }

  function closeDragElement() {
    /* stop moving when mouse button is released:*/
    document.onmouseup = null;
    document.onmousemove = null;
  }
}

</script>

</body>
</html>