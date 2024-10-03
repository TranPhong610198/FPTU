<%-- 
    Document   : home
    Created on : Oct 1, 2024, 5:12:21 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home Page</title>
    </head>
    <c:if test="${sessionScope.account == null}">
        <h2 style="background-color: darkgrey; height: 40px">
            <a href="login.jsp">Login</a>
            <a href="#">Register</a>
        </h2>
    </c:if>
    <c:if test="${sessionScope.account != null}">
        <h2>
            <a href="#">${sessionScope.account.username}</a>
            <a href="#">Change Password</a>
            <a href="logout" >Logout</a>
        </h2>
    </c:if>
    
    
    <body>
        <h1>${sessionScope.account.username}</h1>
    </body>
</html>
