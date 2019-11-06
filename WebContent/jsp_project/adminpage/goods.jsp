<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@page import="DBBean.foodingBean" %>
<%@page import="DBBean.productDataBean" %>
<%@ page import = "java.util.List" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="admincss.css">
<script type="text/javascript">
	function confirmProdctdelete(productid){
		if(confirm('이 상품을 등록 해제 하시겠습니까?')){
			location.href="goodsdelete.jsp?productid="+productid
		}
	}
</script>
</head>
<body>
<%@include file="../general_included/topbar.jsp"%>
<%
	foodingBean dbPro = foodingBean.getInstance();
	int isTool=0;
	int productType=0;
	List<productDataBean> articleList=null;
	try{
		isTool=Integer.parseInt(request.getParameter("isTool"));
	}catch(Exception e){e.printStackTrace();isTool=0;}
	try{
		productType=Integer.parseInt(request.getParameter("productType"));
	}catch(Exception e){e.printStackTrace();productType=0;}
	int count=dbPro.getproductArticleCount(isTool,productType,null);
	articleList=dbPro.getproductArticles(1,1000,isTool,productType,""); 
%>
<br><br><br><br>
<table class="adminstb3" border="1" >
	<tr>
		<td>제목</td>
		<td>썸네일</td>
		<td>가격</td>
		<td>할인율</td>
		<td>도구1/재료2</td>
		<td>2차분류</td>
		<td>수정</td>
		<td>삭제</td>
		
	</tr>
	<%
		if(count==0){
	%>
		<tr>
			<td colspan="8">
				상품이없습니다. 등록해주세요.
			</td>
		</tr>
	<%
		}else{
			for(int i=0;i<articleList.size();i++){
				productDataBean article=articleList.get(i);
		%>
			<tr>
				<td><%=article.getProductName() %></td>
				<td><%=article.getProductThumb() %></td>
				<td><%=article.getPrice() %></td>
				<td><%=article.getDiscountRate() %></td>
				<td><%=article.getIsTool() %></td>
				<td><%=article.getProductType() %></td>
				<td><a href="goodsupdate.jsp?productid=<%=article.getProductId()%>">수정</a></td>
				<td><a onclick="confirmProdctdelete('<%=article.getProductId()%>')">삭제</a></td>
			</tr>
	<%	}
	} %>
</table>
<br>
<table class="adminstb2" border="1">
	<tr>
		<td colspan="6" align="center">아래의 분류를 누르시면 해당 분류만 표시됩니다.</td></tr>
	<tr>
	<tr>
		<td colspan="6" align="center" onclick="location.href='goods.jsp'">전체 상품 분류</td></tr>
	<tr>
		<td colspan="3" width="300px" align="center" onclick="location.href='goods.jsp?isTool=2'">재료 : 2</td>
		<td colspan="3" width="300px" align="center" onclick="location.href='goods.jsp?isTool=1'">도구 : 1</td>
	</tr>
	<tr>
		<td colspan="2" onclick="location.href='goods.jsp?productType=1'">과일</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=1'">1</td>
		<td colspan="2" onclick="location.href='goods.jsp?productType=11'">주방가전</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=11'">11</td>
	</tr>
	<tr>
		<td colspan="2" onclick="location.href='goods.jsp?productType=2'">채소</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=2'">2</td>
		<td colspan="2" onclick="location.href='goods.jsp?productType=12'">냄비/프라이팬</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=12'">12</td>
	</tr>
	<tr>
		<td colspan="2" onclick="location.href='goods.jsp?productType=3'">축산/계란</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=3'">3</td>
		<td colspan="2" onclick="location.href='goods.jsp?productType=13'">칼/도마</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=13'">13</td>
	</tr>
	<tr>
		<td colspan="2" onclick="location.href='goods.jsp?productType=4'">수산물/건어물</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=4'">4</td>
		<td colspan="2" onclick="location.href='goods.jsp?productType=14'">테이블웨어</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=14'">14</td>
	</tr>
	<tr>
		<td colspan="2" onclick="location.href='goods.jsp?productType=5'">과자/초콜릿/시리얼</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=5'">5</td>
		<td colspan="2" onclick="location.href='goods.jsp?productType=15'">밀폐용기</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=15'">15</td>
	</tr>
	<tr>
		<td colspan="2" onclick="location.href='goods.jsp?productType=6'">면/통조림/가공식품</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=6'">6</td>
		<td colspan="2" onclick="location.href='goods.jsp?productType=16'">주방수납/정리</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=16'">16</td>
	</tr>
	<tr>
		<td colspan="2" onclick="location.href='goods.jsp?productType=7'">가루/조미료/오일</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=7'">7</td>
		<td colspan="2" onclick="location.href='goods.jsp?productType=17'">주방조리도구</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=17'">17</td>
	</tr>
	<tr>
		<td colspan="2" onclick="location.href='goods.jsp?productType=8'">장/소스/드레싱/식초</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=8'">8</td>
		<td colspan="2" onclick="location.href='goods.jsp?productType=18'">주방잡화</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=18'">18</td>
	</tr>
	<tr>
		<td colspan="2" onclick="location.href='goods.jsp?productType=9'">유제품/아이스크림</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=9'">9</td>
		<td colspan="2" onclick="location.href='goods.jsp?productType=19'">일회용품</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=19'">19</td>
	</tr>
	<tr>
		<td colspan="2" onclick="location.href='goods.jsp?productType=10'">냉장/냉동/간편식</td>
		<td colspan="1" onclick="location.href='goods.jsp?productType=10'">10</td>
		<td colspan="2"> </td>
		<td colspan="1"> </td>
	</tr>
	<tr>
		<td align="center" colspan="6"><input type="button" class="findbutton2" value="상품 업로드" onclick="location.href='goodsupload.jsp'">
		</td>
	</tr>
</table>
<%@include file="../general_included/footer.jsp"%>
</body>
</html>
