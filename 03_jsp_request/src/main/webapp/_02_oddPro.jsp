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
		String strNum = request.getParameter("num");
		int num = Integer.parseInt(strNum);
	%>
	<h2>홀수짝수 판별</h2>
	<% if (num % 2 == 0) { %>
	<p>짝수</p>
	<% } else { %>
	<p>홀수</p>
	<% } %>
	
	<a href="_02_oddForm.jsp">뒤로가기</a>
</body>
</html>