<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DBBean.foodingBean"%>
<%@page import="DBBean.productDataBean"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="admincss.css">
<script type="text/javascript">
	function sendingthumb(thumbname) {
		$("#thumbnail").css("background-image", "url(" + thumbname + ")");
		$("#thumbnail").innerhtml = "";
		$("#inputthumbnail").val(thumbname);

	}
	function thumbnailupload() {
		window
				.open(
						"../general_included/thumbUpload/fileForm.jsp?storeplace=product",
						"a", "width=400, height=300, left=100, top=50");
	}
</script>
</head>
<body>
	<%@include file="../general_included/topbar.jsp"%>
	<%
		foodingBean dbPro = foodingBean.getInstance();
		int productid = 0;
		productDataBean article = null;
		productid = Integer.parseInt(request.getParameter("productid"));
		article = dbPro.getproductArticle(productid);
	%>
	<br>
	<br>
	<br>
	<br>
	<form method="POST" action="goodsupdatePro.jsp">
		<input type="hidden" name="productId"
			value="<%=article.getProductId()%>">
		<table class="goodstb" border="1">
			<tr>
				<td>제목</td>
				<td colspan="2"><input type="text" name="productName"
					value="<%=article.getProductName()%>"></td>
			</tr>
			<tr>
				<td>썸네일</td>
				<td colspan="2" onclick="thumbnailupload()">
					<div
						style="background-image:url(<%=article.getProductThumb()%>);background-size:cover;width:200px;height:112px"
						id="thumbnail"></div> <input type="hidden" name="productThumb"
					value="<%=article.getProductThumb()%>" id="inputthumbnail">
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td colspan="2"><input type="text" name="price"
					value="<%=article.getPrice()%>">원</td>
			</tr>
			<tr>
				<td>할인률</td>
				<td colspan="2"><input type="text" name="discountRate"
					value="<%=article.getDiscountRate()%>">%</td>
			</tr>
			<tr>
				<td>분류1</td>
				<td>현재 : <%=article.getIsTool()%></td>
				<td><select name="isTool">
						<option value='1' <%if (article.getIsTool() == 1) {%> selected
							<%}%>>도구1</option>
						<option value='2' <%if (article.getIsTool() == 2) {%> selected
							<%}%>>재료2</option>
				</select></td>
			</tr>
			<tr>
				<td>분류2</td>
				<td>현재 : <%=article.getProductType()%></td>
				<td><select name="productType">
						<option value='1' <%if (article.getProductType() == 1) {%>
							selected <%}%>>과일</option>
						<option value='2' <%if (article.getProductType() == 2) {%>
							selected <%}%>>채소</option>
						<option value='3' <%if (article.getProductType() == 3) {%>
							selected <%}%>>정육/계란</option>
						<option value='4' <%if (article.getProductType() == 4) {%>
							selected <%}%>>수산물/건어물</option>
						<option value='5' <%if (article.getProductType() == 5) {%>
							selected <%}%>>과자/초콜릿/시리얼</option>
						<option value='6' <%if (article.getProductType() == 6) {%>
							selected <%}%>>면/통조림/가공식품</option>
						<option value='7' <%if (article.getProductType() == 7) {%>
							selected <%}%>>가루/조미료/오일</option>
						<option value='8' <%if (article.getProductType() == 8) {%>
							selected <%}%>>장/소스/드레싱/식초</option>
						<option value='9' <%if (article.getProductType() == 9) {%>
							selected <%}%>>유제품/아이스크림</option>
						<option value='10' <%if (article.getProductType() == 10) {%>
							selected <%}%>>냉장/냉동/간편식</option>
						<option value='11' <%if (article.getProductType() == 11) {%>
							selected <%}%>>주방가전</option>
						<option value='12' <%if (article.getProductType() == 12) {%>
							selected <%}%>>냄비/프라이팬</option>
						<option value='13' <%if (article.getProductType() == 13) {%>
							selected <%}%>>칼/도마</option>
						<option value='14' <%if (article.getProductType() == 14) {%>
							selected <%}%>>테이블웨어</option>
						<option value='15' <%if (article.getProductType() == 15) {%>
							selected <%}%>>밀폐용기</option>
						<option value='16' <%if (article.getProductType() == 16) {%>
							selected <%}%>>주방수납/정리</option>
						<option value='17' <%if (article.getProductType() == 17) {%>
							selected <%}%>>주방조리도구</option>
						<option value='18' <%if (article.getProductType() == 18) {%>
							selected <%}%>>주방잡화</option>
						<option value='19' <%if (article.getProductType() == 19) {%>
							selected <%}%>>일회용품</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<table style="border-collapse: collapse;">
						<tr>
							<td><input type="submit" value="확인" class="findbutton">
							</td>
							<td><input type="button" onclick="location.href='goods.jsp'"
								value="취소" class="findbutton"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	<%@include file="../general_included/footer.jsp"%>
</body>
</html>
