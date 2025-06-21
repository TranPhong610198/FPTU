<%-- 
    Document   : header
    Created on : Feb 18, 2025, 12:17:17 AM
    Author     : VuxD4t
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Header</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="assests/css/Header.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container-header">
                <!-- Logo -->
                <a class="navbar-brand" href="home">
                    <img src="${pageContext.request.contextPath}/uploads/logo/logoHuy.png" alt="Logo"/>
                </a>

                <!-- Navbar Toggle Button -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Main Navigation -->
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <c:forEach items="${level1Categories}" var="level1">
                            <li class="nav-item">
                                <a class="nav-link" href="listproduct?category=${level1.id}">${level1.name}</a>
                                <div class="mega-menu">
                                    <div class="row">
                                        <c:forEach items="${level2ByParent[level1.id]}" var="level2">
                                            <div class="col-md-3">
                                                <h5><a href="listproduct?category=${level2.id}">${level2.name}</a></h5>
                                                <ul>
                                                    <c:forEach items="${level3ByParent[level2.id]}" var="level3">
                                                        <li><a href="listproduct?category=${level3.id}">${level3.name}</a></li>
                                                        </c:forEach>
                                                </ul>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>

                    <!-- Right Side Items -->
                    <div class="d-flex align-items-center justify-content-end">
                        <!-- Search Form -->
                        <form class="search-form" action="listproduct" method="GET">
                            <input type="text" name="keyword" placeholder="Tìm kiếm...">
                            <button type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                        </form>

                        <!-- User Actions -->
                        <div class="user-actions">
                            <!-- User Profile/Login -->
                            <div class="user-menu">
                                <c:if test="${not empty sessionScope.acc}">
                                    <div class="dropdown">
                                        <button class="dropbtn">
                                            <img src="${sessionScope.acc.avatar}" alt="avatar" class="avatar-img" 
                                                 onerror="this.src='https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg'">
                                            <div class="user-info-header">
                                                <span class="full-name">${sessionScope.acc.fullName}</span>
                                                <span class="username">${sessionScope.acc.username}</span>
                                            </div>
                                        </button>
                                        <div class="dropdown-content">
                                            <c:if test="${sessionScope.acc.role == 'admin'}">
                                                <a href="./admin/userlists">Trang quản trị</a>
                                                <a href="./marketing/productlist">Trang quản lý tiếp thị</a>
                                            </c:if>
                                            <a href="profile">Trang cá nhân</a>
                                            <a href="logout">Đăng xuất</a>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${empty sessionScope.acc}">
                                    <div class="dropdown">
                                        <button class="dropbtn-guest">
                                            <i class="fas fa-user"></i>
                                        </button>
                                        <div class="dropdown-content">
                                            <a href="login">Đăng nhập</a>
                                            <a href="register">Đăng ký</a>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                            <!-- Cart -->
                            <a href="cartdetail" class="cart-icon">
                                <i class="fas fa-shopping-cart"></i>
                                <span class="cart-count">0</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Font Awesome for icons -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Custom JavaScript for navbar toggle -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var navbarToggler = document.querySelector('.navbar-toggler');
                var navbarCollapse = document.querySelector('.navbar-collapse');

                navbarToggler.addEventListener('click', function () {
                    var isExpanded = navbarToggler.getAttribute('aria-expanded') === 'true';
                    navbarToggler.setAttribute('aria-expanded', !isExpanded);
                });

                document.addEventListener('click', function (event) {
                    var isClickInside = navbarCollapse.contains(event.target) || navbarToggler.contains(event.target);

                    if (!isClickInside && navbarCollapse.classList.contains('show')) {
                        navbarCollapse.classList.remove('show');
                        navbarToggler.classList.add('collapsed');
                        navbarToggler.setAttribute('aria-expanded', 'false');
                    }
                });

                var navLinks = document.querySelectorAll('.nav-link');
                navLinks.forEach(function (navLink) {
                    navLink.addEventListener('click', function () {
                        if (window.innerWidth < 992) {
                            navbarCollapse.classList.remove('show');
                            navbarToggler.classList.add('collapsed');
                            navbarToggler.setAttribute('aria-expanded', 'false');
                        }
                    });
                });
            });
        </script>
    </body>
</html>