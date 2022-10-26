<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Auth</title>
</head>
<body>
	<%
		String id = request.getParameter("user_id");
		String pwd = request.getParameter("user_pwd");
		
		if (id.equalsIgnoreCase("ldy0412@gmail.com") && pwd.equalsIgnoreCase("2095")) {
			response.sendRedirect("WelcomeTest.jsp?id=" + id);
		} else {
			 request.getRequestDispatcher("LoginTest.jsp?loginErr=1").forward(request, response);
		}
	%>
</body>
</html>