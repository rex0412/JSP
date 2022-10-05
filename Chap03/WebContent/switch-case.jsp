<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>switch/case 조건문</title>
</head>
<body>
	<%
		int a = 10;
		out.print("a : " + a + "<hr/>");
		
		switch (a % 3) {
		
		case 2 :
			out.print("a의 값을 3으로 나눈 나머지는 2입니다.");
			break;
		case 1 :
			out.print("a의 값을 3으로 나눈 나머지는 1입니다.");
			break;
		default :
			out.print("a의 값을 3으로 나눈 나머지는 0입니다.");
			break;
		}
	%>
</body>
</html>