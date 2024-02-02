<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	[1] 스크립트릿 태그
		(1) 사용법 : <% %>
		(2) 자바 변수를 사용할 수 있다.
	
	[2] 익스프레션 태그
		(1) 사용법 : <%= %>
		(2) 자바 변수를 출력할 수 있다.
--%>

<%
	int x = 10;
	// 콘솔에 출력된다.
	System.out.println("결과 = " + x);
%>

<%-- 변수 x의 값 10이 아닌 문자 x 그 자체이다. --%>
<h2>결과 = x</h2>

<h2>결과 = <%= x %></h2>