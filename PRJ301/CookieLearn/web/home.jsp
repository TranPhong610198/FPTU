<%-- 
    Document   : home
    Created on : Oct 16, 2024, 10:45:59 PM
    Author     : tphon
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
        <h1>Hello World! ${sessionScope.account.username}</h1>
        <c:forEach items="${pageContext.request.cookies}" var="c">
            ${c.name}-${c.value}<br>
        </c:forEach>
            <a href="new">New</a>
    </body>
</html>
