<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 탈퇴를 위해 비밀번호를 한 번 더 입력하세요.</h2>
	
	<%= request.getAttribute("deleteErrMsg") == null ? "" : request.getAttribute("deleteErrMsg") %>
	
	<form action="DeleteProcess.jsp" method="post">
		패스워드 : <input type="password" name="user_pw"> <br> 
		<input type="submit" value="회원탈퇴">
	</form>
</body>
</html>