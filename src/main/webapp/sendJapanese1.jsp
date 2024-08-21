<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>sendJapanese1</title>
    </head>
    <body>
        <form method="POST" action="sendJapanese2.jsp">
            <p>氏名は？</p>
            氏: <input name="lastName" type="text" size="10" /> 
            名: <input name="firstName" type="text" size="10" /> 
            <input type="submit" value="送信">
        </form>
    </body>
</html>