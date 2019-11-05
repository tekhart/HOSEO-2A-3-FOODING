<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@page import="DBBean.foodingBean"%>
<%@ page import="java.util.List"%>
<%@ page import="DBBean.productDataBean"%>
<meta charset="UTF-8">

<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/list.css">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">

	<%@include file="../shop/move.jsp"%>
<style>
body {
	font-family: "Bauhaus ITC";
	color: black;
}

#title {
	text-decoration: none;
}
</style>
<script>
	function CheckAllSubChecks() {
		var main = document.getElementsByClassName("BasketMainCheck");
		var subs = document.getElementsByClassName("BasketSubCheck");
		if (main[0].checked) {
			for (i = 0; i < subs.length; i++) {
				subs[i].checked = true;
			}
		} else {
			for (i = 0; i < subs.length; i++) {
				subs[i].checked = false;
			}
		}
	}
	function AllCheckSubmit() {

		CheckAllSubChecks();
		var subs = document.getElementsByClassName("BasketSubCheck");
		for (i = 0; i < subs.length; i++) {
			if (!subs[i].checked) {
				subs[i].disabled = true;
			}
		}
		document.shopbasketForm.submit();

	}
</script>
</head>

<body id="body">
	<%@include file="../general_included/topbar.jsp"%>
	<%
		request.setCharacterEncoding("UTF-8");
		List<productDataBean> articleList = null;
		foodingBean dbPro = foodingBean.getInstance();
		foodingBean foodingbean = new foodingBean();
		int count = 0;
		try {
			articleList = dbPro.getcartArticles((String)session.getAttribute("idlogin"));
			count = articleList.size();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	
<div id="maindiv">
	<div class="writetitle1">장바구니</div>

	<%@include file="sidemenu.jsp"%> 
	<form method="POST" action="paypage.jsp" name="shopbasketForm">

		<div>
			
				<% 
					if(articleList==null){
				%>
				  
					<table width="400px" height="280px" style="text-align:center; font-size:20pt; border-color:#ffbb00; border-width:3px;
						border-style:solid; font-family:Bauhaus ITC;" align="center">
						<tr><td><br><br> 
						<span><img src="../img/picnic-basket.png" height="60px" width="80px"></span></td></tr>
						<tr><td>
						<h4>장바구니가 비어 있습니다.</h4></td></tr>
							<tr><td><input type="button" value="상점 가기" class="findbutton" onclick="location.href='../shop/main.jsp'"></td></tr><br><br><br><br> </table>
							
				 
				<% 
					}else{
						 
				%>
					<table class="list-table" style="border-spacing:0px;margin:auto; padding-left:100px;">
						<tr>
							<td align="left" style="text-align:left; font-size:18pt; padding:80px 0px 5px 10px;">일반상품(<%=count%>)</td>
						</tr>
						<tr class="list-tableth" >
					 		<td width="10px;" style="border-top:3px solid orange; border-bottom:2px solid orange;">
					 			<label><input type="checkbox" value="alldelete" class="BasketMainCheck" onclick="CheckAllSubChecks()" checked></label></td>
							<td width="150" style="border-top:3px solid orange; border-bottom:2px solid orange;">상품이미지</td>
							<td width="300" style="border-top:3px solid orange; border-bottom:2px solid orange;">상품이름</td>	
							<td width="120" style="border-top:3px solid orange; border-bottom:2px solid orange;">판매가</td>
							<td width="280" style="border-top:3px solid orange; border-bottom:2px solid orange;">수량</td>
							<td width="120" style="border-top:3px solid orange; border-bottom:2px solid orange;">포인트적립</td>
							<td width="100" style="border-top:3px solid orange; border-bottom:2px solid orange;">합계</td>
							<td width="100" style="border-top:3px solid orange; border-bottom:2px solid orange;"></td>
						 </tr> 
					
								
						<tbody class="list-tabletd">
				<%
						
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
							<td width="5%"	style="border-bottom:3px solid orange;">
									<label><input type="checkbox" class="BasketSubCheck" name="CartIdchkbx" value="<%=article.getCartId()%>" checked>
							<td width="10%" style="border-bottom:3px solid orange;">
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
									>> <%=realprice%>원
								<%} %>
							</td>
							<td width="200" style="border-bottom:3px solid orange; font-size:16pt;">	
									<div>
										<%=article.getProductCount() %>
									</div>
							</td>
							<td width="150" style="border-bottom:3px solid orange; font-size:16pt;"><img src="../img/fork.png" width="15px" height="15px"><%=ExpectedValueOfAddMile %></td>
							<td width="150" style="border-bottom:3px solid orange; font-size:16pt;"><%=RealxCountPrice%>원</td>
							<td width="50" style="border-bottom:3px solid orange; ">
							 	<input type="button" class="img-button" onclick="location.href='shopDBassisting_jsp/deletecart_after_clickX.jsp?deletecartid=<%=article.getCartId()%>'">
							</td>
						</tr>
					<%}%>
					<tr> 
						<td colspan="2" style="border-bottom:2px solid orange; height:35px;"></td>
						<td colspan="1" style="border-bottom:2px solid orange; font-size:16pt;">배송비</td>
						<td colspan="1" style="border-bottom:2px solid orange; font-size:16pt;">+</td>
						<td colspan="4" style="border-bottom:2px solid orange; font-size:16pt; text-align:left; vertical-align:middle; display:table-cell; padding-left:80px;"> 
							<%		
								if(totalprice>=50000){bae_song_bee=0;
									%>
										<del><%=default_bae_song_bee%>원</del>=><%=bae_song_bee%> 원
									<%
								}else{
									%>
										<%=bae_song_bee%> 원
									<%
								}	
							%>
						</td>
					</tr> 
					<tr>
						<td colspan="8" height="20px" align="center" style="border-bottom:2px solid orange;">
							<br><span style="vertical-align:middle; display:table-cell; font-size:16pt;">
								총 비용=<%=totalprice+bae_song_bee %>
								</span>
							<br>
						</td>
					</tr>

			</tbody>
		</table>
		<br><br><br>
			<div align="center">
				<input type="button" onclick="AllCheckSubmit()" value="전체상품주문" class="longbt1">
				<input type="submit" value="선택상품주문" class="longbt2">
			</div>
			<%}%>
		</div>
	</form>
</div> 
<br><br><br>

<%@include file="../general_included/footer.jsp"%> 

</body>
</html>
