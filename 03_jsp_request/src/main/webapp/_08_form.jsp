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
		int x = 10;
		int y = 20;
	%>
	<form action="_08_formPro.jsp">
		<input type="hidden" name="x" value="<%=x%>">
		<input type="hidden" name="x" value="<%=y%>">
		<input type="text" name="z" value="0">
		<input type="submit" value="전송">
	</form>
</body>
</html>