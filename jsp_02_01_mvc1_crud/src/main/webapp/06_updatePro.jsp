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
	<% request.setCharacterEncoding("UTF-8"); %>
	
	<jsp:useBean id="member" class="member.MemberDTO">
		<jsp:setProperty property="*" name="member"/>
	</jsp:useBean>
	
	<% 
		MemberDAO.getInstance().updateMember(member);
		response.sendRedirect("00_main.jsp");
	%>
</body>
</html>