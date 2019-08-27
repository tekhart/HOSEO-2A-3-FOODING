<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
String zipcode="";
try{
	zipcode=(String)session.getAttribute("zipcode");
	if(zipcode==null){
		zipcode="";
	}
}finally{}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>

<link rel="stylesheet" href="../css/common.css">
<style>
									
body {
	font-family: 'Oswald', sans-serif;
}
</style>
</head>




<body id="body">

<div id="topdiv" style=text-align:center;>
	<table width=100% height=100%>
    <tr><td width=200 nowrap>
		</td><td width=200 nowrap>
		</td><td width=30 nowrap>

		<input type="button" class="button11" value="로그인" onClick="location.href='signin.jsp'">
		<input type="button" class="button11" value="회원가입" onClick="location.href='signup.jsp'">

		</td></tr>
  	</table>
</div>

<div id="menudiv" style=text-align:center;>
	<table width=100% height=100%>
    <tr><td width=100 nowrap>
				<a href=../mains/main.jsp><img src="../img/fooding.png" height="60px" width="100px"></a>
			</td>
			<td width=150 nowrap><font size="10px"><a href=../mains/main.jsp id="title">FOODING</a></font></td>
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
<br>
<br>
<br>
<br>
<form method="post" action="registerInsert.jsp">
	<!--Register 버튼 누를시 registerInsert.jsp로 넘어감  --> 
		<center>
			<table>
				<tr>
					<td>닉네임</td>
					<td colspan="2"><input type="text" name="nkName" maxlength="30"></td>
				</tr>
				
				<tr>
					<td>아이디</td>
					<td colspan="2"><input type="text" name="id" maxlength="30"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td colspan="2"><input type="password" name="password" maxlength="30"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td colspan="2"><input type="password" name="repassword" maxlength="30"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td colspan="2"><input type="text" name="email" maxlength="30"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="AddrNum" value="<%=zipcode %>" maxlength="30"></td><td><input type="button" value="우편번호 찾기" onclick="location.href='ZipFinder/ZipinputForm.html'"></td>
				</tr><tr>
					<td>상세주소</td>
					<td colspan="2"><input type="text" name="DetailAddr" maxlength="30"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td colspan="2"><input id="male" name="gender" type="radio" value="1" />Male
						<input id="female" name="gender" type="radio" value="2" />Female</td>
				</tr>
				
			</table>
			<input type="submit" value="Register">
		</center>
	</form>
</div>
<br><br><br>
<br><br><br>
<br><br><br>
<br><br><br>
<br><br><br>


<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
<pre>
Create by FOODING
고객문의 1544-XXXX
JSP Project 2019 2A03</pre>
</div>

</body>
</html>
