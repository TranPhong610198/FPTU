<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cài đặt chân trang</title>
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
            }

            body {
                background-color: #f8f9fa;
            }

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

            .page-title {
                color: var(--primary-color);
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--accent-color);
                display: inline-block;
            }

            .filter-card {
                background-color: white;
                border-radius: 8px;
                margin-bottom: 20px;
            }

            .search-box {
                border-radius: 50px;
                padding-left: 15px;
                border: 1px solid var(--border-color);
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

            .badge {
                padding: 6px 12px;
                border-radius: 50px;
            }

            .btn-action {
                padding: 5px 10px;
                margin: 0 2px;
            }

            .pagination .page-link {
                color: var(--primary-color);
                border: 1px solid var(--border-color);
                min-width: 40px;
                text-align: center;
                margin: 0 3px;
            }

            .pagination .page-item.active .page-link {
                background-color: var(--accent-color);
                border-color: var(--accent-color);
                color: white;
            }

            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
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
        </style>
    </head>
    <body>             
        <!-- Include the sidebar -->        
        <jsp:include page="/admin/adminsidebar.jsp" />

        <button class="btn btn-primary sidebar-toggle">
            <i class="fas fa-bars"></i>
        </button>

        <div class="main-content">
            <div class="container-fluid p-4">
                <h2 class="page-title">
                    <i class="fas fa-cog me-2"></i>Cài đặt chân trang
                </h2>

                <!-- Filter Section -->
                <div class="card filter-card">
                    <div class="card-header">
                        <i class="fas fa-filter me-2"></i>Bộ lọc tìm kiếm
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/admin/footer-settings" method="get" class="row g-3">
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-text bg-white">
                                        <i class="fas fa-search text-muted"></i>
                                    </span>
                                    <input type="text" name="search" value="${searchValue}" class="form-control search-box" 
                                           placeholder="Tìm kiếm giá trị...">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <select name="status" class="form-select">
                                    <option value="">Tất cả trạng thái</option>
                                    <option value="active" ${statusFilter == 'active' ? 'selected' : ''}>Active</option>
                                    <option value="inactive" ${statusFilter == 'inactive' ? 'selected' : ''}>Inactive</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <div class="d-flex gap-2">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-filter me-1"></i>Lọc
                                    </button>
                                    <a href="${pageContext.request.contextPath}/admin/footer-settings" class="btn btn-secondary">
                                        <i class="fas fa-undo me-1"></i>Xóa bộ lọc
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Footer Settings Table -->
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <i class="fas fa-list me-2"></i>Danh sách cài đặt chân trang
                        </div>
                        <div>
                            <a href="${pageContext.request.contextPath}/admin/footer-settings/new" class="btn btn-primary btn-sm">
                                <i class="fas fa-plus me-2"></i>Thêm cài đặt mới
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
                                            <a href="?sort=field_name&order=${sortColumn == 'field_name' && sortOrder == 'ASC' ? 'DESC' : 'ASC'}&status=${statusFilter}&search=${searchValue}" 
                                               class="sort-link">
                                                Tên trường
                                                <span class="sort-icons">
                                                    ${sortColumn == 'field_name' ? (sortOrder == 'ASC' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="?sort=value&order=${sortColumn == 'value' && sortOrder == 'ASC' ? 'DESC' : 'ASC'}&status=${statusFilter}&search=${searchValue}"
                                               class="sort-link">
                                                Giá trị
                                                <span class="sort-icons">
                                                    ${sortColumn == 'value' ? (sortOrder == 'ASC' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="?sort=type&order=${sortColumn == 'type' && sortOrder == 'ASC' ? 'DESC' : 'ASC'}&status=${statusFilter}&search=${searchValue}"
                                               class="sort-link">
                                                Loại
                                                <span class="sort-icons">
                                                    ${sortColumn == 'type' ? (sortOrder == 'ASC' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="?sort=status&order=${sortColumn == 'status' && sortOrder == 'ASC' ? 'DESC' : 'ASC'}&status=${statusFilter}&search=${searchValue}"
                                               class="sort-link">
                                                Trạng thái
                                                <span class="sort-icons">
                                                    ${sortColumn == 'status' ? (sortOrder == 'ASC' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th class="text-center">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${footers}" var="footer" varStatus="status">
                                        <tr>
                                            <td class="text-center">${status.index + 1 + (currentPage - 1) * pageSize}</td>
                                            <td>${footer.fieldName}</td>
                                            <td>${footer.value}</td>
                                            <td>${footer.type}</td>
                                            <td>
                                                <span class="badge bg-${footer.status == 'active' ? 'success' : 'danger'}">
                                                    ${footer.status == 'active' ? 'Hoạt động' : 'Không hoạt động'}
                                                </span>
                                            </td>
                                            <td class="text-center">
                                                <div class="action-buttons">
                                                    <a href="${pageContext.request.contextPath}/admin/footer-settings/edit?id=${footer.id}" 
                                                       class="btn btn-primary btn-sm btn-action" title="Chỉnh sửa">
                                                        <i class="fas fa-edit"></i>
                                                    </a>

                                                    <form id="deleteForm${footer.id}" action="${pageContext.request.contextPath}/admin/footer-settings" method="post" style="display: inline-block; margin: 0;">
                                                        <input type="hidden" name="action" value="deleteFooter">
                                                        <input type="hidden" name="id" value="${footer.id}">
                                                        <input type="hidden" name="search" value="${searchValue}">
                                                        <input type="hidden" name="status" value="${statusFilter}">
                                                        <input type="hidden" name="sort" value="${sortColumn}">
                                                        <input type="hidden" name="order" value="${sortOrder}">
                                                        <input type="hidden" name="page" value="${currentPage}">
                                                        <button type="submit" class="btn btn-danger btn-sm btn-action" title="Xóa"
                                                                onclick="return confirm('Bạn có chắc chắn muốn xóa cài đặt này không? Hành động này không thể hoàn tác.');">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </form>
                                                </div>                                            
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Pagination -->
                <c:if test="${totalPages > 1}">
                    <div class="d-flex justify-content-center align-items-center mt-3">
                        <nav>
                            <ul class="pagination">
                                <c:if test="${currentPage > 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${currentPage-1}&status=${statusFilter}&search=${searchValue}&sort=${sortColumn}&order=${sortOrder}">
                                            <i class="fas fa-chevron-left"></i>
                                        </a>
                                    </li>
                                </c:if>

                                <c:forEach begin="1" end="${totalPages}" var="i">
                                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                                        <a class="page-link" href="?page=${i}&status=${statusFilter}&search=${searchValue}&sort=${sortColumn}&order=${sortOrder}">${i}</a>
                                    </li>
                                </c:forEach>

                                <c:if test="${currentPage < totalPages}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${currentPage+1}&status=${statusFilter}&search=${searchValue}&sort=${sortColumn}&order=${sortOrder}">
                                            <i class="fas fa-chevron-right"></i>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </c:if>
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

                                                                        // Highlight active menu item
                                                                        $('.menu-item').removeClass('active');
                                                                        $('.menu-item a[href*="footer-settings"]').closest('.menu-item').addClass('active');

                                                                        // Initialize tooltips
                                                                        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                                                                        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                                                                            return new bootstrap.Tooltip(tooltipTriggerEl)
                                                                        });
                                                                    });
        </script>
    </body>
</html>