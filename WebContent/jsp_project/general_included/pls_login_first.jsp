<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% session.invalidate(); %>

<script>
alert("먼저 로그인 해주세요!");
location.href="../mains/signin.jsp";
</script>
