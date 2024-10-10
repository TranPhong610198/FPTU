<%-- 
    Document   : header
    Created on : Sep 16, 2024, 11:29:07 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Header</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark header ">
            <div class="container-fluid">
                <!-- Logo và tên thương hiệu bên trái -->
                <a class="navbar-brand" href="home">
                    <img src="./images/tải xuống.png" alt="Logo" 
                         class="d-inline-block align-text-top">
                    <!--FondevJS-->
                </a>



                <!-- Các link điều hướng ở giữa -->
                <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="listProduct">Admin</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Categories</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contact</a>
                        </li>
                    </ul>
                </div>

                <!-- Nút Login và Sign-up ở bên phải -->
                <div class="d-flex log-btn">
                    <a class="btn btn-outline-primary me-2" type="button" href="./login/">Login</a>
                    <a class="btn btn-primary" type="button" href="./register/">Register</a>
                </div>

                <!-- Toggler cho mobile -->
                <button class="navbar-toggler Toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        </nav>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


    </body>
</html>
