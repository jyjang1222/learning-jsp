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
- 자동완성 기능을 사용하면 import를 자동으로 작성해준다. <%@page import="java.util.Random"%>	
- 이처럼 지시자 태그는 처음 JSP 페이지를 셋팅할 때와 자바파일을 import할 때 사용한다.

# 3. jsp Request
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
```html
<%
	String str = request.getParameter("age");
	int age = Integer.parseInt(str);
%>
<h3>당신의 나이는 <%=age%>세 입니다.</h3>
```
- 파일명 끝에 Process의 약자인 **Pro** 를 일반적으로 많이 사용한다. (_01_requestPro)
- 데이터 가져오는 방법 <code>request.getParameter()</code>
	- String strAge = request.getParameter("age");
		- 모든 내용은 문자열로 변환된다, 만약 값이 정수라면, 변환해서 사용한다.
	- int age = Integer.parseInt(strAge);
## request 예제
### _02_oddForm.jsp
```
<h2>홀수짝수 판별</h2>
<form method="post" action="_02_oddPro.jsp">
	숫자 : <input type="text" name="num"> <input type="submit" value="입력">
</form>
```
### _02_oddPro.jsp
```
<%
	String strNum = request.getParameter("num");
	int num = Integer.parseInt(strNum);
%>
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
```html
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
```
### _06_hiddenPro.jsp
```html
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
```
- 다음 페이지에서 필요한 데이터는 <code>input type="hidden"</code> 속성을 이용해 데이터를 전달할 수 있다
