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
		
		.tooltip1 {
  position: relative;
  display: inline-block;
  
}

.tooltip1 .tooltiptext1 {
  visibility: hidden;
  width: 40px;
  background-color: #555;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;
  position: absolute;
  z-index: 1;
  bottom: 120%;
  left: 50%;
  margin-left:-20px;
  opacity: 0;
  transition: opacity 0.3s;
}

.tooltip1 .tooltiptext1::after {
  content: "";
  position: absolute;
  top: 100%;
  left: 50%;
  margin-left: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: #555 transparent transparent transparent;
}

.tooltip1:hover .tooltiptext1 {
  visibility: visible;
  opacity: 1;
}

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
		 
		 .trborder	{
		 	border-left:2px solid #ffbb00;
		 	border-right:2px solid #ffbb00;
		 	
		 }
		 
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
					<table style="width:600px; border-collapse:collapse;" class="trborder">
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
						    int[] Writeconturylength = {0,0,0,0,0,0};
						    int[] Writeconturycount = {0,0,0,0,0,0};
							int maxcontury=0;
							int[] WriteFoodtypelength = {0,0,0,0,0,0,0};
							int[] WriteFoodtypecount = {0,0,0,0,0,0,0};
							int maxfoodtype=0;
						    try{
								findId=request.getParameter("findId");
								if(findId==null){
									findId=(String)session.getAttribute("idlogin");

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
										if(Writeconturycount[0]>maxcontury){
											maxcontury=Writeconturycount[0];
										}
									}else if(thiscontury.equals("양식")){
										Writeconturycount[1]=rs.getInt(1);
										if(Writeconturycount[1]>maxcontury){
											maxcontury=Writeconturycount[1];
										}
									}else if(thiscontury.equals("일식")){
										Writeconturycount[2]=rs.getInt(1);
										if(Writeconturycount[2]>maxcontury){
											maxcontury=Writeconturycount[2];
										}
									}else if(thiscontury.equals("중식")){
										Writeconturycount[3]=rs.getInt(1);
										if(Writeconturycount[3]>maxcontury){
											maxcontury=Writeconturycount[3];
										}
									}else if(thiscontury.equals("퓨전")){
										Writeconturycount[4]=rs.getInt(1);
										if(Writeconturycount[4]>maxcontury){
											maxcontury=Writeconturycount[4];
										}
									}else if(thiscontury.equals("기타")){
										Writeconturycount[5]=rs.getInt(1);
										if(Writeconturycount[5]>maxcontury){
											maxcontury=Writeconturycount[5];
										}
									}
								}
								for(int j=0;j<Writeconturycount.length;j++){
									Writeconturylength[j]=Writeconturycount[j]*95/maxcontury+5;
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
										if(WriteFoodtypecount[0]>maxfoodtype){
											maxfoodtype=WriteFoodtypecount[0];
										}
									}else if(thisfoodtype.equals("빵류")){
										WriteFoodtypecount[1]=rs.getInt(1);
										if(WriteFoodtypecount[1]>maxfoodtype){
											maxfoodtype=WriteFoodtypecount[1];
										}
									}else if(thisfoodtype.equals("반찬류")){
										WriteFoodtypecount[2]=rs.getInt(1);
										if(WriteFoodtypecount[2]>maxfoodtype){
											maxfoodtype=WriteFoodtypecount[2];
										}
									}else if(thisfoodtype.equals("면류")){
										WriteFoodtypecount[3]=rs.getInt(1);
										if(WriteFoodtypecount[3]>maxfoodtype){
											maxfoodtype=WriteFoodtypecount[3];
										}
									}else if(thisfoodtype.equals("국류")){
										WriteFoodtypecount[4]=rs.getInt(1);
										if(WriteFoodtypecount[4]>maxfoodtype){
											maxfoodtype=WriteFoodtypecount[4];
										}
									}else if(thisfoodtype.equals("디저트")){
										WriteFoodtypecount[5]=rs.getInt(1);
										if(WriteFoodtypecount[5]>maxfoodtype){
											maxfoodtype=WriteFoodtypecount[5];
										}
									}else if(thisfoodtype.equals("기타")){
										WriteFoodtypecount[6]=rs.getInt(1);
										if(WriteFoodtypecount[6]>maxfoodtype){
											maxfoodtype=WriteFoodtypecount[6];
										}
									}
								}
								for(int j=0;j<WriteFoodtypecount.length;j++){
									WriteFoodtypelength[j]=WriteFoodtypecount[j]*95/maxfoodtype+5;
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
									<div class="tooltip1" style="height:<%=Writeconturylength[0]%>px; width:23px; background-color:orange; position:absolute; bottom:0px; left:15px; ">
										<span class="tooltiptext1"><%=Writeconturycount[0]%></span>
									</div>
									</td>
								<td style="position:relative;">
									<div class="tooltip1" style="height:<%=Writeconturylength[1]%>px; width:23px; background-color:orange; position:absolute; bottom:0px; left:15px; ">
										<span class="tooltiptext1"><%=Writeconturycount[1]%></span>
									</div>
								</td>
								<td style="position:relative;">
									<div class="tooltip1" style="height:<%=Writeconturylength[2]%>px; width:23px; background-color:orange; position:absolute; bottom:0px; left:15px; ">
										<span class="tooltiptext1"><%=Writeconturycount[2]%></span>
									</div>
									</td>
								<td style="position:relative;">
									<div class="tooltip1" style="height:<%=Writeconturylength[3]%>px; width:23px; background-color:orange; position:absolute; bottom:0px; left:15px; ">
										<span class="tooltiptext1"><%=Writeconturycount[3]%></span>
									</div>
									</td>
								<td style="position:relative;">
									<div class="tooltip1" style="height:<%=Writeconturylength[4]%>px; width:23px; background-color:orange; position:absolute; bottom:0px; left:15px; ">
										<span class="tooltiptext1"><%=Writeconturycount[4]%></span>
									</div></td>
								<td style="position:relative;">
									<div class="tooltip1" style="height:<%=Writeconturylength[5]%>px; width:23px; background-color:orange; position:absolute; bottom:0px; left:15px; ">
										<span class="tooltiptext1"><%=Writeconturycount[5]%></span>
									</div></td>
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
											<div  class="tooltip1" style="height:<%=WriteFoodtypelength[0]%>px; width:23px; background-color:orange; position:absolute; bottom:0px; left:10px; ">
												<span class="tooltiptext1"><%=WriteFoodtypecount[0]%></span>
											</div>
										</td>
										<td style="position:relative;">
											<div class="tooltip1"style="height:<%=WriteFoodtypelength[1]%>px; width:23px; background-color:orange; position:absolute; bottom:0px; left:10px; ">
												<span class="tooltiptext1"><%=WriteFoodtypecount[1]%></span>
											</div>
										</td>
										<td style="position:relative;">
											<div class="tooltip1"style="height:<%=WriteFoodtypelength[2]%>px; width:23px; background-color:orange; position:absolute; bottom:0px; left:10px; ">
												<span class="tooltiptext1"><%=WriteFoodtypecount[2]%></span>
											</div>
										</td>
										<td style="position:relative;">
											<div class="tooltip1"style="height:<%=WriteFoodtypelength[3]%>px; width:23px; background-color:orange; position:absolute; bottom:0px; left:10px; ">
												<span class="tooltiptext1"><%=WriteFoodtypecount[3]%></span>
											</div>
										</td>
										<td style="position:relative;">
											<div class="tooltip1"style="height:<%=WriteFoodtypelength[4]%>px; width:23px; background-color:orange; position:absolute; bottom:0px; left:10px; ">
												<span class="tooltiptext1"><%=WriteFoodtypecount[4]%></span>
											</div>
										</td>
										<td style="position:relative;">
											<div class="tooltip1"style="height:<%=WriteFoodtypelength[5]%>px; width:23px; background-color:orange; position:absolute; bottom:0px; left:20px; ">
												<span class="tooltiptext1"><%=WriteFoodtypecount[5]%></span>
											</div>
										</td>
										<td style="position:relative;">
											<div class="tooltip1"style="height:<%=WriteFoodtypelength[6]%>px; width:23px; background-color:orange; position:absolute; bottom:0px; left:10px;">
												<span class="tooltiptext1"><%=WriteFoodtypecount[6]%></span>
											</div>
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
					<br>
					<div align="center">
					<input type="button" value="내정보 수정" class="findbutton" style="width:100px;">
					</div>
				</div>
			</div>
		</div>
<br><br><br>

<%@include file="../general_included/footer.jsp"%>

</body>
</html>
