<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form method="post" action="03_12_joinPro.jsp">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userPw"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="userName"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="userGender" value="남성">남성
					<input type="radio" name="userGender" value="여성">여성
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="회원가입">
				</td>
			</tr>
		</table>
	</form>
	<a href="02_main.jsp">메인으로</a>
</body>
</html>