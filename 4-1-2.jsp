<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	국어 : <%=request.getParameter("kor") %><br>
	영어 : <%=request.getParameter("eng") %><br>
	수학 : <%=request.getParameter("math") %><br>
	<%
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		
		float sum = kor + eng + math;
		
		
		
		
		out.println("총점:" + sum + "<br>" );
		out.println("평균:" + String.format( "%.2f",sum/3));
		
	%>
	
</body>
</html>