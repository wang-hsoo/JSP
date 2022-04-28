 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %> 
 <%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
    Class.forName("org.mariadb.jdbc.Driver");
    try ( 
        Connection conn = DriverManager.getConnection(
                "jdbc:mariadb://localhost:3308/jspdb", "dhkd4873", "1234");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(
        		String.format("select * from member where id = '%s' and pw = '%s' ", id, pw));
    ) {
        if(rs.next()) { 
        	session.setAttribute("userId", rs.getString("id"));
    		session.setAttribute("userName", rs.getString("name"));
    		/*Cookie cookie = new Cookie("userId", id);
    		cookie.setMaxAge(-1);
    		response.addCookie(cookie);*/
    		response.sendRedirect("login_main.jsp");
    		return;
       
        }
        
    } catch(Exception e) {
        e.printStackTrace();
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