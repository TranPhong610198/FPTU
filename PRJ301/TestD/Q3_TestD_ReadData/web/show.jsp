<%-- 
    Document   : show
    Created on : Oct 24, 2024, 5:43:07 AM
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
        <!--<h1>Hello World!</h1>-->
        List of Excutions:
        <table border="1">
            <thead>
                <tr style="color: black; font-weight: bold">
                    <th>Execution ID</th>
                    <th>Array</th>
                    <th>Result</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="items" items="${data1}">
                    <tr>
                        <td><a href="show?id=${items.id}">${items.id}</a></td>
                        <td>${items.array}</td>
                        <td>${items.result}</td>
                        <td><a href="delete?id=${items.id}">Delete</a></td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
            <table border="0">

                <tbody>

                    <tr>
                        <td>Execution ID:</td>
                        <td>
                            <input type="text" name="id" value="${(result.id!=null)?result.id:''}" readonly=""/>
                        </td>
                    </tr>
                    <tr>
                        <td>Array:</td>
                        <td>
                            <input type="text" name="array" value="${(result.array!=null)?result.array:''}" readonly=""/>
                        </td>
                    </tr>
                    <tr>
                        <td>Result: </td>
                        <td>
                            <input type="text" name="result" value="${(result.result!=null)?result.result:''}" readonly=""/>
                        </td>
                    </tr>
                <br>
                </tbody>

            </table>
    </body>
</html>
