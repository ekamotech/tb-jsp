<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.net.URLDecoder" %>
<%
String address = (String)session.getAttribute("address");
if (address == null) {
    address = "";
} else {
    address = URLDecoder.decode(address);
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>session1</title>
    </head>
    <body>
        <form method="POST" action="<%= response.encodeURL("session2.jsp") %>">
            <df>
                <dt>住所</dt>
                <dd><input type="text" name="address" size="40" value="<%= address %>"></dd>
            </df>
            <input type="submit" value="登録">
        </form>
    </body>
</html>