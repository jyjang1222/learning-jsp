<%@page import="member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
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
		ArrayList<MemberDTO> memberList = MemberDAO.getInstance().getMemberList();
	%>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>패스워드</td>
			<td>이름</td>
			<td>가입일</td>
		</tr>
		<% if (memberList.size() > 0) { %>
			<% for (MemberDTO member : memberList) { %>
				<tr>
					<td><%= member.getId() %></td>
					<td><%= member.getPw() %></td>
					<td><%= member.getName() %></td>
					<td><%= member.getRegisteredDate() %></td>
				</tr>
			<% } %>
		<% } else { %>
			<tr>
				<td colspan="4">회원이 없습니다..ㅜ</td>
			</tr>
		<% } %>
	</table>
	<a href="00_main.jsp">메인</a>
</body>
</html>