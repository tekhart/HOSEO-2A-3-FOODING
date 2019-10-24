<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "DBBean.productDataBean" %>
<meta charset="UTF-8">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

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
     <%
		request.setCharacterEncoding("UTF-8");
		List<productDataBean> articleList = null;
		foodingBean dbPro = foodingBean.getInstance();
		foodingBean foodingbean = new foodingBean();

		try{
			articleList = dbPro.getcartArticles(idlogin);
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	
<div id="maindiv">
<div class="writetitle1">
장바구니</div>
	<%@include file="sidemenu.jsp"%> 
	


	<center>
 
			<br> 
		
		<table class="list-table" style="border-spacing:0px;">
						<td align="left" style="text-align:left; font-size:18pt; padding:10px;">일반상품(1)</td>
				          <tr class="list-tableth" >
				         	  <td width="10px;" style="border-top:4px solid orange; border-bottom:2px solid orange;">
				         	   <label><input type="checkbox" value="alldelete"></label></td>
				              <td width="200" style="border-top:4px solid orange; border-bottom:2px solid orange;">상품이미지</td>
				              <td width="300" style="border-top:4px solid orange; border-bottom:2px solid orange;">상품이름</td>	
				              <td width="120" style="border-top:4px solid orange; border-bottom:2px solid orange;">판매가</td>
				              <td width="180" style="border-top:4px solid orange; border-bottom:2px solid orange;">수량</td>
				              <td width="100" style="border-top:4px solid orange; border-bottom:2px solid orange;">포인트</td>
				              <td width="100" style="border-top:4px solid orange; border-bottom:2px solid orange;">배송비</td>
				              <td width="100" style="border-top:4px solid orange; border-bottom:2px solid orange;">합계</td>
				              <td width="100" style="border-top:4px solid orange; border-bottom:2px solid orange;"></td>
				           </tr> 
				        
				      
				        <tbody class="list-tabletd">
				        	<% 
				        		if(articleList==null){
				        	%>
				        		<tr>
				        			<td colspan="9" style="border-bottom:4px solid orange;">
				        				<br>
				        				장바구니가 비었어요! ^~^
				        				<br>
				        			</td>
				        		</tr>
				        	<% 
				        		}else{
				        			for (int i = 0 ; i < articleList.size(); i++) {
										productDataBean article = articleList.get(i);
										int bae_song_bee=2500;
										int realprice=article.getPrice()*(100-article.getDiscountRate())/100;
				        		%>
						        <tr>
						          <td width="10"  style="border-bottom:4px solid orange;">
						          		<label><input type="checkbox" value="prodelete1"></label></td> 
						          <td width="150" style="border-bottom:4px solid orange;">
							          	<div class="bak_item">
											<div class="pro_img"></div>
											<div class="pro_nt"></div>
											<div style="background-image:url('<%=article.getProductThumb() %>');background-size:cover;background-position:center;width:200px;height:150px;"></div>
						          		</div>
						          </td>
						          <td width="150" style="border-bottom:4px solid orange;"><%=article.getProductName() %></td>
						          <td width="150" style="border-bottom:4px solid orange;">
						          	<%if(article.getDiscountRate()==0){%>
						          		<%=article.getPrice()%>원
						          	<%}else{ %>
						          		<del><%=article.getPrice()%>원</del><%=article.getDiscountRate()%>% off<br>
						          		ㄴ><%=realprice%>원
						          	<%} %>
						          </td>
						          <td width="150" style="border-bottom:4px solid orange;">	
						          		<div>
						          			<input type="number" value="1" name="ea" size="2" min="1" max="100" class="proquantity">
						          		</div>
						          </td>
						          <td width="100" style="border-bottom:4px solid orange;"><img src="../img/fork.png" width="15px" height="15px">20</td>
						          <td width="150" style="border-bottom:4px solid orange;"><%=bae_song_bee%>원</td>
						          <td width="150" style="border-bottom:4px solid orange;"><%=realprice+ bae_song_bee%>원</td>
							          <td width="50" style="border-bottom:4px solid orange;">
							           		<input type="button" class="img-button" onclick="location.href='shopDBassisting_jsp/deletecart_after_clickX.jsp?deletecartid=<%=article.getCartId()%>'">
									  </td>
						        </tr>
				        	<%
				        			}
				        		}
				        	%>
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
