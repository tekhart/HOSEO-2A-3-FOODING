<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>

<meta charset="UTF-8">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보</title>

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
장바구니</div>

	<div class="sidebar">
		<div class="sideleft"></div><a href="../mypages/updatepage.jsp" > 개인정보 관리</a>
		<div class="sideleft"></div><a href="#" >포인트 관리</a>
		<div class="sideleft"></div><a href="#" >게시글 관리</a>
		<div class="sideleft"></div><a href="#" > 주문조회</a>
		<div class="sideleft"></div><a href="../mypages/shopbasket.jsp" > 장바구니</a>
	</div>

	<center>

			<br> 
		
		<table class="list-table" style="border-spacing:0px;">
						<td align="left" style="text-align:left; font-size:18pt; padding:10px;">일반상품(1)</td>
				          <tr class="list-tableth" >
				         	  <td width="10px;" style="border-top:4px solid orange; border-bottom:2px solid orange;">
				         	   <label><input type="checkbox" value="alldelete"></label></td>
				              <td width="200" style="border-top:4px solid orange; border-bottom:2px solid orange;">이미지</td>
				              <td width="300" style="border-top:4px solid orange; border-bottom:2px solid orange;">상품정보</td>	
				              <td width="120" style="border-top:4px solid orange; border-bottom:2px solid orange;">판매가</td>
				              <td width="180" style="border-top:4px solid orange; border-bottom:2px solid orange;">수량</td>
				              <td width="100" style="border-top:4px solid orange; border-bottom:2px solid orange;">포인트</td>
				              <td width="100" style="border-top:4px solid orange; border-bottom:2px solid orange;">배송비</td>
				              <td width="100" style="border-top:4px solid orange; border-bottom:2px solid orange;">합계</td>
				              <td width="100" style="border-top:4px solid orange; border-bottom:2px solid orange;"></td>
				           </tr> 
				        
				      
				        <tbody class="list-tabletd">
				        <tr>
				          <td width="10"  style="border-bottom:4px solid orange;">
				          		<label><input type="checkbox" value="prodelete1"></label></td> 
				          <td width="150" style="border-bottom:4px solid orange;">
					          	<div class="bak_item">
									<div class="pro_img"></div>
									<div class="pro_nt"></div>
					          		<img src="../img/pizza-3007395_420.jpg" width="200" height="150">
				          		</div></td>
				          <td width="150" style="border-bottom:4px solid orange;">피자</td>
				          <td width="150" style="border-bottom:4px solid orange;">19,900원</td>
				          <td width="150" style="border-bottom:4px solid orange;">	
				          		<div>
				          			<input type="number" value="1" name="ea" size="2" min="0" max="100" class="proquantity"  
				          			>
				          		<!-- <span>
				          			<input type="button" class="img-button2" >
				          			<input type="button" class="img-button3" >
				          		</span> -->
				          		</div>
				          </td>
				          <td width="100" style="border-bottom:4px solid orange;" img src="../img/fork.jpg">20</td>
				          <td width="150" style="border-bottom:4px solid orange;">2500원</td>
				          <td width="150" style="border-bottom:4px solid orange;">22,400원</td>
					          <td width="50" style="border-bottom:4px solid orange;">
					           		<input type="button" class="img-button" >
							  </td>
				        </tr>
				      </tbody>
				    </table>


		
		
		<br><br><br>
		
		<input type="reset" value="전체상품주문" class="longbt1" style="margin-left:250px;">
		<input type="submit" value="선택상품주문" class="longbt2">
		
		
		</form>
	
	</center>
	
</div> 
<br><br><br>

<%@include file="../general_included/footer.jsp"%> 

</body>
</html>
