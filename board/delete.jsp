<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*"%>
        <%@ page import="java.time.*"%>
        
        <%
        int num = Integer.parseInt(request.getParameter("num"));
        
        	
			Class.forName("org.mariadb.jdbc.Driver");// 자바 커넥터 로드
			
			
			try(
					Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3308/jspdb", "dhkd4873", "1234"); 
			// DB 접속 : DB URL, 아이디, 비밀번호)
			//Resource - 데이터베이스 동작에 관련된 객체
					Statement stmt = conn.createStatement(); //쿼리(문장) 객체
			){
			
				
				stmt.executeUpdate("delete from board where num="+num);
				
	
			
			}catch(Exception e){
				e.printStackTrace();
			}
			
			response.sendRedirect("list.jsp");
			
        
		%>
