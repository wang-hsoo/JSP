
 <%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>   
     
 <!DOCTYPE html>
 <html>
 <head>
     <meta charset="UTF-8">
     <style>
         table { width: 400px; text-align: center; }
         th    { background-color: cyan; }
     </style>    
 </head>
 <body>
 
 <table>
     <tr>
         <th>아이디</th><th>이름</th><th>비밀번호</th>
     </tr>
 <%
     Class.forName("org.mariadb.jdbc.Driver");
     try ( 
         Connection conn = DriverManager.getConnection(
                 "jdbc:mariadb://localhost:3308/jspdb", "dhkd4873", "1234");
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("select * from member");
     ) {
         while (rs.next()) {
             
 %>          
             <tr>
                 <td><%=rs.getString("id" )%></td>
                 <td><%=rs.getString("pw")%></td>
                 <td><%=rs.getString("name" )%></td>
               
             </tr>
 <%          
         }
         
     } catch(Exception e) {
         e.printStackTrace();
     }
 %>
 </table>
 <input type = "button" value="이전 화면으로" onclick="history.back()" >
 </body>
 </html>