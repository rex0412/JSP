<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginTest</title>
</head>
<body>
	<h1>로그인 ✪ ω ✪</h1>
	<%
		String loginErr = request.getParameter("loginErr");
		if (loginErr != null) {
			out.println("아이디나 비밀번호를 확인해주세요");
		}
	%>
	
	<form action="Auth.jsp" method="post">
		<h3>아이디</h3>
		<input type="text" name="user_id" placeholder="아이디를 입력하세요🤔"/> <br> <br>
		<h3>패스워드</h3>
		<input type="password" name="user_pwd" placeholder="비밀번호를 입력하세요🤔"/> <br> <br>
		<input type="submit" value="로그인"/>
	</form>
</body>
</html>