<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import="DBBean.foodingBean" %>
<%@page import="DBBean.pointDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "DBBean.productDataBean" %>

<meta charset="UTF-8">


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>포인트 관리</title>
			<link rel="stylesheet" href="../css/common.css">
			<link rel="stylesheet" href="../css/list.css">
			<link rel="shortcut icon" href="../img/favicon.ico">
			<link rel="icon" href="../img/favicon.ico">


	<style>
						
				
			
body {font-family: Arial;}

/* Style the tab */
.tab4 {
  overflow: hidden;
  border: 1px solid #ccc;
  width:500px;
  margin-left:150px;
  background-color: orange;
}

.lontb{
	border-spacing:0px;
	border-collapse:collapse;
	width:100%; 
}

.lontb td{	text-align:center;
border-bottom:1px solid orange;
}

.pointtdd{
		height:50px;
		display:text-cell;
		vertical-align:middle;
		font-size:14pt;
		width:33%;
		
}

/* Style the buttons inside the tab */
.tab4 button {
  background-color: orange; 
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab4 button:hover {
  background-color: white;
}

/* Create an active/current tablink class */
.tab4 button.active {
  background-color: white;
}

/* Style the tab content */
.tabcontent4 {
  padding: 6px 12px;
	margin-left:150px;
  width:500px;
} 



#menu div {
    position: relative;
    display: inline-block;
}

points_hovering_span { 
    display: block;
    width: 80px;
    padding: 2px 16px;
    cursor: pointer;
}
.arrow_box {
  display: none; 
  position: absolute;
  width: 150px;
  padding: 8px;
  margin-top:5px;
  left:300px;
  -webkit-border-radius: 1px;
  -moz-border-radius: 1px;  
  border-radius: 8px;
  background: white;
  border:1px solid black;
  color: black;
  font-size: 16px;
}

.arrow_box:after {
	width: 0px;
	height: 0px;
	border-top: 60px solid transparent;
	border-bottom: 60px solid transparent;
	border-left: 60px solid black;
	left:110%;
	bottom:31%;
	margin-left: -10px;
    position: absolute;
    border-width: 10px;
    pointer-events: none;
    content: " ";
}

points_hovering_span:hover + p.arrow_box {
  display: block;
}

	</style>
	
	<script>
	
</script>


</head> 
 
		<body id="body">
		<%@include file="../general_included/topbar.jsp"%>
		<%
			request.setCharacterEncoding("UTF-8");
		
			List<pointDataBean> articleList = null; 
			int getlimitBydate=0;
			
			try{
				getlimitBydate = Integer.parseInt(request.getParameter("getlimitBydate"));
			}catch(Exception e){
				e.printStackTrace();
			}
			foodingBean dbPro = foodingBean.getInstance();
			foodingBean foodingbean = new foodingBean();
			try{
				articleList=dbPro.getPointArticle(idlogin,getlimitBydate);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		%>
		<div id="maindiv">
		<div class="writetitle1">
		포인트 관리</div>
			<%@include file="sidemenu.jsp"%>   
			  
				<div class="row3"  style="padding-top:80px;margin-left:450px;"> 
						<div class="forkpoint" style="border: 3px solid #ffc637; border-radius:50px 50px 50px 50px;">    
							<table> 
								<tr><td style="width:800px; padding-left:25px; height:50px; vertical-align:top; ">
										<div id="menu"><points_hovering_span id="points_hovering_points_hovering_span"><img id="forkimage" src="../img/forkc.png" ></points_hovering_span> 
										    <p class="arrow_box">게시글 작성, 재료구매시 포인트 지급해드려요!</p></div>
										 </td></tr>  
								<tr><td align="center" ><div class="forkpoint2"><h3>포크 포인트</h3></div></td></tr>
									<tr><td align="center" style="width:800px; height:140px; vertical-align:top; ">
									<div  class="forkpoint3" style="border: 3px solid #ffc637; border-radius:30px 30px 30px 30px;"><%=point %> P</div></td></tr>
						   </table>
						</div>


<br><br><br><br>
<div class="tab4">
  <button class="tablinks" onclick="location.href='point.jsp?getlimitBydate=7'">1주일</button>
  <button class="tablinks" onclick="location.href='point.jsp?getlimitBydate=31'">1개월</button>
  <button class="tablinks" onclick="location.href='point.jsp?getlimitBydate=0'">전체</button>
</div>

<div class="tabcontent4">
  <table class="lontb">
  	<tr> 
		<td class="pointtdd">거래일</td>
		<td class="pointtdd">내역</td> 
		<td class="pointtdd">포인트</td>  
	</tr> 
	<%
		if(articleList.size()!=0){
			for (int i = 0 ; i < articleList.size(); i++) {
				pointDataBean article = articleList.get(i);
	%>
	<tr>
		<td class="pointtdd"><%=article.getReg_date() %></td>
		<td class="pointtdd" ><%=article.getAdjestreason() %></td> 
		<td class="pointtdd" ><%=article.getPointadjest() %></td>
	</tr>
	<%
			}
		}else{
	%>
	<tr>
		<td colspan="3" class="pointtdd">내역이 없네요!</td>
	</tr>
	<%
		}
	%>
  </table>
</div>
   
</body>	
<%@include file="../general_included/footer.jsp"%>
	<br><br>
</body>
</html>
