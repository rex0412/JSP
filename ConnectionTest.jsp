<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="common.JDBConnect" %> --%>
<%@ page import="common.DBConnPool" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		/* JDBConnect jdbc1 = new JDBConnect(application);
		jdbc1.close(); */
		
		DBConnPool pool = new DBConnPool();
		pool.close();
	%>
</body>
</html>