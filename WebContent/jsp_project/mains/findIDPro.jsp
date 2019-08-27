<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

<style>
																			#body{
	font-family:"Bauhaus ITC";
	}

	#topdiv
		{background-color:#FFBB00;
        height:40px;}
        
 	#menudiv
    	{background-color:white;
         height:100%;
         border-collapse:collapse;
         }
		
			.button11{
				background-color:#FFBB00;
				border:none;
				margin-right:-4.5px;
				color:#813D00;
				}
				
				.button2{
				margin-right:-9px;
				width:250px;
				height:85px;
				font-size:20px;
				background-color:white;
				border:none;
				
				}
				
			.button2:hover{background-color:#FFE08C;}
        
 			#maindiv
    			{background-color:#EAEAEA;
      			 height:0px;}
        
        #menutable{
			margin:0;
			padding:0px;
			border:0;
			height:85px;
			width:250px;
			border-collapse:collapse;
		}
	
        
	#bottable
    	{background-color:#FFFFFF;
    	border-style:solid;
    	color:#FFBB00;
        height:300px;
        width:50%;
        float:left;
         border-collapse:collapse;
        }
        

        
        th, td{padding:10px;}
        
	#eventdiv
    	{background-color:#A6A6A6;
        height:300px;
        width:50%;
        display:inline-block;
        line-height: 200px;
        }
        
     #event{
     position:relative;
     }
     
     #eventimg{
     position:relative;
     }
        
        
    .dotdot{margin-top:-25px;
			margin-right:10px;
			}
			
	.slide-text{
	
		position:relative;
		background-color:#FFFFFF;
		opacity:0.7;
		width:600px;
		height:600px;
		text-align:left;
		margin-top:-604px;
		text-align:center;
		
		font-size:30px;
		}
		
	.dot {
  		position:relative;
	
  		cursor: pointer;
  		height: 15px;
  		width: 15px;
  		margin: 0 2px;
  		background-color: #bbb;
  		border-radius: 50%;
  		display: inline-block;
  		transition: background-color 0.6s ease;
       	}    

	.active, .dot:hover {
  		background-color: #717171;
		}

	.fade {
  		-webkit-animation-name: fade;
  		-webkit-animation-duration: 1.5s;
  		animation-name: fade;
  		animation-duration: 1.5s;
		}

	@-webkit-keyframes fade {
  		from {opacity: .4} 
  		to {opacity: 1}
		}

	@keyframes fade {
  		from {opacity: .4} 
  		to {opacity: 1}
		}
		
		
		
		

        .dropdown {
          position: relative;
          display: inline-block;
            width:250px;
        }

        .dropdown-content {
          display: none;
          position: absolute;
          background-color: #f1f1f1;
          min-width: 160px;
          box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
          z-index: 1;
		width:250px;
        }

.dropdown-content a {

  
  color: black;
  padding: 12px 0px;
  text-decoration: none;
  display: block;
width:250px;
}

.dropdown-content a:hover {background-color: #ddd;
width:250px;}

.dropdown:hover .dropdown-content {display: block;
width:250px;}

.dropdown:hover .dropbtn {background-color: #FFE08C;
width:250px;}



                .dropbtn{

                width:200px;
                height:85px;
                font-size:20px;
                background-color:white;
                border:none;

                }

            .dropbtn:hover{background-color:#FFE08C;}


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

	<%
		String nkname = request.getParameter("nkname");
		String name = request.getParameter("name");
		//form 태그의 값을 저장
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/fooding_db";
			String dbId = "foodingid";
			String dbPass = "foodingpw";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			//DB연결
			String sql = "select id from user where nkname=? and name=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nkname);
			pstmt.setString(2, name);
			//form 태그 값을 저장한 name 변수를 ?에 넣어 ID를 추출함 
			rs = pstmt.executeQuery();
			while (rs.next()) {
			String id = rs.getString("id");
	%>
	<span>당신의 아이디는 </span><h4><%=id%></h4>입니다.<!-- 추출한 ID를 보여줌 -->
	<%
		}} catch (Exception e) {e.printStackTrace();}
		finally {
			if (rs != null)try {rs.close();} catch (SQLException sqle) {}
			if (pstmt != null)try {pstmt.close();} catch (SQLException sqle) {}
			if (conn != null)try {conn.close();} catch (SQLException sqle) {}
		}//자원반환
	%>

</div>
<br><br><br>



<div id="footer" align="right" style="color:#cccccc; font-size:12px;">
Create by FOODING<br>
고객문의 1544-XXXX<br>
JSP Project 2019 2A03
</div>

</body>
</html>
