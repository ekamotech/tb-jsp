<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.net.URLDecoder" %>
<%
String name = "";
Cookie[] cookies = request.getCookies();
if (cookies != null) {
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("name")) {
            name = URLDecoder.decode(cookie.getValue(), "UTF-8");
            break;
        }
    }
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>cookie1</title>
    </head>
    <body>
        <form method="POST" action="cookie2.jsp">
            <df>
                <dt>名前</dt>
                <dd><input type="text" name="name" size="10" value="<%= name %>"></dd>
            </df>
            <input type="submit" value="登録">
        </form>
    </body>
</html>