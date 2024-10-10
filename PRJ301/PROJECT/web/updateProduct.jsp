<%-- 
    Document   : updateProduct
    Created on : Oct 5, 2024, 2:37:40 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
        <style>
            .form-container {
                display: flex;
                flex-direction: column;
                width: 400px;
                margin: auto;
            }
            .form-group {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
            }
            .form-group label {
                flex: 1;
                margin-right: 10px;
            }
            .form-group input {
                flex: 2;
            }
            button {
                width: 100px;
                margin-top: 20px;
                align-self: center;
            }
        </style>
    </head>


    <body>

        <c:set value="${requestScope.oldProduct}" var="c"></c:set>
        <a href="home" class="">Home</a>
        <form action="updateProduct" method="post" class="form-container" enctype="multipart/form-data">
            <input type="hidden" name="oldImageUrl" value="${oldProduct.imageUrl}">

            <h1>Update page</h1>
            <div class="form-group">
                <label for="name">ID:</label>
                <input type="text" id="id" name="id" value="${c.id}">
            </div>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${c.name}">
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <input type="text" id="description" name="description" value="${c.description}">
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="text" id="price" name="price" value="${c.price}">
            </div>
            <div class="form-group">
                <label for="stock">Stock:</label>
                <input type="number" id="stock" name="stock" value="${c.stock}">
            </div>
            <div class="form-group">
                <label for="brand">Brand:</label>
                <input type="text" id="brand" name="brand" value="${c.brand}">
            </div>
            <div class="form-group">
                <label for="categoryId">Category ID:</label>
                <input type="text" id="categoryId" name="categoryId" value="${c.categoryId}">
            </div>
            <div class="form-group">
                <label for="image">Image:</label>
                <input type="file" id="image" name="image" > 
                <img src="${c.imageUrl}" width="auto" height="100px" alt="${c.name}"/>
            </div>
            <button type="submit">Update</button> 
        </form>    
    </body>
</html>
