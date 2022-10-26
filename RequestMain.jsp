<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %>

<%
	request.setAttribute("requestString", "request 객체에 저장되어 있는 문자열");
	request.setAttribute("requestPerson", new Person("이대용", 19));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request 메인 영역</title>
</head>
<body>

	<h2>request 영역의 데이터를 읽기</h2>
	<% Person rPerson = (Person)request.getAttribute("requestPerson"); %>

	<%= request.getAttribute("requestString") %> <br>
	<%= rPerson.getName() %>, <%= rPerson.getAge() %>
	
	<h2>request 영역의 데이터를 삭제하기</h2>
	<%
		request.removeAttribute("requestString");
	%>
	
	<h2>포워딩을 통해 방 이동하기</h2>
	<%
		request.getRequestDispatcher("RequestForward.jsp").forward(request, response);
	%>
</body>
</html>