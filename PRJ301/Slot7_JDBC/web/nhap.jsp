<%-- 
    Document   : nhap
    Created on : Oct 10, 2024, 1:45:05 PM
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
        <h1>List of Employee</h1>
        <jsp:useBean id="dao" class="dal.DAO"></jsp:useBean>
        <c:set var="dd" value="${dao.depts}"></c:set>
        <c:set var="em" value="${dao.emps}"></c:set>
            Department 
            <select name="did">
            <c:forEach items="${dd}" var="d">
                <option value="${d.id}">${d.name}></option>
            </c:forEach>
        </select>
        <table border="1px">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>DOB</th>
                <th>GENDER</th>
                <th>DEPARTMENT</th>
            </tr>
            <c:forEach items="${em}" var="e">
                <tr>
                    <td>${e.id}</td>
                    <td>${e.name}</td>
                    <td>${e.dob}</td>
                    <td>${e.gender}</td>
                    <td>${e.department.name}</td>
                </tr>
            </c:forEach>

        </table>
    </body>
</html>
