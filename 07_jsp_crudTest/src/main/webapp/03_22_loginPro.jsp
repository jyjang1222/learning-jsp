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
		
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		
		// 관리자일 경우
		if (id.equals("admin") && pw.equals("admin")) {
			response.sendRedirect("01_11_adminMain.jsp");
		} else { // 일반 사용자일 경우
			boolean checkLogin = false;
			
			// 로그인 체크
			for (Map<String, String> user : userDB) {
				if (user.get("userId").equals(id) && user.get("userPw").equals(pw)) {
					checkLogin = true;
				}
			}
			
			if (checkLogin) {
				session.setAttribute("log", id);
				// 세션의 유효시간을 100분으로 설정
				session.setMaxInactiveInterval(60 * 100);
				
				response.sendRedirect("02_main.jsp");
			} else {
				response.sendRedirect("03_21_loginForm.jsp");
			}
		}
		
	%>
</body>
</html>