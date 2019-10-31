<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "DBBean.productDataBean" %>

<!--  달력기능 넣어보려했는데 잘 모르겠음
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
-->
<meta charset="UTF-8">


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>포인트 관리</title>
			<link rel="stylesheet" href="../css/common.css">
			<link rel="stylesheet" href="../css/list.css">
			<link rel="shortcut icon" href="../img/favicon.ico">
			<link rel="icon" href="../img/favicon.ico">


	<style>
						
				
			
body {font-family: Arial;}

/* Style the tab */
.tab4 {
  overflow: hidden;
  border: 1px solid #ccc;
  width:50%;
  background-color: orange;
}

.lontb{
	border-spacing:0px;
	border-collapse:collapse;
	width:100%; 
}

.lontb td{	text-align:center;
border-bottom:1px solid orange;
}

.pointtdd{
		height:50px;
		display:text-cell;
		vertical-align:middle;
		font-size:14pt;
		width:33%;
		
}

/* Style the buttons inside the tab */
.tab4 button {
  background-color: orange; 
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab4 button:hover {
  background-color: white;
}

/* Create an active/current tablink class */
.tab4 button.active {
  background-color: white;
}

/* Style the tab content */
.tabcontent4 {
  display: none;
  padding: 6px 12px;

  width:50%;
} 



#menu div {
    position: relative;
    display: inline-block;
}

span { 
    display: block;
    width: 80px;
    padding: 2px 16px;
    cursor: pointer;
}
.arrow_box {
  display: none; 
  position: absolute;
  width: 210px;
  padding: 8px;
  left: 300px; 
  -webkit-border-radius: 1px;
  -moz-border-radius: 1px;  
  border-radius: 8px;
  background: white;
  border:1px solid black;
  color: black;
  font-size: 14px;
}

.arrow_box:after {
	width: 0px;
	height: 0px;
	border-top: 60px solid transparent;
	border-bottom: 60px solid transparent;
	border-left: 60px solid black;
	left:110%;
	margin-left: -10px;
    position: absolute;
    border-width: 10px;
    pointer-events: none;
    content: " ";
}

span:hover + p.arrow_box {
  display: block;
}

	</style>
	
	<script>
	<!-- 달력기능...
	<script type="text/javascript">
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#startDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", selectedDate );
                 }    
 
            });
            $( "#endDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
                 }    
 
            });    
    });
    -->
</script>


</head> 
 
		<body id="body">
		<%@include file="../general_included/topbar.jsp"%>
		
		<div id="maindiv">
		<div class="writetitle1">
		포인트 관리</div>
			<%@include file="sidemenu.jsp"%>   
			  
			<center>  
				<div class="row3"  style="padding-top:80px;"> 
						<div class="forkpoint" style="border: 3px solid #ffc637; border-radius:50px 50px 50px 50px;">    
							<table> 
								<tr><td style="width:800px; padding-left:25px; height:50px; vertical-align:top; ">
										<div id="menu"><span><img id="forkimage" src="../img/forkc.png" ></span> 
										    <p class="arrow_box">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa이상하넹</p></div>
										 </td></tr>  
								<tr><td align="center" ><div class="forkpoint2"><h3>포크 포인트</h3></div></td></tr>
									<tr><td align="center" style="width:800px; height:140px; vertical-align:top; ">
									<div  class="forkpoint3" style="border: 3px solid #ffc637; border-radius:30px 30px 30px 30px;">0 P</div></td></tr>
						   </table>
						</div>
				</div>


<br><br><br><br>
<div class="tab4">
  <button class="tablinks" onclick="openCity(event, 'London')">1주일</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')">1개월</button>
  <button class="tablinks" onclick="openCity(event, 'Tokyo')">전체</button>
</div>

<div id="London" class="tabcontent4">
  <table class="lontb"><tr>  
									<td class="pointtdd">거래일</td>
									<td class="pointtdd">내역</td> 
									<td class="pointtdd">포인트</td>  
								</tr> 
  <tr><td class="pointtdd">2019.10.10</td>
									<td class="pointtdd" >질문에 답변</td> 
									<td class="pointtdd" >+ 5</td>
								</tr>
								
								
								<tr><td class="pointtdd">2019.10.14</td>
									<td class="pointtdd">글 작성</td>
									<td class="pointtdd">+ 10</td>
								</tr>
  </table>
</div>

<div id="Paris" class="tabcontent4">
<table class="lontb"><tr>  
									<td class="pointtdd">거래일</td>
									<td class="pointtdd">내역</td> 
									<td class="pointtdd">포인트</td>  
								</tr> 
		<tr><td class="pointtdd">2019.09.28</td>
									<td class="pointtdd" >상품 구매</td>
									<td class="pointtdd" >+ 103</td>
								</tr>
<tr><td class="pointtdd">2019.10.10</td>
									<td class="pointtdd" >질문에 답변</td> 
									<td class="pointtdd" >+ 5</td>
								</tr>
								
								
								<tr><td class="pointtdd">2019.10.14</td>
									<td class="pointtdd">글 작성</td>
									<td class="pointtdd">+ 10</td>
								</tr>
</table>
</div>

<div id="Tokyo" class="tabcontent4">
<table class="lontb"><tr>  
									<td class="pointtdd">거래일</td>
									<td class="pointtdd">내역</td> 
									<td class="pointtdd">포인트</td>  
								</tr> 
		<tr>
		<td class="pointtdd" >2019.09.28</td>
									<td class="pointtdd" >상품 구매</td>
									<td class="pointtdd" >+ 103</td>
								</tr>
<tr><td class="pointtdd" >2019.10.10</td>
									<td class="pointtdd" >질문에 답변</td> 
									<td class="pointtdd" >+ 5</td>
								</tr>
								
								
								<tr><td class="pointtdd">2019.10.14</td>
									<td class="pointtdd">글 작성</td>
									<td class="pointtdd">+ 10</td>
								</tr>
								<td class="pointtdd" >2019.01.03</td>
									<td class="pointtdd" >글 작성</td>
									<td class="pointtdd" >+ 10</td>
								</tr>
								
								
								<tr><td class="pointtdd" >2019.03.04</td>
									<td class="pointtdd" >글 작성</td>
									<td class="pointtdd" >+ 10</td>
								</tr>
								
</table>
</div>

<script>
function openCity(evt, cityName) {
  var i, tabcontent4, tablinks;
  tabcontent4 = document.getElementsByClassName("tabcontent4");
  for (i = 0; i < tabcontent4.length; i++) {
    tabcontent4[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
</script>
   
</body>
				
			     <!-- 					 
							<table class="pointsearch">
								<tr><td style="width:120px; text-align:center;">조회기간</td> 
										<td align="center">
											<input type="button" value="1주일" class="pointbutton" >
											<input type="button" value="15일" class="pointbutton">
											<input type="button" value="1개월" class="pointbutton">
										</td>
										<td align="center">
											<input type="text" id="startDate" value="달력시작" class="calendar" style="text-align:center;">
											~ &nbsp;<input type="text" id="endDate" value="달력끝" class="calendar" style="text-align:center;"></td>
								</tr>					
							</table>  
						  
							<table class="pointtable" style="text-align:center; height:50px; border-bottom:1px solid #525252; border-spacing:0px;">   
								
								
						
								
						
								
								
								
							</table>
			-->
			
			
			
<%@include file="../general_included/footer.jsp"%>
	<br><br>
</body>
</html>
