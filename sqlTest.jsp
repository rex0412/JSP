<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@page import="common.JDBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동적 쿼리문 회원추가</title>
</head>
<body>
	<h2>회원 추가 테스트 - executeUpdate() 메서드 사용</h2>
	<%
	// DB 연결!
		JDBConnect jdbc = new JDBConnect();
		
		String id = "test1";
		String pw = "1111";
		String name = "테스트1회원";
	
		String sql = "INSERT INTO member VALUES(?, ?, ?, sysdate)";
		PreparedStatement ps = jdbc.conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);
		ps.setString(3, name);
		
		int insertResult = ps.executeUpdate();
		
		out.println(insertResult + "행이 입력되었습니다.");
		
		// 자원 반납
		jdbc.close();
	%>
</body>
</html>