<%@page import="member.MemberDAO"%>
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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		int result = MemberDAO.getInstance().login(id, pw);
	%>
	<% 
		if (result == 1) {
			session.setAttribute("log", id);
			response.sendRedirect("00_main.jsp");
	%>
	<% } else { %>
			<p>아이디, 비밀번호를 확인해주세요</p>
			<a href="00_main.jsp">메인</a>
	<% } %>
</body>
</html>