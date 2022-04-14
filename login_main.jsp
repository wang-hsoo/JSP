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
	/*Cookie[] cookies = request.getCookies(); 
	String userId = null
	if (cookies != null) {
	    for(Cookie cookie : cookies) {           
	        if (cookie.getName().equals("userId")) { 
	            userId = cookie.getValue();
	            break;
	        }
	    }
	}*/
	//userId
	
	String userId = (String)session.getAttribute("userId");
	
	if( userId == null){
%>
<form action="login.jsp" method="post">
    아이디:   <input type="text"     name="id">&nbsp;&nbsp;
    비밀번호: <input type="password" name="pw">
    <input type="submit" value="로그인"> 
</form>

<%} else { %>

<form action="logout.jsp" method="post"> 
    admin님 로그인
    <input type="submit" value="로그아웃"> 
</form>

<%
}
%>
</body>
</html>