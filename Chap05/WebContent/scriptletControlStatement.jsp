<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제어문을 사용한 Scriplet 예제</title>
</head>
<body>
	<% 
		int num = Integer.parseInt(request.getParameter("num"));
		String hello = "Hello!";
		String world = "World!";
		
		for (int i = 1; i <= num; i++) {
			
			out.print("<h" + i + ">" + hello + " " + world + "</h" + i + ">");
			if (i == num){
	%>
				<h1>스크립틀릿 내 for문의 마지막 수행입니다.</h1>
	<%
			} else {
			
	%>
				<h1>스크립틀릿 내 for문 수행 중입니다.</h1>
	<%
			}
		}
	%>
</body>
</html>