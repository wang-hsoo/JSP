 <%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
 <%@ page import="com.oreilly.servlet.MultipartRequest,
                  com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
                  java.io.File" %>
         <%@ page import="java.sql.*"%>
         <%@ page import="java.time.*"%>
     
 
 <% 
     MultipartRequest multi = new MultipartRequest(
             request,                    // POST 로 전달된 내용을 담은 객체
             application.getRealPath("/files"),   // 파일을 저장할 경로
             100 * 1024 * 1024,                   // 최대 파일 크기 (100MB)
             "utf-8",                             // 인코딩
             new DefaultFileRenamePolicy()        // 동일 파일명 처리 방법
     );
 	
 	 
     File file = multi.getFile("upload");         // 파일 객체 얻기
     String uploader = request.getParameter("uploader");
     
     if (file != null){
    	 Class.forName("org.mariadb.jdbc.Driver");// 자바 커넥터 로드
 		
 		
 		try(
 				Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3308/jspdb", "dhkd4873", "1234"); 
 		// DB 접속 : DB URL, 아이디, 비밀번호)
 		//Resource - 데이터베이스 동작에 관련된 객체
 				Statement stmt = conn.createStatement(); //쿼리(문장) 객체
 		){
 				String curTime = LocalDate.now() + " "  + LocalTime.now().toString().substring(0 , 8);
 				
 				String user;
 				String sql;
 				if(uploader == null){
 					 sql = String.format("insert into webhard(fname, ftime,fsize) values ('%s', '%s', %d)",
 		       				file.getName(),curTime , file.length());
 				}else{
 					 user = multi.getParameter("uploader");
 					  sql = String.format("insert into webhard(fname, ftime,fsize, user) values ('%s', '%s', %d, '%s')",
	 		       				file.getName(),curTime , file.length(), user);
 				}
 			 	
//현재시간 substring(시작위치, 끝위치)
 			stmt.executeUpdate(sql);
 			response.sendRedirect( "webhard.jsp"); //php - header("Location:webhard.jsp")
 			return;

 		
 		}catch(Exception e){
 			e.printStackTrace();
 		}
         
	     }
 %>
  <!DOCTYPE html>
 <html>
 <head>
     <meta charset="UTF-8">
 </head>
 <body>
 <script>
 	alert('	파일 업로드 오류');
 	history.back();
 </script>
 
 </body>
 </html>