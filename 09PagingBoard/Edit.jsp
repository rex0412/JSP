<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1.board.BoardDTO" %>
<%@ page import="model1.board.BoardDAO" %>
<%@ include file="./IsLoggedIn.jsp" %> <!-- 로그인 여부 체크 -->
<%
    // 수정작업 -> 이미 작성되어있는 게시물의 정보를 가져와서 input, textarea 영역 내에 삽입!
    // 이미 작성되어 있는 게시물의 정보를 가져오는거? -> BoardDAO - selectView(num)
    String num = request.getParameter("num");
    
    // DB 내의 데이터를 넘겨받아야 함!
    BoardDAO dao = new BoardDAO(application);
    BoardDTO dto = dao.selectView(num);
    
    // 글쓴이 본인인지를 한번 더 확인!
    if(session.getAttribute("UserId").toString().equals(dto.getId()) == false){
        // 작성자 본인만 수정 가능하다! -> 뒤로 되돌려보내자~!
        JSFunction.alertBack("작성자 본인만 수정이 가능합니다.", out);
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
    
    <h2>글 수정하기(Edit)</h2>
    
    <form action="EditProcess.jsp" method="post">
        <input type="hidden" name="num" value=<%=num %>>
        <table border="1" width="100%">
    
            <tr>
                <td>제목</td>
                <td><input type="text" name="title" style="width: 99.4%;" required value=<%=dto.getTitle().toString().replace("\s", "&nbsp") %>></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea name="content" style="width:99.55%; height:100px; resize:none;" required><%=dto.getContent() %></textarea></td>
            </tr>
            
            <tr>
                <td colspan="2" align="center">
                    <button type="submit">작성 완료</button>
                    <button type="reset">다시 입력</button>
                    <button type="button" onclick="location.href='List.jsp'">목록 보기</button>
                </td>     
            </tr>
        </table>
    </form>

    
</body>
</html>
