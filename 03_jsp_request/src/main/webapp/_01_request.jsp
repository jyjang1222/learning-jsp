<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
	http://localhost:8282/03_jsp_request/_01_requestPro.jsp?age=15
	--%>
	<form method="post" action="_01_requestPro.jsp">
		나이 : <input type="text" name="age">
		<input type="submit" value="입력완료">
	</form>
</body>
</html>