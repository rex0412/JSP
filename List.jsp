<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@page import="java.util.List"%>


<%
BoardDAO dao = new BoardDAO(application); // DB에 연결

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");

//      자료형        변수명 = new 생성자();
Map<String, Object> param = new HashMap<String, Object>();

if (searchWord != null) {
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}

int totalCount = dao.selectCount(param);
List<BoardDTO> boardLists = dao.selectList(param);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp"></jsp:include>
	<h2>목록 보기(List)</h2>

	<form method="get">
		<table border="1" width="100%">
			<tr>
				<td align="center"><select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
				</select> <input type="text" name="searchField"> <input type="submit"
					value="검색하기"></td>
			</tr>
		</table>
	</form>

	<table border="1" width="100%">
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>

		<%
		if (boardLists.isEmpty()) {
		%>

		<tr>
			<td colspan="5" align="center">등록된 게시물이 아직 없어요!</td>
		</tr>

		<%
		} else {

		int virtualNum = 0;
		for (BoardDTO dto : boardLists) {
			virtualNum = totalCount--;
		%>

		<tr align="center">
			<td><%=virtualNum%></td>
			<td><a href="View.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle()%></a>
			</td>
			<td><%=dto.getId()%></td>
			<td><%=dto.getVisitcount()%></td>
			<td><%=dto.getPostdate()%></td>
		</tr>

		<%
		}
		}
		%>
	</table>

	<table border="1" width="100%">
		<tr align="right">
			<td>
				<button type="button" onClick="location.href='Write.jsp';">글쓰기</button>
	</table>
</body>
</html>