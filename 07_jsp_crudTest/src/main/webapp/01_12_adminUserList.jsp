<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
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
		Object obj = session.getAttribute("userDB");
		ArrayList<Map<String, String>> userDB = (ArrayList<Map<String, String>>)obj;
	%>
	<h1>관리자 페이지(회원 정보 확인하기)</h1>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>패스워드</td>
			<td>이름</td>
			<td>성별</td>
			<td>삭제</td>
		</tr>
		<% for (Map<String, String> user : userDB) { %>
		<tr>
			<td><%= user.get("userId") %></td>
			<td><%= user.get("userPw") %></td>
			<td><%= user.get("userName") %></td>
			<td><%= user.get("userGender") %></td>
			<td><a href="01_13_adminUserDelete.jsp?userid=<%=user.get("userId")%>">삭제</a></td>
		</tr>
		<% } %>
	</table>
	<a href="01_11_adminMain.jsp">메인으로가기</a>
</body>
</html>