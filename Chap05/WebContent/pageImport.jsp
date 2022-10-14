<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>

<%
	Date today = new Date();
	SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
	SimpleDateFormat time = new SimpleDateFormat("hh:mm:ss a");
%>
<h3>현재 시각은 <%= date.format(today) %> <%=time.format(today) %>입니다.</h3>