<%@ page import="java.util.Random"%>
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
	[1] JSP는 자바 서버 페이지의 약자이다.
	
	[2] JSP의 역할
		HTML 페이지에서 아래 4개의 태그를 추가로 사용할 수 있다.
	
		(1) 지시자(Directive) 태그			<%@ %>
		(2) 표현식(Expression) 태그			<%= %>
		(3) 스크립트릿(Scriptlet) 태그		<%  %>
--%>

<%
	// 자바 문법 작성
	String name = "홍길동";

	Random ran = new Random();
%>

<h2>이름 : <%=name%></h2>

</body>
</html>