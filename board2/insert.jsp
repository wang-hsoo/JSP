<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*"%>
        <%@ page import="java.time.*"%>
        
        <%
        String writer = request.getParameter("writer");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
  
        
        if(writer  != null && writer.length()  > 0 &&
        	title   != null && title.length()   >  0 &&
        	content != null && content.length() > 0 ){
        	
			Class.forName("org.mariadb.jdbc.Driver");// 자바 커넥터 로드
			
			
			try(
					Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3308/jspdb", "dhkd4873", "1234"); 
			// DB 접속 : DB URL, 아이디, 비밀번호)
			//Resource - 데이터베이스 동작에 관련된 객체
					Statement stmt = conn.createStatement(); //쿼리(문장) 객체
			){
			
				 String curTime = LocalDate.now() + "" + LocalTime.now().toString().substring(0,8);
				stmt.executeUpdate(String.format("insert into board (writer, title, content, regtime, hits, userid)" +
									"values ('%s', '%s', '%s', '%s', 0, '%s')", writer, title, content, curTime, (String)session.getAttribute("userId") ));
				
	
			
			}catch(Exception e){
				e.printStackTrace();
			}
			
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