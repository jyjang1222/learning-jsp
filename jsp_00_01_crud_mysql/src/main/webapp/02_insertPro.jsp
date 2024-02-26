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
		Connection conn = null; // db연결용
		PreparedStatement pstmt = null; // 쿼리문 실행용
		
		try {
			// jsp_00_01_crud_mysql가 db명
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_00_01_crud_mysql?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver"); // web-inf/lib에 있는 드라이버파일 로드
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw); // 3개의 인자 작성
			
			String sql = "INSERT INTO member VALUES(?, ?, ?, NOW())"; // 무슨 값이 들어 올지 모르므로 ?로 작성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id); // 순서대로 ?에 데이터 입력, 1부터시작
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.executeUpdate(); // 쿼리문 실행
			
			conn.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	%>
	<a href="00_main.jsp">메인</a>
</body>
</html>