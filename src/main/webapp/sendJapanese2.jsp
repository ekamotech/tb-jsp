<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>sendJapanese2</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            String lastName = request.getParameter("lastName");
            String firstName = request.getParameter("firstName");
        %>
        <p><%= lastName %><%= firstName %>さん、こんにちは。</p>
    </body>
</html>