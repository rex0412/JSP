<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="common.JDBConnect"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정적 쿼리문 - 회원 조	회</title>
</head>
<body>
	<h2>회원 목록 조회하기 - executeQuery() 메서드 사용</h2>
	<%
		JDBConnect jdbc = new JDBConnect(); // DB에 연결!
		
		// 회원의 목록을 전부 가져오는 쿼리문
		String sql = "SELECT id, pass, name, regidate FROM member";
		Statement  st = jdbc.conn.createStatement();
		
		// 쿼리문 수행
		ResultSet r = st.executeQuery(sql);
		
		while (r.next()) {
			String id = r.getString(1/*"id"*/);
			String pw = r.getString(2/*"pass"*/);
			String name = r.getString(3/*"name"*/);
			java.sql.Date regidate = r.getDate(4/* "regidate" */);
			
			out.println(String.format("회원 아이디 : %s, 회원 비밀번호 : %s, 회원 이름 : %s, 회원 가입 날짜 : %s", id, pw, name, regidate) + "<br>");
		}
		
		// 자원 반납
		jdbc.close();
	%>
</body>
</html>