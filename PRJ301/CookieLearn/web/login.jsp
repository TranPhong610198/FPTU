<%-- 
    Document   : login
    Created on : Oct 1, 2024, 5:02:05 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login form</h1>
        <h3 style="color:red">${requestScope.error}</h3>
        <c:set var="cookie" value="${pageContext.request.cookies}"/>
        <form action="login" method="post">
            Enter username <input type="text" name="user" value="${cookie.cuser.value}"></br>
            Enter password <input type="password" name="pass"  value="${cookie.cpass.value}"></br>
            <input type="checkbox" name="rem" value="ON" ${cookie.crem!=null?'checked':''}>Remember me <br>
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>
