<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="../css/common.css">
<style>
	
            #currentbtn{
            width:200px;
            height:80px;
            background-color:gray;
            border:none;
            }
            #notcurrentbtn{
            width:200px;
            height:80px;
            background-color:#FFBB00;
            border:none;
            }
</style>

<script type="text/javascript">
function Findid(){
	
	var findid=document.findid;
	
	if(findid.nkname.value==""){
		alert("닉네임을 입력해주세요");
		findid.nkname.focus();
		return;
	}
	
	if(findid.email.value==""){
		alert("이메일을 입력해주세요");
		findid.email.focus();
		return;
	}
	
	findid.submit();
}
</script>

</head>
<body>

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
    	<tr>
    		<td width=100 nowrap>
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
        	</td>
        </tr>
    </table>
</div>

<div id="maindiv">

	<center>
		<br>
		<br>
	<input type="button" value="ID찾기" id="currentbtn"> <%-- 현 페이지 이므로 기능없음. --%>
	<input type="button" value="PW찾기" onClick="location.href='findPW.jsp'" id="notcurrentbtn">
		
		<form method="post" name="findid" action="findIDPro.jsp">
			<H2>아이디찾기</H2>
			<P>찾으려는 아이디의 닉네임과 성함을 입력해 주세요.</P>
			<table>
				<tr>
					<td>
						닉네임
					</td>
					<td>
					 : <INPUT type="text" name="nkname" maxlength="30" /> 
					</td>
				</tr>
				<tr>
					<td>
						이메일
					</td>
					<td>
					 : <INPUT type="text" name="email" maxlength="30" /> 
					</td>
				</tr>
			</table>
			
			 
			<input type="button" value="찾기" onclick="Findid();"/>
		</form>
		<!-- find 버튼을 누르면  findIDPro.jsp로 넘어감  -->
	</center>
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
