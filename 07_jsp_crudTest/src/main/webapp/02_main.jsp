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
		String log = (String)session.getAttribute("log");
	%>
	<h1>메인 페이지</h1>
	<table>
		<tr>
			<% if (log == null) { %>
			<td><a href="03_11_joinForm.jsp">회원가입</a></td>
			<td><a href="03_21_loginForm.jsp">로그인</a></td>
			<% } else { %>
			<td><a href="03_23_logoutPro.jsp">로그아웃</a></td>
			<td><a href="">회원정보수정</a></td>
			<td><a href="">회원탈퇴</a></td>
			<% } %>
		</tr>
	</table>
</body>
</html>