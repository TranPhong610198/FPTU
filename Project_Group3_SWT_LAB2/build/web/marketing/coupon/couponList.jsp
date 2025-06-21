<%-- 
    Document   : couponList
    Created on : Feb 18, 2025, 8:59:00 PM
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
        <title>Quản lý mã giảm giá</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            :root {
                --primary-color: #2c3e50;
                --secondary-color: #34495e;
                --accent-color: #3498db;
                --light-color: #ecf0f1;
                --border-color: #dee2e6;
                --hover-color: #f8f9fa;
                --danger-color: #e74c3c;
                --success-color: #2ecc71;
                --warning-color: #f39c12;
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

            /* Badge Styles */
            .badge-status {
                font-weight: 600;
                padding: 5px 10px;
                border-radius: 50px;
            }

            .badge-active {
                background-color: var(--success-color);
                color: white;
            }

            .badge-expired {
                background-color: var(--danger-color);
                color: white;
            }

            .badge-discount-type {
                background-color: rgba(52, 152, 219, 0.2);
                color: var(--accent-color);
                font-weight: 600;
                padding: 5px 10px;
                border-radius: 50px;
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
                <c:if test="${not empty param.success}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <c:choose>
                            <c:when test="${param.success eq 'add'}">
                                Thêm mã giảm giá thành công!
                            </c:when>
                            <c:when test="${param.success eq 'edit'}">
                                Chỉnh sửa mã giảm giá thành công!
                            </c:when>
                            <c:when test="${param.success eq 'delete'}">
                                Xóa mã giảm giá thành công!
                            </c:when>
                        </c:choose>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <c:if test="${param.error eq 'delete'}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        Không thể xóa mã giảm giá. Vui lòng thử lại!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <h2 class="page-title">
                    <i class="fas fa-tags me-2"></i>Quản lý mã giảm giá
                </h2>

                <!-- Filter Section -->
                <div class="card filter-card">
                    <div class="card-header">
                        <i class="fas fa-filter me-2"></i>Bộ lọc tìm kiếm
                    </div>
                    <div class="card-body">
                        <form action="couponlist" method="GET" class="row g-3">
                            <div class="col-md-3">
                                <div class="input-group">
                                    <span class="input-group-text bg-white">
                                        <i class="fas fa-search text-muted"></i>
                                    </span>
                                    <input type="text" name="searchCode" value="${searchCode}" class="form-control search-box" placeholder="Tìm kiếm mã giảm giá...">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <select class="form-select" id="filterType" name="filterType">
                                    <option value="">Tất cả loại giảm giá</option>
                                    <option value="percentage" ${filterType == 'percentage' ? 'selected' : ''}>Phần trăm</option>
                                    <option value="fixed" ${filterType == 'fixed' ? 'selected' : ''}>Cố định</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <select class="form-select" id="filterStatus" name="filterStatus">
                                    <option value="">Tất cả trạng thái</option>
                                    <option value="active" ${filterStatus == 'active' ? 'selected' : ''}>Hoạt động</option>
                                    <option value="inactive" ${filterStatus == 'inactive' ? 'selected' : ''}>Chưa kích hoạt</option>
                                    <option value="expired" ${filterStatus == 'expired' ? 'selected' : ''}>Hết hạn</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <div class="d-grid gap-2 d-md-flex">
                                    <button type="submit" class="btn btn-primary me-md-2">
                                        <i class="fas fa-filter me-2"></i>Lọc
                                    </button>
                                    <a href="couponlist" class="btn btn-secondary">
                                        <i class="fas fa-eraser me-2"></i>Xóa bộ lọc
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Coupon List Table -->
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <i class="fas fa-ticket-alt me-2"></i>Danh sách mã giảm giá
                        </div>
                        <div>
                            <a href="addCoupon" class="btn btn-success btn-sm">
                                <i class="fas fa-plus me-2"></i>Thêm mã mới
                            </a>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered mb-0">
                                <thead>
                                    <tr class="bg-light">
                                        <th class="text-center" style="width: 60px;">STT</th>
                                        <th>
                                            <a href="couponlist?searchCode=${searchCode}&filterType=${filterType}&filterStatus=${filterStatus}&sortField=code&sortOrder=${sortField == 'code' && sortOrder == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                                Mã giảm giá
                                                <span class="sort-icons">
                                                    ${sortField == 'code' ? (sortOrder == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>Loại mã</th>
                                        <th>
                                            <a href="couponlist?searchCode=${searchCode}&filterType=${filterType}&filterStatus=${filterStatus}&sortField=discount_value&sortOrder=${sortField == 'discount_value' && sortOrder == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                                Giá trị
                                                <span class="sort-icons">
                                                    ${sortField == 'discount_value' ? (sortOrder == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>Tối thiểu</th>
                                        <th>
                                            <a href="couponlist?searchCode=${searchCode}&filterType=${filterType}&filterStatus=${filterStatus}&sortField=max_discount&sortOrder=${sortField == 'max_discount' && sortOrder == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                                Giảm tối đa
                                                <span class="sort-icons">
                                                    ${sortField == 'max_discount' ? (sortOrder == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="couponlist?searchCode=${searchCode}&filterType=${filterType}&filterStatus=${filterStatus}&sortField=usage_limit&sortOrder=${sortField == 'usage_limit' && sortOrder == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                                Lượt dùng
                                                <span class="sort-icons">
                                                    ${sortField == 'usage_limit' ? (sortOrder == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>Đã dùng</th>
                                        <th>
                                            <a href="couponlist?searchCode=${searchCode}&filterType=${filterType}&filterStatus=${filterStatus}&sortField=expiry_date&sortOrder=${sortField == 'expiry_date' && sortOrder == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                                Ngày hết hạn
                                                <span class="sort-icons">
                                                    ${sortField == 'expiry_date' ? (sortOrder == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>Trạng thái</th>
                                        <th class="text-center">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty couponList}">
                                            <c:forEach items="${couponList}" var="coupon" varStatus="status">
                                                <tr>
                                                    <td class="text-center">${status.index + 1 + (currentPage - 1)*10}</td>
                                                    <td><strong>${coupon.code}</strong></td>
                                                    <td>
                                                        <span class="badge-discount-type">
                                                            ${coupon.discount_type == 'percentage' ? 'Phần trăm' : 'Cố định'}
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${coupon.discount_type == 'percentage'}">
                                                                <fmt:formatNumber value="${coupon.discount_value}" maxFractionDigits="0"/>%
                                                            </c:when>
                                                            <c:otherwise>
                                                                <fmt:formatNumber value="${coupon.discount_value}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td><fmt:formatNumber value="${coupon.min_order_amount}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${coupon.max_discount > 0}">
                                                                <fmt:formatNumber value="${coupon.max_discount}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                Không giới hạn
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>${coupon.usage_limit == 0 ? 'Không giới hạn' : coupon.usage_limit}</td>
                                                    <td>${coupon.used_count}</td>
                                                    <td><fmt:formatDate value="${coupon.expiry_date}" pattern="dd/MM/yyyy"/></td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${coupon.status == 'active'}">
                                                                <span class="badge badge-status badge-active">Hoạt động</span>
                                                            </c:when>
                                                            <c:when test="${coupon.status == 'inactive'}">
                                                                <span class="badge badge-status badge-discount-type">Chưa kích hoạt</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="badge badge-status badge-expired">Hết hạn</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="btn-group" role="group">
                                                            <a href="editCoupon?id=${coupon.id}" class="btn btn-outline-primary btn-sm" title="Chỉnh sửa">
                                                                <i class="fas fa-edit"></i>
                                                            </a>
                                                            <button type="button" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#couponlist${coupon.id}" title="Xóa">
                                                                <i class="fas fa-trash-alt"></i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>

                                                <!-- Delete Confirmation Modal -->
                                            <div class="modal fade" id="couponlist${coupon.id}" tabindex="-1" aria-labelledby="couponlist${coupon.id}" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="couponlist?action=delete&id=${coupon.id}">Xác nhận xóa</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            Bạn có chắc chắn muốn xóa mã giảm giá <strong>${coupon.code}</strong>?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                                            <form action="couponlist" method="POST" style="display: inline;">
                                                                <input type="hidden" name="action" value="delete">
                                                                <input type="hidden" name="id" value="${coupon.id}">
                                                                <button type="submit" class="btn btn-danger">Xóa</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="11" class="empty-state">
                                                <i class="fas fa-ticket-alt fa-3x mb-3" style="opacity: 0.5;"></i>
                                                <p>Không tìm thấy mã giảm giá nào. Vui lòng thử lại với điều kiện tìm kiếm khác hoặc tạo mã giảm giá mới.</p>
                                                <a href="addCoupon" class="btn btn-primary mt-3">
                                                    <i class="fas fa-plus me-2"></i>Thêm mã giảm giá mới
                                                </a>
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
                        Hiển thị ${couponList.size()} / ${totalItems} mã giảm giá
                    </div>
                    <nav>
                        <ul class="pagination">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="couponlist?page=${currentPage-1}&sortField=${sortField}&sortOrder=${sortOrder}&searchCode=${searchCode}&filterType=${filterType}&filterStatus=${filterStatus}" aria-label="Previous">
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
                                            <a class="page-link" href="couponlist?page=${i}&sortField=${sortField}&sortOrder=${sortOrder}&searchCode=${searchCode}&filterType=${filterType}&filterStatus=${filterStatus}">${i}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="couponlist?page=${currentPage+1}&sortField=${sortField}&sortOrder=${sortOrder}&searchCode=${searchCode}&filterType=${filterType}&filterStatus=${filterStatus}" aria-label="Next">
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Add JavaScript for sidebar functionality -->
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
                $('.menu-item a[href="couponlist"]').closest('.menu-item').addClass('active');

                // Initialize tooltips
                var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                    return new bootstrap.Tooltip(tooltipTriggerEl)
                });
            });
        </script>
    </body>
</html>