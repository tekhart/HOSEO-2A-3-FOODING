<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@page import="DBBean.foodingBean"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>개인정보</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>결제 페이지</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/list.css">
<style>
body {
	font-family: "Bauhaus ITC";
	color: black;
}

#title {
	text-decoration: none;
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
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}
		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.className += " active";
	}
	
	

	</script>




</head>

<body id="body">
	<%@include file="../general_included/topbar.jsp"%>


	<div id="maindiv">
		<div class="writetitle1">결제페이지</div>

		<%@include file="sidemenu.jsp"%>

		<center>

			<br>
			<table class="row">
				<tr>
					<td colspan="2" align="right" width="580px"
						style="padding-bottom: 50px; padding-left: 280px;">
						<div class="container">
							<h3 align="center">주문자 정보</h3>
							<label for="fname1" class="labelpay"><i
								class="fa fa-user"></i> 주문하시는분</label><br>
							<br> <input type="text" id="fname1" name="firstname2"
								class="inputtext" placeholder="이름"><br>
							<br> <label for="email" class="labelpay"><i
								class="fa fa-envelope"></i> Email</label> <input type="text" id="email"
								name="email" class="inputtext" placeholder="john@example.com">
							<label for="state" class="labelpay">비밀번호 확인</label> <input
								type="text" id="passwdcheck" name="passwdcheck"
								class="inputtext" placeholder="본인확인을 위해 비밀번호 확인이 필요합니다 ">
							<input type="submit" value="확인" class="tkdyd"
								style="margin-top: 40px;">
						</div>
					</td>

					<td colspan="2" align="center" style="padding-bottom: 50px;">
						<div class="container2">
							<h3 align="center">배송지 정보</h3>
							<label for="fname" class="labelpay"><i class="fa fa-user"></i>
								받으시는분</label><br>
							<br> <input type="text" id="fname2" name="firstname2"
								class="inputtext" placeholder="이름"><br>
							<br> <label for="city" class="labelpay"><i
								class="fa fa-institution"></i> 주소</label><br>
							<br> <input type="text" id="city1" name="city1"
								class="inputtext" placeholder="우편번호"><br>
							<br> <input type="text" id="city2" name="city2"
								class="inputtext" placeholder="주소"><br>
							<br> <input type="text" id="city3" name="city3"
								class="inputtext" placeholder="상세주소"><br>
							<br> <label for="state" class="labelpay">배송메시지</label> <input
								type="text" id="delimessa" name="delimessa" class="inputtext"
								placeholder="기사님들이 배송하실 때 확인하는 메세지란입니다. EX)부재시 경비실">
						</div>
					</td>
				</tr>
			</table>



			<table style="margin-left: 282px;" width="1148px;">
				<tr>
					<td class="container3">
						<h3>결제 수단</h3>

						<div style="padding-top: 20px;"></div>
						<div
							style="padding-bottom: 10px; width: 520px; float: left; border-bottom: 1px solid black;">
							<span class="tablinks"> <input type="radio"
								name="chk_info" value="신용카드" class="tablinks"
								onclick="openCity(event, 'creditcard')">신용카드
							</span> <span class="tablinks" style="float: left; margin-left: 50px;">
								<input type="radio" name="chk_info" value="무통장입금"
								class="tablinks" onclick="openCity(event, 'Bank Deposit')">무통장입금
							</span>
						</div> 

						<div id="creditcard" class="tabcontent" style="margin-top: 10px;">
							<p class="tdpayment" style="padding-top: 5px;">사용하는 은행</p> 
							<select name='bank' class="tdpayinput"
								style="width: 160px; height: 29px; margin-top: -10px;"><br>
								<option value='' selected>---은행선택---</option>
								<option value='농협'>농협</option>
								<option value='국민은행'>국민은행</option>
								<option value='우리은행'>우리은행</option>
								<option value='하나은행'>하나은행</option>
								<option value='신한은행'>신한은행</option>
								<option value='외환은행'>외환은행</option>
								<option value='씨티은행'>씨티은행</option>
								<option value='기업은행'>기업은행</option>
								<option value='우체국'>우체국</option> 
								<option value='부산은행'>부산은행</option>
								<option value='SC은행'>SC은행</option>
							</select>
							<p class="tdpayment" style="margin-top:40px;">카드번호</p>
								<div style="margin-top:-10px;">
									<span><input type="text" class="tdpayinput2" placeholder="4자리"></span>
									<span><input type="text" class="tdpayinput2" placeholder="4자리"></span>
									<span><input type="text" class="tdpayinput2" placeholder="4자리"></span>
									<span><input type="text" class="tdpayinput2" placeholder="4자리"></span>
								</div>
								
							<p class="tdpayment" style="margin-top:50px;">유효기간</p>
								<div style="margin-top:-10px;">
									<span><input type="text" class="tdpayinput2" placeholder="MM"></span>
									<span><input type="text" class="tdpayinput2" placeholder="YY"></span>
								</div>
								 
							<p class="tdpayment" style="margin-top:50px; width:560px;">CVC ( 카드뒷면의 7자리 숫자중 뒷 3자리입니다 )</p>
								<div style="margin-top:-10px;">
									<span><input type="text" class="tdpayinput2" placeholder="3자리"></span>
								</div>
							<p class="tdpayment" style="margin-top:50px; width:380px;">카드 비밀번호</p>
								<div style="margin-top:-10px;">
									<span><input type="text" class="tdpayinput2" placeholder="4자리"></span>
								</div>
							<input type="submit" value="카드등록" class="btpay1" onclick="">
						</div>
						
						
						<div id="Bank Deposit" class="tabcontent">
							<p class="tdpayment">입금자명</p>
							<input type="text" maxlength="20" class="tdpayinput"
								style="width: 200px; height: 29px; margin-top: -10px;">

							<p class="tdpayment" style="padding-top: 35px;">입금은행</p>
							<select name='bank' class="tdpayinput"
								style="width: 160px; height: 29px; margin-top: -10px;"><br>
								<option value='' selected>---입금은행선택---</option>
								<option value='농협'>농협</option>
								<option value='국민은행'>국민은행</option>
								<option value='우리은행'>우리은행</option>
								<option value='하나은행'>하나은행</option>
								<option value='신한은행'>신한은행</option>
								<option value='외환은행'>외환은행</option>
								<option value='씨티은행'>씨티은행</option>
								<option value='기업은행'>기업은행</option>
								<option value='우체국'>우체국</option>
								<option value='부산은행'>부산은행</option>
								<option value='SC은행'>SC은행</option>
							</select>
							
							<p class="tdpayment" style="padding-top: 35px;">입금예정일</p>
							<select name='day1' class="tdpayinput"
								style="width: 100px; height: 29px; margin-right: 10px; margin-top: -10px;">
								<option value='' selected>---년도---</option>
								<option value='2019년'>2019년</option>
								<option value='2020년'>2020년</option>
							</select> 
							
							<select name='day2' class="tdpayinput"
								style="width: 80px; height: 29px; margin-right: 10px; margin-top: -10px;">
								<option value='' selected>---월---</option>
								<option value='1월'>1월</option>
								<option value='2월'>2월</option>
								<option value='3월'>3월</option>
								<option value='4월'>4월</option>
								<option value='5월'>5월</option>
								<option value='6월'>6월</option>
								<option value='7월'>7월</option>
								<option value='8월'>8월</option>
								<option value='9월'>9월</option>
								<option value='10월'>10월</option>
								<option value='11월'>11월</option>
								<option value='12월'>12월</option>
							</select> <select name='day3' class="tdpayinput"
								style="width: 80px; height: 29px; margin-top: -10px;">
								<option value='' selected>---일---</option>
								<option value='1'>1일</option>
								<option value='2'>2일</option>
								<option value='3'>3일</option>
								<option value='4'>4일</option>
								<option value='5'>5일</option>
								<option value='6'>6일</option>
								<option value='7'>7일</option>
								<option value='8'>8일</option>
								<option value='9'>9일</option>
								<option value='10'>10일</option>
								<option value='11'>11일</option>
								<option value='12'>12일</option>
								<option value='13'>13일</option>
								<option value='14'>14일</option>
								<option value='15'>15일</option>
								<option value='16'>16일</option>
								<option value='17'>17일</option>
								<option value='18'>18일</option>
								<option value='19'>19일</option>
								<option value='20'>20일</option>
								<option value='21'>21일</option>
								<option value='22'>22일</option>
								<option value='23'>23일</option>
								<option value='24'>24일</option>
								<option value='25'>25일</option>
								<option value='26'>26일</option>
								<option value='27'>27일</option>
								<option value='28'>28일</option>
								<option value='29'>29일</option>
								<option value='30'>30일</option>
								<option value='31'>31일</option>
							</select>

						</div>
					</td>

								</div>
						</td>
			
								 

						<td class="container3" style="margin-left:1px; float:right;">
							 <h3>결제 예정 금액</h3> 	
		          		  		<label for="fname" class="labelpay"> ₩ 총 주문금액</label><br><br>
		          		  			<div class="inputtd2">연동해야함</div><br><br> 
		          		  		<label for="fname" class="labelpay"> 포인트 <span style="color:#424242; font-size:18px;">| 포크 n개 (총 n원)</span></label><br><br>
		          		  	<br>	<div style=" width:526px; float:left;">
		          		  				<input type="text" class="inputtd3"> =
		          		  				<input type="text" class="inputtd3">
		          		  				<span class="won">원</span>
		          		  			
		          		  					<a href="" class="tkdyd3">사용</a>
		          		  			</div><br><br> 
		          		  			
		          		  					<div><input type="submit" value="결제하기" class="btpay2" onclick="location.href='loading.jsp'"></div> 
		          		  					
						</td>
					</tr>
			</table> 
		
            <!-- checked="checked" -->
  
</div></table>
</center>
<br><br><br>



	<%@include file="../general_included/footer.jsp"%>

</body>
</html>
