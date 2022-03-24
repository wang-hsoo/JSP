<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Class.forName("org.mariadb.jdbc.Driver");// 자바 커넥터 로드
		
		
		try(
				Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3308/jspdb", "dhkd4873", "1234"); 
		// DB 접속 : DB URL, 아이디, 비밀번호)
		//Resource - 데이터베이스 동작에 관련된 객체
				Statement stmt = conn.createStatement(); //쿼리(문장) 객체
		){
		
			 		       	String sql = 
					               "create table score (" + 
					                  "    num  int          primary key," + 
					                  "    name varchar(20),             " +
					                  "    kor  int,                     " +    
					                  "    eng  int,                     " +
					                  "    math int                      " +    
					                 ")";

			stmt.executeUpdate(sql);

		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	%>
</body>
</html>