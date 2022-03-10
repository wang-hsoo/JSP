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
		int a = Integer.parseInt(request.getParameter("len"));
	%>
	둘레 : <%= a * 2 * Math.PI %>
	면적 : <%= a * a * Math.PI %>
</body>
</html>