<%@page import="java.sql.*" contentType="text/html; charset=utf-8" %>
<%@page import="DBBean.sbkimDB" %>
		<%
			String nkname = request.getParameter("nkname");
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String repasswd = request.getParameter("repasswd");
			String email = request.getParameter("email");
			String detailaddr = request.getParameter("detailaddr");
		%>

<Script>
	function AutoInput(zip,address){
		zip1=zip.substring(0,3);
		zip2=zip.substring(4,7);
		opener.nform.zip1.value=zip1;
		opener.nform.zip2.value=zip2;
		opener.nform.address1.value=address;
		self.close();
	}
	</Script>
	
	<head><title>검색결과</title></head>
	
	<center><img src="image/post1.gif"></center><br>
	<table align=center border=0>
	<tr>
	<td bgcolor="#a3acd5" width=100><font size=2>
	<center>우편번호</center></font></td>
	<td bgcolor="#a3acd5" width=350><font size=2>
	<center>주소</center></font></td></tr>
	
	<%
	String zipcode="";
	sbkimDB usedb=new sbkimDB();		//dbbean 클래스의 오브젝트화
	request.setCharacterEncoding("utf-8");
	
	usedb.connect();		//dbbean클래스의 오브젝트화
	String dong=request.getParameter("dong");
	
	String sql="select * from zipcode where dong like '%"+dong+"%'";	//질의생성
	ResultSet rs=usedb.resultQuery(sql);		//빈 클래스를 이용한 질의 실행
	
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
<td bgcolor="#eeeeee"><center><font size=2>
<a href="JavaScript:AutoInput('<%=zip%>','<%=address%>','<%=zip%>')"></a>
</font></center></td>
<td bgcolor="#eeeeee">&nbsp;&nbsp;&nbsp;
<font size=2><a href="JavaScript:AutoInput('<%=zip%>','<%=address%>')">
<%=address%></a></font></td></tr>
<%session.setAttribute("zipcode",zipcode);

}while(rs.next());

response.sendRedirect("../signup.jsp");
%>
</table>

<%
}
else
{
%>
</table>
<font size=2><center><br>찾고자하는 동이 존재하지 않습니다.<br><br><br>
다시 검색하시려면 <a href=../ZipFinder/ZipinputForm.html onclick="Backtrack();">여기</a>를 누르세요</center></font>
<%
}
%>
<br><br><br>
<center><input type="button" value="돌아가기" onclick="location.href='../signup.jsp'"></center>