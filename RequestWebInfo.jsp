<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request Web Info</title>
</head>
<body>
	
	<%= request.getMethod() %>
	<%= request.getRequestURL() %>
	<%= request.getProtocol() %>
	<%= request.getParameter("id") %>
	<%= request.getParameter("pw") %>
	<% String[] foods = request.getParameterValues("food"); %>
	
	<%
		for(int i = 0; i < foods.length; i++) {
			out.println(foods[i]);
		}
	%>
</body>
</html>