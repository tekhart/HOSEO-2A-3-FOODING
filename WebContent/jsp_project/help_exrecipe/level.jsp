<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>난이도별 레시피</title>
<link rel="shortcut icon" href="../img/favicon.ico">
<link rel="icon" href="../img/favicon.ico">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/list.css">
<style>

</style>
</head>
<body>
<%@include file="../general_included/topbar.jsp"%>
<div id="maindiv">
<div class="writetitle1">
난이도별 레시피</div>


<div class="rlch" onclick="location.href='level1.jsp'"><br><br><br><p class="ppp">기초</p> </div>
<div class="chqh" onclick="location.href='level2.jsp'"><br><br><br><p class="ppp">초보</p> </div>
<div class="tlaghk" onclick="location.href='level3.jsp'"><br><br><br><p class="ppp">심화</p> </div>

</body>
</html>
