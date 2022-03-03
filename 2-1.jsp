<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<%@ page import="java.time.*" %>

 <!DOCTYPE html>
 <html>
 <head>
   <!--
     이 주석은 소스보기를 하면 보입니다
  -->

  <%--
    이 주석은 소스보기를 해도 보이지 않습니
 --%>
     <meta charset="UTF-8">
     <title>테스트 페이지</title>
  </head>
  <body>
  <%
    /*
      여러줄 주석
    */

      out.println("오늘 날짜 : " + LocalDate.now() + "<br>");
      out.println("현재 시간 : " + LocalTime.now());
  %>
  </body>
  </html>
