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
				          <tr class="list-tableth" >
				              <td width="350" style="border-top:4px solid orange; border-bottom:2px solid orange;">상품정보</td>
				              <td width="120" style="border-top:4px solid orange; border-bottom:2px solid orange;">판매가</td>
				              <td width="150" style="border-top:4px solid orange; border-bottom:2px solid orange;">수량</td>
				              <td width="100" style="border-top:4px solid orange; border-bottom:2px solid orange;">등록일</td>
				           </tr> 
				        
				      
				        <tbody class="list-tabletd">
				        <tr>
				          <td width="300"  style="border-bottom:4px solid orange;">
				          	<div class="bak_item">
							<div class="pro_img"><img src="../img/pizza-3007395_420.jpg" width="210px" height="150px"></div>
							<div class="pro_nt"></div>
						</div>
				          </td> 
				          <td width="150" style="border-bottom:4px solid orange;"></td>
				          <td width="150" style="border-bottom:4px solid orange;">1</td>
				          <td width="100" style="border-bottom:4px solid orange;"></td>
				        </tr>
				      </tbody>
				    </table>


		
		
		<br><br><br>
		
		<input type="reset" value="수정" class="findbutton">
		<input type="submit" value="확인" class="findbutton">
		
		
		</form>
	
	</center>
	
</div> 
<br><br><br>



<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
Create by FOODING<br>
고객문의 1544-XXXX<br>
JSP Project 2019 2A03
</div>

</body>
</html>
