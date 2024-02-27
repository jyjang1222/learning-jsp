# 목차
0. [JSP 설치](#0-JSP-(Java-Server-Page)-설치)
1. [이클립스와 톰캣 설정](#1-이클립스와-톰캣-설정)
2. [jsp_basic](#2-jsp-basic)
3. [Request](#3-Request)
4. [Session](#4-Session)
5. [Response](#5-Response)
6. [Application](#6-Application)
7. [Out](#7-Out)
8. [Include](#8-Include)
9. [DB연결](#9-DB연결)

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
### 지시자(Directive) 태그 <%@ %>
- 사용법 : <%@ page 속성1="값" 속성2="값" ... %>
- JSP 페이지에 대한 정보를 정의한다.
- 속성
	- 여러종류가 있으나 당장은 아래 기본 3개만 사용하며, 페이지를 만들 때 자동 생성된다.
	- language, contentType, pageEncoding
### 스크립트릿 태그 <% %>
- 사용법 : <% %>
- 자바 변수를 사용할 수 있다.
### 표현식 태그 <%= %>
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

## request메서드
### request.getParameter()
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

### request.setCharacterEncoding("UTF-8")
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
- <code>request.setCharacterEncoding("UTF-8")</code>;

### request.getParameterValues()
```html
<tr>
	<td> 선택과목</td>
	<td>
		<select name="subject">
		     <option value="JAVA">JAVA</option>
		     <option value="JSP">JSP</option>
		     <option value="SPRING">SPRING</option>
		 </select>     	
	</td>
</tr>
<tr>
	<td>취미</td>
	<td>
		<input type="checkbox" name="hobby" value="운동">운동
		<input type="checkbox" name="hobby" value="독서">독서
		<input type="checkbox" name="hobby" value="공부">공부  
		<input type="checkbox" name="hobby" value="쇼핑">쇼핑        	
	</td>
</tr>
<tr>
	<td>메모</td>
	<td><textarea rows="10" cols="50" name="memo"></textarea></td>
</tr>
```
```java
String subject = request.getParameter("subject");

String[] hobbyList = request.getParameterValues("hobby");

String memo = request.getParameter("memo");
```
- input태그의 type속성 값으로 radio와 checkbox는 반드시 같은 name속성을 지정해야 한다.
- textarea는 value 속성이 없지만 <textarea></textarea> 사이의 내용을 value로 인식한다.
	- <textarea></textarea> 사이에는 칸을 띄우거나 줄을 바꾸지 않도록 주의한다.
- <code>request.getParameterValues()</code>를 사용하면 checkbox의 여러 value값을 가져올수있다. 

## input type="hidden"
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
### button onclick="window.location.href=''"
```html
int x = 10;
int y = 20;
int z = 30;

<button onclick="window.location.href='_10_buttonPro.jsp?x=<%=x%>&y=<%=y%>&z=<%=z%>'">전송</button>
```

# 4. Session
- session은 request와 달리 브라우저가 실행되는 동안 처음부터 끝까지 데이터가 유지된다.
## session 메서드
### session.setAttribute(key, value)
```java
int x = 10;
int y = 20;

session.setAttribute("x", x);
session.setAttribute("y", y);
```
- <code>session.setAttribute(키, 값)</code> 키라는 이름으로 값을 저장할 수 있다.

### session.getAttribute(key)
```java
Object obj = session.getAttribute("x");
int x = (int)obj;
obj = session.getAttribute("y");
int y = (int)obj;
```
- Object obj = <code>session.getAttribute(키)</code> 키로 데이터를 꺼내올 수 있으며, Object 타입으로 반환된다.
  
### session.removeAttribute(key)
- <code>session.removeAttribute(키)</code> 키로 세션에 저장된 데이터를 삭제할 수 있다.
  
### session.invalidate()
- <code>session.invalidate()</code>
- 모든 세션을 삭제할 수 있다.

### session.setMaxInactiveInterval(n)
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

# 5. Response
## response 메서드
### response.sendRedirect()
```java
System.out.println("response");
response.sendRedirect("_04_responseNext.jsp");
```
- 페이지를 바로 이동할 때 <code>response.sendRedirect()</code>를 사용한다.

# 6. Application
- 당장은 사용할일이 잘 없다. 필요할때 찾아서 사용.
### application.getServerInfo()
- 서버정보가 출력된다.
### application.getRealPath()
- ()안에 경로를 추가로 입력할 수 있다. application.getRealPath("/img")
### application.getContextPath()
- 빨간글씨로 콘솔창에 출력된다.
### application.log()
- 프로젝트명이 출력된다.

# 7. Out
## out 메서드
### out.println()
```
String name = "[자바에서 HTML을 출력할 수 있다.]";
out.println("출력되는 내용은 <b>" + name + "</b> 입니다.");
  
<h2>위와 같은 내용 출력</h2> 
출력되는 내용은 <b><%=name %></b> 입니다.
```
- 자바에서 html태그를 사용가능하다. 현재는 쓰이지 않는 메서드이다.

# 8. Include
```html
<%-- top --%>
<jsp:include page="_01_top.jsp" />

<%-- center --%>
<hr>
<h1>바나나</h1>
<p>바나나는 파초과 바나나 속에 속하는 숙근성 영년생 열대과수를 총칭한다.
<h1>다이어트 식품</h1>
<p>바나나는 탄수화물이 약 27%이고 비타민A와 C가 풍부하며, 100g 87kcal의 열량을 갖는다.
<h1>다양한 섭취법</h1>
<p>바나나는 열매를 주식으로 이용할 뿐 아니라 미성숙한 열매는 채소로 다양한 요리에 응용된다.</p>
<hr>

<%-- bottom --%>
<jsp:include page="_02_bottom.jsp" />
```

# 9. DB연결
## 사전준비
- 준비파일 : mysql연결 드라이버
- DB연결 주소 : jdbc:mysql://localhost:3306/MySQL 데이터베이스 이름?serverTimezone=UTC&useSSL=false
- jdbc드라이버 파일 경로 : /src/main/webapp/WEB-INF/lib
- jdbc드라이버 파일 로드 : Class.forName("com.mysql.cj.jdbc.Driver")

```java
// 1. Connection, PreparedStatement 변수 선언
Connection conn = null; // db연결용
PreparedStatement pstmt = null; // 쿼리문 실행용

try {
	// 2. db 주소, id, pw 변수 선언
	String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_00_01_crud_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";

	// 3. jdbc 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	// 4. Connection변수에 db주소, id, pw 인자 전달
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);

	// 5. PreparedStatement변수에 쿼리문 인자 전달
	String sql = "INSERT INTO member VALUES(?, ?, ?, NOW())"; // 무슨 값이 들어 올지 모르므로 인자를 ?로 작성
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id); // 순서대로 ?에 데이터 입력, 1부터시작
	pstmt.setString(2, pw);
	pstmt.setString(3, name);
	pstmt.executeUpdate(); // 쿼리문 실행
	// 6. close()로 종료
	conn.close();
	pstmt.close();
} catch(Exception e) {
	e.printStackTrace();
}
```

## Connection (DB연결 클래스)
### prepareStatement(query)
- 실행할 쿼리문 설정

## PreparedStatement (쿼리문 실행 클래스)
### setString(idx, arg), setInt(idx, arg) 등
- 쿼리문에 인자 입력
- **인덱스 1**로 시작
### executeQuery()
- SELECT
### executeUpdate()
- SELECT를 제외한 나머지 명령어

## DriverManager
### getConnection(jdbcUrl, dbId, dbPw)
- Connection변수에 db주소, id, pw 인자 전달

## ResultSet (결과 저장 클래스)
```sql
ResultSet res = null;

String sql = "SELECT COUNT(*) FROM member WHERE id=? AND pw=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pw);
res = pstmt.executeQuery();

if (res.next()) {
	int result = res.getInt(1);
	
	if (result == 1) {
		session.setAttribute("log", id);
		out.println("result = " + result + "<br>");
	} else {
		out.println("아이디와 패스워드를 확인해주세요.<br>");
	}
}

res.close();
```
### next()
- row가 하나이상 존재하면 true
- row의 개수에 따라 if문(column 하나), while문(column 여러개)을 결정하게 된다.
### getInt(column idx OR column label), getString() 등
- 인자로 column인덱스나 column라벨을 전달
- **인덱스 1**로 시작

## TimeStamp
- 일반적으로 jsp에서 SQL 날짜 데이터를 다룰 때는 java.sql.Timestamp를 사용한다.
### 데이터베이스에서 데이터 가져오기
```java
ResultSet rs = statement.executeQuery("SELECT * FROM my_table");
while (rs.next()) {
    Timestamp timestamp = rs.getTimestamp("my_timestamp_column");
    // timestamp 변수를 사용하여 날짜 및 시간 데이터 처리
}
rs.close();
```
### 데이터베이스에 데이터 보내기
```java
Timestamp timestamp = new Timestamp(System.currentTimeMillis());
PreparedStatement pstmt = connection.prepareStatement("INSERT INTO my_table (my_timestamp_column) VALUES (?)");
pstmt.setTimestamp(1, timestamp);
pstmt.executeUpdate();
pstmt.close();
```

## ResultSet, Timestamp를 통해 날짜 데이터 가져올 때 차이점
### ResultSet을 사용하는 경우
- ResultSet를 사용하여 SQL 날짜 데이터를 가져올 때는 <code>getDate()</code> 또는 <code>getTime()</code> 등의 메서드를 사용하여 날짜와 시간을 가져올 수 있다.
- 이 경우에는 ResultSet에서 직접 날짜를 가져오기 때문에 Timestamp 객체를 따로 생성할 필요가 없다.
- ResultSet를 사용하여 날짜를 가져올 때는 데이터베이스에서 반환되는 **타임존 정보**가 고려되지 않으므로 주의해야 한다.
### Timestamp를 사용하는 경우
- Timestamp 클래스를 사용하여 SQL 날짜 데이터를 가져오면, ResultSet에서 가져온 값을 Timestamp 객체로 명시적으로 변환해야 한다.
- Timestamp 클래스를 사용하면 데이터베이스에서 반환되는 타임존 정보를 보다 잘 처리할 수 있다.
- Timestamp 객체에는 날짜와 시간을 저장할 뿐만 아니라 타임존 정보도 포함된다.

# 10. jsp액션 태그
```html
<jsp:useBean  id ="member" class="model.Member"></jsp:useBean>		
(1) 위 한줄은 아래와 같다.
Member member = new Member(); 

<jsp:setProperty name="member" property="*"/>		
(2) 위 한줄은 아래와 같다. 
member.setId(request.getParameter("id"));
member.setPw(request.getParameter("pw"));
member.setName(request.getParameter("name"));

(3) 사용법
<jsp:useBean id="member" class="basic.MemberDTO">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>

<p>아이디 : <%= member.getId() %></p>
<p>비밀번호 : <%= member.getPw() %></p>
```
