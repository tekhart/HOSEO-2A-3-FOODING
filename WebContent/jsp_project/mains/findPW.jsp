<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID/PW</title>
<style>
																			body {}
																			#topdiv
																				{background-color:#FFBB00;
																		        height:40px;}
																		 	#menudiv
																		    	{background-color:white;
																		        height:100%;}
																			.button11{
																						background-color:#FFBB00;
																						border:none;
																						margin-right:-4.5px;
																						color:#813D00;
																						}
																			.button2{
																						margin-right:-4.5px;
																						width:250px;
																						height:85px;
																						font-size:20px;
																						background-color:white;
																						border:none;
																						}
																			.button2:hover{background-color:#FFE08C;}
																		 	#maindiv
																		    	{background-color:#EAEAEA;
																		        height:600px;}
</style>
</head>
<body>

<div id="topdiv" style=text-align:center;>
	<table width=100% height=100%>
    <tr><td width=200 nowrap>
		</td><td width=200 nowrap>
		</td><td width=30 nowrap>

		<input type="button" class="button11" value="로그인">
		<input type="button" class="button11" value="회원가입">

		</td></tr>
  	</table>
</div>

<div id="menudiv" style=text-align:center;>
	<table width=100% height=100%>
    <tr><td width=100 nowrap>
				<a href=../mains/main.jsp><img src="../img/fooding.png" height="60px" width="100px"></a>
			</td>
			<td width=150 nowrap><font size="10px"><a href=../mains/main.jsp>FOODING</a></font></td>
			<td>
				<center>
					<table id="menutable">
						<tr>
							<td><center>
								<div class="dropdown">
			
	            					<button class="dropbtn">레시피</button>
	            
	            					<div class="dropdown-content">
	            						<center>
		        							<a href="#">전체 레시피</a>
							        		<a href="#">인기 레시피</a>
							        		<a href="#">맞춤 레시피</a>
							       			<a href="#">레시피 작성</a>
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
		            						<a href="#">요리 강의</a>
									        <a href="#">초보용 레시피</a>
									        <a href="#">재료구매</a>
	            						</center>
						        	</div>
						        </div></center>
	        				</td>	
	        				<td><center>
						        <div class="dropdown">
						            <button class="dropbtn">공지사항</button>
						            <div class="dropdown-content">
							            <center>
							            	<a href="#">푸딩규칙</a>
									        <a href="#">이벤트</a>
							            </center>
						        	</div>
						        </div></center>
					        </td>
	        				<td><center>
	        					<div class="dropdown">
						            <button class="dropbtn">고객센터</button>
						            <div class="dropdown-content">
							            <center>
							             	<a href="#">자주하는 질문</a>
									        <a href="#">문의사항</a>
							            </center>
						        	</div>
						        </div></center>
	        				</td>
	        			</tr>
	        		</table>
				</center>
        	</td></tr>
 	</table>
</div>

<div id="maindiv">

	<center>
	<insert type="button" value="ID찾기" onClick="location.href='FINDID.jsp'" id="toFindIDbutton">
	<insert type="button" value="PW찾기" id="toFindPWbutton"> <%-- 현 페이지 이므로 기능없음. --%>
		<br>
		<br>
		<form method="post" action="findPWPro.jsp">
			<H2>Find Password</H2>
			<P>Type your ID to find your Password</P>
			<INPUT type="text" name="findID" maxlength="30" /> <input
				type="submit" value="Find" />
		</form>
		<!-- find 버튼을 누르면  findPWPro.jsp로 넘어감  -->
	</center>
</div>
<br><br><br>



<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
Create by FOODING<br>
고객문의 1544-XXXX<br>
JSP Project 2019 2A03
</div>

	<center>
		<form method="post" action="findIDPro.jsp">
			<H2>Find ID</H2>
			<P>Type your name to find your ID</P>
			<INPUT type="text" name="findName" maxlength="30" /> <input
				type="submit" value="Find" />
		</form>
		<!-- find 버튼을 누르면  findIDPro.jsp로 넘어감  -->
		<br>
		<br>
		<form method="post" action="findPWPro.jsp">
			<H2>Find Password</H2>
			<P>Type your ID to find your Password</P>
			<INPUT type="text" name="findID" maxlength="30" /> <input
				type="submit" value="Find" />
		</form>
		<!-- find 버튼을 누르면  findPWPro.jsp로 넘어감  -->
	</center>
</body>
</html>
