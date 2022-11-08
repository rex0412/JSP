<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

%>

<table>
  <tr>
    <td align="center">
    <a href="../day09/Register.jsp">회원가입</a>
    &nbsp;&nbsp;&nbsp;
    <% if (session.getAttribute("UserId") == null) { %>
    	<a href="../day10/LoginForm.jsp">로그인</a>
    	<% } else { %>
    	<a href="../day11/Logout.jsp">로그아웃</a>
    	<% } %>
    	&nbsp;&nbsp;&nbsp;
    	<a href="../08Board/List.jsp">게시판(페이징X)</a>
    	&nbsp;&nbsp;&nbsp;
    	<a href="../09PagingBoard/List.jsp">게시판(페이징O)</a>
    </td>
  </tr>
</table>
