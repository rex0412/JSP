<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>납치 완료</title>
</head>
<body>
	<h2>포워드로 전달된 페이지</h2>
	<h4>request 영역의 데이터를 읽어볼까?</h4>
	
	<% Person pPerson = (Person)request.getAttribute("requestPerson"); %>
	
	<%= request.getAttribute("requestStirng") %>
	<%= pPerson.getName() %>, <%= pPerson.getAge() %>
</body>
</html>