<%-- 
    Document   : home
    Created on : Sep 24, 2024, 5:08:35 PM
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
        <table border="1px" width="40%" >
            <tr style="color: red">
                <th>ID</th>
                <th>Name</th>
                <th>Describe</th>
            </tr>
            <c:forEach items="${requestScope.data}" var="c">
                <tr>
                <td>${c.id}</td>
                <td>${c.name}</td>
                <td>${c.describe}</td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>
