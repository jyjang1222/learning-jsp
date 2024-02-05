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
		
		String userId = request.getParameter("userId");
		int removeIdx = 0;
		
		for (int i = 0; i < userDB.size(); i++) {
			Map<String, String> user = userDB.get(i);
			if (user.get("userId").equals(userId)) {
				removeIdx = i;
			}
		}
		
		userDB.remove(removeIdx);
		
		response.sendRedirect("01_12_adminUserList.jsp");
	%>
</body>
</html>