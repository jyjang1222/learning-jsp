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
		request.setCharacterEncoding("UTF-8");
		String userId = (String)session.getAttribute("log");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userGender = request.getParameter("userGender");
	
		Object obj = session.getAttribute("userDB");
		ArrayList<Map<String, String>> userDB = (ArrayList<Map<String, String>>)obj;
		
		for (Map<String, String> user : userDB) {
			if (user.get("userId").equals(userId)) {
				user.put("userPw", userPw);
				user.put("userName", userName);
				user.put("userGender", userGender);
			}
		}
		
		session.setAttribute("log", null);
		response.sendRedirect("02_main.jsp");
	%>
</body>
</html>