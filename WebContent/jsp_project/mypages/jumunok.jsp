<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../jsp_project/css/common.css">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="article" scope="page" class="DBBean.buyDataBean">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>
</head>
<%
	try {
		String[] selCartIdchkbx = null;
		selCartIdchkbx = request.getParameterValues("sendcartids");
		String chk_info = request.getParameter("chk_info");
		String accountName = request.getParameter("accountName");
		int accountId = Integer.parseInt(request.getParameter("accountId"));
		if(chk_info.equals("신용카드")){
			article.setAccountName("신용카드");
			article.setAccountId(0);
		}
		
		int intedCartIds[] = new int[selCartIdchkbx.length];

		for (int i = 0; i < selCartIdchkbx.length; i++) {
			intedCartIds[i] = Integer.parseInt(selCartIdchkbx[i]);
		}
		foodingBean dbPro = foodingBean.getInstance();

		dbPro.SendCartToBuy(intedCartIds, article);
%>
<body>
	<%@include file="../general_included/topbar.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<table style="width: 400px; margin: auto; text-align: center;">
		<tr>
			<td><img src="../img/check.png" width="50px" height="50px"
				style="vertical-align: middle;"> 구매가 완료되었습니다.</td>
		</tr>
		<tr>
			<td><img src="../img/delivery.gif"></td>
		</tr>
		<tr>
			<td>
				<%
					if (chk_info.equals("신용카드")) {
				%> 수송 준비중입니다! <%
					} else {
				%> 입금이 확인되면 바로 출발합니다! <%
					}
				%>
			</td>
		</tr>
	</table>
</body>
<%
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</html>