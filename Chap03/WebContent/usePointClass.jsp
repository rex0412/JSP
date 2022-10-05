<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import= "myClass.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 사용</title>
</head>
<body>
	<%
		out.println("<h3>myPoint1 객체 생성 <br/>");
		Point myPoint1 = new Point();
		out.println("myPoint1 객체 생성 완료</h3>");
		
		out.println("현재 myPoint1.x : " + myPoint1.getX() + "<br/>");
		out.println("현재 myPoint1.y : " + myPoint1.getY() + "<br/>");
		
		myPoint1.x = 2;
		myPoint1.y = 4;
		
		out.println("변경 후 myPoint1.x : " + myPoint1.getX() + "<br/>");
		out.println("변경 후 myPoint1.y : " + myPoint1.getY() + "<hr/>");
		
		out.println("<h3>myPoint2 객체 생성 <br/>");
		Point myPoint2 = new Point (3, 5);
		out.println("myPoint2 객체 생성 완료 </h3>");
		
		out.println("현재 myPoint2.x : " + myPoint2.getX() + "<br/>");
		out.println("현재 myPoint2.y : " + myPoint2.getY() + "<br/>");
		
		myPoint2.setX(10);
		myPoint2.setY(17);
		
		out.println("변경 후 myPoint2.x : " + myPoint2.getX() + "<br/>");
		out.println("변경 후 myPoint2.y : " + myPoint2.getX() + "<hr/>");
	%>
</body>
</html>