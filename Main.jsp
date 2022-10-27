<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>
	
	<h1>회원가입</h1>
	
	<form action="AuthJoin.jsp" method="post">
	<strong>ID</strong> <input type="text" name="id" placeholder="ID를 입력하세요"> <br>
	<strong>Password</strong> <input type="Password" name="pw" placeholder="비밀번호를 입력하세요"> <br>
	<strong>Name</strong> <input type="text" name="name" placeholder="영어 이름을 적어주세요"> <br>
	
	<input type="submit" value="회원가입">
	</form>
</body>
</html>