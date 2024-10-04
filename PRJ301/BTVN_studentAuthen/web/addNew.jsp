<%-- 
    Document   : addNew
    Created on : Sep 26, 2024, 1:39:04 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD Page</title>
    </head>
    <body>
        <h1>Add new page</h1>
        <h4>${requestScope.error}</h4>
        <form action="add">
            enter id: <input type="number" name="id"/><br>
            enter name: <input type="text" name="name"/><br>
            enter describe: <input type="text" name="desc"/><br>
            <button type="submit">Add</button>
        </form>
    </body>
</html>
