<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@page import="DBBean.foodingBean"%>
<%@page import="DBBean.buyDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%!SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>

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
.jumuntb {
	border-collapse: collapse;
	width: 1200px;
	margin: auto;
	padding: 100px;
	top: 100px;
	position: relative;
}

.cc {
	width: 100px;
}

.jumuntb td {
	height: 60px;
	width: 150px;
	text-align: center;
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

.jumuntr1 td {
	background-color: #FFCD12;
	color: white;
	border-top: 2px solid #CCA63D;
	border-bottom: 2px solid #CCA63D;
}

.jumuntr2 td {
	border-bottom: 1px solid #eaeaea;
}
</style>
<script type="text/javascript">
	function thanks_to_pay(buyref,buytotalprice,buypointused,buytitle){
		if(confirm('결제확인을 하시겠습니까?')){
			location.href="confirmPay.jsp?buyref="+buyref+"&buytotalprice="+buytotalprice+"&buypointused="+buypointused+"&buytitle="+buytitle+"";
		}else{
			return;
		}
	}
	function changebuystatus(buyref,buystatus){
		if(confirm(buyref+"번 주문 상태를 "+buystatus+' 상태로 변경하시겠습니까?')){
			location.href="changestatus.jsp?buyref="+buyref+"&buystatus="+buystatus+"";
		}else{
			return;
		}
	}
</script>
</head>
<body id="body">
	<%@include file="../general_included/topbar.jsp"%>
	<%
		foodingBean dbPro = foodingBean.getInstance();
		String userid = request.getParameter("userid");
		if (userid == null) {
			userid = "";
		}
		int[] refarray = dbPro.getDistinctBuyRefs(userid);
	%>
	<div id="maindiv">
		<div class="writetitle1">주문조회</div>
		<table class="jumuntb" border="1">
			<tr class="jumuntr1">
				<td class="cc">결제자</td>
				<td class="cc">주문번호</td>
				<td>주문 제목</td>
				<td>결제 일자</td>
				<td>포인트 사용량</td>
				<td>가격 총액</td>
				<td>실 결제액</td>
				<td>결제 방식</td>
				<td>현 상태</td>
			</tr>
			<%
				for (int refint = 0; refint < refarray.length; refint++) {
					List<buyDataBean> DataArticleList = dbPro.getbuyArticles(refarray[refint]);
					int totalprice = 0;
					buyDataBean article = null;
					String buytitle = "";
					for (int articleint = 0; articleint < DataArticleList.size(); articleint++) {
						article = DataArticleList.get(articleint);
						int realprice = article.getPrice() * (100 - article.getDiscountRate()) / 100;
						totalprice += realprice * article.getProductCount();
						if (articleint == 0) {
							buytitle = article.getProductName();
							if (DataArticleList.size() != 1) {
								buytitle += "외 " + (DataArticleList.size() - 1) + " 개의 제품";
							}
						}
					}
			%>
			<tr>
				<td><%=article.getOwner()%></td>
				<td><%=article.getRef()%></td>
				<td><%=buytitle%></td>
				<td><%=sdf.format(article.getBuydate())%></td>
				<td><%=article.getPointused()%>원</td>
				<td><%=totalprice%>원</td>
				<td><%=totalprice - article.getPointused()%>원</td>
				<td>
					<%
						if (article.getAccountId() > 0 && article.getAccountId() < 6) {
					%> 무통장입금<br>입금자 : <%=article.getAccountName()%>
						<input type="button" value="결제 확인"
						onclick="thanks_to_pay(<%=article.getRef()%>,<%=totalprice%>,<%=article.getPointused()%>,'<%=buytitle%>')">
					<%
						} else {
					%>
						<%=article.getAccountName()%>
					<%
					 	}
					%>
				</td>
				<td>
					<%=article.getSanction()%>
					<%
					 	if (article.getSanction().equals("상품준비중") || article.getSanction().equals("상품배달중")) {
					 %>
					 	<select name='searchtype' style="ime-mode:inactive; padding: .7em .5em; 
								border-radius: 5px 5px 5px 5px; border-color:#ffbb00; font-size:14pt;
								font-family:Bauhaus ITC; height:50px;" >
							<option selected>배달단계 조정</option>
							<option onclick="changebuystatus(<%=article.getRef() %>,'상품준비중')">상품준비중</option>
							<option onclick="changebuystatus(<%=article.getRef() %>,''배달중')">배달중</option>
							<option onclick="changebuystatus(<%=article.getRef() %>,'배달 완료')">배달 완료</option>
						</select>
					 <%
					 	}
					 %>
				</td>
			</tr>
			<%
				}
			%>

		</table>

	</div>
	<%@include file="../general_included/footer.jsp"%>
</body>
</html>
