<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1.board.BoardDAO" %>
<%@ page import="model1.board.BoardDTO" %>
<%@ page import="model1.board.BoardPage" %>
<%
	BoardDAO dao = new BoardDAO(application); // DB에 연결!
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	//      자료형        변수명 = new 생성자();
	Map<String, Object> param = new HashMap<String, Object>();
	if(searchWord != null){
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	int totalCount = dao.selectCount(param); // 게시물 수
	
	// 전체 페이지 수 계산
	/*
		1. 화면에 출력할 전체 레코드 수(게시물 데이터)를 세기
		ex. 전체 게시물 : 105개
		
		2. 한 페이지에서 출력할 게시물의 범위를 계산
		- 시작 게시물 번호 : (현재 페이지 - 1) * POSTS_PER_PAGE + 1
		- 마지막 게시물 번호 : (현재 페이지) * POSTS_PER_PAGE
		
		3. 전체 페이지 수 계산
		= Math.ceil(전체 게시물 수 / POSTS_PER_PAGE)
	*/
	
	// 전체 페이지 수 계산
	int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
	int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
	int totalPage = (int)Math.ceil((double)totalCount/pageSize);
	// int 12 / int 10 = int 1.0 -> 올림하면 1
	// double 12 / int 10 = double 1.2 -> 올림하면 2
			
	// 내가 현재 있는 페이지가 몇번째 페이지인지!
	int pageNum = 1; 
	String tmp = request.getParameter("pageNum");
	if(tmp != null && !tmp.equals("")){
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
	
	// 현재 내 페이지에 출력할 게시물의 범위를 계산!
	// 시작 게시물 번호 : (현재 페이지 - 1) * POSTS_PER_PAGE + 1
	// 마지막 게시물 번호 : (현재 페이지) * POSTS_PER_PAGE
	int start = (pageNum - 1) * pageSize + 1;
	int end = pageNum * pageSize;
	param.put("start", start);
	param.put("end", end);
	
	List<BoardDTO> boardLists = dao.selectListPage(param);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>목록 보기(List)</h2>
	<!-- 검색 옵션 (form) -->
	<form method="get">
		<table border="1" width="100%">
			<tr>
				<td align="center"> 
					<select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchWord">
					<input type="submit" value="검색하기">
				</td>
			</tr>
		</table>
	</form>
	
	<!-- 게시물의 목록 (table) -->
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
			<td colspan="5" align="center">
				등록된 게시물이 아직 없어요!
			</td>
		</tr>
		<%
			} else {
				
			int virtualNum = 0;
			int countNum = 0;
			for(BoardDTO dto : boardLists) {
				virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
			
		%>
		
		<tr align="center">
			<!-- 번호, 제목, 작성자, 조회수, 작성일  -->
			<td><%= virtualNum%></td>
			<td>
				<a href="View.jsp?num=<%=dto.getNum() %>"><%= dto.getTitle()%></a>
			</td>
			<td><%= dto.getId()%></td>
			<td><%= dto.getVisitcount()%></td>
			<td><%= dto.getPostdate()%></td>
		
		</tr>
	<%
			}
		}
	%>
	</table>

<!-- 
		< 페이징 기능 >
		[ 한 페이지에 출력할 게시물 개수(POSTS_PER_PAGE) : 10개 ]
		[ 한 화면(블록)에 출력할 페이지 번호 개수(PAGES_PER_BLOCK) : 5개 ] 
		
		1. 화면에 출력할 전체 레코드 수(게시물 데이터)를 세기
		ex. 전체 게시물 : 105개
		
		2. 한 페이지에서 출력할 게시물의 범위를 계산
		- 시작 게시물 번호 : (현재 페이지 - 1) * POSTS_PER_PAGE + 1
		- 마지막 게시물 번호 : (현재 페이지) * POSTS_PER_PAGE
		
		3. 전체 페이지 수 계산
		= Math.ceil(전체 게시물 수 / POSTS_PER_PAGE)
		
		4. 이전 페이지 블록 바로가기 출력
		pageTmp = ((현재 페이지 – 1) / PAGES_PER_BLOCK) * PAGES_PER_BLOCK + 1 
		
		if(pageTmp == 1) 출력X
		else pageTmp-1 결과로 이전 페이지 블록 바로가기 출력!
		
		5. 각 페이지 번호를 출력
		4단계에서 계산한 pageTmp를 가지고 PAGES_PER_BLOCK만큼 반복하면서 +1씩 연산 후 출력
		
		ex. pageTmp = 1 -> 1,2,3,4,5
		ex. pageTmp = 6 -> 6,7,8,9,10
		
		6. 다음 페이지 블록 바로가기 출력
		5단계까지 출력한 pageTmp에 +1해주면 완료!
		
		ex. pageTmp = 1 -> 1,2,3,4,5 -> <<<6>>>
		ex. pageTmp = 6 -> 6,7,8,9,10 -> <<<<11>>>
		
-->	
	<!-- 글쓰기 버튼 -->
	<table border="1" width="100%">
		<tr align="center">
			<td>
				<%=BoardPage.paging(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
			</td>
			<td>
				<button type="button" onClick="location.href='Write.jsp';">글쓰기</button>
			</td>
		</tr>
	</table>
</body>
</html>