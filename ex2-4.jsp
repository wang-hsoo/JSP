<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <body>
    <%
      out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공백을 5개 찍고 이 문장이 시작됩니다.<br>");
      out.println("이 문장은 중간에 공백이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5개 있습니다");
      //한줄 주석

    %>
    <br>
    <br>
    25 + 10 = <%= 25 + 10%>
    <br>
    <br>
    25 * 10 = <%= 25 * 10%>

    <!--
      html 주석
    -->

    <%--
      JSP 주석
    --%>
  </body>
</html>
