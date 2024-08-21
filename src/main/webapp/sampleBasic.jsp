<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.List, java.util.ArrayList, java.util.Arrays" %>
<%
boolean isTrue = true;
List<String> fruits = Arrays.asList("Apple", "Orange", "Melon");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>JSP Example</title>
    </head>
    <body>

        <% if (isTrue) { %>
            <p>This is true!</p>
        <% } else { %>
            <p>This is false!</p>
        <% } %>

        <hr>

        <ul>
        <% for (String fruit : fruits) { %>
            <li><%= fruit %></li>
        <% } %>
        </ul>

    </body>
</html>