<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBBean.foodingBean" %>
<% 
	String idlogin="none";
	session.setAttribute("zipcode","");
	foodingBean topbarbean=new foodingBean();
%>
<html>
<head>
<link rel="stylesheet" href="../css/common.css">

<script type="text/javascript">	
</script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js">
</script>
		

		
		</head><body>
<div id="topdiv" style=text-align:center;>
	<table width="100%" height="100%">
     	<tr><td width=0 nowrap></td>
	    	<td width=0 nowrap></td>
	    	<td nowrap align="right">
				<div>
					<%
						try{
							idlogin=(String)session.getAttribute("idlogin");
							
							if(idlogin==null){
								%>
								<input type="button" class="button11" value="로그인" onClick="location.href='../mains/signin.jsp'"> &nbsp;
								<input type="button" class="button11" value="회원가입" onClick="location.href='../mains/signup.jsp'">&nbsp;
								<%
							}else{
								String nknamelogin=topbarbean.findnkname(idlogin);
								%>
								<%=nknamelogin %>&nbsp;님&nbsp;
								<input type="button" class="button11" value="마이페이지" onClick="location.href='../mypages/updatepage.jsp'"> &nbsp;
								<input type="button" class="button11" value="로그아웃" onClick="location.href='../mains/logout.jsp'">
								<img src="../img/cart.png" height="30px" width="30px" onClick="location.href='../mypages/jumuncheck.jsp'" style="vertical-align:middle;"><span class="badge">3</span>
								<%
							}
						}finally{}
					%>
					&nbsp;
				</div>
			</td>
		</tr>
  	</table>
</div>

<div id="menudiv" style="text-align:center;height:120px;">
	<table width=100% height=120px>
    	<tr>
    		<td width=100 nowrap>
				<a href=../mains/main.jsp><img src="../img/fooding.png" height="60px" width="100px"></a>
			</td>
			<td width=150 nowrap><font size="10px"><a href=../mains/main.jsp id="title"><div id="titleimage" width="288px" height="76px">
			</div></a></font></td>
			<td>
				<center>
					<table id="menutable">
						<tr>
							<td><center>
								<div class="dropdown">
			
	            					<button class="dropbtn" OnClick="window.location='../recipes/list.jsp'">레시피</button>
	            
	            					<div class="dropdown-content">
	            						<center>
		        							<a href="../recipes/list.jsp">전체 레시피</a>
							        		<a href="../recipes/list.jsp?fame=1">인기 레시피</a>
							        		<a href="../recipes/custom.jsp">맞춤 레시피</a>
							       			<a href="../recipes/writeForm.jsp">레시피 작성</a>
						       			</center>
						       		</div>
	       						</div>
	       						</center>
	        				</td>
	        
	       					<td><center>
	        					<div class="dropdown">
	            					<button class="dropbtn">요리도우미</button>
	            					<div class="dropdown-content">
	            						<center>
		            						<a href="../help_cookhelp/list.jsp">요리 강의</a>
									        <a href="../help_exrecipe/list.jsp">초보용 레시피</a>
									        <a href="../help_question/list.jsp">도와줘요!</a>
									        <a href="../shop/main.jsp">재료구매</a>
	            						</center>
						        	</div>
						        </div></center>
	        				</td>	
	        				<td><center>
						        <div class="dropdown">
						            <button class="dropbtn" OnClick="window.location='../announces/list.jsp'">공지사항</button>
						            <div class="dropdown-content">
							            <center>
							            	<a href="../announces/list.jsp">푸딩규칙</a>
									        <a href="#">이벤트</a>
							            </center>
						        	</div>
						        </div></center>
					        </td>
	        				<td><center>
	        					<div class="dropdown">
						            <button class="dropbtn" OnClick="window.location='../notices/faq.jsp'">고객센터</button>
						            <div class="dropdown-content">
							            <center>
							             	<a href="../mains/faq.jsp">자주하는 질문</a>
									        <a href="../mains/ask.jsp">문의사항</a>
							            </center>
						        	</div>
						        </div></center>
	        				</td>
	        			</tr>
	        		</table>
				</center>
        	</td>
        </tr>
    </table>
</div>
</body>
</html>