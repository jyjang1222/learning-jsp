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
	 	int z = 30;
 	%>
 	
 	<button onclick="window.location.href='_10_buttonPro.jsp?x=<%=x%>&y=<%=y%>&z=<%=z%>'">전송</button>
 	
</body>
</html>