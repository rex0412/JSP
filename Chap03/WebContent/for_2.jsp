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
		for (int i = 2; i <= 9; i++) {
				out.println(i + "단");
				out.println("<br/>");
			for (int j = 1; j <= 9; j++){
				out.println( i + " X " + j + " = ");
				out.println(i * j);
				out.println("<br/>");
			}
				out.println("<hr/>");
		}
	%>
</body>
</html>