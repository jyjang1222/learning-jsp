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
		String userId = (String)session.getAttribute("log");
		String userPw = "";
		String userName = "";
		String userGender = "";
	
		Object obj = session.getAttribute("userDB");
		ArrayList<Map<String, String>> userDB = (ArrayList<Map<String, String>>)obj;
		
		for (Map<String, String> user : userDB) {
			if (user.get("userId").equals(userId)) {
				userPw = user.get("userPw");
				userName = user.get("userName");
				userGender = user.get("userGender");
			}
		}
	%>
	<h1>회원정보 수정</h1>
	<form method="post" action="03_32_updatePro.jsp">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><%=userId%></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="userPw" value="" required></td>				
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="userName" value="<%=userName%>" required></td>				
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<% if (userGender.equals("남성")) { %>
					<input type="radio" name="userGender" value="남성" checked>남성
					<input type="radio" name="userGender" value="여성">여성
					<% } else { %>
					<input type="radio" name="userGender" value="남성">남성
					<input type="radio" name="userGender" value="여성" checked>여성
					<% } %>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="입력완료">
				</td>
			</tr>
		</table>
	</form>
	<a href="02_main.jsp">메인으로</a>
</body>
</html>