<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="model1.board.ReplyDTO" %>
<%@ page import="model1.board.ReplyDAO" %>
<%@ include file="../08Board/IsLoggedIn.jsp" %> <!-- 로그인 여부 체크 -->
<%
String r_num = request.getParameter("r_num");
ReplyDAO dao = new ReplyDAO(application);
ReplyDTO dto = dao.selectReply(r_num);
System.out.println(session.getAttribute("UserId"));
System.out.println(dto.getId());
// 댓글 쓴 본인인지를 한번 더 확인!
if(session.getAttribute("UserId").toString().equals(dto.getId()) == false){
// 작성자 본인만 수정 가능하다! -> 뒤로 되돌려보내자~!
JSFunction.alertBack("댓글 작성자만 수정이 가능합니다.", out);
return;
}
dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
<jsp:include page="../Common/Link.jsp" />
<h2>댓글 수정하기(ReplyEdit)</h2>
<form action="ReplyEditProcess.jsp" method="post">
<input type="hidden" name="num" value=<%=dto.getNum() %>>
<input type="hidden" name="r_num" value=<%=dto.getR_num() %>>
<table border="1" width="100%">
<tr>
<td><textarea name="content" style="width:99.55%; height:100px; resize:none;"
required><%=dto.getContent() %></textarea></td>
</tr>
<tr>
<td colspan="2" align="center">
<button type="submit">수정 완료</button>
<button type="reset">다시 입력</button>
<button type="button" onclick="location.href='View.jsp?num=<%=dto.getNum()%>'">게시물로 돌아가기</button>
</td>
</tr>
</table>
</form>
</body>
</html>