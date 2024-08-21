<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>getHeaders</title>
    </head>
    <body>
        <table border="1">
            <tbody>
                <%
                    Enumeration<String> headers = request.getHeaderNames();
                    while (headers.hasMoreElements()) {
                        String name = headers.nextElement();
                %>
                <tr>
                    <th><%= name %></th>
                    <td><%= request.getHeader(name) %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>