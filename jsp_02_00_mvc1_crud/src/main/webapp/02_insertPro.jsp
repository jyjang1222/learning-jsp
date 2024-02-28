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
	<% request.setCharacterEncoding("UTF-8"); %>
	
	<jsp:useBean id="member" class="member.MemberDTO">	
		<jsp:setProperty property="*" name="member"/>
	</jsp:useBean>
	
	<%
		int result = MemberDAO.getInstance().insertMember(member);
	
		out.println("result = " + result + "<br>");
	%>
	<a href="00_main.jsp">메인</a>
</body>
</html>