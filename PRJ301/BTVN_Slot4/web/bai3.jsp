<%-- 
    Document   : bai3
    Created on : Sep 16, 2024, 9:57:02 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bai 3</title>
    </head>
    <body>
        <h1>Example get data</h1>
        <h2 style="color: red">
            ${requestScope.error}
        </h2>
        <form action="bai3" method="post">
            Enter your name: <input type="text" name="name"/> <br>
            Enter your pass:  <input type="password" name="pass"/> <br>
            <input type="submit" value="Enter">
        </form>
    </body>
</html>
