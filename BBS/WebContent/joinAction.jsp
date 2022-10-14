<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
			|| user.getUserGender() == null || user.getUserName() == null || user.getUserGender() == null) {

		PrintWriter script = response.getWriter();

		script.println("<script>");
		script.println("alert('입력되지 않은 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");

	} else { // 회원가입 완료
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		if(result == -1) {
			PrintWriter script = response.getWriter();

			script.println("<script>");
			script.println("alert('아이디가 중복되었습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();

			script.println("<script>");
			script.println("alert('회원가입이 완료되었습니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");			
		}
	}
	%>
</body>
</html>