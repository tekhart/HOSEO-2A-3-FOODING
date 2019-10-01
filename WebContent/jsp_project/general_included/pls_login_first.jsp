<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% session.invalidate(); %>

<script>
alert("먼저 로그인 하여주십시오!.");
location.href="../mains/signin.jsp";
</script>
