<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="model1.board.ReplyDTO" %>
<%@ page import="model1.board.ReplyDAO" %>
<%@ include file="../08Board/IsLoggedIn.jsp" %> <!-- 로그인 여부 체크 -->
<%
String r_num = request.getParameter("r_num");
String num = request.getParameter("num");
ReplyDTO dto = new ReplyDTO();
dto.setR_num(r_num);
ReplyDAO dao = new ReplyDAO(application);
int result = dao.deleteReply(dto);
if(result == 1){
JSFunction.alertLocation("댓글이 삭제되었습니다", "View.jsp?num=" + num, out);
} else {
JSFunction.alertBack("댓글 삭제하기에 실패했습니다", out);
}
%>