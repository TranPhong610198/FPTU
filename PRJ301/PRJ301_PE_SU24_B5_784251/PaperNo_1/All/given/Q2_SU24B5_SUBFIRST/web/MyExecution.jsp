<%-- 
    Document   : MyExecution
    Created on : Nov 3, 2024, 6:57:48 AM
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
        <form action="list" method="post">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Enter a string (str):</td>
                        <td>
                            <input type="text" name="str"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Enter an integer (n):</td>
                        <td>
                            <input type="text" name="n"/>

                        </td>
                    </tr>
                    <tr>
                        <td>Result:</td>
                        <td>
                            <input type="text" name="result" readonly=""/>
                        </td>
                    </tr>
                </tbody>
            </table>
            <button type="submit">SUB FIRST</button>  <p style="font-style: italic">${requestScope.err}</p>
        </form>
        
        List of Execution:
        <table border="1">
            <thead>
                <tr>
                    <th>String str</th>
                    <th>Index n</th>
                    <th>Result</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.list}" var="list">
                    <tr>
                        <td>${list.str}</td>
                        <td>${list.n}</td>
                        <td>${list.result}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>


    </body>
</html>
