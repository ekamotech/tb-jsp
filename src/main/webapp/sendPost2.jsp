<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <title>sendPost2</title>
</head>
    <body>
        <% String monthText = request.getParameter("month") + "月"; %>
        <p>今月は<%=monthText%>です。</p>
    </body>
</html>