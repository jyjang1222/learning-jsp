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
		Object obj = session.getAttribute("name");
		String[] nameList = (String[])obj;
		obj = session.getAttribute("score");
		int[] scoreList = (int[])obj;
	%>
	<p>이름 :
		<% for (String name : nameList) { %>
			<b><%= name%> </b>
		<% } %>
	</p>
	<p>점수 :
		<% for (int score : scoreList) { %>
			<b><%= score%> </b>
		<% } %>
	</p>
</body>
</html>