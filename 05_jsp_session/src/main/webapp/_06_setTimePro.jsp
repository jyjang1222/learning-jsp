<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>5초 뒤에 F5를 눌러보세요!</h2>
	
	<%
		String[] nameList = (String[])session.getAttribute("name");
		int[] scoreList = (int[])session.getAttribute("score");
	%>
	
	<% if (nameList != null && scoreList != null) { %>
		<% for(int i = 0; i < nameList.length; i++) { %>
				<%= nameList[i] %>, <%= scoreList[i] %>
		<% } %>	
	<% } %>
</body>
</html>