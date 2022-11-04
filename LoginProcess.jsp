<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="common.MemberDAO"%>
<%@page import="common.MemberDTO2"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
	<%
	// form 데이터에서 유저의 입력 값 받아오는 부분
			String userId = request.getParameter("user_id");
			String userPw = request.getParameter("user_pw");
			
			// DB에 연결하기 위한 정보 - web.xml에서 가져오기
			String oracleDriver = application.getInitParameter("OracleDriver");
			String oracleUrl = application.getInitParameter("OracleURL");
			String oracleId = application.getInitParameter("OracleId");
			String oraclePw = application.getInitParameter("OraclePw");
			
			MemberDAO dao = new MemberDAO(oracleDriver, oracleUrl, oracleId, oraclePw);
			MemberDTO2 dto =  dao.getMemberDTO(userId, userPw);
			dao.close();
			
			if (dto.getId() == null) {
		// 로그인 실패!
		request.setAttribute("LoginErrMsg", "아이디나 비밀번호를 다시 확인해주세요.");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
			} else {
		// 로그인 성공!
		 session.setAttribute("UserId", dto.getId());
		session.setAttribute("UserName", dto.getName());
		response.sendRedirect("LoginForm.jsp");
			}
	%>
</body>
</html>