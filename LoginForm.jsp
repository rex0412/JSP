<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 활용 로그인</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<%= request.getAttribute("LoginErrMsg") ==  null ? "" : request.getAttribute("LoginErrMsg") %>
	<%
		if (session.getAttribute("UserId") == null) {
	%>
	<script>
		function validateForm(form) {
				if (!form.user_id.value) {
					alert("아이디를 입력하세요");
					return False
				}
				if (!form.user_pw.value) {
					alert("패스워드를 입력하세요!");
					return False
				}
		}
	</script>
	
	<form action="LoginProcess.jsp" method="post" onsubmit="return validateForm(this)">
		아이디 : <input type="text" name="user_id"> <br>
		패스워드 : <input type="password" name="user_pw"> <br>
		<input type="submit" value="로그인">
	</form>
	
	<%
		} else {
	%>
		<%= session.getAttribute("UserName") %> 회원님, 환영합니다! <br>
		<a href="Logout.jsp">[로그아웃]</a>
	<%		
		}
	%>
</body>
</html>