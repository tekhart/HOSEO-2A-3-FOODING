<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "DBBean.foodingBean" %>
	<%@ page import = "DBBean.BoardDataBean" %>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  foodingBean dbPro = foodingBean.getInstance(); 
  BoardDataBean article =  dbPro.getArticle(num);

%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">  
	function youreally(){
		if(confirm("정말로 글 삭제할껍니까?")){
			location.href="deleteForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>"
		}else{
			location.href="content.jsp?num=<%=num%>&pageNum=<%=pageNum%>"
		}
	}
</script>
</head>
<body onload="youreally()">
<p>글삭제</p>
<br>
<form method="POST" name="delForm" id="form"
   action="deletePro.jsp?pageNum=<%=pageNum%>" 
   > 
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