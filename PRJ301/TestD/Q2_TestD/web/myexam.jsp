<%-- 
    Document   : myexam
    Created on : Oct 15, 2024, 3:40:37 PM
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
        <form action="myExam" method="post">
            Code:  <input type="text" name="code"/><br/>
            Name:  <input type="text" name="name"/><br/>
            Position: <select name="position" id="position">
                <option value="Striker">Striker</option>
                <option value="Goalkeeper">Goalkeeper</option>
                <option value="Defender">Defender</option>
                <option value="Midfielder">Midfielder</option>
            </select>
            <br/>
            Salary:  <input type="text" name="salary"/><br/>
            <p>${requestScope.error}</p>

            <input type="submit" value="CREATE"/><br/>
        </form>
        <c:set var="list" value="${requestScope.list}"/>
        <c:if test="${list.size()>0}">
            List of Players: <br/>
            <table border="1px" width="40%  ">
                <tr>
                    <th>Code</th>   
                    <th>Name</th>
                    <th>Position</th>
                    <th>Salary</th>
                </tr>
                <c:forEach items="${requestScope.list}" var="s" >
                    <tr>
                        <td>${s.code}</td>
                        <td>${s.name}</td>
                        <td>${s.position}</td>
                        <td>${s.salary}</td>
                    </tr>
                </c:forEach>
            </table>

        </c:if>
    </body>
</html>
