<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/list.css">

<meta charset="UTF-8">

<title>맞춤 레시피</title>
<script type="text/javascript" src="../js//jquery-1.11.1.min.js"></script>
 <script>
 function CheckAllSubChecks() {
		var main = document.getElementById("checkall");
		var subs = document.getElementsByClassName("checkbox");
			for (i = 0; i < subs.length; i++) {
				subs[i].checked = false;
			}
	}
 </script>
<style>
/*when hovering an item:*/
.autocomplete-items div:hover {
	background-color: ##ffbb00;
}

/*when navigating through the items using the arrow keys:*/
.autocomplete-active {
	background-color: #ffbb00 !important;
	width: 400px;
	color: #ffffff;
}

#myUL div {
	float: left;
	margin-left: 3px;
}

			#cb1 + .cbcb {
				display: inline-block;
				width:9px;
				height: 15px;
				margin-right:7px;
				border:solid #eee;
				border-width: 0 4px 4px 0;
				cursor: pointer;
				-webkit-transform: rotate(45deg);
				-ms-transform: rotate(45deg);
				transform: rotate(45deg);
				
			}
			#cb1:checked + .cbcb {
				border:solid green;
				border-width: 0 4px 4px 0;
				-webkit-animation: animation 1000ms linear both;
  				animation: animation 1000ms linear both;
			}
			#cb1{
				display: none;
			}
			
.checkall1{
	border: 1px solid #ffbb00;
	border-radius:2px;
	cursor:pointer;
		background-color:white;
	-webkit-transition: background-color 1000ms linear;
    -ms-transition: background-color 1000ms linear;
    transition: background-color 1000ms linear;
}

			.checkall1:hover{
				background-color:#ffbb00;
	-webkit-transition: background-color 1000ms linear;
    -ms-transition: background-color 1000ms linear;
    transition: background-color 1000ms linear;
}


@-webkit-keyframes animation { 
  0% { -webkit-transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  3.2% { -webkit-transform: matrix3d(1.206, 0.383, 0, 0, -0.383, 1.206, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.206, 0.383, 0, 0, -0.383, 1.206, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  4.3% { -webkit-transform: matrix3d(1.2, 0.513, 0, 0, -0.513, 1.2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.2, 0.513, 0, 0, -0.513, 1.2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  6.41% { -webkit-transform: matrix3d(1.125, 0.71, 0, 0, -0.71, 1.125, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.125, 0.71, 0, 0, -0.71, 1.125, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  8.61% { -webkit-transform: matrix3d(1.01, 0.834, 0, 0, -0.834, 1.01, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.01, 0.834, 0, 0, -0.834, 1.01, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  12.71% { -webkit-transform: matrix3d(0.825, 0.889, 0, 0, -0.889, 0.825, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.825, 0.889, 0, 0, -0.889, 0.825, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  12.91% { -webkit-transform: matrix3d(0.818, 0.888, 0, 0, -0.888, 0.818, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.818, 0.888, 0, 0, -0.888, 0.818, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  17.22% { -webkit-transform: matrix3d(0.72, 0.834, 0, 0, -0.834, 0.72, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.72, 0.834, 0, 0, -0.834, 0.72, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  18.92% { -webkit-transform: matrix3d(0.701, 0.807, 0, 0, -0.807, 0.701, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.701, 0.807, 0, 0, -0.807, 0.701, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  25.23% { -webkit-transform: matrix3d(0.682, 0.729, 0, 0, -0.729, 0.682, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.682, 0.729, 0, 0, -0.729, 0.682, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  28.33% { -webkit-transform: matrix3d(0.687, 0.709, 0, 0, -0.709, 0.687, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.687, 0.709, 0, 0, -0.709, 0.687, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  31.43% { -webkit-transform: matrix3d(0.693, 0.699, 0, 0, -0.699, 0.693, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.693, 0.699, 0, 0, -0.699, 0.693, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  39.44% { -webkit-transform: matrix3d(0.705, 0.698, 0, 0, -0.698, 0.705, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.705, 0.698, 0, 0, -0.698, 0.705, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  56.46% { -webkit-transform: matrix3d(0.708, 0.708, 0, 0, -0.708, 0.708, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.708, 0.708, 0, 0, -0.708, 0.708, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  61.66% { -webkit-transform: matrix3d(0.707, 0.708, 0, 0, -0.708, 0.707, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.707, 0.708, 0, 0, -0.708, 0.707, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  81.48% { -webkit-transform: matrix3d(0.707, 0.707, 0, 0, -0.707, 0.707, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.707, 0.707, 0, 0, -0.707, 0.707, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  83.98% { -webkit-transform: matrix3d(0.707, 0.707, 0, 0, -0.707, 0.707, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.707, 0.707, 0, 0, -0.707, 0.707, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  100% { -webkit-transform: matrix3d(0.707, 0.707, 0, 0, -0.707, 0.707, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.707, 0.707, 0, 0, -0.707, 0.707, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); } 
}

@keyframes animation {
  0% { -webkit-transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  3.2% { -webkit-transform: matrix3d(1.206, 0.383, 0, 0, -0.383, 1.206, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.206, 0.383, 0, 0, -0.383, 1.206, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  4.3% { -webkit-transform: matrix3d(1.2, 0.513, 0, 0, -0.513, 1.2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.2, 0.513, 0, 0, -0.513, 1.2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  6.41% { -webkit-transform: matrix3d(1.125, 0.71, 0, 0, -0.71, 1.125, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.125, 0.71, 0, 0, -0.71, 1.125, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  8.61% { -webkit-transform: matrix3d(1.01, 0.834, 0, 0, -0.834, 1.01, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.01, 0.834, 0, 0, -0.834, 1.01, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  12.71% { -webkit-transform: matrix3d(0.825, 0.889, 0, 0, -0.889, 0.825, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.825, 0.889, 0, 0, -0.889, 0.825, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  12.91% { -webkit-transform: matrix3d(0.818, 0.888, 0, 0, -0.888, 0.818, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.818, 0.888, 0, 0, -0.888, 0.818, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  17.22% { -webkit-transform: matrix3d(0.72, 0.834, 0, 0, -0.834, 0.72, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.72, 0.834, 0, 0, -0.834, 0.72, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  18.92% { -webkit-transform: matrix3d(0.701, 0.807, 0, 0, -0.807, 0.701, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.701, 0.807, 0, 0, -0.807, 0.701, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  25.23% { -webkit-transform: matrix3d(0.682, 0.729, 0, 0, -0.729, 0.682, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.682, 0.729, 0, 0, -0.729, 0.682, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  28.33% { -webkit-transform: matrix3d(0.687, 0.709, 0, 0, -0.709, 0.687, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.687, 0.709, 0, 0, -0.709, 0.687, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  31.43% { -webkit-transform: matrix3d(0.693, 0.699, 0, 0, -0.699, 0.693, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.693, 0.699, 0, 0, -0.699, 0.693, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  39.44% { -webkit-transform: matrix3d(0.705, 0.698, 0, 0, -0.698, 0.705, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.705, 0.698, 0, 0, -0.698, 0.705, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  56.46% { -webkit-transform: matrix3d(0.708, 0.708, 0, 0, -0.708, 0.708, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.708, 0.708, 0, 0, -0.708, 0.708, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  61.66% { -webkit-transform: matrix3d(0.707, 0.708, 0, 0, -0.708, 0.707, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.707, 0.708, 0, 0, -0.708, 0.707, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  81.48% { -webkit-transform: matrix3d(0.707, 0.707, 0, 0, -0.707, 0.707, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.707, 0.707, 0, 0, -0.707, 0.707, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  83.98% { -webkit-transform: matrix3d(0.707, 0.707, 0, 0, -0.707, 0.707, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.707, 0.707, 0, 0, -0.707, 0.707, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  100% { -webkit-transform: matrix3d(0.707, 0.707, 0, 0, -0.707, 0.707, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(0.707, 0.707, 0, 0, -0.707, 0.707, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
}

</style>

</head>
<body id="body">
	<%@include file="../general_included/topbar.jsp"%>
	<div id="maindiv">
		<div class="writetitle1">맞춤 레시피</div>
		<br>
		<form method="POST" action="customPro.jsp" name="customsearchForm">
		
		<input type="button" id="checkall" onclick="CheckAllSubChecks()" value="모두 취소" style="position:absolute; right:452px; top:240px;" class="checkall1">
		
			<table border="1" class="customtb">
				<tr>
					<td class="customfirst">상황별 요리</td>
					<td class="customfirst">나라별 요리</td>
					<td class="customfirst">재료별 요리</td>
					<td class="customfirst">조리법별 요리</td>
					<td class="customfirst">도구별 요리</td>
				</tr>
				<tr>
					<td class="customsecond">
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="상황:간식"><span class="cbcb"></span>간식<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="상황:야식"><span class="cbcb"></span>야식<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="상황:안주"><span class="cbcb"></span>안주<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="상황:해장"><span class="cbcb"></span>해장<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="상황:접대"><span class="cbcb"></span>접대<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="상황:나들이"><span class="cbcb"></span>나들이<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="상황:파티"><span class="cbcb"></span>파티<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="상황:명절"><span class="cbcb"></span>명절<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="상황:실생활"><span class="cbcb"></span>실생활<br></label>
					</td>
					<td class="customsecond">
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="나라:한식"><span class="cbcb"></span>한식<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="나라:양식"><span class="cbcb"></span>양식<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="나라:일식"><span class="cbcb"></span>일식<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="나라:중식"><span class="cbcb"></span>중식<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="나라:퓨전"><span class="cbcb"></span>퓨전<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="나라:기타"><span class="cbcb"></span>이국적인<br></label>
					</td>
					<td class="customsecond">
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="재료:고기"><span class="cbcb"></span>육류<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="재료:나물,재료:버섯,재료:파,재료:추"><span class="cbcb"></span>채소류<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="재료:새우,재료:어,재료:게,재료:랍스타,재료:조개"><span class="cbcb"></span>해산물<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="재료:콩,재료:두부"><span class="cbcb"></span>콩/두부<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="재료:사과,재료:배,재료:포도,재료:복숭아"><span class="cbcb"></span>과일<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="재료:달걀,재료:우유,재료:치즈"><span class="cbcb"></span>달걀/유제품<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="재료:만두"><span class="cbcb"></span>만두<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="재료:밀가루"><span class="cbcb"></span>밀가루<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="재료:김치"><span class="cbcb"></span>김치<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="재료:통조림,재료:캔"><span class="cbcb"></span>가공식품<br></label>
					</td>
					<td class="customsecond">
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="종류:밥류"><span class="cbcb"></span>밥류<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="종류:빵류"><span class="cbcb"></span>빵류<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="종류:반찬류"><span class="cbcb"></span>반찬류<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="종류:면류"><span class="cbcb"></span>면류<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="종류:국류"><span class="cbcb"></span>국류<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="종류:디저트"><span class="cbcb"></span>디저트<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="종류:기타"><span class="cbcb"></span>이색적인<br></label>
					</td>
					<td class="customsecond">
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="도구:칼"><span class="cbcb"></span>칼<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="도구:믹서기"><span class="cbcb"></span>믹서기<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="도구:가스레인지"><span class="cbcb"></span>가스레인지<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="도구:냄비"><span class="cbcb"></span>냄비<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="도구:오븐"><span class="cbcb"></span>오븐<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="도구:전자레인지"><span class="cbcb"></span>전자레인지<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="도구:냉장고"><span class="cbcb"></span>냉장고<br></label>
					<label><input type="checkbox" id="cb1" class="checkbox" name="customsearch" value="도구:타이머"><span class="cbcb"></span>타이머<br></label>
					</td>
				</tr>
			</table>
			<table width="900px" style="margin: auto;">
				<tr>
					<td align="center" height="100px;">
						<div class="newelementsearchbar" align="left"
							style="width: 400px; height: 200px; margin-left: 300px; margin-top: 10px;">
							<input type="text" name="myCountry" placeholder="검색..."
								class="searchbar2" id="myInput" onkeyup="newElemententerkey()">
						</div>
					</td>
					<td>
						<div style="width: 400px; height: 200px;">
							<input type="submit" value="검색" class="bt"
								style="position: relative; top: 0px;">
						</div>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td>
						<div>
							<ul id="myUL" style="margin-left: 400px; width: 600px;">
							</ul>
						</div>
					</td>
				</tr>
			</table>

			<script>
				function newElemententerkey() {
					if (window.event.keyCode == 13) {
						newElement();
					}
				}

				//Create a "close" button and append it to each list item
				var myNodelist = document.getElementsByTagName("text");
				var i;
				for (i = 0; i < myNodelist.length; i++) {
					var span = document.createElement("SPAN");
					var txt = document.createTextNode("\u00D7");
					span.className = "close";
					span.appendChild(txt);
					myNodelist[i].appendChild(span);
				}

				//Click on a close button to hide the current list item
				var close = document.getElementsByClassName("close");
				var i;
				for (i = 0; i < close.length; i++) {
					close[i].onclick = function() {
						var div = this.parentElement;
						div.remove();
					}
				}

				//Create a new list item when clicking on the "Add" button
				function newElement() {
					var li = document.createElement("div");
					var inputValue = document.getElementById("myInput").value;
					var t = document.createTextNode(inputValue);
					li.appendChild(t);
					if (inputValue === '') {
						alert("재료나 도구를 검색하세요");
					} else {
						document.getElementById("myUL").appendChild(li);
					}

					var span = document.createElement("SPAN");
					var txt = document.createTextNode("\u00D7");
					span.className = "close";
					span.appendChild(txt);
					li.appendChild(span);
					var input = document.createElement("input");
					input.setAttribute('name', 'customsearch');
					input.setAttribute('type', 'hidden');
					input.value = "사용자지정:" + inputValue;
					li.appendChild(input);

					document.getElementById("myInput").value = "";
					for (i = 0; i < close.length; i++) {
						close[i].onclick = function() {
							var div = this.parentElement;
							div.remove();
						}
					}
				}

				function autocomplete(inp, arr) {
					/*the autocomplete function takes two arguments,
					the text field element and an array of possible autocompleted values:*/
					var currentFocus;
					/*execute a function when someone writes in the text field:*/
					inp
							.addEventListener(
									"input",
									function(e) {
										var a, b, i, val = this.value;
										/*close any already open lists of autocompleted values*/
										closeAllLists();
										if (!val) {
											return false;
										}
										currentFocus = -1;
										/*create a DIV element that will contain the items (values):*/
										a = document.createElement("DIV");
										a.setAttribute("id", this.id
												+ "autocomplete-list");
										a.setAttribute("class",
												"autocomplete-items");
										/*append the DIV element as a child of the autocomplete container:*/
										this.parentNode.appendChild(a);
										/*for each item in the array...*/
										for (i = 0; i < arr.length; i++) {
											/*check if the item starts with the same letters as the text field value:*/
											if (arr[i].substr(0, val.length)
													.toUpperCase() == val
													.toUpperCase()) {
												/*create a DIV element for each matching element:*/
												b = document
														.createElement("DIV");
												/*make the matching letters bold:*/
												b.innerHTML = "<strong>"
														+ arr[i].substr(0,
																val.length)
														+ "</strong>";
												b.innerHTML += arr[i]
														.substr(val.length);
												/*insert a input field that will hold the current array item's value:*/
												b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
												/*execute a function when someone clicks on the item value (DIV element):*/
												b
														.addEventListener(
																"click",
																function(e) {
																	/*insert the value for the autocomplete text field:*/
																	inp.value = this
																			.getElementsByTagName("input")[0].value;
																	/*close the list of autocompleted values,
																	(or any other open lists of autocompleted values:*/
																	closeAllLists();
																});
												a.appendChild(b);
											}
										}
									});
					/*execute a function presses a key on the keyboard:*/
					inp.addEventListener("keydown", function(e) {
						var x = document.getElementById(this.id
								+ "autocomplete-list");
						if (x)
							x = x.getElementsByTagName("div");
						if (e.keyCode == 40) {
							/*If the arrow DOWN key is pressed,
							increase the currentFocus variable:*/
							currentFocus++;
							/*and and make the current item more visible:*/
							addActive(x);
						} else if (e.keyCode == 38) { //up
							/*If the arrow UP key is pressed,
							decrease the currentFocus variable:*/
							currentFocus--;
							/*and and make the current item more visible:*/
							addActive(x);
						} else if (e.keyCode == 13) {
							/*If the ENTER key is pressed, prevent the form from being submitted,*/
							e.preventDefault();
							if (currentFocus > -1) {
								/*and simulate a click on the "active" item:*/
								if (x)
									x[currentFocus].click();
							}
						}
					});
					function addActive(x) {
						/*a function to classify an item as "active":*/
						if (!x)
							return false;
						/*start by removing the "active" class on all items:*/
						removeActive(x);
						if (currentFocus >= x.length)
							currentFocus = 0;
						if (currentFocus < 0)
							currentFocus = (x.length - 1);
						/*add class "autocomplete-active":*/
						x[currentFocus].classList.add("autocomplete-active");
					}
					function removeActive(x) {
						/*a function to remove the "active" class from all autocomplete items:*/
						for (var i = 0; i < x.length; i++) {
							x[i].classList.remove("autocomplete-active");
						}
					}
					function closeAllLists(elmnt) {
						/*close all autocomplete lists in the document,
						except the one passed as an argument:*/
						var x = document
								.getElementsByClassName("autocomplete-items");
						for (var i = 0; i < x.length; i++) {
							if (elmnt != x[i] && elmnt != inp) {
								x[i].parentNode.removeChild(x[i]);
							}
						}
					}
					/*execute a function when someone clicks in the document:*/
					document.addEventListener("click", function(e) {
						closeAllLists(e.target);
					});
				}

				/*An array containing all the country names in the world:*/
				var countries = [ "아이스크림", "당근", "당근", "당근", "당근", "당근", "당근",
						"당근", "당근", "당근", "당근", "당근", "당근", "당근", "당근", "당근",
						"당근", "두부", "콩", "치킨", "피자", "짜장면", "탕수육", "밀가루", "피망",
						"박력분", "오이", "참치", "양상추", "양배추", "감자", "귤", "곤약",
						"스파게티", "블루베리", "꿀", "파인애플", "사과", "오렌지", "한라봉", "멜론",
						"수박", "바나나", "고기", "키위", "목살", "안심", "등심", "삼겹살", "양파",
						"토마토", "대파", "쪽파", "감", "아보카도", "토스트", "참외", "방울토마토",
						"밤", "복숭아", "살구", "자두", "앵두", "망고", "딸기", "물", "무화과",
						"자몽", "피스타치오", "연어", "시나몬", "계피", "땅콩", "가지", "호박",
						"브로콜리", "상추", "깻잎", "대추", "배추", "시금치", "참기름", "부추",
						"죽순", "옥수수", "팝콘", "치즈", "우엉", "마", "고구마", "연근", "무",
						"미나리", "미역", "김", "다시마", "멸치", "앞다리살", "뒷다리살", "갈비",
						"오징어", "문어", "김치", "새우", "게", "갈치", "고등어", "넙치", "대구",
						"농어", "미더덕", "복어", "깨", "오이지", "후추", "소금", "케찹",
						"머스타드", "설탕", "미림", "조미료", "계란", "우유", "라면", "콩나물",
						"식초", "간장", "버터", "떡", "식용유", "식빵", "초콜릿", "고춧가루",
						"베이킹파우더", "굴소스", "마요네즈", "햄", "스팸", "마늘", "치킨스톡",
						"비엔나소시지" ];

				/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
				autocomplete(document.getElementById("myInput"), countries);
			</script>

		</form>
	</div>
	<%@include file="../general_included/footer.jsp"%>
</body>
</html>
