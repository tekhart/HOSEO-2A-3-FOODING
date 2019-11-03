<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	

	String [] customArray = request.getParameterValues("customsearch");
	
	String customString="";
	for(int i=0;i<customArray.length;i++){
		if(i!=0){
			customString+=",";
		}
		customString+=customArray[i];
	}
	
%>
<script>
	location.href="list.jsp?search=<%=customString%>&searchtype=맞춤";
</script>