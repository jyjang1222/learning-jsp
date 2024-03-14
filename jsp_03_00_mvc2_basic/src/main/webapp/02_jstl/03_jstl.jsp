<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="num" value="4" />
	<c:if test="${num > 3}">
		실행됨
	</c:if>
	<h3>문제1. 1~10 출력</h3>
	<c:forEach var="i" begin="1" end="10" step="2">
		${ i } &nbsp;
	</c:forEach>
	<br>
	<c:forEach var="i" begin="1" end="10" step="${ i+=2 }">
		${ i } &nbsp;
	</c:forEach>
	<br>
	<c:forEach var="i" begin="2" end="10" step="${ i+=2 }">
 		${ i } &nbsp;
	</c:forEach>
</body>
</html>