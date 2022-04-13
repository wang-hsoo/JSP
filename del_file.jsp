 <%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
 <%@ page import="java.io.File" %>
         <%@ page import="java.sql.*"%>
   
 
 <% 
 		int num = Integer.parseInt(request.getParameter("num"));
    	 Class.forName("org.mariadb.jdbc.Driver");// 자바 커넥터 로드
 		
 		
 		try(
 				Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3308/jspdb", "dhkd4873", "1234"); 
 		// DB 접속 : DB URL, 아이디, 비밀번호)
 		//Resource - 데이터베이스 동작에 관련된 객체
 				Statement stmt = conn.createStatement(); //쿼리(문장) 객체
 				 ResultSet rs = stmt.executeQuery("select * from webhard where num =" + num);
 		){
 			if(rs.next()){
 				File file = new File(application.getRealPath("/files/") + rs.getString("fname"));
 				if(file != null){
 					file.delete();
 				}
 				
 				stmt.executeUpdate("delete from webhard where num=" + num);
 			}

 			response.sendRedirect( "webhard.jsp"); //php - header("Location:webhard.jsp")
 			return;

 		
 		}catch(Exception e){
 			e.printStackTrace();
 		}
         
	    
 %>
