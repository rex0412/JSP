<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.MemberDTO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AuthLogin</title>
</head>
<body>
	<%
	MemberDTO rMemberDTO = (MemberDTO)application.getAttribute("requestMemberDTO");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if (id.equalsIgnoreCase(rMemberDTO.getId()) && pw.equalsIgnoreCase(rMemberDTO.getPw())) {
		request.getRequestDispatcher("Welcome.jsp").forward(request, response);
	} else {
			 request.getRequestDispatcher("Login.jsp?loginErr=1").forward(request, response);
	}
	%>
</body>
</html>