<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
foodingBean dbPro = foodingBean.getInstance();
try{
	List<productDataBean> userArticle =dbPro.getuserArticles();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
public productDataBean getproductArticle(int productId)
			throws Exception {
		con = null;
		pstmt = null;
		rs = null;
		productDataBean article=null;
		try {
			con = getConnection();

			pstmt = con.prepareStatement(
				"select * from product where productId = ?");
			pstmt.setInt(1, productId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new productDataBean();
				article.setProductId(rs.getInt("productId"));
				article.setProductName(rs.getString("productName"));
				article.setIsTool(rs.getInt("isTool"));
				article.setProductType(rs.getInt("productType"));
				article.setPrice(rs.getInt("price"));
				article.setDiscountRate(rs.getInt("discountRate"));
				article.setProductThumb(rs.getString("productThumb"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			DBclose();
		}
		return article;
	} --%>
	
<%}catch(Exception e){e.printStackTrace();} %>
</body>
</html>
