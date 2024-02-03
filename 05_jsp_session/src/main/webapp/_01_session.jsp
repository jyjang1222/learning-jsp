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
		int x = 10;
		int y = 20;
		
		session.setAttribute("x", x);
		session.setAttribute("y", y);
	%>
	<h1>_01_session</h1>
	<a href="_01_sessionPro1.jsp">다음 페이지</a>
</body>
</html>