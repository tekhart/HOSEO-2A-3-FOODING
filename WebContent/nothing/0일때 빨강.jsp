<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.mySelect { font-size: 2em; }
.mySelect option { color: green; }
.mySelect option[value=""] { color: red; }
.mySelect:invalid { color: red; }

</style>
</head>
<body>
<select class="mySelect" required>
    <option value="">0</option>
    <option value="1">1</option>
</select>
</body>
</html>
