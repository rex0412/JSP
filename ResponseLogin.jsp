<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Response</title>
</head>
<body>
	<%
		String id = request.getParameter("user_id");
		String pwd = request.getParameter("user_pwd");
		
		if (id.equalsIgnoreCase("i want go home") && pwd.equalsIgnoreCase("1025")) {
			response.sendRedirect("Welcome.jsp");
		} else {
			 request.getRequestDispatcher("ResposeMain.jsp?loginErr=1").forward(request, response);
		}
	%>
</body>
</html>