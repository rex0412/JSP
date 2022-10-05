<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삼항 연산자</title>
</head>
<body>
	<%
		int a = 3;
		out.print(((a % 2 == 0) ? "a의 값은 짝수입니다." : "a의 값은 홀수입니다."));
	%>
</body>
</html>