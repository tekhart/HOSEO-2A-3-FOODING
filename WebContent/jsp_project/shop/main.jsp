<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "DBBean.foodingBean" %>
<%@ page import = "DBBean.productDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%!
	int pageSize = 6;
	SimpleDateFormat sdf = 	
		new SimpleDateFormat("yyyy-MM-dd");
%>
<%	
	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	String search=request.getParameter("search");
	String preProType=request.getParameter("productType");
	String preIsTool=request.getParameter("isTool");
	if(preProType==null){
		preProType="0";
	}if(preIsTool==null){
		preIsTool="0";
	}
	int productType=Integer.parseInt(preProType);
	int isTool=Integer.parseInt(preIsTool);

	if (pageNum == null||pageNum.equals("0")) {
		pageNum = "1";
	}

	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	
	List<productDataBean> articleList = null; 
	
	foodingBean dbPro = foodingBean.getInstance();
	foodingBean foodingbean = new foodingBean();
	count = dbPro.getproductArticleCount(isTool,productType,search);
	
	
	
	if (count > 0) {
		articleList = dbPro.getproductArticles(startRow, pageSize,isTool,productType,search);
	}
	
%>
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>재료 구매</title>
	<link rel="stylesheet" href="../css/common.css">
	<link rel="stylesheet" href="../css/list.css">
	<link rel="shortcut icon" href="../img/favicon.ico">
	<link rel="icon" href="../img/favicon.ico">
	<%@include file="../general_included/topbar.jsp"%>
	<%@include file="move.jsp"%>
	<style>
		.button134 {
		border: none; 
		outline: 0;
		padding: 12px;
		color: white;
		background-color: #000;
		text-align: center;
		cursor: pointer;
		width: 100%;
		font-size: 18px;
		margin-right:10px;
	}
	
	.detail td{padding:5px;
	border-bottom:1px solid orange;
	}
	
	.modal {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		padding-top: 100px; /* Location of the box */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	.modal-content {
		background-color: #fefefe;
		margin: auto;
		padding: 20px;
		border: 1px solid #888;
		width: 750px;
		
	}
	
	/* The Close Button */
	.close {
		color: #aaaaaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
		color: #000;
		text-decoration: none;
		cursor: pointer;
	}
	
	.card {
		-webkit-transition: 0.3s;
	 	 transition: 0.3s;
	 	 max-width: 300px;
	 	 margin: 28px;
			 max-height:690px;
		float:left;
		 font-family: arial;
	 	 text-align: center;
	 	 display: inline-block;
	 	 box-shadow:0 2px 2px 0 rgba(0,0,0,0.2)
	}
	
	.card:hover {
		box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2)
	}
	</style>
</head>
<body>
	<div id="maindiv">
		<div class="writetitle1">
			재료구매
		</div>
		<br><br><br><br><br><br><br><br><br><br><br><br>
		<%@include file="sidemenu2.jsp"%>
		
		<br><br><br><br><br> 
		
		
		<% if (count == 0) { %>	
				<table align="center" class="nogul">
					<tr>
						<td align="center">
							검색결과가 없습니다.<br>
							 다른 걸 검색해 보세요! <br>
									<img src="../img/ding.png" height="335px" width="559px">
						</td>
					</tr>
				</table>
			<%}else {%>
				<br>
				<%	
					for (int i = 0 ; i < articleList.size(); i++) {
						productDataBean article = articleList.get(i);
				%>
				<div class="card">
					<div style="background-image:url('<%=article.getProductThumb() %>');background-size:300px;width:300px;height:168px;"></div>
					<h1><%=article.getProductName() %></h1>
					<%if(article.getDiscountRate()==0){ %>
						<p class="price"><%=article.getPrice()%></p>
					<%}else{ %>
						<p class="price"><%=article.getPrice()%>(-<%=article.getDiscountRate()%>) => <%=article.getPrice()*article.getDiscountRate()/100 %></p>
					<%}%>
					<p><button id="myBtn" onclick="ShowDetail()">자세히 보기</button></p>
				</div>
		 	<%}%>
		<%}%>
		<%@include file="../general_included/footer.jsp"%>
				
		<div id="myModal" class="modal">
			<div class="modal-content">
				<span class="close">&times;</span>
				<table class="detail" style="border-spacing:0px;">
					<tr>
						<td rowspan="3">
							<img src="../img/casserole-dish-2776735_420.jpg" width="400px" height="400px" >
						</td>
						<td id="myModal_title">
							[제목]<br>요리 재료 모음
						</td>
					</tr>
					<tr>
						<td id="myModal_price">
							[가격]<br><del>12000</del><br>8900
						</td>
					</tr>
					<tr>
						<td>[설명]<br>기본적인 요리 재료 모음입니다<br>구성품 : 토마토, 버섯, 고추, 피망, 양파, 마늘</td>
					</tr>
					<tr>
						<td colspan="2" style="border-bottom:4px solid white;"><input type="button" class="button134" value="+ 장바구니에 추가"></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
			
			
				
	<script>
	// Get the modal
	var modal = document.getElementById("myModal");
	
	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
	// When the user clicks the button, open the modal 
	btn.onclick = function() {
		modal.style.display = "block";
	}
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
		modal.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
		modal.style.display = "none";
		}
	}
	</script>
				
		
</body>
</html>
