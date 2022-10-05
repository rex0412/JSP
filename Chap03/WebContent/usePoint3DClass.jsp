<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="myClass.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 사용</title>
</head>
<body>
	<%
		out.println("<h3>myPoint3D 객체 생성 <br/>");
		Point3D myPoint3D = new Point3D();
		out.println("<h3>myPoint3D 객체 생성 완료 <h3/>");
		
		out.println("현재 myPoint3D.x : " + myPoint3D.getX() + "<br/>");
		out.println("현재 myPoint3D.y : " + myPoint3D.getY() + "<br/>");
		out.println("현재 myPoint3D.z : " + myPoint3D.getZ() + "<hr/>");
		
		out.println("<h3>멤버 변수를 통한 값 변경</h3>");
		
		myPoint3D.x = 2;
		myPoint3D.y = 4;
		myPoint3D.z = 6;
		
		out.println("현재 myPoint3D.x : " + myPoint3D.getX() + "<br/>");
		out.println("현재 myPoint3D.y : " + myPoint3D.getY() + "<br/>");
		out.println("현재 myPoint3D.z : " + myPoint3D.getZ() + "<hr/>");
		
		out.println("<h3>메서드를 통한 값 변경</h3>");
		
		myPoint3D.setX(8);
		myPoint3D.setY(10);
		myPoint3D.setZ(12);
		
		out.println("현재 myPoint3D.x : " + myPoint3D.getX() + "<br/>");
		out.println("현재 myPoint3D.y : " + myPoint3D.getY() + "<br/>");
		out.println("현재 myPoint3D.z : " + myPoint3D.getZ() + "<hr/>");
	%>
</body>
</html>