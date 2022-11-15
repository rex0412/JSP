<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="utils.JSFunction"%>

<% 
		if (session.getAttribute("UserId") == null) {
			// 로그인 후 접근이 가능합니다. 로그인 창으로 이동하세요
			JSFunction.alertLocation("로그인 후 글 작성이 가능합니다.", "../day10/LoginForm.jsp", out);
			
			return;
		}
	%>