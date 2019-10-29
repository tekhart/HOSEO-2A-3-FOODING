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
		
		.wwawa{
		border-bottom:2px dashed #ffbb00;
		}
		
		.alignleft {
    float: left;
    text-align:left;
    width:33.33333%;
}
.aligncenter {
    float: left;
    text-align:center;
    width:33.33333%;
}
.alignright {
    float: left;
    text-align:right;
    width:33.33333%;
}
		
		 .graphtd{
		 	height:100px;
		 }
		 
		 .graphtd td{
		 	border-bottom:1px solid orange;
		 }
		 
		 .grapht{width:300px;
		 border-spacing:0px;
		 border-collapse:collapse;}
		 
		  .grapht1{width:100%;
		 border-spacing:0px;
		 border-collapse:collapse;}
		 
		 .grapht1 td{
		 border-bottom:1px solid orange;}
		 
		</style>
		
		<script type="text/javascript"></script>

	</head>
	

	
	<body id="body">
		<%@include file="../general_included/topbar.jsp"%>
		<div id="maindiv">
		<div class="writetitle1">프로필</div>	

		<%@include file="sidemenu.jsp"%>
			<div style="margin-left:550px">
					
				<br>
				<br>
				<br> 
				<br>
				<!--Register 버튼 누를시 registerInsert.jsp로 넘어감	-->
				<div>
					<table style="width:600px; border-collapse:collapse;">
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
							List<BoardDataBean> articleList = null; 
						    int WriteRecipecount = 0;
						    int WriteCommentcount = 0;
							int[] Writeconturycount = {0,0,0,0,0,0};
							int[] WriteFoodtypecount = {0,0,0,0,0,0,0};
						    try{
								findId=request.getParameter("findId");
								if(findId==null){
									findId=(String)session.getAttribute("idlogin");;

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
						<td rowspan="2">
						<div style="height:100px; width:100px; border-radius:50%; border:3px solid orange; margin:auto;"/>
						</td>
							<td> 
							<h3><%=nk %></h3>
							</td>
							
						</tr>
						<tr>
							 
							<td>
								<%=email %> (<img src="../img/fork.png" style="width:20px;height:20px"> : <%=mile%>)
							</td>
					
					
						</tr>
							
						<tr>
							
							<td colspan="2"  class="wwawa">
								
							<table style="border-spacing:20px;"><tr>
							<td>
							
							<table class="grapht">
							<tr class="graphtd">
								<td style="position:relative;">
									<div  style="height:<%=Writeconturycount[0]*30+5 %>px; width:15px; background-color:orange; position:absolute; bottom:0px; left:15px; "/></td>
								<td style="position:relative;">
									<div style="height:<%=Writeconturycount[1] *30+5%>px; width:15px; background-color:orange; position:absolute; bottom:0px; left:15px; "/></td>
								<td style="position:relative;">
									<div style="height:<%=Writeconturycount[2] *30+5%>px; width:15px; background-color:orange; position:absolute; bottom:0px; left:15px; "/></td>
								<td style="position:relative;">
									<div style="height:<%=Writeconturycount[3]*30+5 %>px; width:15px; background-color:orange; position:absolute; bottom:0px; left:15px; "/></td>
								<td style="position:relative;">
									<div style="height:<%=Writeconturycount[4] *30+5%>px; width:15px; background-color:orange; position:absolute; bottom:0px; left:15px; "/></td>
								<td style="position:relative;">
									<div style="height:<%=Writeconturycount[5] *30+5%>px; width:15px; background-color:orange; position:absolute; bottom:0px; left:15px; "/></td>
							</tr><tr><td colspan="6" height="5px"></td></tr><tr style="text-align:center;">
							<td>한식</td>
							<td>양식</td>
							<td>일식</td>
							<td>중식</td>
							<td>퓨전</td>
							<td>기타</td></tr></table>
							
							</td>
							<td>
							
							
								<table class="grapht">
									<tr class="graphtd">
										<td style="position:relative;">
											<div  style="height:<%=WriteFoodtypecount[0]*30+5 %>px; width:15px; background-color:orange; position:absolute; bottom:0px; left:10px; "/>
										</td>
										<td style="position:relative;">
											<div style="height:<%=WriteFoodtypecount[1] *30+5%>px; width:15px; background-color:orange; position:absolute; bottom:0px; left:10px; "/>
										</td>
										<td style="position:relative;">
											<div style="height:<%=WriteFoodtypecount[2] *30+5%>px; width:15px; background-color:orange; position:absolute; bottom:0px; left:10px; "/>
										</td>
										<td style="position:relative;">
											<div style="height:<%=WriteFoodtypecount[3]*30+5 %>px; width:15px; background-color:orange; position:absolute; bottom:0px; left:10px; "/>
										</td>
										<td style="position:relative;">
											<div style="height:<%=WriteFoodtypecount[4] *30+5%>px; width:15px; background-color:orange; position:absolute; bottom:0px; left:10px; "/>
										</td>
										<td style="position:relative;">
											<div style="height:<%=WriteFoodtypecount[5] *30+5%>px; width:15px; background-color:orange; position:absolute; bottom:0px; left:20px; "/>
										</td>
										<td style="position:relative;">
											<div style="height:<%=WriteFoodtypecount[6] *30+5%>px; width:15px; background-color:orange; position:absolute; bottom:0px; left:10px;"/>
										</td>
									</tr>
									<tr><td colspan="7" height="5px"></td></tr>
									<tr style="text-align:center;">
										<td>밥류</td>
										<td>빵류</td>
										<td>반찬</td>
										<td>면류</td>
										<td>국류</td>
										<td>디저트</td>
										<td>기타</td>
							
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</tr>
		
					 <tr>
						 
							<td colspan="2">
								<p class="alignleft"></p><p class="aligncenter">내가 쓴 레시피 (<%=WriteRecipecount%>)</p><p class="alignright">댓글 수 (<%=WriteCommentcount%>)</p>
							</td>
							
						</tr>
						
						<tr>
							<td colspan="2" >
								<%
									for (int i = 0 ; i < articleList.size(); i++) {
										BoardDataBean article = articleList.get(i);
										String writerid=article.getWriterid();
								%>
									<div>
										<table class="grapht1"> 
											<tr>
												<td>
													<div style="background-image:url('<%=article.getThumbnail() %>');
														background-size:cover;background-position:center;width:250px;height:100px;">
													</div>
												</td>
												<td><%=article.getTitle() %></td>
											</tr>
										
										</table>
									</div>
								<%
									}
								%>
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
