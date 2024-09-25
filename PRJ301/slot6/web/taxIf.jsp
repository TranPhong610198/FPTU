<%-- 
    Document   : taxIf
    Created on : Sep 19, 2024, 2:38:58 PM
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
        <h1>Hello World!</h1>
        <form method="post">
            Enter a salary:
            <input type="text" name="salary"/><br/>
            <c:set var="salary" scope="request" value="${param.salary}"/>
            <c:if test="${salary<200}">
                <h3 style="color: blue">Tax: ${0}</h3>
            </c:if>
            <c:if test="${(salary>=200)&&(salary<400)}">
                <h3 style="color: blue">Tax: ${(salary-200)*0.1}</h3>
            </c:if>
            <c:if test="${salary>=400}">
                <h3 style="color: blue">Tax: ${(200*0.1)+((salary-400)*0.15)}</h3>
            </c:if>
            <input type="submit" value="Calculate tax"/>
        </form>
    </body>
</html>



