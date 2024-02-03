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
		Object obj = session.getAttribute("x");
		int x = (int)obj;

		obj = session.getAttribute("y");
		int y = (int)obj;
	%>
	
	<h1>_01_sessionPro2</h1>
	<h2>x = <%=x%>, y = <%=y%></h2>
	
	<a href="_01_sessionPro1.jsp">이전페이지</a>
	<a href="_01_sessionRemove.jsp">다음페이지</a>
</body>
</html>