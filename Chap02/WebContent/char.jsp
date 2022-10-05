<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>char 데이터 타입</title>
</head>
<body>
	<%
		char a1 = 'a';
		char a2 = '\u0061';
		char a3 = 0x0061;
		char a4 = 97;
		
		out.print(a1);
		out.print("<hr/>");
		out.print(a2);
		out.print("<hr/>");
		out.print(a3);
		out.print("<hr/>");
		out.print(a4);
		out.print("<hr/>");
	%>
</body>
</html>