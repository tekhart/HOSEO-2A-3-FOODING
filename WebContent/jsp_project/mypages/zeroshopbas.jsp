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

		<%@include file="sidemenu.jsp"%> 

	<center>

	<table width="500px" height="280px" style="text-align:center; font-size:20pt; border-color:#ffbb00; border-width:3px;
		border-style:solid; font-family:Bauhaus ITC";" >
		<tr><td>
		<span><img src="../img/picnic-basket.png" height="60px" width="80px"></span></td></tr>
		<tr><td>
		<h4>장바구니가 비어 있습니다.</h4></td></tr>
			<tr><td></td></tr><br><br><br><br> </table>
	
	
			<br>
		
		</table> 
		</fieldset>
		
		<br><br><br>
		
		<input type="reset" value="전체상품주문" class="longbt1">
		<input type="submit" value="선택상품주문" class="longbt2">
		
		
		</form>
	
	</center>
	
</div> 
<br><br><br>



	<%@include file="../general_included/footer.jsp"%>

</body>
</html>
