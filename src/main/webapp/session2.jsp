<%@ page contentType="text/html; charset=UTF-8" import="java.net.URLEncoder" %>
<%
request.setCharacterEncoding("UTF-8");
String address = URLEncoder.encode(request.getParameter("address"), "UTF-8");
session.setAttribute("address", address);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>session2</title>
    </head>
    <body>
        <p>セッションが保存されました。</p>
    </body>
</html>