<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Test</title>
</head>
<body>
	<h2>쿠키 체크하기 - 새로운 페이지</h2>
	
	<%
		Cookie[] cookies = request.getCookies();
	
		 if (cookies != null) {
			/* for(int i = 0; i < cookies.length; i++) {
				cookies[i].getName();
				cookies[i].getValue();
			} */
			
			for(Cookie cookie : cookies) {
				out.println(cookie.getName());
				out.println(cookie.getValue());
			}
		}
	%>
</body>
</html>