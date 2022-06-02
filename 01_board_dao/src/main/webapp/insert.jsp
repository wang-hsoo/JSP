<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ page import="com.board.db.*" %>
        
<%
        String writer = request.getParameter("writer");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        if(writer  != null && writer.length()  > 0 &&
        	title   != null && title.length()   >  0 &&
        	content != null && content.length() > 0 ){
        	
        	BoardDto dto = new BoardDto();
        	dto.setWriter(writer);
        	dto.setTitle(title);
        	dto.setContent(content);
        	new BoardDao().insertOne(dto);
        	
        	response.sendRedirect("list.jsp");
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
		alert('모든 항목이 빈칸 없이 입력되어야 합니다.');
		history.back();
	</script>
</body>
</html>