<%-- 
    Document   : search
    Created on : Oct 10, 2024, 1:58:03 PM
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
        <form action="search" >
            ID <input type="text" name="id"><br>
            Name <input type="text" name="name"><br/>
            Gender 
            <input type="radio" name="gender" value="true"/>Nam
            <input type="radio" name="gender" value="false"/>Nữ
            <input type="radio" name="gender" value="null"/>Both<br>
            Department
            <select name="did">
                <option ${requestScope.did == 0?'selected':''} 
                    value="0">-----ALL-----</option>

                <c:forEach items="${requestScope.depts}" var="d">
                    <option value="${d.id}" ${requestScope.did == d.id?'selected':''}>${d.name}</option>
                </c:forEach>
            </select>
            <br>
            Dob From<input type="date" name="from"/><br>
            Dob To <input type="date" name="to"/><br>

            <input type="submit" value="SEARCH" />
        </form>
        <hr><!-- comment -->
        <table border="1px">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>DOB</th>
                <th>Gender</th>
                <th>Department</th>
            </tr>
            <c:forEach items="${requestScope.emps}" var="e">
                <tr>
                    <td>${e.id}</td>
                    <td>${e.name}</td>
                    <td>${e.dob}</td>
                    <td>${e.gender ? 'Male' : 'Female'}</td>
                    <td>${e.department.name}</td>

                </tr>
            </c:forEach>
        </table>

    </body>
</html>
