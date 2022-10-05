<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>for 반복문</title>
</head>
<body>
	<%
		for (int i = 1; i <= 9; i++) {
			out.println("2 곱하기 " + i + " 은(는) ");
			out.println(2*i);
			out.println("<br/>");
		}
	%>
</body>
</html>