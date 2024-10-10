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
        <a  href="authen?action=add">ADD NEW</a>
        <table border="1px" width="50%" >
            <tr style="color: red">
                <th>ID</th>
                <th>Name</th>
                <th>DOB</th>
                <th>Gender</th>
                <th>Address</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${requestScope.data}" var="c">
                <tr>
                    <td>${c.id}</td>
                    <td>${c.name}</td>
                    <td>${c.dob}</td>
                    <td>
                        <c:choose>
                            <c:when test="${c.gender == true}">
                                <img src="imgages/male.png" alt="Male" width="20">
                            </c:when>
                            <c:otherwise>
                                <img src="imgages/female.png" alt="Female" width="20">
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${c.address}</td>
                    <td>
                        <button type="button" onclick="doDelete('${c.id}')">Delete</button>
                        &nbsp; &nbsp; &nbsp;
                        <a href="authen?action=update&id=${c.id}">Update</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("are you want to delete id: " + id + "?")) {
                    window.location = "authen?action=delete&id=" + id;
                }
            }
        </script>
    </body>
</html>
