<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주소검색</title>

<link rel="stylesheet" href="../../css/common.css">

</head>
<body>


	<form method="post" action="zipsearch.jsp">
	<div width=300>
		
			<table cellspacing="0" width="100%"><tr><td>
			<input type="text" class="zipsearch" placeholder="동/읍/면" name="dong"></td>
			<td width="60px">
			<input type="submit" value="찾기" class="zipfinder"></td></tr></table>

	
	
	<table align=center cellpadding=15 cellspacing=0 width=450 border=0>
	<tr><td height=10></td></tr> 
	<tr><td bgcolor=#fffee1> 
	
	검색할 지역의 동이나 읍/면의 이름을 빈칸없이 입력하세요
	
	</td></tr>
	</table>
		</div>
	</form>
	
</body>
</html>