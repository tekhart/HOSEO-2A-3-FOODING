<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "DBBean.buyDataBean" %>
<%@ page import = "DBBean.bankDataBean" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
	foodingBean dbPro = foodingBean.getInstance();
	int buyref=Integer.parseInt(request.getParameter("buyref"));
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	List<buyDataBean> DataArticleList =dbPro.getbuyArticles(buyref);
	
	int totalprice=0;
	buyDataBean article=null;
	bankDataBean bankarticle=null;
	String buyname="";
	Timestamp buydate=null;
	
	String banknum="";
	String bank="";
	
	for(int articleint=0;articleint<DataArticleList.size();articleint++){
		article=DataArticleList.get(articleint);
		int realprice=article.getPrice()*(100-article.getDiscountRate())/100;
		totalprice+=realprice*article.getProductCount();
		
		if(articleint==0){
			buyname=article.getProductName();
			if(DataArticleList.size()!=1){
				buyname+="외 "+DataArticleList.size()+" 개의 제품";
			}
			totalprice-=article.getPointused();
			buydate=article.getBuydate();
			bankarticle=dbPro.getbankArticle(article.getAccountId());
			bank=bankarticle.getBank();
			banknum=bankarticle.getBanknum();
		}
	}
	Timestamp enddate=new Timestamp(buydate.getTime()+(1000*60*60*24*3));
%>
<meta charset="UTF-8">


<!DOCTYPE html>
<html>
<head>
	<link rel="shortcut icon" href="../img/favicon.ico">
	<link rel="icon" href="../img/favicon.ico">
<meta charset="UTF-8">
	<title>접수 완료</title>
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
	
</script>


</head> 

		<body id="body">
		<%@include file="../general_included/topbar.jsp"%>

		<div id="maindiv">
		<div class="writetitle1">
		</div>
		<%@include file="sidemenu.jsp"%>   

			<center>  
				<div class="row2"> 
					<div class="jumungamsa">주문 감사드립니다(접수 완료)</div>
					<p> 총 입금하실 금액을 확인하시고, 은행에 입금하여 주세요.</p>
					<table class="jugamtable">
						<tr><td>주문번호</td><td><%=buyref %></td>
							<td>주문일</td><td><%=sdf.format(buydate) %></td>
					</table>
			<br><br> 
					 <p class="bankinfo" >입금하실 은행정보</p>
					<table style="border:3px solid #c0c0c0; border-width: thin;  border-collapse: collapse;">
						<tr>
							<td class="bankallprice">총 입금하실 금액</td>
							<td class="banking"><%=totalprice %>원</td>
							<td class="bankallprice">입금은행</td>
							<td class="banking"><%=bank %></td>
						</tr>
						<tr>
							<td class="bankallprice">계좌번호</td>
							<td class="banking"><%=banknum %></td>
							<td class="bankallprice"> 입금기한</td>
							<td class="banking">주문일로부터 3일간(<%=sdf.format(enddate) %>까지)</td>
						</tr>
					</table>
						<div style="text-align:center; margin-top:40px;">
							<input type="button" value="확인" class="tkdyd4" onclick="location.href='../mypages/jumuncheck.jsp'">
						</div>
				</div>


			</center>

<%@include file="../general_included/footer.jsp"%>
	<br><br>
</body>
</html>