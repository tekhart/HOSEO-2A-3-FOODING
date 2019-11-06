<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>
<%@page import="DBBean.buyDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%!
	SimpleDateFormat sdf = 	
		new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE html>
<html>
<head>

<title>주문 조회</title>
<link rel="stylesheet" href="../jsp_project/css/common.css">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="../css/list.css">
	<%@include file="../shop/move.jsp"%>
<style>
.jumuntb{
border-collapse:collapse;
width:1200px;
margin:auto;
padding:100px;
top:100px;
position:relative;
}

.cc{width:100px;} 

.jumuntb td {
	height:60px;
	width:150px;
	text-align:center;
}

.tooltip {
	position: relative;
}

.tooltip .tooltiptext {
	visibility: hidden;
	width: 320px;
	background-color: #555;
	color: #fff;
	text-align: center;
	border-radius: 6px;
	padding: 5px 0;
	position: absolute;
	z-index: 1;
	bottom: 125%;
	left: 50%;
	margin-left: -127px;
	opacity: 0;
	transition: opacity 0.3s;
}	

.tooltip .tooltiptext::after {
	content: "";
	position: absolute;
	top: 100%;
	left: 50%;
	margin-left: -5px;
	border-width: 5px;
	border-style: solid;
	border-color: #555 transparent transparent transparent;
}

.tooltip:hover .tooltiptext {
	visibility: visible;
	opacity: 1;
}

.jumuntr1 td{
	background-color:#FFCD12;
	color:white;
	border-top:2px solid #CCA63D;
	border-bottom:2px solid #CCA63D;
}

.jumuntr2 td{
	border-bottom:1px solid #eaeaea;
}


</style>

</head>
<body  id="body">
<%@include file="../general_included/topbar.jsp"%>
<%

	foodingBean dbPro = foodingBean.getInstance();
	int[] refarray=dbPro.getDistinctBuyRefs(idlogin);
	
%>
<div id="maindiv">
<div class="writetitle1">
주문조회</div>
	<%@include file="sidemenu.jsp"%>
	
<table class="jumuntb" border="1">
	<tr class="jumuntr1">
		<td class="cc">주문번호</td>
		<td>주문 제목</td>
		<td>제품 사진</td>
		<td>제품 이름</td>
		<td>주문 개수</td>
		<td class="tooltip">
			가격
			<img src="../img/what2.png" width="25px" height="25px" style="vertical-align:middle;">
			<span class="tooltiptext">
				할인 / 사용 포인트가 적용된 금액입니다
			</span>
		</td>
		<td>비고</td>
	</tr>
	<%for(int refint=0;refint<refarray.length;refint++){
		List<buyDataBean> DataArticleList =dbPro.getbuyArticles(refarray[refint]);
		int totalprice=0;
		buyDataBean article=null;
		for(int articleint=0;articleint<DataArticleList.size();articleint++){
			article=DataArticleList.get(articleint);
			int realprice=article.getPrice()*(100-article.getDiscountRate())/100;
			totalprice+=realprice*article.getProductCount() ;
			%>
			<tr>
				<%
				if(articleint==0){
					%>
					<td rowspan="<%=DataArticleList.size()+1%>">
						<%=article.getBuyId() %>
					</td>
					<td rowspan="<%=DataArticleList.size()%>">
						<%=article.getProductName()%>
						<%if(DataArticleList.size()!=1){%>
							외 <%=DataArticleList.size()-1 %>개의 제품
						<%} %>
					</td>
				<%}%>
				<td>
					<div style="background-image:url('<%=article.getProductThumb() %>');background-size:cover;background-position:center;width:290px;height:163px;"></div>
				</td>
				<td>
					<%=article.getProductName() %>
				</td>
				<td>
					<%=article.getProductCount() %> 개
				</td>
				<td>
					<%if(article.getDiscountRate()!=0){ %>
						<%=article.getDiscountRate() %>% <%=article.getPrice() %>원<br>
					<%} %>
					<%=realprice %>원
				</td>
				<td
					<%if(article.getAccountId()>0&&article.getAccountId()<6){ %>
						onclick="location.href='BankDeposit.jsp?buyref=<%=article.getRef() %>'"
					<%} %>
				>
					<%=article.getSanction() %>
					<%if(article.getAccountId()>0&&article.getAccountId()<6){ %>
						클릭하시면 입금계좌 정보와 제한 기일이 나옵니다.
					<%} %>
				</td>
			</tr>
		<%}%>
		<tr>
			<td>
				결제 일자 <br>
				<%=sdf.format(article.getBuydate())%>
			</td>
			<td colspan="3">
				사용포인트 : <%=article.getPointused()%>포크
			</td>
			<td>
				총 가격 : <%=totalprice%>원 
			</td>
			<td>
				<%=totalprice-article.getPointused()%>원
			</td>
		</tr>
	<%}%>
	
</table>


<%@include file="../general_included/footer.jsp"%>
</body>
</html>
