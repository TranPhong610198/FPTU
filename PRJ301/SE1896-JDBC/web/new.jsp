<%-- 
    Document   : new
    Created on : Sep 26, 2024, 10:55:47 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add a new category </h1>
        <h4 style="color: red">${requestScope.error}</h4>
        <form action="add">
            enter id <input type="number" name="id"/><br/>
            enter name <input type="text" name="name"/><br/>
            enter describe <input type="text" name="desc"/><br/>
            <button type="submit">ADD</button>
        </form>
    </body>
</html>
