<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý danh mục</title>
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

            .btn-action {
                padding: 5px 10px;
                margin: 0 2px;
            }

            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                }
                .sidebar-toggle {
                    display: block;
                }
            }
        </style>
    </head>
    <body>
        <!-- Include the sidebar -->
        <jsp:include page="/admin/adminsidebar.jsp" />

        <div class="main-content">
            <div class="container-fluid p-4">
                <h2 class="page-title">
                    <i class="fas fa-folder me-2"></i>Quản lý danh mục
                </h2>

                <!-- Alerts -->
                <c:if test="${param.message != null}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${param.message}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <c:if test="${param.error != null}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${param.error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <!-- Filter Section -->
                <div class="card filter-card">
                    <div class="card-header">
                        <i class="fas fa-filter me-2"></i>Bộ lọc tìm kiếm
                    </div>
                    <div class="card-body">
                        <form action="categorylists" method="GET" class="row g-3">
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-text bg-white">
                                        <i class="fas fa-search text-muted"></i>
                                    </span>
                                    <input type="text" name="search" value="${searchQuery}" 
                                           class="form-control search-box" placeholder="Tìm kiếm theo tên...">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <select name="status" class="form-select">
                                    <option value="">Tất cả trạng thái</option>
                                    <option value="active" ${statusFilter == 'active' ? 'selected' : ''}>Hoạt động</option>
                                    <option value="inactive" ${statusFilter == 'inactive' ? 'selected' : ''}>Không hoạt động</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <select name="sort" class="form-select">
                                    <option value="">Sắp xếp mặc định</option>
                                    <option value="name" ${sortBy == 'name' ? 'selected' : ''}>Tên</option>
                                    <option value="status" ${sortBy == 'status' ? 'selected' : ''}>Trạng thái</option>
                                    <option value="level" ${sortBy == 'level' ? 'selected' : ''}>Cấp độ</option>
                                </select>
                            </div>
                            <div class="d-flex">
                                        <button type="submit" class="btn btn-primary me-2">
                                            <i class="fas fa-filter me-1"></i>Lọc
                                        </button>
                                        <a href="categorylists" class="btn btn-secondary">Xóa bộ lọc</a>
                                    </div>
                        </form>
                    </div>
                </div>

                <!-- Categories Table -->
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <i class="fas fa-list me-2"></i>Danh sách danh mục
                        </div>
                        <a href="categoryadd" class="btn btn-primary">
                            <i class="fas fa-plus me-2"></i>Thêm danh mục
                        </a>
                    </div>
                    <div class="card-body p-0">
                        <c:choose>
                            <c:when test="${empty categories}">
                                <div class="text-center py-5">
                                    <i class="fas fa-folder-open fa-4x text-muted mb-3"></i>
                                    <h5 class="text-muted">Không tìm thấy danh mục nào</h5>
                                    <p class="text-muted">Vui lòng thử lại với điều kiện tìm kiếm khác hoặc thêm danh mục mới</p>
                                    
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="table-responsive">
                                    <table class="table table-hover table-bordered mb-0">
                                        <thead>
                                            <tr class="bg-light">
                                                <th class="text-center" style="width: 60px;">STT</th>
                                                <th>Tên danh mục</th>
                                                <th>Danh mục cha</th>
                                                <th>Cấp độ</th>
                                                <th>Mô tả</th>
                                                <th>Trạng thái</th>
                                                <th class="text-center">Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${categories}" var="category" varStatus="status">
                                                <tr>
                                                    <td class="text-center">${status.index + 1 + (currentPage - 1)*10}</td>
                                                    <td>${category.name}</td>
                                                    <td>${category.parentName != null ? category.parentName : 'Danh mục gốc'}</td>
                                                    <td><span class="badge bg-secondary">${category.level}</span></td>
                                                    <td>${category.description}</td>
                                                    <td>
                                                        <span class="badge ${category.status == 'active' ? 'bg-success' : 'bg-danger'}">
                                                            ${category.status == 'active' ? 'Hoạt động' : 'Không hoạt động'}
                                                        </span>
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="categorydetail?id=${category.id}" class="btn btn-primary btn-sm btn-action">
                                                            <i class="fas fa-edit"></i>
                                                        </a>
                                                        <button type="button" class="btn btn-danger btn-sm btn-action" onclick="deleteCategory(${category.id})">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <!-- Pagination -->
                <c:if test="${totalPages > 1}">
                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <div class="text-muted">
                            Hiển thị ${(currentPage-1)*pageSize + 1} đến 
                            ${currentPage*pageSize > totalCategories ? totalCategories : currentPage*pageSize} 
                            trong tổng số ${totalCategories} danh mục
                        </div>
                        <nav aria-label="Page navigation">
                            <ul class="pagination mb-0">
                                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="categorylists?page=${currentPage - 1}${not empty searchQuery ? '&search='.concat(searchQuery) : ''}${not empty statusFilter ? '&status='.concat(statusFilter) : ''}${not empty sortBy ? '&sort='.concat(sortBy) : ''}">
                                        <i class="fas fa-chevron-left"></i>
                                    </a>
                                </li>

                                <c:forEach begin="1" end="${totalPages}" var="i">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <a class="page-link" href="categorylists?page=${i}${not empty searchQuery ? '&search='.concat(searchQuery) : ''}${not empty statusFilter ? '&status='.concat(statusFilter) : ''}${not empty sortBy ? '&sort='.concat(sortBy) : ''}">${i}</a>
                                    </li>
                                </c:forEach>

                                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                    <a class="page-link" href="categorylists?page=${currentPage + 1}${not empty searchQuery ? '&search='.concat(searchQuery) : ''}${not empty statusFilter ? '&status='.concat(statusFilter) : ''}${not empty sortBy ? '&sort='.concat(sortBy) : ''}">
                                        <i class="fas fa-chevron-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </c:if>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                                                            function deleteCategory(categoryId) {
                                                                if (confirm('Bạn có chắc chắn muốn xóa danh mục này?')) {
                                                                    window.location.href = 'categorydelete?id=' + categoryId;
                                                                }
                                                            }

                                                            $(document).ready(function () {
                                                                // Highlight active menu item
                                                                $('.menu-item').removeClass('active');
                                                                $('.menu-item a[href="categorylists"]').closest('.menu-item').addClass('active');

                                                                // Initialize tooltips
                                                                var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                                                                var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                                                                    return new bootstrap.Tooltip(tooltipTriggerEl)
                                                                });
                                                            });
        </script>
    </body>
</html>