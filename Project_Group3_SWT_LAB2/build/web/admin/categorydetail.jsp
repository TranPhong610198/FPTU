<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi tiết danh mục</title>
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

            .page-title {
                color: var(--primary-color);
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--accent-color);
                display: inline-block;
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

            .info-label {
                font-weight: 600;
                color: var(--primary-color);
                margin-bottom: 5px;
            }

            .edit-buttons {
                display: none;
            }

            .editing .edit-buttons {
                display: block;
            }

            .editing .view-content {
                display: none;
            }

            .edit-content {
                display: none;
            }

            .editing .edit-content {
                display: block;
            }

            .status-badge {
                padding: 6px 12px;
                border-radius: 20px;
                font-size: 14px;
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

            .breadcrumb {
                background-color: transparent;
                padding: 0;
                margin-bottom: 1rem;
            }

            .breadcrumb-item a {
                color: var(--accent-color);
                text-decoration: none;
            }

            .breadcrumb-item.active {
                color: var(--primary-color);
            }

            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                }
            }
        </style>
    </head>
    <body>
        <!-- Include the sidebar -->
        <jsp:include page="/admin/adminsidebar.jsp" />

        <div class="main-content">
            <div class="container-fluid p-4">
                <!-- Breadcrumb -->
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="categorylists">Danh sách danh mục</a></li>
                        <li class="breadcrumb-item active">Chi tiết danh mục</li>
                    </ol>
                </nav>

                <!-- Alerts -->
                <c:if test="${not empty param.message}">
                    <div class="alert alert-success alert-dismissible fade show">
                        <i class="fas fa-check-circle me-2"></i>${param.message}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                <c:if test="${not empty param.error}">
                    <div class="alert alert-danger alert-dismissible fade show">
                        <i class="fas fa-exclamation-circle me-2"></i>${param.error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <h2 class="page-title">
                    <i class="fas fa-folder-open me-2"></i>Chi tiết danh mục
                </h2>

                <!-- Category Details Card -->
                <div class="card" id="categoryForm">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <i class="fas fa-info-circle me-2"></i>Thông tin danh mục
                        </div>
                        <button onclick="toggleEdit()" class="btn btn-primary btn-sm" id="editButton">
                            <i class="fas fa-edit me-2"></i>Chỉnh sửa
                        </button>
                    </div>
                    <div class="card-body">
                        <form action="categorydetail" method="post">
                            <input type="hidden" name="id" value="${category.id}">
                            <div class="row">
                                <div class="col-md-6">
                                    <!-- Category Name -->
                                    <div class="mb-3">
                                        <div class="info-label">Tên danh mục</div>
                                        <div class="view-content">${category.name}</div>
                                        <div class="edit-content">
                                            <input type="text" name="name" class="form-control" 
                                                   value="${category.name}" required>
                                        </div>
                                    </div>

                                    <!-- Level -->
                                    <div class="mb-3">
                                        <div class="info-label">Cấp độ</div>
                                        <div class="view-content">Cấp ${category.level}</div>
                                        <div class="edit-content">
                                            <select name="parentId" class="form-select" id="parentCategory">
                                                <option value="">Không có (Danh mục cấp 1)</option>
                                                <c:forEach items="${potentialParents}" var="parent">
                                                    <c:if test="${parent.id != category.id}">
                                                        <option value="${parent.id}" 
                                                                ${parent.id == category.parentId ? 'selected' : ''}
                                                                data-level="${parent.level}">
                                                            <c:if test="${parent.level == 2}">
                                                            </c:if>
                                                            ${parent.name}
                                                            (Cấp ${parent.level})
                                                        </option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <!-- Status -->
                                    <div class="mb-3">
                                        <div class="info-label">Trạng thái</div>
                                        <div class="view-content">
                                            <span class="badge ${category.status == 'active' ? 'bg-success' : 'bg-danger'}">
                                                ${category.status == 'active' ? 'Hoạt động' : 'Không hoạt động'}
                                            </span>
                                        </div>
                                        <div class="edit-content">
                                            <select name="status" class="form-select">
                                                <option value="active" ${category.status == 'active' ? 'selected' : ''}>
                                                    Hoạt động
                                                </option>
                                                <option value="inactive" ${category.status == 'inactive' ? 'selected' : ''}>
                                                    Không hoạt động
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <!-- Parent Category -->
                                    <div class="mb-3">
                                        <div class="info-label">Danh mục cha</div>
                                        <div>
                                            <c:choose>
                                                <c:when test="${parentCategory != null}">
                                                    <a href="categorydetail?id=${parentCategory.id}" class="text-primary">
                                                        ${parentCategory.name}
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-muted">Danh mục gốc</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>

                                    <!-- Description -->
                                    <div class="mb-3">
                                        <div class="info-label">Mô tả</div>
                                        <div class="view-content">
                                            ${category.description != null && !category.description.trim().isEmpty() ? category.description : 'Không có mô tả'}
                                        </div>
                                        <div class="edit-content">
                                            <textarea name="description" class="form-control" rows="3">${category.description}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Save and Cancel buttons -->
                            <div class="edit-buttons mt-3">
                                <button type="submit" class="btn btn-success btn-sm">
                                    <i class="fas fa-save me-2"></i>Lưu thay đổi
                                </button>
                                <button type="button" class="btn btn-secondary btn-sm" onclick="cancelEdit()">
                                    <i class="fas fa-times me-2"></i>Hủy
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Child Categories Card -->
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-sitemap me-2"></i>Danh mục con
                    </div>
                    <div class="card-body p-0">
                        <c:choose>
                            <c:when test="${!empty childCategories}">
                                <div class="table-responsive">
                                    <table class="table table-hover table-bordered mb-0">
                                        <thead>
                                            <tr class="bg-light">
                                                <th class="text-center" style="width: 60px;">STT</th>
                                                <th>Tên danh mục</th>
                                                <th>Mô tả</th>
                                                <th>Trạng thái</th>
                                                <th class="text-center">Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${childCategories}" var="child" varStatus="status">
                                                <tr>
                                                    <td class="text-center">${status.index + 1}</td>
                                                    <td>${child.name}</td>
                                                    <td>${child.description}</td>
                                                    <td>
                                                        <span class="badge ${child.status == 'active' ? 'bg-success' : 'bg-danger'}">
                                                            ${child.status == 'active' ? 'Hoạt động' : 'Không hoạt động'}
                                                        </span>
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="categorydetail?id=${child.id}" class="btn btn-info btn-sm">
                                                            <i class="fas fa-eye"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="p-4 text-center text-muted">
                                    <i class="fas fa-info-circle me-2"></i>Không có danh mục con
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="mt-4">
                    <a href="categorylists" class="btn btn-secondary">
                        <i class="fas fa-arrow-left me-2"></i>Quay lại
                    </a>
                    <button onclick="deleteCategory(${category.id})" class="btn btn-danger">
                        <i class="fas fa-trash me-2"></i>Xóa
                    </button>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                        function toggleEdit() {
                            document.querySelector('#categoryForm').classList.add('editing');
                            document.getElementById('editButton').style.display = 'none';
                        }

                        function cancelEdit() {
                            document.querySelector('#categoryForm').classList.remove('editing');
                            document.getElementById('editButton').style.display = 'block';
                        }

                        function deleteCategory(categoryId) {
                            if (confirm('Bạn có chắc chắn muốn xóa danh mục này?')) {
                                window.location.href = 'categorydelete?id=' + categoryId;
                            }
                        }

                        // Highlight active menu item
                        $(document).ready(function () {
                            $('.menu-item').removeClass('active');
                            $('.menu-item a[href="categorylists"]').closest('.menu-item').addClass('active');
                        });
        </script>
    </body>
</html>