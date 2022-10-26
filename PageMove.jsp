<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %>

<h2>href로 이동한 완전히 다른 Page</h2>
<%
        int pHrefInt = (Integer)pageContext.getAttribute("pageInt");
        String pHrefString = pageContext.getAttribute("pageString").toString();
        Person pHrefPerson = (Person)pageContext.getAttribute("pagePerson");
    %>
<%=pHrefInt %>
<%=pHrefString %>
<%=pHrefPerson.getName() %>, <%=pHrefPerson.getAge() %>
