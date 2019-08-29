<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ page import="java.sql.*"%>
<%@page import="DBBean.foodingBean" %>
<jsp:useBean id="tempbean" scope="request" class="DBBean.foodingBean"/>

<%
request.setCharacterEncoding("UTF-8");
foodingBean foodingbean=new foodingBean();

String nkname = request.getParameter("nkname");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String repasswd = request.getParameter("repasswd");
String email = request.getParameter("email");
String addrnum = request.getParameter("addrnum");
String detailaddr = request.getParameter("detailaddr");

String select = request.getParameter("select");

tempbean.setAll(nkname,id,passwd,repasswd,email,addrnum,detailaddr);
%>
<form method="post" name="register" action="signup.jsp" >
	<input type="hidden" name="nkname" value=<%=nkname%>>
</form>
<%

if(select.equals("id")){

	foodingbean.connect();
	String sql = "select id from user where id="+id+";";
	ResultSet rs = foodingbean.resultQuery(sql);
		while (rs.next()) {
			String dbid = rs.getString("id");
			if(dbid.equals(id)){
				%>
				<script type="text/javascript">
					var register=document.register;
					alert("중복된 아이디입니다.");
					register.submit();
				</script>
				<%
			}
			
		}
	%>
		<script type="text/javascript">
			var register=document.register;
			alert("사용 가능합니다.");
			register.submit();
		</script>
	<%
}


if(select.equals("zip")){
	
	%>
		<script type="text/javascript">
			zipload.submit();
		</script>
	<%
}
%>


