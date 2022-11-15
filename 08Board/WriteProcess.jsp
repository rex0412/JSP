<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@page import="utils.JSFunction"%>
<%@ include file="./IsLoggedIn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<%
		int result = 0;
		
		BoardDAO dao = new BoardDAO(application);
		BoardDTO dto = new BoardDTO();
		
		String Title = request.getParameter("title");
		String Content = request.getParameter("content");
		String Id = session.getAttribute("UserId").toString();
		
		dto.setTitle(Title);
		dto.setContent(Content);
		dto.setId(Id);
		
		// result = dao.InsertWrite(dto);
		
		// int result = 0;
		for (int i = 1; i <= 100; i++) {
			dto.setTitle(Title + "-" + i);
			result = dao.InsertWrite(dto);
		}
		
		dao.close();
		
		if(result == 1) {
			JSFunction.alertLocation("게시물이 성공적으로 업로드 되었습니다.", "List.jsp", out);
		} else {
			JSFunction.alertLocation("게시물 업로드에 실패하였습니다.", "List.jsp", out);
		}
	%>
</body>
</html>