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
