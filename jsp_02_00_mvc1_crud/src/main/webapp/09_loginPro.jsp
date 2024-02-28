<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet res = null;
	
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_00_01_crud_mysql?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT COUNT(*) FROM member WHERE id=? AND pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			res = pstmt.executeQuery();
			
			if (res.next()) {
				int result = res.getInt(1);
				
				if (result == 1) {
					session.setAttribute("log", id);
					response.sendRedirect("00_main.jsp");
				} else {
					out.println("아이디와 패스워드를 확인해주세요.<br>");
					out.println("<a href=\"00_main.jsp\">메인</a>");
				}
			}
			
			
			conn.close();
			pstmt.close();
			res.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>