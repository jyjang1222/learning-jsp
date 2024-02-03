<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String str = request.getParameter("num");
		int num = Integer.parseInt(str);
		
		String name = request.getParameter("name");
		
		str = request.getParameter("grade");
		int grade = Integer.parseInt(str);
		
		String subject = request.getParameter("subject");
		
		String[] hobbyList = request.getParameterValues("hobby");
		
		String memo = request.getParameter("memo");
	%>
	
		<div align="center">
		<table border="1">
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>과목</td>
				<td>취미</td>
				<td>메모</td>
			</tr>
			
			<tr>
				<td><%=num%></td>
				<td><%=name%></td>
				<td><%=subject %></td>
				<td>
				<% for (String hobby : hobbyList) { %>
					<span><%=hobby%> </span>
				<% } %>
				</td>
				<td><%=memo%></td>
			</tr>		
		</table>
	</div>
</body>
</html>