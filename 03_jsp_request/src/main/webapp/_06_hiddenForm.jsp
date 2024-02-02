<%@page import="java.util.Random"%>
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
	 [구구단 게임]
	  
	  1. 구구단 문제를 출제하기 위해, 숫자 2개를 랜덤저장한다.
	  2. 저장한숫자를 토대로 구구단 문제를 출력한다.
	 	 예)	3 x 7 = ?
	  3. 문제에 해당하는 정답을 입력받는다.
	  4. 정답을 비교 "정답" 또는 "땡"을 출력한다.
	 
 --%>
 <%
 	Random ran = new Random();
 	int num1 = ran.nextInt(8) + 2;
 	int num2 = ran.nextInt(8) + 2;
 	int result = num1 * num2;
 %>
 
 <h1>구구단 게임</h1>
 <form method="post" action="_06_hiddenPro.jsp">
 	<h2><%=num1%> x <%=num2%> = <input type="text" name="userInput"></h2>
 	<input type="hidden" name="num1" value=<%=num1%>>
 	<input type="hidden" name="num2" value=<%=num2%>>
 	<input type="hidden" name="result" value=<%=result%>>
 	<input type="submit" value="입력완료">
 </form>
 
</body>
</html>