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
		String str = request.getParameter("age");
		int age = Integer.parseInt(str);
	%>
	<h3>당신의 나이는 <%=age%>세 입니다.</h3>
</body>
</html>