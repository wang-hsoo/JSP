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
		
			 String[][] score = {
					             { "1", "홍길동", "50", "60", "70" }, 
					             { "2", "이순신", "65", "75", "85" }, 
					             { "3", "강감찬", "60", "80", "70" }
					         }; 
			 for (int i = 0; i < score.length; i++) {
				              String sql = String.format(
				                      "insert into score values (%s, '%s', %s, %s, %s)",
				                      score[i][0], score[i][1], score[i][2], 
				                      score[i][3], score[i][4]);
				              
				              stmt.executeUpdate(sql);
				              out.println("쿼리 실행 성공 : " + sql + "<br>");
				          }

		
		}catch(Exception e){
			out.println(e);
			e.printStackTrace();
		}
		
		
	%>
</body>
</html>