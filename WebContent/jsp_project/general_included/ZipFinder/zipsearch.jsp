<%@page import="java.sql.*" contentType="text/html; charset=utf-8"%>
<%@page import="DBBean.foodingBean"%>

<Script>
	function AutoInput(zip,address){
		zip1=zip.substring(0,3);
		zip2=zip.substring(4,7);
		opener.nform.zip1.value=zip1;
		opener.nform.zip2.value=zip2;
		opener.nform.address1.value=address;
		self.close();
	}
	function Zipsubmit(zip,address){
		var zipcode=document.zipcode;
		zipcode.reqaddrnum.value=zip;
		zipcode.reqaddress.value=address;
		zipcode.submit();
	}
	</Script>
<link rel="stylesheet" href="../../css/common.css">
<head>
<title>검색결과</title>
</head>
<form method="post" name="zipcode" action="ZipsearchPro.jsp">
	<input type="hidden" name="reqaddrnum"> <input type="hidden"
		name="reqaddress">

	<table align=center border=0>
		<tr>
			<th bgcolor="#ffbb00" width=100 height=25><font size=2><center>우편번호</center></font>
			</th>
			<th bgcolor="#ffbb00" width=350 height=25><font size=2><center>주소</center></font>
			</th>
		</tr>
		<%
			String zipcode="";
			foodingBean usedb=new foodingBean();		//dbbean 클래스의 오브젝트화
			request.setCharacterEncoding("utf-8");
			
			usedb.connect();		//dbbean클래스의 오브젝트화
			String dong=request.getParameter("dong");
			
			String sql="select * from zipcode where dong like '%"+dong+"%'";	//질의생성
			ResultSet rs=usedb.resultQuery(sql);		//빈 클래스를 이용한 질의 실행
			try{
				if(rs.next()){		//질의 결과 출력
					do{
						String zip=rs.getString("zipcode");
						String sido=rs.getString("sido");
						String gugun=rs.getString("gugun");			
						String dong2=rs.getString("dong");
						String ri=rs.getString("ri");
						String bunji=rs.getString("bunji");
						if(ri==null) ri="";
						if(bunji==null)bunji="";
						zipcode=zip;
						String address=sido+""+gugun+""+dong+""+ri+""+bunji;
						%>

		<tr>
			<td bgcolor="#eeeeee">
				<center>
					<font size=2> <input class="zipbutton" type="button"
						value="<%=zip %>"
						onclick="Zipsubmit('<%=zip %>','<%=address %>');">
					</font>
				</center>
			</td>
			<td bgcolor="#eeeeee">&nbsp;&nbsp;&nbsp; <font size=2><a><%=address%></a></font>
			</td>
		</tr>
		<%
					}while(rs.next());
					%>
	</table>
</form>
<%
				}
				else
				{
					%>
<script>
						alert("존재하지 않는 주소입니다.");
						location.href="ZipinputForm.jsp";
					</script>
<%	
				}
			}catch (Exception e) {
				%>
<script>
					alert("존재하지 않는 주소입니다.");
					location.href="ZipinputForm.jsp";
				</script>
<%	
		}finally{}
				
%>
<br>
<br>
<br>
<center>
	<input type="button" value="돌아가기" class="findbutton"
		onclick="location.href='../signup.jsp'">
</center>