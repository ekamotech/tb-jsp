<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title><c:out value="Hello World!" /></title>
    </head>
    <body>
        <c:out value="${param['msg']}" />
    </body>
</html>