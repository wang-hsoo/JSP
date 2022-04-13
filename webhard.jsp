<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>  
        table  { width: 700px; text-align: center; }
        th     { background-color: cyan; }
        
        .left  { text-align: left;  }        
        .right { text-align: right; }

        a       { text-decoration: none; color: blue; }
        a:hover { color: red;  }
    </style>    
</head>
<body>

<form action="add_file.jsp" enctype="multipart/form-data" method="post">
    업로드할 파일을 선택하세요.<br>
    <input type="file" name="upload"><br>
    <input type="submit" value="업로드">
</form>
<br>

<table>
    <tr>
        <th>파일명</th><th>업로드 시간</th><th>크기</th><th>삭제</th>
    </tr>
     <%
     Class.forName("org.mariadb.jdbc.Driver");
     try ( 
         Connection conn = DriverManager.getConnection(
                 "jdbc:mariadb://localhost:3308/jspdb", "dhkd4873", "1234");
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("select * from webhard");
     ) {
         while (rs.next()) {
        	 
        	 long fsize = rs.getInt("fsize" );
        	 String unit = "B";
        	 if(fsize > 1024) {
        		 fsize /= 1024;
        		 unit = "KB";
        	 }
        	 
        	 if(fsize > 1024){
        		 fsize /= 1024;
        		 unit = "MB";
        	 }
        	 
             
 %>          
             <tr>
                 <td class="left"><a href="files/<%=rs.getString("fname")%>"><%=rs.getString("fname").toString()%></a></td>
                 <td><%=rs.getString("ftime" )%></td>
                 <td class="right"><%=String.format("%,d", fsize) + unit%></td>
                 <td><a href="del_file.jsp?num=<%=rs.getInt("num")%>">X</a></td>
             </tr>
 <%          
         }
         
     } catch(Exception e) {
         e.printStackTrace();
     }
 %>
    
    
    
    
</table>
</body>
</html>