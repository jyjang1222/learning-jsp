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
		int result = MemberDAO.getInstance().insertMember(member);
		String msg = "가입 완료";
		
		if (result == 1) {
			msg = "중복된 아이디입니다";
		}
	
		out.println("result = " + result + "<br>");
	%>
	<p><%= msg %></p>
	<a href="00_main.jsp">메인</a>
</body>
</html>