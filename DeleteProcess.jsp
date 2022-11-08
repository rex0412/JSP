<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="common.MemberDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		/* 유저로부터 pw 값 받아오기
		유저의 id값을 받아오기 (-> 세션) */
		
		/* MemberDAO deleteUser(id, pw)
		-> 삭제 성공 : 세션 값 삭제 후 다시 로그인 페이지로 이동
		-> 삭제 실패 : 비밀번호를 다시 확인해주세요 안내 문구 띄우기 */

		String upass = request.getParameter("user_pw");
		String uid = session.getAttribute("UserId").toString();
		
		MemberDAO dao = new MemberDAO(application);
		
		int isDeleted = dao.deleteUser(uid, upass);
		
		dao.close();
		if (isDeleted == 1) {
			// ver1. 하나 하나 속성 삭제
			session.removeAttribute("UserId");
			session.removeAttribute("UserName");
			// ver2. 모든 속성 한꺼번에 삭제 (서버는 더 이상 세션 정보를 유지하지 않음)
			session.invalidate();
			
			response.sendRedirect("../day10/LoginForm.jsp");
			/* response.sendRedirect("../day09/Register.jsp"); */
		} else {
			request.setAttribute("deleteErrMsg", "비밀번호를 다시 확인해주세요");
			request.getRequestDispatcher("DeleteUser.jsp").forward(request, response);
		}
	%>
</body>
</html>