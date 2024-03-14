<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSTL core 태그예제 - set, out, remove</h3>
	<c:set var="data" value="10" /> <%--  request.setAttibute("data" , 10)  --%>
	data = <c:out value="${data}" />
	<br>
	<c:remove var="data" /> <%--  request.setAttibute("data" , "") --%>
	data = <c:out value="${data}" />
</body>
</html>