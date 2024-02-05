<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원탈퇴</h2>
	<form method="post" action="03_42_deletePro.jsp">
		<table border="1">
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="userPw"></td>
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