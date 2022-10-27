<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<h1>로그인</h1>
	
	<%
		String loginErr = request.getParameter("loginErr");
		if (loginErr != null) {
			out.println("아이디나 비밀번호를 확인해주세요");
		}
	%>
	
		<form action="AuthLogin.jsp" method="post">
		<strong>아이디</strong> <input type="text" name="id"/> <br>
		<strong>비밀번호</strong> <input type="password" name="pw"/> <br>
		<input type="submit" value="로그인"/>
		</form>
</body>
</html>