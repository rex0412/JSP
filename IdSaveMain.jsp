<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.CookieManager" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie를 사용하여 아이디 저장하는 로그인 화면</title>
</head>
<body>
	
	<%
	 	String loginIdCookieVal = "";
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for(int i = 0; i<cookies.length; i++) {
				String cookieName = cookies[i].getName();
			
				if(cookieName.equals("loginId")) {
					loginIdCookieVal = cookies[i].getValue();
				}
			}
		}
	
		/* String loginId = CookieManager.readCookie(request, "loginId"); */
		
		String cookieCheck = "";
		if (!loginIdCookieVal.equals("")) {
			cookieCheck = "checked";
		}
	%>
	
	<h2>로그인 페이지</h2>
	
	<form action="IdSaveProcess.jsp" method="post">
		아이디 : <input type="text" name="user_id" value=<%= loginIdCookieVal %>>
		<br>
		비밀번호 : <input type="password" name="user_pw">
		<br>
		<input type="checkbox" name="save_check" value="Y" <%= cookieCheck %>> 아이디 저장하기
		<input type="submit" value="로그인">
	</form>
</body>
</html>