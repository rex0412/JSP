<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 출력1</title>
</head>
<body>

	<h1>구구단 출력</h1>
	
	<table border="1">
	
	<th>2단</th>
	<th>3단</th>
	<th>4단</th>
	<th>5단</th>
	<th>6단</th>
	<th>7단</th>
	<th>8단</th>
	<th>9단</th>

	<%

     	for(int j = 1; j <= 9; j++) {

	%>

  	<tr>

 	<%

		for(int i = 2; i <= 9; i++) {

 	%>

   <td>
   		<%=(i + " X " + j + " = " + i * j)%>
   </td>

   <%

   }

    %>

 </tr>

<%

}

%>

</table>

</body>
</html>