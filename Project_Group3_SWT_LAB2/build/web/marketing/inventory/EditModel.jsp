<%-- 
    Document   : EditModel
    Created on : Feb 17, 2025, 2:31:30 AM
    Author     : nguye
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Model</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <style>
            .main-content {
                margin-left: 250px;
                transition: all 0.3s;
                padding: 10px;
            }

            .main-content .container {
                padding: 1rem;
                background-color: #fff;
                border: 1px solid #dee2e6;
                border-radius: 0.25rem;
                box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            }

            .info-section {
                border: 1px solid #dee2e6;
                border-radius: 0.25rem;
                padding: 1.5rem;
                margin-bottom: 1.5rem;
                background-color: #f8f9fa;
            }

            .info-section h5 {
                margin-top: 0;
                border-bottom: 1px solid #dee2e6;
                padding-bottom: 0.5rem;
                margin-bottom: 1rem;
            }

            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                }
                .main-content.active {
                    margin-left: 250px;
                }
                .sidebar-toggle {
                    display: block;
                }
            }

            .sidebar-toggle {
                position: fixed;
                left: 10px;
                top: 10px;
                z-index: 1001;
                display: none;
            }

            @media (max-width: 768px) {
                .sidebar-toggle {
                    display: block;
                }
            }
        </style>
    </head>
    <body>
        <!-- Include the sidebar -->
        <jsp:include page="../sidebar.jsp" />

        <button class="btn btn-primary sidebar-toggle">
            <i class="fas fa-bars"></i>
        </button>

        <div class="main-content">
            <div class="container py-4">
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${errorMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <div class="info-section">
                    <h5>Chỉnh Sửa Mẫu</h5>
                    <form action="editModel" method="POST">
                        <input type="hidden" name="productId" value="${variant.productId}">
                        <input type="hidden" name="variantId" value="${variant.id}">
                        <input type="hidden" name="source" value="${param.source}"> 

                        <div class="row g-3">
                            <div class="col-md-3">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="sku" name="sku" 
                                           value="${variant.sku}" readonly>
                                    <label for="sku">SKU</label>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="color" name="color" 
                                           value="${variant.color.name}" required>
                                    <label for="color">Màu sắc</label>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="size" name="size" 
                                           value="${variant.size.name}" required>
                                    <label for="size">Kích thước</label>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-floating">
                                    <input type="number" class="form-control" id="quantity" name="quantity" 
                                           value="${variant.quantity}" required min="0">
                                    <label for="quantity">Số lượng</label>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex justify-content-between mt-4">
                            <c:choose>
                                <c:when test="${param.source == 'productlist'}">
                                    <a href="productlist" class="btn btn-secondary">
                                        <i class="fas fa-arrow-left me-2"></i>Quay lại
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="inventorylist" class="btn btn-secondary">
                                        <i class="fas fa-arrow-left me-2"></i>Quay lại
                                    </a>
                                </c:otherwise>
                            </c:choose>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-2"></i>Cập nhật
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            $(document).ready(function () {
                // Toggle sidebar
                $('.sidebar-toggle').on('click', function () {
                    $('.sidebar').toggleClass('active');
                    $('.main-content').toggleClass('active');
                    $(this).hide();
                });

                // Close sidebar when clicking outside on mobile
                $(document).on('click', function (e) {
                    if ($(window).width() <= 768) {
                        if (!$(e.target).closest('.sidebar').length && !$(e.target).closest('.sidebar-toggle').length) {
                            $('.sidebar').removeClass('active');
                            $('.main-content').removeClass('active');
                            $('.sidebar-toggle').show();
                        }
                    }
                });

                // Highlight inventory management in sidebar
                $('.menu-item').removeClass('active');
                $('.menu-item a[href="inventorylist"]').closest('.menu-item').addClass('active');

                // Open product submenu by default
                $('#productSubmenu').addClass('show');
            });
        </script>
    </body>
</html>