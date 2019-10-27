<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import = "java.util.List" %>
<%@ page import = "DBBean.productDataBean" %>
<%@ page import="DBBean.foodingBean"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
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
<script type="text/javascript" src="../js/jquery-1.11.1.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
	var IMP = window.IMP; // 생략가능
	IMP.init('imp49916893'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	var msg;
	function customer_decided_topay(){IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 14000,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }

	    alert(msg);
	});
   }
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
	<%
	
		int addproductid=0;
		int addproductcount=0;
		foodingBean dbPro = foodingBean.getInstance();
		String[] selCartIdchkbx=null;
		List<productDataBean> articleList=null;
		try{
			selCartIdchkbx = request.getParameterValues("CartIdchkbx");
			int intedCartIds[]=new int[selCartIdchkbx.length];
			
			for(int i = 0; i<selCartIdchkbx.length; i++){
				intedCartIds[i]=Integer.parseInt(selCartIdchkbx[i]);
				addproductcount=i;
			}
			articleList=dbPro.getcartArticles(intedCartIds);
		}catch(Exception e){
			e.printStackTrace();
		}
	%>

	<div id="maindiv">
		<div class="writetitle1">결제페이지</div>

		<%@include file="sidemenu.jsp"%>
		<center>
		<div><table class="list-table" style="border-spacing:0px;margin:auto; padding-left:250px;">
			<tr>
				<td align="left" style="text-align:left; font-size:18pt; padding:80px 0px 5px 10px;">일반상품(<%=addproductcount%>)</td>
			</tr>
			<tr class="list-tableth" >
		 		<td width="150" style="border-top:3px solid orange; border-bottom:2px solid orange;">상품이미지</td>
				<td width="300" style="border-top:3px solid orange; border-bottom:2px solid orange;">상품이름</td>	
				<td width="120" style="border-top:3px solid orange; border-bottom:2px solid orange;">판매가</td>
				<td width="280" style="border-top:3px solid orange; border-bottom:2px solid orange;">수량</td>
				<td width="120" style="border-top:3px solid orange; border-bottom:2px solid orange;">포인트적립</td>
				<td width="100" style="border-top:3px solid orange; border-bottom:2px solid orange;">합계</td>
			 </tr> 
		
					
			<tbody class="list-tabletd">
				<% 
					if(selCartIdchkbx==null){
				%>
					<tr>
						<td colspan="9" style="border-bottom:3px solid orange;">
							<br>
							장바구니가 비었어요! ^~^
							<br>
						</td>
					</tr>
				<% 
					}else{
						int totalprice=0;
						int default_bae_song_bee=2500;
						int bae_song_bee=default_bae_song_bee;
						
						for (int i = 0 ; i < articleList.size(); i++) {
							productDataBean article = articleList.get(i);
							int realprice=article.getPrice()*(100-article.getDiscountRate())/100;
							int RealxCountPrice=realprice*article.getProductCount();
							int ExpectedValueOfAddMile=realprice*article.getProductCount()/100;
							totalprice+=RealxCountPrice;
					%>
						<tr>
							<td width="150" style="border-bottom:3px solid orange;">
									<div class="bak_item">
									<div class="pro_img"></div>
									<div class="pro_nt"></div>
									<div style="background-image:url('<%=article.getProductThumb() %>');background-size:cover;background-position:center;width:200px;height:120px;"></div>
									</div>
							</td>
							<td width="150" style="border-bottom:3px solid orange; font-size:16pt;"><%=article.getProductName() %></td>
							<td width="150" style="border-bottom:3px solid orange; font-size:16pt;">
								<%if(article.getDiscountRate()==0){%>
									<%=article.getPrice()%>원
								<%}else{ %>
									<del><%=article.getPrice()%>원</del><%=article.getDiscountRate()%>% off<br>
									ㄴ><%=realprice%>원
								<%} %>
							</td>
							<td width="200" style="border-bottom:3px solid orange; font-size:16pt;">	
									<div>
										<%=article.getProductCount() %>
									</div>
							</td>
							<td width="150" style="border-bottom:3px solid orange; font-size:16pt;"><img src="../img/fork.png" width="15px" height="15px"><%=ExpectedValueOfAddMile %></td>
							<td width="150" style="border-bottom:3px solid orange; font-size:16pt;"><%=RealxCountPrice%>원</td>
						</tr>
					<%}%>
					<tr>
						<td colspan="2" style="border-bottom:2px solid orange;"></td>
						<td colspan="1" style="border-bottom:2px solid orange; font-size:16pt;">배송비</td>
						<td colspan="9" style="border-bottom:2px solid orange; font-size:16pt; ">
							<br>
							<%		
								if(totalprice>=50000){bae_song_bee=0;
									%>
										<del><%=default_bae_song_bee%> 원</del>=><%=bae_song_bee%> 원
									<%
								}else{
									%>
										<%=bae_song_bee%> 원
									<%
								}	
							%>
							<br>
						</td>
					</tr> 
					<tr>
						<td colspan="9" height="20px" align="center" style="border-bottom:2px solid orange;">
							<br><span style="vertical-align:middle; display:table-cell; font-size:16pt;">
								총 비용=<%=totalprice %>
								</span>
							<br>
						</td>
					</tr>
				<%}%>
			</tbody>
		</table>
		</div>
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
					<td class="container3" colspan="2" style="margin-left:1px; float:right;">
						 <h3>결제 예정 금액</h3> 	
          		  		<label for="fname" class="labelpay"> ₩ 총 주문금액</label><br><br>
          		  			<div class="inputtd2">연동해야함</div><br><br> 
          		  		<label for="fname" class="labelpay"> 포인트 <span style="color:#424242; font-size:18px;">| 포크 n개 (총 n원)</span></label><br><br>
	          		  	<br>
	          		  	<div style=" width:526px; float:left;">
        		  			<input type="text" class="inputtd3"> =
        		  			<input type="text" class="inputtd3">
        		  			<span class="won">원</span>
        		  			<a href="" class="tkdyd3">사용</a>
        		  		</div>
        		  		<br><br>	
         		  		<div><input type="submit" value="결제하기" class="btpay2" onclick="customer_decided_topay()"></div> 
	          		  					
					</td>
				</tr>
			</table>
  
</div></table>
</center>
<br><br><br>



	<%@include file="../general_included/footer.jsp"%>

</body>
</html>
