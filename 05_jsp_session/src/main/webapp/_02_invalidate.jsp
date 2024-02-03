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
		// session의 모든 내용을 지울 때 사용한다.
		session.invalidate();
	
		Object obj = session.getAttribute("x");
		System.out.println(obj);
		obj = session.getAttribute("y");
		System.out.println(obj);
	%>
	
	<a href="_01_sessionRemove.jsp">이전페이지</a>
</body>
</html>