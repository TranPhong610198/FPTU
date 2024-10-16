<%-- 
    Document   : myexam
    Created on : Oct 8, 2024, 3:43:44 PM
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
        <form action="myexamServlet" method="post">
            Code:  <input type="text" name="code" required=""/><br/>
            Name:  <input type="text" name="name" required=""/><br/>
            Number of carriages:  <input type="number" name="num" required=""/><br/>
            <input type="submit" value="ADD"/><br/>
        </form>
    <c:set var="list" value="${requestScope.data}"/>
    <c:if test="${list.size()>0}">
        List of Trains: <br/>
        <table border="1px" width="40%  ">
            <tr>
                <th>Code</th>   
                <th>Name</th>
                <th>Number of carriages</th>
            </tr>
            <c:forEach items="${requestScope.data}" var="s" >
                <tr>
                    <td>${s.code}</td>
                    <td>${s.name}</td>
                    <td>${s.num}</td>
                </tr>
            </c:forEach>
        </table>

    </c:if>
</body>
</html>
