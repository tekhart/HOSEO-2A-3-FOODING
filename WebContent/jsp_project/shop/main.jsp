<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "DBBean.foodingBean" %>
<%@ page import = "DBBean.productDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%!
	int pageSize = 40;
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
			z-index: 1000; /* Sit on top */
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
			width: 200px;
			margin: 10px;
			height:313px;
			float:left;
			font-family: arial;
			text-align: center;
			display: inline-block;
			box-shadow:0 2px 2px 0 rgba(0,0,0,0.2)
		}
		.card:hover {
			box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2)
		}
		

		
		body {
  font-family: "Lato", sans-serif;
}


.blue-btn a{
  color: white;
  text-decoration:none;
  margin-top: 0em;
  text-align: center;
  display:inline-block; /* important */
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}



.first-link{
	-webkit-transition: 2s;
  -moz-transition: 2s;
  transition: 2s;
  
  -webkit-transition-timing-function: linear;
  -moz-transition-timing-function: linear;
  transition-timing-function: linear;
}

.blue-btn{
  overflow: hidden;
}

.first-link{
  margin-left: 0em;   
}

.blue-btn:hover .first-link{
  margin-left: -300px;
}


	</style>
	<script>
		function ShowDetail(pdtid,pdtname,price,dscountrt,pdtthumb) {
			document.getElementById("myModal_Title").innerHTML="[제품명]<br>"+pdtname;
			if(dscountrt==0){
				document.getElementById("myModal_Price").innerHTML="[가격]<br>"+price+"원";
			}else{
				document.getElementById("myModal_Price").innerHTML="[가격]<br><del>"+price+"원</del> "+price*(100-dscountrt)/100+"원";
			}
			$("#myModal_Thumb").css("background-image","url("+pdtthumb+")");
			inputproductcountNumber.this_is_just_for_save.value=pdtid;
			
			document.getElementById("myModal").style.display = "block";
		}
		// When the user clicks on <span> (x), close the modal
		function CloseDetail() {
			document.getElementById("myModal").style.display = "none";
		}
		
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == document.getElementById("myModal")) {
				document.getElementById("myModal").style.display = "none";
			}
		}
		
		function toAddCart(){
			var pdtid=inputproductcountNumber.this_is_just_for_save.value;
			var pdtcnt=inputproductcountNumber.inputproductCount.value;
			location.href="../mypages/shopDBassisting_jsp/addcart_before_showcart.jsp?addproductid="+pdtid+"&addproductcount="+pdtcnt;
	
		}
		
		
		var dropdown = document.getElementsByClassName("dropdown-btn");
		var i;

		for (i = 0; i < dropdown.length; i++) {
		  dropdown[i].addEventListener("click", function() {
		  this.classList.toggle("active");
		  var dropdownContent = this.nextElementSibling;
		  if (dropdownContent.style.display === "block") {
		  dropdownContent.style.display = "none";
		  } else {
		  dropdownContent.style.display = "block";
		  }
		  });
		}

	</script>
	
</head>
<body>
	<div id="maindiv">
		<div class="writetitle1">
			재료구매
		</div>
		<%@include file="sidemenu.jsp"%>
		
		<div style="margin-left:250px;maxwidth:950px">
			<% if (count == 0) { %>	
					<table align="center" class="nogul">
						<tr>
							<td align="center">
								상품 준비중입니다!
										<img src="../img/ding.png" height="335px" width="559px">
							</td>
						</tr>
					</table>
				<%}else {%>
					<br>
					
					<%	
						for (int i = 0 ; i < articleList.size(); i++) {
							productDataBean article = articleList.get(i);
							int realprice=article.getPrice()*(100-article.getDiscountRate())/100;
					%>
					<div class="card">
						<div style="background-image:url('<%=article.getProductThumb() %>');background-size:cover;background-position:center;width:200px;height:112px;"></div>
						<p class="writerlong blue-btn"><span class="first-link"><%=article.getProductName() %></span></p>
						<div class="product_price_html">
							<%if(article.getDiscountRate()==0){ %>
								
							<%}else{ %>
								<span style="text-decoration:line-through; align:left;"> <%=article.getPrice()%>원</span><span style="color:red;"><%=article.getDiscountRate()%></span><span style="font-size:16px;">%</span><span style="font-size:13px;">off</span>
							<%}%>
							<br> <%=realprice%>원</div>
						<p><button id="myBtn" 
							onclick="ShowDetail(<%=article.getProductId()%>,'<%=article.getProductName()%>',<%=article.getPrice()%>,<%=article.getDiscountRate()%>,'<%=article.getProductThumb()%>')">자세히 보기</button></p>
					</div>
				 	<%}%>
			 	
			<%}%>
		</div>
				
		<div id="myModal" class="modal" style="display: none">
			<div class="modal-content" style="background-color:#eeeeee">
				<span class="close" onclick="CloseDetail()">&times;</span>
				<table class="detail" style="border-spacing:0px;">
					<tr>
						<td rowspan="3">
							<div id="myModal_Thumb" style="background-size:cover;width:400px;height:400px;background-position:center;"></div>
						</td>
						<td width="100%" height="150px">
							<div id="myModal_Title"></div>
						</td>
					</tr>
					<tr>
						<td>
							<div id="myModal_Price"></div>
						</td>
					</tr>
					<tr>
						<td>
							<form name="inputproductcountNumber">
								<input type="hidden" name="this_is_just_for_save">
								수량 : <input type="number" value="1" name="inputproductCount" size="2" min="1" max="100" class="proquantity">
							</form>
						</td>
					</tr>
					<tr>
						<td colspan="2" height="60px">
							<%if(idlogin!=null){ %>
								<input type="button" onclick="toAddCart()" class="button134" value="+ 장바구니에 추가">
								<div class='testEle'></div>
							<%}else{ %>
								<input type="button" class="button134" value="로그인 후 이용해주세요" onclick="location.href='../mains/signin.jsp'">
							<%} %>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
			<%@include file="../general_included/footer.jsp"%>
</body>
</html>
