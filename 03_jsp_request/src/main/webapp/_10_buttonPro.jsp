<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String str = request.getParameter("x");
		int x = Integer.parseInt(str);
		
		str = request.getParameter("y");
		int y = Integer.parseInt(str);
		
		str = request.getParameter("z");
		int z = Integer.parseInt(str);
	%>
	
	<h2>x = <%= x %></h2>
	<h2>y = <%= y %></h2>
	<h2>z = <%= z %></h2>
</body>
</html>