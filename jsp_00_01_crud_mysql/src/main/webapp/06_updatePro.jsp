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
	<%
		String id = String.valueOf(session.getAttribute("log"));
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
	%>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_00_01_crud_mysql?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "UPDATE member SET pw=?, name=? WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, id);
			pstmt.executeUpdate();
			
			conn.close();
			pstmt.close();
			
			response.sendRedirect("00_main.jsp");
		} catch(Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>