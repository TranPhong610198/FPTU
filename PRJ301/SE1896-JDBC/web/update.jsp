<%-- 
    Document   : new
    Created on : Sep 26, 2024, 10:55:47 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Update a category </h1>
        <c:set var="c" value="${requestScope.category}"/>
        <form action="update" method="post">
            enter id <input type="number" readonly name="id" value="${c.id}"/><br/>
            enter name <input type="text" name="name" value="${c.name}"/><br/>
            enter describe <input type="text" name="desc" value="${c.describe}"/><br/>
            <button type="submit">UPDATE</button>
        </form>
    </body>
</html>
