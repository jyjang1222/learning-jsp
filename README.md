# 0. JSP (Java Server Page) 설치
1. JDK : 자바언어 설치
2. Web Eclipse (압축해제)
	- https://www.eclipse.org/downloads/packages/
	- Eclipse IDE for Java Developers : 자바언어 학습용
	- Eclipse IDE for Enterprise Java and Web Developers : 웹개발용
	- Eclipse > Open Perspective(우측상단 격자 아이콘) > Java EE(커피콩 아이콘)
		- Java : 기존의 자바언어 학습용, Java EE : 웹개발용
3. Apache Tomcat9.0 (압축해제)
   	- 로컬에 서버 띄우는 용도
	- https://tomcat.apache.org/download-90.cgi

설치영상 : https://supercodemother.com/27a4b5e5d8c744c791bfb2c7f3a985e0

# 1. 이클립스와 톰캣 설정
1. 프로젝트 생성
	- project explorer우클릭 > new > dynamic web project
2. 톰캣 설정
   	- 하단 Server탭 우클릭 > new > server > apach tomcat9 선택 > finish
3. 포트번호 변경
	- Servers 탭의 Tomcat v9.0 Server… 를 더블 클릭
	- [Overview] 탭에서 HTTP/1.1 > Port Number 를 8282로 변경한다.
4. 인코딩 변경
	- windows메뉴 > preference > 검색창 enc 입력 > Workspace, CSS, HTML, JSP 파일 모두 UTF-8로 인코딩을 변경

# 2. jsp_basic
## 주석
```
<!--  
	[1] HTML 주석
	HTML 주석은 소스보기를 할 때 내용이 보인다.
-->
<%--
	[2] JSP 주석
	JSP 주석은 소스보기를 할 때 내용이 보이지 않는다.
	덕분에 보안에 유리한다.	
--%>		
```
## 기본설명
- JSP는 자바 서버 페이지의 약자이다.
- JSP의 역할 : HTML 페이지에서 아래 4개의 태그를 추가로 사용할 수 있다.
  
|태그|코드|
|---|---|
|지시자(Directive) 태그|<%@ %>|
|표현식(Expression) 태그	|<%= %>|
|스크립트릿(Scriptlet) 태그|<%  %>|

## jsp 태그
### 지시자(Directive) 태그
- 사용법 : <%@ page 속성1="값" 속성2="값" ... %>
- JSP 페이지에 대한 정보를 정의한다.
- 속성
	- 여러종류가 있으나 당장은 아래 기본 3개만 사용하며, 페이지를 만들 때 자동 생성된다.
	- language, contentType, pageEncoding
### 스크립트릿 태그
- 사용법 : <% %>
- 자바 변수를 사용할 수 있다.
### 표현식 태그
- 사용법 : <%= %>
- 자바 변수를 출력할 수 있다.

## Random
- 지시자 태그를 사용해서 Random 클래스를 import한다. (= 자바와 동일)		
- 자동완성 기능을 사용하면 import를 자동으로 작성해준다. <code><%@page import="java.util.Random"%></code>
- 이처럼 지시자 태그는 처음 JSP 페이지를 셋팅할 때와 자바파일을 import할 때 사용한다.

# 3. Request
## form 데이터 입력 페이지
```html
<form method="post" action="_01_requestPro.jsp">
	나이 : <input type="text" name="age">
	<input type="submit" value="입력완료">
</form>
```
- form 태그
	- submit 버튼과 함께 쓰여 입력받은 데이터를 다음 페이지로 전달한다.
	- 속성
		- action="내용을 처리할 페이지명"
		- method="get" 또는 "post"
			- 데이터 전달 방식으로 get방식이 기본 속성
			- get방식은 데이터가 주소로 노출되어 보안에 취약하고 데이터 용량에 제한이 있다.
			- post방식은 데이터가 주소로 노출되지 않아 보안에 강하고 대용량 데이터 전달이 가능하다.
- input 태그
	- name="age" : age변수에 input에 입력된 내용을 저장한다.

## form 데이터 처리 페이지
```java
String str = request.getParameter("age");
int age = Integer.parseInt(str);

<h3>당신의 나이는 <%=age%>세 입니다.</h3>
```
- 파일명 끝에 Process의 약자인 **Pro** 를 일반적으로 많이 사용한다. (_01_requestPro)
- 데이터 가져오는 방법 <code>request.getParameter()</code>
	- String strAge = request.getParameter("age");
		- 모든 내용은 문자열로 변환된다, 만약 값이 정수라면, 변환해서 사용한다.
	- int age = Integer.parseInt(strAge);
## request 예제
### _02_oddForm.jsp
```html
<h2>홀수짝수 판별</h2>
<form method="post" action="_02_oddPro.jsp">
	숫자 : <input type="text" name="num"> <input type="submit" value="입력">
</form>
```
### _02_oddPro.jsp
```java
String strNum = request.getParameter("num");
int num = Integer.parseInt(strNum);

<h2>홀수짝수 판별</h2>
<% if (num % 2 == 0) { %>
<p>짝수</p>
<% } else { %>
<p>홀수</p>
<% } %>

<a href="_02_oddForm.jsp">뒤로가기</a>
```
## hiddenForm
### _06_hiddenForm.jsp
```java

Random ran = new Random();
int num1 = ran.nextInt(8) + 2;
int num2 = ran.nextInt(8) + 2;
int result = num1 * num2;

 <h1>구구단 게임</h1>
 <form method="post" action="_06_hiddenPro.jsp">
 	<h2><%=num1%> x <%=num2%> = <input type="text" name="userInput"></h2>
 	<input type="hidden" name="num1" value="<%=num1%>">
 	<input type="hidden" name="num2" value="<%=num2%>">
 	<input type="hidden" name="result" value="<%=result%>">
 	<input type="submit" value="입력완료">
 </form>
```
### _06_hiddenPro.jsp
```java
String num1 = request.getParameter("num1");
String num2 = request.getParameter("num2");
int result = Integer.parseInt(request.getParameter("result"));
int userInput = Integer.parseInt(request.getParameter("userInput"));

<h1>구구단 게임</h1>
<h2><%=num1%> x <%=num2%> = <input type="text" value=<%=userInput%> readonly></h2>
<h3>정답은 <%=result%>, <%=(result == userInput) ? "정답":"땡"%></h3>
<a href="_06_hiddenForm.jsp">돌아가기</a>
```
- 다음 페이지에서 필요한 데이터는 <code>input type="hidden"</code> 속성을 이용해 데이터를 전달할 수 있다

## 데이터를 다른 JSP 페이지로 전달하는 방법 3가지
1. form   : action="next.jsp"과 submit버튼
2. a      : href="next.jsp"
3. button : onclick="window.location.href='next.jsp'"

### form
```html
int x = 10;
int y = 20;

<form action="_08_formPro.jsp">
	<input type="hidden" name="x" value="<%=x%>">
	<input type="hidden" name="x" value="<%=y%>">
	<input type="text" name="z" value="0">
	<input type="submit" value="전송">
</form>
```
### a
```html
int x = 10;
int y = 20;
int z = 30;

<a href="_09_aTagPro.jsp?x=<%=x%>&y=<%=y%>&z=<%=z%>">다음페이지</a>
```
### button
```html
int x = 10;
int y = 20;
int z = 30;

<button onclick="window.location.href='_10_buttonPro.jsp?x=<%=x%>&y=<%=y%>&z=<%=z%>'">전송</button>
```

# 4. Session
- session은 request와 달리 브라우저가 실행되는 동안 처음부터 끝까지 데이터가 유지된다.
## 세션 메서드
### 세션 저장하기
```java
int x = 10;
int y = 20;

session.setAttribute("x", x);
session.setAttribute("y", y);
```
- <code>session.setAttribute(키, 값)</code> 키라는 이름으로 값을 저장할 수 있다.

### 세션 꺼내오기
```java
Object obj = session.getAttribute("x");
int x = (int)obj;
obj = session.getAttribute("y");
int y = (int)obj;
```
- Object obj = <code>session.getAttribute(키)</code> 키로 데이터를 꺼내올 수 있으며, Object 타입으로 반환된다.
  
### 세션 지우기
- <code>session.removeAttribute(키)</code> 키로 세션에 저장된 데이터를 삭제할 수 있다.
  
### 세션 모두 지우기
- <code>session.invalidate()</code>
- 모든 세션을 삭제할 수 있다.

### 세션 n초뒤 지우기
```java
String[] name = {"김철수", "이만수", "최영희", "박준범"};
int[] score = {87, 100, 42, 98};

session.setAttribute("name", name);
session.setAttribute("score", score);

// session에 저장된 데이터가 5초간 유지 후, 삭제된다.
session.setMaxInactiveInterval(5);

response.sendRedirect("_06_setTimePro.jsp");
```
- <code>session.setMaxInactiveInterval()</code> session에 저장된 데이터가 n초간 유지 후, 삭제된다.

## Response
```java
System.out.println("response");
response.sendRedirect("_04_responseNext.jsp");
```
- 페이지를 바로 이동할 때 <code>response.sendRedirect()</code>를 사용한다.

## form post 주의점
```html
<form method="post" action="_05_formPostPro.jsp">
	이름 : <input type="text" name="name">
	<input type="submit" value="전송">
</form>
```
```java
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");

<h2>name = <%= name %></h2>
```
- form태그의 method속성 값을 post로 했을 경우, URL 경로에 input값이 암호화되어 표기가 안된다.
- 아래처럼 다음 페이지에서는 인코딩 처리를 하지 않으면 한글은 깨진다.
- request.setCharacterEncoding("UTF-8");

