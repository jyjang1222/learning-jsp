<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String id = String.valueOf(session.getAttribute("log")); %>
	<h2>회원정보 수정</h2>
	<form method="post" action="06_updatePro.jsp">
		아이디 : <input type="text" name="id" value="<%= id %>" readonly> <br>
		패스워드 : <input type="password" name="pw"> <br>
		이름 : <input type="text" name="name"> <br>
		
		<input type="submit" value="입력완료">
	</form>
	<a href="00_main.jsp">메인</a>
</body>
</html>