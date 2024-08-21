<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.net.URLEncoder" %>
<%
    request.setCharacterEncoding("UTF-8");
    String name = URLEncoder.encode(request.getParameter("name"), "UTF-8");
    Cookie cookie = new Cookie("name", name);
    /*
     * 最長存続期間 (expiry) 、単位は秒
     * 正の値: Cookie の有効期限が切れる 最長 存続期間
     * 負の値: Cookie が永続的に保存されない。ブラウザーが終了すると Cookie も削除される
     * 0: Cookie が削除される
     */
    cookie.setMaxAge(60 * 60 * 24 * 180);
    response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>cookie2</title>
    </head>
    <body>
        <p>Cookie が保存されました。</p>
    </body>
</html>