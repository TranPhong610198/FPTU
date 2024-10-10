<%-- 
    Document   : addProduct
    Created on : Oct 5, 2024, 2:37:04 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Product</title>
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
        <h1 style="text-align: center;">Add a New Product</h1>
        <form action="addProduct" method="POST" class="form-container" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required="">
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <input type="text" id="description" name="description" required="">
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="text" id="price" name="price" required="">
            </div>
            <div class="form-group">
                <label for="stock">Stock:</label>
                <input type="number" id="stock" name="stock" required="">
            </div>
            <div class="form-group">
                <label for="brand">Brand:</label>
                <input type="text" id="brand" name="brand" required="">
            </div>
            <div class="form-group">
                <label for="categoryId">Category Id:</label>
                <input type="number" id="categoryId" name="categoryId" required="">
            </div>
            <div class="form-group">
                <label for="image">Image Upload:</label>
                <input type="file" id="image" name="image" required="">
            </div>
            <button type="submit">ADD</button>
        </form>
    </body>
</html>
