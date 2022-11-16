<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page import="model1.board.ReplyDAO"%>
<%@ page import="model1.board.ReplyDTO"%>
<%
String num = request.getParameter("num");

BoardDAO dao = new BoardDAO(application);
dao.updateVisitCount(num);
BoardDTO dto = dao.selectView(num);

dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>

<script>
	function deletePost() {
		const check = confirm("정말로 이 글을 삭제하시겠습니까?");
		if (check) {
			// form 객체를 가져와서, 전송방식 post & 전송경로 DeleteProcess.jsp & 전송버튼 클릭!
			const form = document.frm; // name="frm"인 요소 가져오기
			form.method = "post";
			form.action = "DeleteProcess.jsp";
			form.submit();
		}
	}
</script>

</head>
<body>

	<!--
    [번호]    [dto.getNum()]        [작성자] [dto.getName()]
    [작성일]    [dto.getPostdate()]    [조회수] [dto.getVisitcount()]
    [제목]    [dto.getTitle()                                  ]
    [내용]    [dto.getContent()                                ]       
    
    [             수정하기  삭제하기   목록보기                     ]

 -->

	<jsp:include page="../Common/Link.jsp"></jsp:include>

	<h2>상세 보기(View)</h2>

	<form name="frm">
		<input type="hidden" name="num" value=<%=dto.getNum()%>>
		<table border="1" width="100%">

			<tr>

				<td>번호</td>
				<td><%=dto.getNum()%></td>

				<td>작성자</td>
				<td><%=dto.getName()%></td>

			</tr>

			<tr>

				<td>작성일</td>
				<td><%=dto.getPostdate()%></td>

				<td>조회수</td>
				<td><%=dto.getVisitcount()%></td>

			</tr>

			<tr>

				<td>제목</td>
				<td colspan="3"><%=dto.getTitle()%></td>
			</tr>

			<tr>
				<td>내용</td>
				<%--             
            <%= "아니요\r\n네니요\r\n네\r\n" %>
            아니요 <br>
            네니요 <br>
            네 <br> 
			--%>
				<td colspan="3" height="100"><%=dto.getContent().replace("\r\n", "<br>")%></td>
			</tr>

			<tr>

				<td colspan="4" align="center">
					<%
					if (session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(dto.getId())) {
					%>

					<button type="button"
						onClick="location.href='Edit.jsp?num=<%=dto.getNum()%>';">수정하기</button>
					<button type="button" onclick="deletePost();">삭제하기</button> <%
 }
 %>

					<button type="button" onClick="location.href='List.jsp'">목록보기</button>

				</td>

			</tr>

		</table>
	</form>

	<% if (replyList.size() > 0){%>
<h3>댓글</h3>
<%}%>
<form name="replyFrm">
<table border="1" width="100%" >
<%for(ReplyDTO rdto : replyList) {%>
<tr>
<td><strong><%=rdto.getId() %></strong></td>
<td width="70%"><%=rdto.getContent().toString().replace("\r\n", "<br/>") %></td>
<td><%=rdto.getPostdate() %></td>
<% if(session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(rdto.getId()))
{ %>
<td align="center">
<a href="ReplyEdit.jsp?r_num=<%=rdto.getR_num()%>">수정</a>
&nbsp;
<a href="DeleteReplyProcess.jsp?r_num=<%=rdto.getR_num()%>&num=<%=rdto.getNum()%>">삭제</a></td>
<% } %>
</tr>
<%} %>
</table>
</form>

<% if(session.getAttribute("UserId") != null) { %>
<form action="ReplyWriteProcess.jsp" method="post">
<input type="hidden" name="num" value=<%=dto.getNum() %>>
<table style="width:100%; border:1px solid #000; margin-top:5px; padding:5px">
<tr>
<td width="95%">
<textarea name="content" style="width:98%; height:50px; resize:none;"
required></textarea>
</td>
<td width="5%">
<button type="submit">댓글 작성</button>
</td>
</tr>
</table>
</form>
<% } %>

</body>
</html>