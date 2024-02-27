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
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
	%>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet res = null;
		
		String msg = "";
		
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_00_01_crud_mysql?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT COUNT(*) FROM member WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			res = pstmt.executeQuery();
			
			if (res.next()) {
				int result = res.getInt(1);
				
				if (result == 0) {
					sql = "INSERT INTO member VALUES(?, ?, ?, NOW())";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.setString(2, pw);
					pstmt.setString(3, name);
					pstmt.executeUpdate();				
					
					msg = "가입완료";
				} else {
					msg = "중복된 아이디입니다.";
				}
			}
			
			conn.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	%>
	<p><%= msg %></p>
	<a href="00_main.jsp">메인</a>
</body>
</html>