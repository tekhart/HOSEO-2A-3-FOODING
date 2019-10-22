<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "DBBean.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="../css/common.css">
		<link rel="stylesheet" href="../css/list.css">
		<meta charset="UTF-8">
		<title>Sign Up</title>

		<style>
		
		</style>
		
		<script type="text/javascript"></script>
		
	</head>
	

	
	<body id="body">
		<%@include file="../general_included/topbar.jsp"%>
		<div id="maindiv">
		<div class="writetitle1">마이페이지</div>	
		<br>
		<br>
		<br> 
		<br>
		<form method="post" name="register" action="signcross.jsp" >
		
			<input type="hidden" name="nknamecheck">
			<input type="hidden" name="idcheck">
			<input type="hidden" name="passwdcheck">
			<input type="hidden" name="repasswdcheck">
			<input type="hidden" name="emailcheck">		
			<input type="hidden" name="selected">
			<!--Register 버튼 누를시 registerInsert.jsp로 넘어감	-->
			<center>
				<table border="1">
					<%	
						request.setCharacterEncoding("UTF-8");
						
						String zipcode="";
						String nk="";
						
						try{
							zipcode=(String)session.getAttribute("zipcode");
							if(zipcode==null){
								zipcode="";
							}
						}finally{}

						foodingBean foodingbean=new foodingBean();
					    foodingBean dbPro = foodingBean.getInstance();
					
						String findId=request.getParameter("findId");
						if(findId==null){
							findId=idlogin;
						}
						
						String sql="select * from user where ID = '"+findId+"';";
						
						ResultSet rs = foodingbean.resultQuery(sql);
				
						if(rs.next()){
							nk=rs.getString("nkname");
							String email=rs.getString("email");
							String addrnum=rs.getString("addrnum");
							String address=rs.getString("address");
							String detailaddr=rs.getString("detailaddr");
							String mile=rs.getString("mileage");
							%>	
								<tr>
									<td colspan="3" width="500px">
										<h1><%=nk %></h1>
									</td>
									<td width="300px">
								</tr>
								<tr>
									<td width="100px"></td>
									<td  colspan="3">
										<%=email %>
									</td>
								</tr>
								
								
						<%}%>
						
						<td colspan="3">
							<%
								try{
									int count = dbPro.getArticleCount("글쓴이",nk,0);
									List<BoardDataBean> articleList=null;
									if (count > 0) {
										articleList = dbPro.getArticles(1, 5,"글쓴이",nk,0);
								    }
									for (int i = 0 ; i < articleList.size(); i++) {
										BoardDataBean article = articleList.get(i);
										String writerid=article.getWriterid();
										%>
											<div>
												<table>
													<tr>
														<td rowspan="2">
															<div style="background-image:url('<%=article.getThumbnail() %>');
																background-size:cover;background-position:center;width:250px;height:100px;">
															</div>
														</td>
														<td width="250px"><%=article.getTitle() %></td>
													</tr>
													<tr>
														<td></td>
													</tr>
												</table>
											</div>
										<%
									}
								}catch(Exception e){
									e.printStackTrace();
								}
							%>
						</td>
						<td></td>
					</table>
				</center>
			</form>
		</div>
<br><br><br>



<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
Create by FOODING<br>
고객문의 1544-XXXX<br>
JSP Project 2019 2A03
</div>

</body>
</html>
