<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.JSFunction" %>
<%@ page import="utils.CookieManager" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 & 아이디 저장(쿠키)</title>
</head>
<body>
	<%
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String save_check = request.getParameter("save_check");
		
		if (user_id.equals("must") && user_pw.equals("1234")) {
			// 로그인!
			// 로그인을 했다 -> alert창 띄워줘야 됨 (JSFunction - alert~)
			// 아이디를 저장하고자 checkbox 체크됨 -> 크키 데이터에 아이디 저장 O
			if (save_check != null && save_check.equals("Y")) {
				// 쿠키 만들어야함!
				/* Cookie c = new Cookie("loginId", user_id);
				c.setPath("/");
				c.setMaxAge(86400); // 24시간 -> 초로 환산
				response.addCookie(c); */
				
				CookieManager.makeCookie(response, "loginId", user_id, 86400);
			} else {
				/* Cookie c = new Cookie("loginId", "");
				c.setPath("/");
				c.setMaxAge(0); // 성성과 동시에 만료(삭제)
				response.addCookie(c); */
				
				CookieManager.deleteCookie(response, "loginId");
			}
			
			JSFunction.alertLocation("로그인에 성공했습니다!", "IdSaveMain.jsp", out);
		} else {
			JSFunction.alertBack("아이디나 비밀번호를 다시 확인해주세요.", out);
		}
	%>
</body>
</html>