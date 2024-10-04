<%-- 
    Document   : login
    Created on : Oct 1, 2024, 5:02:05 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login form</h1>
        <h3 style="color:red">${requestScope.error}</h3>
        <form action="login" method="post">
            Enter username <input type="text" name="user"></br>
            Enter password <input type="password" name="pass"></br>
            
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>
