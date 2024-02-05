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
		
		String userId = (String)session.getAttribute("log");
		String userPw = request.getParameter("userPw");
		
		boolean checkPw = false;
		int removeIdx = 0;
		
		// 비번 체크
		for (int i = 0; i < userDB.size(); i++) {
			Map<String, String> user = userDB.get(i);
			if (user.get("userId").equals(userId) && user.get("userPw").equals(userPw)) {
				checkPw = true;
				removeIdx = i;
			}
		}
		
		if (checkPw) {
			userDB.remove(removeIdx);
			response.sendRedirect("02_main.jsp");
		} else {
			response.sendRedirect("03_41_deleteForm.jsp");
			
		}
	%>
</body>
</html>