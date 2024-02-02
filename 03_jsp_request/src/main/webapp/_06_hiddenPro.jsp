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
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	int result = Integer.parseInt(request.getParameter("result"));
	int userInput = Integer.parseInt(request.getParameter("userInput"));
%>
<h1>구구단 게임</h1>
<h2><%=num1%> x <%=num2%> = <input type="text" value=<%=userInput%> readonly></h2>
<h3>정답은 <%=result%>, <%=(result == userInput) ? "정답":"땡"%></h3>
<a href="_06_hiddenForm.jsp">돌아가기</a>
</body>
</html>