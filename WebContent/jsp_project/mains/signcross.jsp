<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ page import="java.sql.*"%>
<%@page import="DBBean.foodingBean" %>
<jsp:useBean id="tempbean" scope="session" class="DBBean.foodingBean"/>

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

%>
<form method="post" name="register" action="signup.jsp" >
	
</form>

<%

if(select.equals("id")){

	foodingbean.connect();
	String sql = "select id from user where id="+id+";";
	ResultSet rs = foodingbean.resultQuery(sql);
		while (rs.next()) {
			String dbid = rs.getString("id");
			if(dbid.equals(id)){
				select="inavaid";
				tempbean.setAll(nkname,id,passwd,repasswd,email,addrnum,detailaddr,select);
				%>
				<script type="text/javascript">
					var register=document.register;
					register.submit();
				</script>
				<%
		}
	}
		select="vaid";
		tempbean.setAll(nkname,id,passwd,repasswd,email,addrnum,detailaddr,select);
	%>
		<script type="text/javascript">
			var register=document.register;
			register.submit();
		</script>
	<%
}


if(select.equals("zip")){
	
	%>
		<script type="text/javascript">
			var zipload=document.zipload;
			zipload.submit();
		</script>
	<%
}
%>


