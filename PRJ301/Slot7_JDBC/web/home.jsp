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
        <title>Home</title>
    </head>
    <body>
        <h1>List</h1>
        <a  href="addNew.jsp">ADD NEW</a>
        <table border="1px" width="40%" >
            <tr style="color: red">
                <th>ID</th>
                <th>Name</th>
                <th>Describe</th>
                <th>Action</th>

            </tr>
            <c:forEach items="${requestScope.data}" var="c">
                <tr>
                    <td>${c.id}</td>
                    <td>${c.name}</td>
                    <td>${c.describe}</td>
                    <td>
                        <a href="#" onclick="doDelete('${c.id}')">Delete</a> &nbsp; &nbsp; &nbsp;
                        <a href="update?id=${c.id}">Update</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("are you want to delete id: " + id + "?")) {
                    window.location = "delete?id="+id;
                }
            }
        </script>
    </body>
</html>
