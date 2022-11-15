<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="utils.JSFunction"%>

<%
	// 삭제 처리 로직!
	
	int result = 0;
		
		BoardDAO dao = new BoardDAO(application);
		BoardDTO dto = new BoardDTO();
		
		String Title = request.getParameter("title");
		String Content = request.getParameter("content");
		String Id = session.getAttribute("UserId").toString();
		String Num = request.getParameter("num");
		
		dto.setNum(Num);
		dto.setId(Id);
		
		result = dao.deletePost(dto);
		dao.close();
		
		if(result == 1) {
			JSFunction.alertLocation("게시물이 성공적으로 삭제되었습니다.", "List.jsp", out);
		} else {
			JSFunction.alertLocation("게시물 삭제 처리에 실패하였습니다.", "List.jsp", out);
		}
%>