<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${pageContext.request.contextPath}
	<h2>로그인</h2>
	<!-- contextPath 프로젝트명 가져옴 -->
	<form action="${pageContext.request.contextPath}/login.do" method="post">
		아이디:<input type="text" name="id">
		비밀번호:<input type="text" name="pw">
		<input type="submit" value="로그인">
	</form>
</body>
</html>