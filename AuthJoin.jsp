<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.MemberDTO" %>    
<%application.setAttribute("requestMemberDTO", new MemberDTO(request.getParameter("id"),request.getParameter("pw"),request.getParameter("name"))); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <% request.getRequestDispatcher("Login.jsp").forward(request, response);%>
</body>
</html>