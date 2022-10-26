<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	session.setAttribute("isLogin", true);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session 메인 영역</title>
</head>
<body>

	<%= session.getAttribute("isLogin") %>
	
	<a href="SessionMove.jsp">주소가 완전히 바뀝니다~!</a>

</body>
</html>