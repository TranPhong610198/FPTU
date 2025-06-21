<%-- 
    Document   : listInventory
    Created on : Feb 16, 2025, 2:08:22 AM
    Author     : nguye
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Inventory Management</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
        <style>
            :root {
                --primary-color: #2c3e50;
                --secondary-color: #34495e;
                --accent-color: #3498db;
                --light-color: #ecf0f1;
                --border-color: #dee2e6;
                --hover-color: #f8f9fa;
            }

            body {
                background-color: #f8f9fa;
            }

            .sort-link {
                text-decoration: none;
                color: var(--primary-color);
                font-weight: 600;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .sort-link:hover {
                color: var(--accent-color);
            }

            .sort-icons {
                margin-left: 5px;
            }

            /* Main content styles */
            .main-content {
                margin-left: 250px;
                transition: all 0.3s;
                padding: 20px;
                min-height: 100vh;
            }

            .card {
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                border: 1px solid var(--border-color);
                margin-bottom: 20px;
            }

            .card-header {
                background-color: #fff;
                border-bottom: 1px solid var(--border-color);
                padding: 15px 20px;
                font-weight: 600;
            }

            .table {
                margin-bottom: 0;
            }

            .table th {
                font-weight: 600;
                border-top: none;
                background-color: rgba(52, 152, 219, 0.05);
                vertical-align: middle;
            }

            .table td {
                vertical-align: middle;
            }

            .table tbody tr:hover {
                background-color: var(--hover-color);
            }

            .action-btn {
                padding: 5px 15px;
                border-radius: 4px;
                transition: all 0.3s;
            }

            .action-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .btn-view {
                background-color: var(--accent-color);
                color: white;
            }

            .btn-view:hover {
                background-color: #2980b9;
                color: white;
            }

            .search-box {
                border-radius: 50px;
                padding-left: 15px;
                border: 1px solid var(--border-color);
            }

            .search-btn {
                border-radius: 50px;
                padding: 8px 20px;
            }

            .filter-card {
                background-color: white;
                border-radius: 8px;
                margin-bottom: 20px;
            }

            .page-title {
                color: var(--primary-color);
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--accent-color);
                display: inline-block;
            }

            .empty-state {
                padding: 40px;
                text-align: center;
                color: #6c757d;
            }

            .badge-quantity {
                background-color: var(--accent-color);
                color: white;
                font-weight: 600;
                padding: 5px 10px;
                border-radius: 50px;
            }

            /* Responsive */
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

            /* Toggle button */
            .sidebar-toggle {
                position: fixed;
                left: 10px;
                top: 10px;
                z-index: 1001;
                display: none;
                border-radius: 50%;
                width: 42px;
                height: 42px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }

            @media (max-width: 768px) {
                .sidebar-toggle {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }
            }

            /* Pagination styling */
            .pagination .page-item .page-link {
                color: var(--primary-color);
                border: 1px solid var(--border-color);
                min-width: 40px;
                text-align: center;
            }

            .pagination .page-item.active .page-link {
                background-color: var(--accent-color);
                border-color: var(--accent-color);
                color: white;
            }

            .pagination .page-item .page-link:hover {
                background-color: var(--hover-color);
            }


            /* Ô input chính */
            .select2-container--default .select2-selection--single {
                height: 38px;
                padding: 5px 15px;
            }

            /* Mũi tên dropdown */
            .select2-container--default .select2-selection--single .select2-selection__arrow {
                height: 38px;
                right: 10px;
            }

            /* Placeholder */
            .select2-container--default .select2-selection--single .select2-selection__placeholder {
                color: #6c757d;
            }

            /* Khi focus */
            .select2-container--default.select2-container--focus .select2-selection--single {
                border-color: var(--accent-color);
                box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
            }

            /* Dropdown kết quả */
            .select2-container--default .select2-dropdown {
                border: 1px solid var(--border-color);
                border-radius: 0px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                background-color: #fff;
                margin-top: 5px;
            }

            /* Option trong dropdown */
            .select2-container--default .select2-results__option {
                padding: 8px 15px;
                color: var(--primary-color);
            }

            /* Option khi hover */
            .select2-container--default .select2-results__option--highlighted[aria-selected] {
                background-color: var(--hover-color);
                color: var(--primary-color);
            }


            /* Ô tìm kiếm trong dropdown */
            .select2-container--default .select2-search--dropdown .select2-search__field {
                border: 1px solid var(--border-color);
                border-radius: 10px;
                padding: 5px 15px;
            }

            /* Xóa lựa chọn (nút x) */
            .select2-container--default .select2-selection--single .select2-selection__clear {
                color: var(--accent-color);
                font-weight: bold;
                margin-right: 10px;
            }
            
            /* Tăng chiều cao tối đa của dropdown */
            .select2-container--default .select2-results > .select2-results__options {
                max-height: 400px; 
                overflow-y: auto; 
            }

            /* Đảm bảo dropdown không bị cắt */
            .select2-container--default .select2-dropdown {
                max-height: none; /* Loại bỏ giới hạn chiều cao của container dropdown */
            }

            /* Table responsiveness */
            @media (max-width: 768px) {
                .table-responsive {
                    display: block;
                    width: 100%;
                    overflow-x: auto;
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
            <div class="container-fluid p-4">
                <h2 class="page-title">
                    <i class="fas fa-warehouse me-2"></i>Quản lý kho hàng
                </h2>

                <!-- Filter Section -->
                <div class="card filter-card">
                    <div class="card-header">
                        <i class="fas fa-filter me-2"></i>Bộ lọc tìm kiếm
                    </div>
                    <div class="card-body">
                        <form action="inventorylist" method="GET" class="row g-3">
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-text bg-white">
                                        <i class="fas fa-search text-muted"></i>
                                    </span>
                                    <input type="text" name="search" value="${searchKeyword}" class="form-control search-box" placeholder="Tìm kiếm sản phẩm...">
                                </div>
                            </div>
                            <!--                            <div class="col-md-3">
                                                            <select name="category" class="form-select">
                                                                <option value="">Tất cả danh mục</option>
                            <c:forEach items="${categoryList}" var="cat">
                                <option value="${cat.id}" ${cat.id == selectedCategory ? 'selected' : ''}>${cat.name}</option>
                            </c:forEach>
                        </select>
                    </div>-->
                            <div class="col-md-3">
                                <select name="category" class="form-select select2">
                                    <option value="">📑 Tất cả danh mục</option>
                                    <c:forEach items="${categoryList}" var="cat">
                                        <c:choose>
                                            <%-- Level 1 categories (parent categories) --%>
                                            <c:when test="${cat.level == 1}">
                                                <option value="${cat.id}" ${selectedCategory == cat.id ? 'selected' : ''}>
                                                    🛍️ ${cat.name}
                                                </option>
                                                <%-- Display child categories --%>
                                                <c:forEach items="${categoryList}" var="childCat">
                                                    <c:if test="${childCat.parentId == cat.id}">
                                                        <option value="${childCat.id}" ${selectedCategory == childCat.id ? 'selected' : ''}>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;🧷 ${childCat.name}
                                                        </option>
                                                        <%-- Display grandchild categories if any --%>
                                                        <c:forEach items="${categoryList}" var="grandChildCat">
                                                            <c:if test="${grandChildCat.parentId == childCat.id}">
                                                                <option value="${grandChildCat.id}" ${selectedCategory == grandChildCat.id ? 'selected' : ''}>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;⤷ ${grandChildCat.name}
                                                                </option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>    
                            <div class="col-md-3">
                                <div class="d-grid gap-2 d-md-flex">
                                    <button type="submit" class="btn btn-primary me-md-2">
                                        <i class="fas fa-filter me-2"></i>Lọc
                                    </button>
                                    <a href="inventorylist" class="btn btn-secondary">
                                        <i class="fas fa-eraser me-2"></i>Xóa bộ lọc
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Products Table -->
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <i class="fas fa-boxes me-2"></i>Danh sách sản phẩm trong kho
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered mb-0">
                                <thead>
                                    <tr class="bg-light">
                                        <th class="text-center" style="width: 60px;">STT</th>
                                        <th>
                                            <a href="inventorylist?search=${searchKeyword}&category=${selectedCategory}&sortField=product_name&sortOrder=${sortField == 'product_name' && sortOrder == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                                Tên sản phẩm
                                                <span class="sort-icons">
                                                    ${sortField == 'product_name' ? (sortOrder == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="inventorylist?search=${searchKeyword}&category=${selectedCategory}&sortField=category&sortOrder=${sortField == 'category' && sortOrder == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                                Danh mục
                                                <span class="sort-icons">
                                                    ${sortField == 'category' ? (sortOrder == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>Màu sắc</th>
                                        <th>Kích thước</th>
                                        <th class="text-center">
                                            <a href="inventorylist?search=${searchKeyword}&category=${selectedCategory}&sortField=totalQuantity&sortOrder=${sortField == 'totalQuantity' && sortOrder == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                                Tổng số lượng
                                                <span class="sort-icons">
                                                    ${sortField == 'totalQuantity' ? (sortOrder == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th class="text-center">Chi tiết</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty inventoryList}">
                                            <c:forEach items="${inventoryList}" var="item" varStatus="status">
                                                <tr>
                                                    <td class="text-center">${status.index + 1 + (currentPage - 1)*10}</td>
                                                    <td>${item.productName}</td>
                                                    <td><span class="badge bg-secondary rounded-pill">${item.category}</span></td>
                                                    <td>
                                                        <c:forEach items="${item.colorString.split(',')}" var="color" varStatus="colorStatus">
                                                            <span class="badge bg-light text-dark me-1">${color}</span>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <c:forEach items="${item.sizeString.split(',')}" var="size" varStatus="sizeStatus">
                                                            <span class="badge bg-light text-dark me-1">${size}</span>
                                                        </c:forEach>
                                                    </td>
                                                    <td class="text-center">
                                                        <span class="badge-quantity">${item.totalQuantity}</span>
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="inventoryDetail?id=${item.productId}&source=inventorylist" class="btn btn-outline-primary btn-sm">
                                                            <i class="fas fa-eye me-1"></i> Xem
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="7" class="empty-state">
                                                    <i class="fas fa-box-open fa-3x mb-3"></i>
                                                    <p>Không tìm thấy sản phẩm nào trong kho. Vui lòng thử lại với điều kiện tìm kiếm khác.</p>
                                                </td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Pagination -->
                <div class="d-flex justify-content-between align-items-center mt-3">
                    <div class="text-muted small">
                        Hiển thị ${inventoryList.size()} / ${totalItems} sản phẩm
                    </div>
                    <nav>
                        <ul class="pagination">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="inventorylist?page=${currentPage-1}&sortField=${sortField}&sortOrder=${sortOrder}&search=${searchKeyword}&category=${selectedCategory}" aria-label="Previous">
                                        <i class="fas fa-chevron-left"></i>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <c:choose>
                                    <c:when test="${i == currentPage}">
                                        <li class="page-item active">
                                            <span class="page-link">${i}</span>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a class="page-link" href="inventorylist?page=${i}&sortField=${sortField}&sortOrder=${sortOrder}&search=${searchKeyword}&category=${selectedCategory}">${i}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="inventorylist?page=${currentPage+1}&sortField=${sortField}&sortOrder=${sortOrder}&search=${searchKeyword}&category=${selectedCategory}" aria-label="Next">
                                        <i class="fas fa-chevron-right"></i>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Add JavaScript for sidebar functionality -->
        <script>
            $(document).ready(function () {
                $('.select2').select2({
                    placeholder: "📑 Chọn danh mục",
                    allowClear: true,
                    width: '100%',
                    matcher: function (params, data) {
                        // Nếu không có search term, hiển thị tất cả
                        if (!params.term || params.term.trim() === '') {
                            return data;
                        }
                        var term = params.term.toLowerCase();
                        var text = data.text.toLowerCase();
                        if (text.indexOf(term) > -1) {
                            return data;
                        }
                        return null;
                    }
                });

                $('.sidebar-toggle').on('click', function () {
                    $('.sidebar').toggleClass('active');
                    $('.main-content').toggleClass('active');
                    $(this).hide();
                });

                $(document).on('click', function (e) {
                    if ($(window).width() <= 768) {
                        if (!$(e.target).closest('.sidebar').length && !$(e.target).closest('.sidebar-toggle').length) {
                            $('.sidebar').removeClass('active');
                            $('.main-content').removeClass('active');
                            $('.sidebar-toggle').show();
                        }
                    }
                });

                $('.menu-item').removeClass('active');
                $('.menu-item a[href="inventorylist"]').closest('.menu-item').addClass('active');
                $('#productSubmenu').addClass('show');

                var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
                var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                    return new bootstrap.Tooltip(tooltipTriggerEl);
                });
            });
        </script>
    </body>
</html>