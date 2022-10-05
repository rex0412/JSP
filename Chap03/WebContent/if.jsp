<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if 조건문</title>
</head>
<body>
	<%
	int a = 10;
	int b = 3;
	
	out.print("a : " + a + ", b : " + b);
	out.print("<hr/>");
	
	out.print("[if문 실행] <br/>");
	if (a == b) {
		out.print("a의 값과 b의 값은 같습니다. <br/>");
	}
	out.print("<hr/>");
	
	out.print("[if-else문 실행] <br/>");
	if (a != b) {
		out.print("a의 값과 b의 값은 같지 않습니다. <br/>");
	} else {
		out.print("a의 값과 b의 값은 같습니다. <br/>");
	}
	out.print("<hr/>");
	
	out.print("[if-else if-else문 실행] <br/>");
	if (a <= b) {
		out.print("a의 값이 b의 값보다 작거나 같습니다. <br/>");
	} else if (a < b) {
		out.print("a의 값이 b의 값보다 작습니다. <br/>");
	} else if (a >= b) {
		out.print("a의 값이 b의 값보다 크거나 같습니다. <br/>");
	} else if (a > b) {
		out.print("a의 값이 b의 값보다 큽니다. <br/>");
	} else {
		out.print("a의 값과 b의 값이 같습니다 <br/>");
	}
	out.print("<hr/>");
	
	out.print("수행 종료");
	%>
</body>
</html>