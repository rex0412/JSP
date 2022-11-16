<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="model1.board.ReplyDAO" %>
<%@ page import="model1.board.ReplyDTO" %>
<%@ include file="./IsLoggedIn.jsp" %> <!-- 로그인 여부 체크 -->

<%
String content = request.getParameter("content");
String num = request.getParameter("num");
String userId = session.getAttribute("UserId").toString();
ReplyDTO dto = new ReplyDTO();
dto.setContent(content);
dto.setId(userId);
dto.setNum(num);
ReplyDAO dao = new ReplyDAO(application);
int result = dao.insertReply(dto);
if(result == 1){
response.sendRedirect("View.jsp?num="+num);
} else {
JSFunction.alertBack("댓글 작성에 실패하였습니다", out);
}
%>