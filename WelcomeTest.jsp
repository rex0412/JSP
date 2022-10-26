<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WelcomeTest</title>
</head>
<body>
	<h1>Welcome ✪ ω ✪</h1>
	<br>
	<%
	String id = request.getParameter("id");
	out.print(id + "님 환영합니다"); %> <br> <br>
	<a href="LoginTest.jsp"><input type="submit" value="로그아웃😎"></a>
</body>
</html>