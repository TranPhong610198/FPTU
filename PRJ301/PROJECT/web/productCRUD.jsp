<%-- 
    Document   : productCRUD
    Created on : Oct 5, 2024, 2:08:32 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>product CRUD</title>
    </head>
    <body>
        <a href="./addProduct.jsp" class="">ADD</a> &nbsp;&nbsp;&nbsp;
        <a href="home" class="">Home</a>
        <table border="1px solid" width="80%">
            <tr style="color: red">
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Brand</th>
                <th>Category ID</th>
                <th>Image</th>
                <th>Action</th>
            </tr>
            <tr>
                <c:forEach items="${requestScope.listProduct}" var="c">
                <tr>
                    <td>${c.id}</td>
                    <td>${c.name}</td>
                    <td>${c.description}</td>
                    <td>${c.price}</td>
                    <td>${c.stock}</td>
                    <td>${c.brand}</td>
                    <td>${c.categoryId}</td>
                    <td>
                        <img src="${c.imageUrl}" width="auto" height="100px" alt="${c.name}"/>
                    </td>
                    <td>
                        <a onclick="doDelete('${c.id}')" href="#">Delete</a> &nbsp; &nbsp; &nbsp;
                        <a href="updateProduct?id=${c.id}">Update</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm('Are you sure you want to delete ID ' + id + '?')) {
                    window.location='deleteProduct?id=' + id;
                }
            }
        </script>
    </body>
</html>
