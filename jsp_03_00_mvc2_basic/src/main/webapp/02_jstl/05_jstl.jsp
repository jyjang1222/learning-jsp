<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="_02_jstl.MemberDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	MemberDTO mem1 = new MemberDTO("qwer", "1111", "홍길동", "qwer@naver.com", "sports");
	MemberDTO mem2 = new MemberDTO("abcd", "2222", "박민철", "abcd@naver.com", "drawing");
	MemberDTO mem3 = new MemberDTO("java", "3333", "김상수", "java@naver.com", "reading");
	
	ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
	list.add(mem1);
	list.add(mem2);
	list.add(mem3);
	
	request.setAttribute("memberList", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th>이메일</th>
			<th>취미</th>
		</tr>
		<%-- 확장for문과 기능이 똑같다. --%>
		
		<%-- for(MemberDTO mem : memberList){} --%>
		<c:forEach var="mem" items="${ memberList }"> 
		<tr>
			<%-- mem.getId()와 동일 문장 --%>
			<td>${ mem.id }</td>
			<td>${ mem.pw }</td>
			<td>${ mem.name }</td>
			<td>${ mem.email }</td>
			<td>${ mem.hobby }</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>