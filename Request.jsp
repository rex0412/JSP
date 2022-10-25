<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request</title>
</head>
<body>
<!-- 	<form action="RequestWebInfo.jsp" method="get">
		<input type="text" name="id" placeholder="아이디를 입력하세요.">
		<input type="password" name="pw" placeholder="비밀번호를 입력하세요.">
		<input type="submit" value="GET 방식으로 로그인">
	</form>
	
	<br>
	
	<form action="RequestWebInfo.jsp" method="post">
		<input type="text" name="id" placeholder="아이디를 입력하세요.">
		<input type="password" name="pw" placeholder="비밀번호를 입력하세요.">
		<input type="submit" value="POST 방식으로 로그인">
	</form>
	
	<br>
	 -->
	<form method="post" action="RequestWebInfo.jsp">
		<label><input type="checkbox" name="food" value="chicken"/>chicken</label>
		<label><input type="checkbox" name="food" value="pizza"/>pizza</label>
		<label><input type="checkbox" name="food" value="hamburger"/>hamburger</label>
		<input type="submit" value="제출"/>
	</form>
</body>
</html>