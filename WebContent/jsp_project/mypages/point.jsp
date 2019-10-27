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
			


	<style>
		
		body{	font-family:"Bauhaus ITC";
		color:black;}
		
		#title{
		text-decoration:none;
	
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
						<div class="forkpoint">   
							<table> 
								<tr><td style="width:800px; height:50px; vertical-align:top;">
										<img id="forkimage" src="../img/fork.png" ></td></tr> 
								<tr><td align="center" ><div class="forkpoint2"><h3>포크 포인트</h3></div></td></tr>
									<tr><td align="center" style="width:800px; height:180px; vertical-align:top;"><div  class="forkpoint3">0 P</div></td></tr>
						   </table>
						</div>
				</div>
			     
					 
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
								<tr>  
									<td class="pointtd" style="text-align:center; height:50px; border-bottom:2px solid #525252;">거래일</td>
									<td class="pointtd" style="text-align:center; height:50px; border-bottom:2px solid #525252;">내역</td> 
									<td class="pointtd" style="text-align:center; height:50px; border-bottom:2px solid #525252;">포인트</td>  
								</tr> 
								
								<tr><td class="pointtdd" style="border-bottom:1px solid #525252;">거래일이라네요</td>
									<td class="pointtdd" style="border-bottom:1px solid #525252;">내역이라네요</td>
									<td class="pointtdd" style="border-bottom:1px solid #525252;">포인트라네요</td>
								</tr>
								
								
								<tr><td class="pointtdd" style="border-bottom:1px solid #525252;">거래일이라네요</td>
									<td class="pointtdd" style="border-bottom:1px solid #525252;">내역이라네요</td>
									<td class="pointtdd" style="border-bottom:1px solid #525252;">포인트라네요</td>
								</tr>
								
								
								<tr><td class="pointtdd" style="border-bottom:1px solid #525252;">거래일이라네요</td>
									<td class="pointtdd" style="border-bottom:1px solid #525252;">내역이라네요</td>
									<td class="pointtdd" style="border-bottom:1px solid #525252;">포인트라네요</td>
								</tr>
								
								<tr><td class="pointtdd" style="border-bottom:1px solid #525252;">거래일이라네요</td>
									<td class="pointtdd" style="border-bottom:1px solid #525252;">내역이라네요</td>
									<td class="pointtdd" style="border-bottom:1px solid #525252;">포인트라네요</td>
								</tr>
								
								
								<tr><td class="pointtdd">거래일이라네요</td>
									<td class="pointtdd">내역이라네요</td>
									<td class="pointtdd">포인트라네요</td>
								</tr>
								
							</table>
			
			
			
			
<%@include file="../general_included/footer.jsp"%>
	<br><br>
</body>
</html>
