<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 3명의 회원 샘플데이터 저장
	String[] sampleId = {"qwer", "asdf", "hello"};
	String[] samplePw = {"1111", "2222", "3333"};
	String[] sampleName = {"이만수", "박영희", "이수민"};
	String[] sampleGender = {"남성", "여성", "여성"};
	
	// 회원 저장
	ArrayList<Map<String, String>> userDB = new ArrayList<Map<String, String>>();	
	
	for (int i = 0; i < sampleId.length; i++) {
		Map<String, String> user = new HashMap<String, String>();
		user.put("userId", sampleId[i]);
		user.put("userPw", samplePw[i]);
		user.put("userName", sampleName[i]);
		user.put("userGender", sampleGender[i]);
		userDB.add(user);
	}
	
	// 회원 출력
	for (Map<String, String> user : userDB) {
		System.out.println(user);
	}

	// 로그인 상태를 확인할 수 있는 log변수 세션에 저장
	session.setAttribute("log", null);
	
	// 세션에 회원 정보 저장
	session.setAttribute("userDB", userDB);
	
	// 각종 정보 저장 후, main페이지로 이동하기
	response.sendRedirect("02_main.jsp");
%>
