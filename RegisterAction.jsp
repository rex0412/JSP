<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="common.JDBConnect"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");

	JDBConnect jdbc = new JDBConnect();

	String sql = "select * from member where id=?";
	PreparedStatement ps2 = jdbc.conn.prepareStatement(sql);
	ps2.setString(1, id);
	ResultSet r = ps2.executeQuery();

	while (r.next()) {
		request.getRequestDispatcher("Register.jsp?loginErr=1").forward(request, response);
	}

	String sql2 = "INSERT INTO member VALUES(?, ?, ?, sysdate)";

	PreparedStatement ps = jdbc.conn.prepareStatement(sql2);
	ps.setString(1, id);
	ps.setString(2, pw);
	ps.setString(3, name);

	int result = ps2.executeUpdate();

	System.out.println(result + "행이 DB에 입력되었습니다.");
	jdbc.close();

	session.setAttribute("user_name", name);
	response.sendRedirect("Welcome.jsp");
	%>
</body>
</html>
