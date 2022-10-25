<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 예제</title>
</head>
<body>
	<h2>1.로그인 폼</h2>
	<%
		String loginErr = request.getParameter("loginErr");
		if (loginErr != null) {
			out.println("로그인에 실패하였습니다.");
		}
	%>
	
	<form action="ResponseLogin.jsp" method="post">
		아이디 : <input type="text" name="user_id"/> <br/>
		패스워드 : <input type="password" name="user_pwd"/> <br/>
		<input type="submit" value="로그인"/>
	</form>
</body>
</html>