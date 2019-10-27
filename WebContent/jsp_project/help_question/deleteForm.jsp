<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "DBBean.foodingBean" %>
	<%@ page import = "DBBean.QuestionDataBean" %>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  foodingBean dbPro = foodingBean.getInstance(); 
  QuestionDataBean article =  dbPro.getquestionArticle(num);

%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<script type="text/javascript">  

</script>
</head>
<body>
<p>글삭제</p>
<br>
<form method="POST" name="delForm" 
   action="deletePro.jsp?pageNum=<%=pageNum%>" 
   onsubmit="return deleteSave()"> 
 <center>삭제된 글은 복구가 불가능합니다. <br> 정말 글을 삭제하시겠습니까?</center>
 <input type="hidden" name="num"  value=<%=num %>>
 <input type="hidden" name="pagenum"  value=<%=pageNum %>>
 <table>
 <tr height="30">
    <td align=center>
      <input type="submit" value="삭제" >
      <input type="button" value="취소" 
       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">     
   </td>
 </tr>  
</table> 
</form>
</body>
</html>