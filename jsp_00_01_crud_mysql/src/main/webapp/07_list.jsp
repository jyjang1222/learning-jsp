<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet res = null;
		
		ArrayList<Map<String, String>> userList = new ArrayList<Map<String, String>>();
		
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_00_01_crud_mysql?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
					
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM member";
			pstmt = conn.prepareStatement(sql);
			res = pstmt.executeQuery();
			
			while(res.next()) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Map<String, String> user = new HashMap<String, String>();
				
				String id = res.getString("id");
				String pw = res.getString("pw");
				String name = res.getString("name");
				String regDate = sdf.format(res.getDate("reg_date"));
				
				user.put("id", id);
				user.put("pw", id);
				user.put("name", id);
				user.put("regDate", regDate);
				
				userList.add(user);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	%>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>패스워드</td>
			<td>이름</td>
			<td>가입일</td>
		</tr>
		<% if (userList.size() > 0) { %>
			<% for (Map<String, String> user : userList) { %>
				<tr>
					<td><%= user.get("id") %></td>
					<td><%= user.get("pw") %></td>
					<td><%= user.get("name") %></td>
					<td><%= user.get("regDate") %></td>
				</tr>
			<% } %>
		<% } else { %>
			<tr>
				<td colspan="4">회원이 없습니다..ㅜ</td>
			</tr>
		<% } %>
	</table>
	<a href="00_main.jsp">메인</a>
</body>
</html>