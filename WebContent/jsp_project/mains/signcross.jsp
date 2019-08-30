<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ page import="java.sql.*"%>
<%@page import="DBBean.foodingBean" %>
<jsp:useBean id="tempbean" scope="session" class="DBBean.foodingBean"/>

<%
request.setCharacterEncoding("UTF-8");
foodingBean foodingbean=new foodingBean();
int selected=0;

String nkname = request.getParameter("nkname");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String repasswd = request.getParameter("repasswd");
String email = request.getParameter("email");
String addrnum = request.getParameter("addrnum");
String detailaddr = request.getParameter("detailaddr");
String gender=request.getParameter("gender");
String slct = request.getParameter("slct");

%>
<form method="post" name="register" action="signup.jsp" ></form>
<form method="post" name="zipload" action="ZipFinder/ZipinputForm.jsp" ></form>
<%

if(slct.equals("id")){

	foodingbean.connect();
	String sql = "select id from user";
	ResultSet rs = foodingbean.resultQuery(sql);
		while (rs.next()) {
			String dbid = rs.getString("id");
			if(dbid.equals(id)){
				selected=1;
				
			}
		}
		if(selected==1){slct="inavaid";}
		else{slct="avaid";}
		tempbean.setAll(nkname,id,passwd,repasswd,email,addrnum,detailaddr,slct);
		%>
		<script type="text/javascript">
			location.href="signup.jsp";
		</script>
		<%
	
}
else if(slct.equals("zip")){
	tempbean.setAll(nkname,id,passwd,repasswd,email,addrnum,detailaddr,slct);
	%>
		<script type="text/javascript">
			var zipload=document.zipload;
			zipload.submit();
		</script>
	<%
}

else{
	int mileage = 0;
	
	
	foodingbean.connect();
	
	String sql = "insert into user values('"+nkname+"','"+id+"','"+passwd+"','"+email+"','"+addrnum+"','"+detailaddr+"','"+gender+"',"+mileage+")";
	foodingbean.nonResultQuery(sql);
	session.setAttribute("idlogin",id);
	response.sendRedirect("../mains/main.jsp");
}
%>


