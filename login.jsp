<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals("admin")&&pw.equals("1234")){
		Cookie cookie = new Cookie("userId", id);
		
		cookie.setMaxAge(-1);
		response.addCookie(cookie);
		response.sendRedirect("login_main.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert('아이디와 비밀번호가 틀립니다.');
		history.back();
	</script>
</body>
</html>