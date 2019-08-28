<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.sql.*"%>
<%@page import="DBBean.foodingBean" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<meta charset="UTF-8">
<%
String nkname = request.getParameter("nkname");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String repasswd = request.getParameter("repasswd");
String email = request.getParameter("email");
String addrnum = request.getParameter("addrnum");
String detailaddr = request.getParameter("detailaddr");
String gender = request.getParameter("gender");

String select = request.getParameter("select");



if(nkname==null){nkname="";}
if(id==null){id="";}
if(passwd==null){passwd="";}
if(repasswd==null){repasswd="";}
if(email==null){email="";}
if(detailaddr==null){detailaddr="";}


if(select.equals("id")){
	
	
	foodingBean foodingbean=new foodingBean();
	
	foodingbean.connect();
	String sql = "select id from user where id="+id+";";
	ResultSet rs = foodingbean.resultQuery(sql);
		while (rs.next()) {
			String dbid = rs.getString("id");
			if(dbid.equals(id)){
				%>
					var idreturn=document.idreturn;
					alert("중복된 아이디입니다.");
					idreturn.submit();

				<%
			}
			
		}
		%>
			var idreturn=document.idreturn;
			alert("사용 가능합니다.");
			idreturn.submit();
		<%
	
}


if(select.equals("zip")){
	
	%>
					var zipload=document.zipload;
					zipload.submit();
	<%
}
%>
</script>

