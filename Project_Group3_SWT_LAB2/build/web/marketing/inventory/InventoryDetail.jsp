<%-- 
    Document   : InventoryDetail
    Created on : Feb 17, 2025, 12:14:33 AM
    Author     : nguye
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Inventory Detail</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <style>
            .model-table-container {
                max-height: 600px;
                overflow-y: auto;
                border: 1px solid #dee2e6;
                border-radius: 0.25rem;
                margin-bottom: 1.5rem;
            }

            .model-table-container table {
                margin-bottom: 0;
            }

            .model-table-container .table-bordered th,
            .model-table-container .table-bordered td {
                border-color: #dee2e6;
            }
            .read-only-field {
                background-color: #e9ecef;
                cursor: not-allowed;
            }
            .action-buttons .btn {
                margin-right: 5px;
            }
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
                padding: 1rem;
                margin-bottom: 1.5rem;
                background-color: #f8f9fa;
            }

            .info-section h5 {
                margin-top: 0;
                border-bottom: 1px solid #dee2e6;
                padding-bottom: 0.5rem;
                margin-bottom: 1rem;
            }

            .table-hover tbody tr:hover {
                background-color: rgba(0, 123, 255, 0.075);
            }

            .sticky-top {
                background-color: #f8f9fa;
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
                <!-- Success Messages -->
                <c:if test="${not empty param.success}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <c:choose>
                            <c:when test="${param.success eq 'add'}">
                                Thêm mẫu sản phẩm thành công!
                            </c:when>
                            <c:when test="${param.success eq 'edit'}">
                                Chỉnh sửa mẫu sản phẩm thành công!
                            </c:when>
                            <c:when test="${param.success eq 'delete'}">
                                Xóa mẫu sản phẩm thành công!
                            </c:when>
                        </c:choose>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <!-- Error Messages -->
                <c:if test="${not empty errorMessage || not empty param.error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${not empty errorMessage ? errorMessage : 'Không thể xóa mẫu sản phẩm. Vui lòng thử lại!'}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <!-- Product Info Section -->
                <div class="info-section">
                    <h5 class="mb-3">Thông tin sản phẩm</h5>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control read-only-field" id="productName" 
                                       value="${inventory.productName}" readonly>
                                <label for="productName">Tên sản phẩm</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control read-only-field" id="category" 
                                       value="${inventory.category}" readonly>
                                <label for="category">Danh mục</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-floating mb-3">
                                <input type="number" class="form-control read-only-field" id="totalStock" 
                                       value="${inventory.totalQuantity}" readonly>
                                <label for="totalStock">Tổng số lượng tồn kho</label>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Model Table Section -->
                <div class="info-section">
                    <h5 class="mb-3">Chi tiết mẫu sản phẩm</h5>
                    <div class="d-flex justify-content-end mb-3">
                        <a href="addModel?productId=${inventory.productId}&source=${param.source}" class="btn btn-success">
                            <i class="fas fa-plus me-2"></i>Thêm Mẫu Mới
                        </a>
                    </div>
                    <div class="model-table-container">
                        <table class="table table-bordered table-hover">
                            <thead class="table-light sticky-top">
                                <tr>
                                    <th>Mã sản phẩm lưu kho</th>
                                    <th>Màu sắc</th>
                                    <th>Kích thước</th>
                                    <th>Số lượng</th>
                                    <th>Ngày cập nhật</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${variants}" var="variant">
                                    <tr>
                                        <td>${variant.sku}</td>
                                        <td>${variant.color.name}</td>
                                        <td>${variant.size.name}</td>
                                        <td>${variant.quantity}</td>
                                        <td><fmt:formatDate value="${variant.lastRestockDate}" pattern="dd/MM/yyyy"/></td>
                                        <td>
                                            <div class="action-buttons">
                                                <a href="editModel?variantId=${variant.id}&productId=${inventory.productId}&source=${param.source}" 
                                                   class="btn btn-outline-primary btn-sm">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <button type="button" class="btn btn-outline-danger btn-sm" 
                                                        data-bs-toggle="modal" data-bs-target="#deleteModal${variant.id}">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="d-flex justify-content-start mt-3">
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
                </div>
            </div>
        </div>

        <!-- Delete Confirmation Modals -->
        <c:forEach items="${variants}" var="variant">
            <div class="modal fade" id="deleteModal${variant.id}" tabindex="-1" 
                 aria-labelledby="deleteModalLabel${variant.id}" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deleteModalLabel${variant.id}">Xác nhận xóa</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Bạn có chắc chắn muốn xóa mẫu sản phẩm này?<br>
                            Mã sản phẩm lưu kho: <strong>${variant.sku}</strong><br>
                            Màu sắc: <strong>${variant.color.name}</strong><br>
                            Kích thước: <strong>${variant.size.name}</strong>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <form action="inventoryDetail" method="POST" style="display: inline;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="productId" value="${inventory.productId}">
                                <input type="hidden" name="variantId" value="${variant.id}">
                                <input type="hidden" name="source" value="${param.source}"> 
                                <button type="submit" class="btn btn-danger">Xóa</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <!-- Scripts -->
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

                // Highlight current menu item
                $('.menu-item').removeClass('active');
                $('.menu-item a[href="inventorylist"]').closest('.menu-item').addClass('active');

                // Open product submenu by default
                $('#productSubmenu').addClass('show');
            });
        </script>
    </body>
</html>