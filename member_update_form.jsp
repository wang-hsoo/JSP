<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
 <%
	String userId = (String)session.getAttribute("userId");
 	String userPw = null;
 	String name = null;
	
    Class.forName("org.mariadb.jdbc.Driver");
    try ( 
        Connection conn = DriverManager.getConnection(
                "jdbc:mariadb://localhost:3308/jspdb", "dhkd4873", "1234");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(
        		String.format("select * from member where id = '%s' ", userId));
    ) {
        rs.next();
        userPw = rs.getString("pw");
        name = rs.getString("name");
    } catch(Exception e) {
        e.printStackTrace();
    }
	
%>
     
 <!DOCTYPE html>
 <html>
 <head>
     <meta charset="UTF-8">
     <title>회원가입</title>
 </head>
 <body>
 <form action="member_update.jsp" method="post">
     <table>
         <tr>
             <td>아이디</td>
             <td><input type="text" name="id" value = "<%=userId%>" readonly></td>
         </tr>
         <tr>
             <td>비밀번호</td>
             <td><input type="password" name="pw" value = "<%=userPw%>"></td>
         </tr>
         <tr>
             <td>이름</td>
             <td><input type="text" name="name" value = "<%=name%>"></td>
         </tr>
     </table>    
     <input type="submit" value="저장"> 
 </form>
 
 </body>
 </html>