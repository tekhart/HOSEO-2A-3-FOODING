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



<script type="text/javascript">

function openCity(evt, cityName) {
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }
	  document.getElementById(cityName).style.display = "block";
	  evt.currentTarget.className += " active";
	}

</script>




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
				<td colspan="2" align="right" width="580px" style="padding-bottom:50px; padding-left:280px;">
					<div class="container">
	          		  <h3 align="center">주문자 정보</h3>
		          		  	 <label for="fname" class="labelpay"><i class="fa fa-user"></i> 주문하시는분</label><br><br>
		           			 <input type="text" id="fname2" name="firstname2" class="inputtext" placeholder="이름"><br><br>
							 <label for="email" class="labelpay"><i class="fa fa-envelope"></i> Email</label>
		           			 <input type="text" id="email" name="email" class="inputtext" placeholder="john@example.com">
		            		 <label for="state"  class="labelpay">비밀번호 확인</label>
		                	 <input type="text" id="passwdcheck" name="passwdcheck" class="inputtext" 
		                	 placeholder="본인확인을 위해 비밀번호 확인이 필요합니다 " >   		
		                	 <input type="submit" value="확인" class="bt" style="margin-top:40px;">
					</div>
				</td>
				
				 <td colspan="2" align="center" style="padding-bottom:50px;">
					<div class="container2">
          		 		 <h3 align="center">배송지 정보</h3>
		          		  	 <label for="fname" class="labelpay"><i class="fa fa-user"></i> 받으시는분</label><br><br>
		           			 <input type="text" id="fname2" name="firstname2" class="inputtext" placeholder="이름"><br><br>
		          		  	 <label for="city" class="labelpay"><i class="fa fa-institution"></i> 주소</label><br><br>
		            		 <input type="text" id="city1" name="city1" class="inputtext"  placeholder="우편번호"><br><br>
		            		 <input type="text" id="city2" name="city2" class="inputtext"  placeholder="주소"><br><br>
		            		 <input type="text" id="city3" name="city3" class="inputtext"  placeholder="상세주소"><br><br>
		            		 <label for="state"  class="labelpay">배송메시지</label>
		                	 <input type="text" id="delimessa" name="delimessa" class="inputtext" placeholder="기사님들이 배송하실 때 확인하는 메세지란입니다. EX)부재시 경비실">
					</div>
			   </td>
			</tr>
			</table>
			
			
			
			<table >
				<tr>
					<td colspan="2" align="center" style="padding-bottom:10px; padding-left:275px;">
						<div class="container3">
		          		  <h3>결제 예정 금액</h3> 	
		          		  		<label for="fname" class="labelpay"> ₩ 총 주문금액</label><br><br>
		          		  			<div class="inputtd2">연동해야함</div><br><br>
		          		  		<label for="fname" class="labelpay"> 포인트</label><br><br>
		          		  			<div class="inputtd2">연동해야함</div><br><br>
						</div>
					</td>
				</tr>
			
			
				<tr>
					<td colspan="2" align="center" style="padding-left:275px;">
						<div class="container3">
		          		  <h3>결제 수단</h3> 	
		          		  		<div style="padding-top:20px;"></div>
		          		  			<span style="float:left;">
			          		  			<input type="radio" name="chk_info" value="신용카드" class="tablinks" onclick="openCity(event, 'creditcard')">신용카드
			          		  		</span>
			          		  		<span style="float:left; margin-left:50px;">
										<input type="radio" name="chk_info" value="무통장입금" class="tablinks" onclick="openCity(event, 'Bank Deposit')">무통장입금
									</span>	
									
									<div id="creditcard" class="tabcontent">
										 <h3>신용카드</h3>
										 <p>주문후 72시간 이내에 무통장입금확인 되지 않으면 자동으로 주문최소됩니다.</p>
									</div>
											
									<div id="Bank Deposit" class="tabcontent">
										<h3>무통장입금</h3>
										<p>주문후 72시간 이내에 무통장입금확인 되지 않으면 자동으로 주문최소됩니다.</p> 
									</div>
						</div>
					</td>
				</tr>
			</table>
			
			
			
            <!-- checked="checked"
      </div>

<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'London')">London</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')">Paris</button>
  <button class="tablinks" onclick="openCity(event, 'Tokyo')">Tokyo</button>
</div>

<div id="London" class="tabcontent">
  <h3>London</h3>
  <p>London is the capital city of England.</p>
</div>

<div id="Paris" class="tabcontent">
  <h3>Paris</h3>
  <p>Paris is the capital of France.</p> 
</div>

<div id="Tokyo" class="tabcontent">
  <h3>Tokyo</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>
-->


</center>
<br><br><br>



<%@include file="../general_included/footer.jsp"%>

</body>
</html>
