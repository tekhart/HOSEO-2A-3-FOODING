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
		<link rel="shortcut icon" href="../img/favicon.ico">
		<link rel="icon" href="../img/favicon.ico">
		<meta charset="UTF-8">
		<title>Sign Up</title>

		<style>
		
		</style>
		
		<script type="text/javascript"></script>
		
	</head>
	

	
	<body id="body">
		<%@include file="../general_included/topbar.jsp"%>
		<div id="maindiv">
		<%@include file="sidemenu.jsp"%>
			<div style="margin-left:550px">
				<div class="writetitle1">마이페이지</div>	
				<br>
				<br>
				<br> 
				<br>
				<!--Register 버튼 누를시 registerInsert.jsp로 넘어감	-->
				<div style="margin:auto">
					<table border="1">
						<%	
							request.setCharacterEncoding("UTF-8");
		
							foodingBean foodingbean=new foodingBean();
					    	foodingBean dbPro = foodingBean.getInstance();
					    	
							String findId="";
							String nk="";
							String email="";
							String addrnum="";
							String address="";
							String detailaddr="";
							String mile="";
						    List<BoardDataBean> articleList=null;
						    int WriteRecipecount = 0;
						    int WriteCommentcount = 0;
							int[] Writeconturycount = {0,0,0,0,0,0};
							int[] WriteFoodtypecount = {0,0,0,0,0,0,0};
						    try{
								findId=request.getParameter("findId");
								if(findId==null){
									findId=idlogin;
								}
							}finally{}
						    
						    try{
						    	String sql="select count(*) from recipe_comment where writerid = '"+findId+"';";
								ResultSet rs = foodingbean.resultQuery(sql);
								if(rs.next()){
									WriteCommentcount=rs.getInt(1);
								}
						    }catch(Exception e){e.printStackTrace();}
							
						    try{
						    	String sql="select count(*),contury from recipes where writerid = '"+findId+"' group by contury;";
						    	ResultSet rs = foodingbean.resultQuery(sql);
								int i=0;
								while(rs.next()){
									String thiscontury=rs.getString("contury");
									if(thiscontury.equals("한식")){
										Writeconturycount[0]=rs.getInt(1);
									}else if(thiscontury.equals("양식")){
										Writeconturycount[1]=rs.getInt(1);
									}else if(thiscontury.equals("일식")){
										Writeconturycount[2]=rs.getInt(1);
									}else if(thiscontury.equals("중식")){
										Writeconturycount[3]=rs.getInt(1);
									}else if(thiscontury.equals("퓨전")){
										Writeconturycount[4]=rs.getInt(1);
									}else if(thiscontury.equals("기타")){
										Writeconturycount[5]=rs.getInt(1);
									}
								}
						    }catch(Exception e){e.printStackTrace();}
						    
						    try{
						    	String sql="select count(*),foodtype from recipes where writerid = '"+findId+"' group by foodtype;";
						    	ResultSet rs = foodingbean.resultQuery(sql);
								int i=0;
								while(rs.next()){
									String thisfoodtype=rs.getString("foodtype");
									if(thisfoodtype.equals("밥류")){
										WriteFoodtypecount[0]=rs.getInt(1);
									}else if(thisfoodtype.equals("빵류")){
										WriteFoodtypecount[1]=rs.getInt(1);
									}else if(thisfoodtype.equals("반찬류")){
										WriteFoodtypecount[2]=rs.getInt(1);
									}else if(thisfoodtype.equals("면류")){
										WriteFoodtypecount[3]=rs.getInt(1);
									}else if(thisfoodtype.equals("국류")){
										WriteFoodtypecount[4]=rs.getInt(1);
									}else if(thisfoodtype.equals("디저트")){
										WriteFoodtypecount[5]=rs.getInt(1);
									}else if(thisfoodtype.equals("기타")){
										WriteFoodtypecount[6]=rs.getInt(1);
									}
								}
						    }catch(Exception e){e.printStackTrace();}
						    
						    try{
								String sql="select * from user where ID = '"+findId+"';";
								ResultSet rs = foodingbean.resultQuery(sql);
								if(rs.next()){
									nk=rs.getString("nkname");
									email=rs.getString("email");
									addrnum=rs.getString("addrnum");
									address=rs.getString("address");
									detailaddr=rs.getString("detailaddr");
									mile=rs.getString("mileage");
								}
						    }catch(Exception e){e.printStackTrace();}
							
							try{
								WriteRecipecount = dbPro.getArticleCount("글쓴이",nk,0);
								if (WriteRecipecount > 0) {
									articleList = dbPro.getArticles(1, 5,"글쓴이",nk,0);
							    }
							}catch(Exception e){e.printStackTrace();}
						%>	
						<tr>
							<td colspan="3" width="500px">
								<h1><%=nk %></h1>
							</td>
							<td width="300px">
						</tr>
						<tr>
							<td width="100px"></td>
							<td colspan="2">
								<%=email %>
							</td>
							<td></td>
						</tr>
						<tr>
							<td width="100px"></td>
							<td colspan="2">
								여태 쓴 레시피 수 : <%=WriteRecipecount%>
							</td>
							<td></td>
						</tr>
						<tr>
							<td width="100px"></td>
							<td colspan="2">
								한식 : <%=Writeconturycount[0]%><br>
								양식 : <%=Writeconturycount[1]%><br>
								일식 : <%=Writeconturycount[2]%><br>
								중식 : <%=Writeconturycount[3]%><br>
								퓨전 : <%=Writeconturycount[4]%><br>
								기타 : <%=Writeconturycount[5]%>
							</td>
							<td></td>
						</tr>
						<tr>
							<td width="100px"></td>
							<td colspan="2">
								밥류 : <%=WriteFoodtypecount[0]%><br>
								빵류 : <%=WriteFoodtypecount[1]%><br>
								반찬 : <%=WriteFoodtypecount[2]%><br>
								면류 : <%=WriteFoodtypecount[3]%><br>
								국류 : <%=WriteFoodtypecount[4]%><br>
								디저트 : <%=WriteFoodtypecount[5]%><br>
								기타 : <%=WriteFoodtypecount[6]%>
							</td>
							<td></td>
						</tr>
						<tr>
							<td width="100px"></td>
							<td colspan="2">
								여태 쓴 댓글 수 : <%=WriteCommentcount%>
							</td>
							<td></td>
						</tr>
						<tr>
							<td width="100px"></td>
							<td colspan="2">
								<img src="../img/fork.png" style="width:20px;height:20px"> : <%=mile%>
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="3">
								<%
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
								%>
							</td>
							<td>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
<br><br><br>

<%@include file="../general_included/footer.jsp"%>

</body>
</html>
