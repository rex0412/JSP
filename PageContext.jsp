<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %>

<%
    pageContext.setAttribute("pageInt", 1026);
    pageContext.setAttribute("pageString", "졸리지만 힘내보자");
    pageContext.setAttribute("pagePerson", new Person("천예지", 18) );
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page 영역</title>
</head>
<body>

    <%
        int pInt = (Integer)pageContext.getAttribute("pageInt");
        String pString = pageContext.getAttribute("pageString").toString();
        Person pPerson = (Person)pageContext.getAttribute("pagePerson");
    %>
    <h2>원본 Page</h2>
    <%=pInt %> <br>
    <%=pString %><br>
    <%=pPerson.getName() %>, <%=pPerson.getAge() %>
    
    <p>------------------------</p>
    
    <%@include file="PageInclude.jsp" %>
    
    <p>------------------------</p>
    <h2>페이지 이동 후에도 데이터가 살아있을까요?</h2>
    <a href="PageMove.jsp">이동해보자!</a>
</body>
</html>