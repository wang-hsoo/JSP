<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"%>
<%@ page import="com.board.db.*" %>   
<%@ page import="java.util.*" %>   

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        table     { width:680px; text-align:center; }
        th        { background-color:cyan; }
        
        .num      { width: 80px; }
        .title    { width:230px; }
        .writer   { width:100px; }
        .regtime  { width:180px; }
        a:link    { text-decoration:none; color:blue; }
        a:visited { text-decoration:none; color:gray; }
        a:hover   { text-decoration:none; color:red;  }
    </style>
</head>
<body>

<table>
    <tr>
        <th class="num"    >번호    </th>
        <th class="title"  >제목    </th>
        <th class="writer" >작성자  </th>
        <th class="regtime">작성일시</th>
        <th                >조회수  </th>
    </tr>
    
     <%
     ArrayList<BoardDto> dtoList = new BoardDao().selectList();
     Class.forName("org.mariadb.jdbc.Driver");
     
         for (BoardDto dto : dtoList) {
            
 %>          
        <tr>
        	<td><%=dto.getNum()%></td>
        	<td style="text-align:left;">
            	<a href="view.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle()%></a>
        	</td>
         	<td><%=dto.getWriter()%></td>
        	<td><%=dto.getRegtime()%></td>
        	<td><%=dto.getHits()%></td>
    	</tr>
    	<% 
}
         %>
</table>

<br>
<input type="button" value="글쓰기" onclick="location.href='write.jsp'">

</body>
</html>