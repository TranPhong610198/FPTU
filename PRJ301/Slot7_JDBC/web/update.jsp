<%-- 
    Document   : addNew
    Created on : Sep 26, 2024, 1:39:04 PM
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
        <h1>Update page</h1>
        <!--<h4>${requestScope.error}</h4>-->
        <c:set var="c" value="${requestScope.category}"></c:set>
        <form action="update" method="post">
            enter id: <input type="number" name="id" value="${c.id}" readonly=" "/><br>
            enter name: <input type="text" name="name" value="${c.name}"/><br>
            enter describe: <input type="text" name="desc" value="${c.describe}"/><br>
            <button type="submit">Update</button>
        </form>
    </body>
</html>
