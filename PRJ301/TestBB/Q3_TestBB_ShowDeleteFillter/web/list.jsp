<%-- 
    Document   : list
    Created on : Oct 8, 2024, 3:59:07 PM
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
        <form action="show">
            <h1>Supplier Filter</h1>
            Supplier name: <input type="text" name="name">
            <button type="submit">Filter by name</button>
        </form>
        <form action="show">
            Year of birth: <input type="number" name="year">
            <button type="submit">Filter by year</button>
        </form>
        
        <h3>list of suppliers:</h3>
        <table border="1px" >
            <tr style="color: red">
                <th>Code</th>
                <th>Name</th>
                <th>Date of birth</th>
                <th>Gender</th>
                <th>Adress</th>
            </tr>
            <c:forEach items="${requestScope.data}" var="c">
                <tr>
                    <td>${c.code}</td>
                    <td>${c.name}</td>
                    <td>${c.birth}</td>
                    <td>
                        ${c.gender?'Male':'Female'}
                    </td>
                    <td>${c.address}</td>
                    <td>
                        <a href="#" onclick="doDelete('${c.code}')">Delete</a> &nbsp; &nbsp; &nbsp;
                    </td>
                </tr>
            </c:forEach>
        </table>

        
     <script type="text/javascript">
            function doDelete(code) {
                if (confirm("are you want to delete id: " + code + "?")) {
                    window.location = "delete?code="+code;
                }
            }
        </script>   
    </body>
</html>
