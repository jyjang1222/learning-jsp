<%@page import="member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
		String id = String.valueOf(session.getAttribute("log"));
		String pw = request.getParameter("pw");
		
		int result = MemberDAO.getInstance().deleteMember(id, pw);
		String msg = "비밀번호를 확인해주세요";
		
		if (result == 1) {
			session.invalidate();
			msg = "탈퇴 완료";
		}
	%>
	<p><%= msg %></p>
	<a href="00_main.jsp">메인</a>
</body>
</html>