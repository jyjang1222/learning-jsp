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
		session.removeAttribute("x");
	
		Object obj = session.getAttribute("x");
		System.out.println(obj);
		obj = session.getAttribute("y");
		System.out.println(obj);
	%>
</body>
</html>