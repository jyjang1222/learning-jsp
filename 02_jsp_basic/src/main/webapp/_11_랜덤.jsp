<%@ page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	JSP에서의 랜덤 사용법
		
	[1] 지시자 태그를 사용해서 Random 클래스를 import한다. (= 자바와 동일)
		<%@page import="java.util.Random"%>			
	
	[2] 이처럼 지시자 태그는 처음 JSP 페이지를 셋팅할 때와
		자바파일을 import할 때 사용한다.
--%>

<%
	Random ran = new Random();
	
	int rNum = ran.nextInt(100);		// 0 ~ 99
%>

<h2>랜덤결과 = <%= rNum %></h2>