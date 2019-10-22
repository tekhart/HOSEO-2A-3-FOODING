<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/list.css">
<style>
	body{	font-family:"Bauhaus ITC";
		color:black;}

#title{
	text-decoration:none;

}


</style>

</head>

<body id="body">
<%@include file="../general_included/topbar.jsp"%>


<div id="maindiv">
<div class="writetitle1">
결제페이지</div>

	<div class="sidebar">
		<div class="sideleft"></div><a href="../mypages/updatepage.jsp" > 개인정보 관리</a>
		<div class="sideleft"></div><a href="#" >포인트 관리</a>
		<div class="sideleft"></div><a href="#" >게시글 관리</a>
		<div class="sideleft"></div><a href="#" > 주문조회</a>
		<div class="sideleft"></div><a href="../mypages/shopbasket.jsp" > 장바구니</a>
</div>

	<center>

		<br>
		<table class="row">
    		<tr>
				<td colspan="2">
				<div class="container" align="center">
          		  <h3>주문자 정보</h3>
          		  	<label for="fname" class="labelpay"><i class="fa fa-user"></i> 주문하시는분</label><br><br>
           			 <input type="text" id="fname2" name="firstname2" class="inputtext" placeholder="이름"><br><br>
					<label for="email" class="labelpay"><i class="fa fa-envelope"></i> Email</label>
           			 <input type="text" id="email" name="email" class="inputtext" placeholder="john@example.com">
            		 <label for="state"  class="labelpay">비밀번호 확인</label>
                	<input type="text" id="passwdcheck" name="passwdcheck" class="inputtext" placeholder="본인확인을 위해 비밀번호 확인이 필요합니다">        		
                	<input type="submit" value="확인" class="bt" style="margin-top:15px;">
			</div></td></tr>

				<tr>
				<td colspan="2">
				<div class="container2" align="center">
          		  <h3>배송지 정보</h3>
          		  	<label for="fname" class="labelpay"><i class="fa fa-user"></i> 받으시는분</label><br><br>
           			 <input type="text" id="fname2" name="firstname2" class="inputtext" placeholder="이름"><br><br>
          		  	 <label for="city" class="labelpay"><i class="fa fa-institution"></i> 주소</label><br><br>
            		<input type="text" id="city1" name="city1" class="inputtext"  placeholder="우편번호"><br><br>
            		<input type="text" id="city2" name="city2" class="inputtext"  placeholder="주소"><br><br>
            		<input type="text" id="city3" name="city3" class="inputtext"  placeholder="상세주소"><br><br>
            		 <label for="state"  class="labelpay">배송메시지</label>
                	<input type="text" id="delimessa" name="delimessa" class="inputtext" placeholder="기사님들이 배송하실 때 확인하는 메세지란입니다. EX)부재시 경비실">
			</div></td></tr>
			
				<tr>
				<td colspan="2">
					<div class="container3" align="center">
	          		  <h3>결제 예정 금액</h3> 		
	          		  	<table>
		          		  	<tr class="paymoney"><td>총 주문금액</td></tr>
		          		  	<tr><td class="inputtext">연동해야함</td>
		          		  	<tr class="paymoney"><td>포인트</td></tr>
		          		  	<tr><td class="inputtext">연동해야함</td>
          		  		</table>
					</div>
				</td>
			</tr>
			
			
			
			</table>
            <!--
            <label for="fname" class="labelpay"><i class="fa fa-user"></i> 이름</label><br><br>
            <input type="text" id="fname2" name="firstname" class="inputtext" placeholder="이름"><br><br>
            <label for="email" class="labelpay"><i class="fa fa-envelope"></i> 이메일</label><br><br>
            <input type="text" id="email2" name="email" class="inputtext"  placeholder="john@example.com"><br><br>
            <label for="city" class="labelpay"><i class="fa fa-institution"></i> 상세주소</label><br><br>
            <input type="text" id="city2" name="city" class="inputtext"  placeholder="주소"><br><br>
            -->


      </div>


</center>
<br><br><br>



<%@include file="../general_included/footer.jsp"%>

</body>
</html>
