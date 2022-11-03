<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웰컴!</title>
</head>
<body>
	<%=session.getAttribute("user_name")+"님 환영합니다"%>
</body>
</html>