<%@page import="java.util.HashMap"%>
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
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userGender = request.getParameter("userGender");
		
		Object obj = session.getAttribute("userDB");
		ArrayList<Map<String, String>> userDB = (ArrayList<Map<String, String>>)obj;
		
		// 아이디 중복 체크
		boolean checkDupliId = false;
		
		for (Map<String, String> user : userDB) {
			if (user.get("userId").equals(userId)) {
				checkDupliId = true;
			}
		}
		
		if (checkDupliId) {
			response.sendRedirect("03_21_loginForm.jsp");
		} else {
			Map<String, String> user = new HashMap<String, String>();
			
			user.put("userId", userId);
			user.put("userPw", userId);
			user.put("userName", userId);
			user.put("userGender", userId);
			
			userDB.add(user);
			
			response.sendRedirect("02_main.jsp");
		}
	%>
</body>
</html>