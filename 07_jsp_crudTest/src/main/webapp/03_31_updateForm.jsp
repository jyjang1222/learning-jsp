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
		String log = (String)session.getAttribute("log");
	%>
	<h1>회원정보 수정</h1>
	<form method="post" action="03_32_updatePro.jsp">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><%= log %></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pw" value=""></td>				
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value=""></td>				
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="남성" checked="checked">남성
					<input type="radio" name="gender" value="여성">여성
					<input type="radio" name="gender" value="남성">남성
					<input type="radio" name="gender" value="여성" checked="checked">여성
				</td>	
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="입력완료">
				</td>
			</tr>
		</table>
	</form>	
</body>
</html>