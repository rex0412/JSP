<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %>

<h2>Include된 완전히 다른 Page</h2>
<%
        int pIncludeInt = (Integer)pageContext.getAttribute("pageInt");
        String pIncludeString = pageContext.getAttribute("pageString").toString();
        Person pIncludePerson = (Person)pageContext.getAttribute("pagePerson");
%>

<%=pIncludeInt %>
<%=pIncludeString %>
<%=pIncludePerson.getName() %>, <%=pIncludePerson.getAge() %>