<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thêm danh mục</title>
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
            
            .form-label {
                font-weight: 500;
                color: var(--primary-color);
                margin-bottom: 8px;
            }
            
            .required-field::after {
                content: " *";
                color: red;
            }
            
            .form-control, .form-select {
                border-radius: 6px;
                border: 1px solid var(--border-color);
                padding: 10px 15px;
            }
            
            .form-text {
                color: #6c757d;
                font-size: 0.875rem;
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
                <h2 class="page-title">
                    <i class="fas fa-folder-plus me-2"></i>Thêm danh mục
                </h2>

                <!-- Alerts -->
                <c:if test="${not empty param.error}">
                    <div class="alert alert-danger alert-dismissible fade show">
                        <i class="fas fa-exclamation-circle me-2"></i>${param.error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                <c:if test="${not empty param.message}">
                    <div class="alert alert-success alert-dismissible fade show">
                        <i class="fas fa-check-circle me-2"></i>${param.message}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <!-- Add Category Form -->
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-plus-circle me-2"></i>Thông tin danh mục
                    </div>
                    <div class="card-body">
                        <form action="categoryadd" method="post" class="needs-validation" novalidate>
                            <div class="row">
                                <div class="col-md-6">
                                    <!-- Category Name -->
                                    <div class="mb-3">
                                        <label class="form-label required-field">Tên danh mục</label>
                                        <input type="text" name="name" class="form-control" required 
                                               placeholder="Nhập tên danh mục">
                                        <div class="invalid-feedback">
                                            Vui lòng nhập tên danh mục
                                        </div>
                                    </div>

                                    <!-- Parent Category -->
                                    <div class="mb-3">
                                        <label class="form-label">Danh mục cha</label>
                                        <select name="parentId" class="form-select" id="parentCategory">
                                            <option value="">Không có (Danh mục cấp 1)</option>
                                            <c:forEach items="${potentialParents}" var="parent">
                                                <option value="${parent.id}" data-level="${parent.level}">
                                                    <c:if test="${parent.level == 2}">
                                                       
                                                    </c:if>
                                                    ${parent.name}
                                                    <c:if test="${parent.level == 1}">
                                                        (Cấp 1)
                                                    </c:if>
                                                    <c:if test="${parent.level == 2}">
                                                        (Cấp 2)
                                                    </c:if>
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <div class="form-text">
                                            <i class="fas fa-info-circle me-1"></i>
                                            Cấp độ danh mục:<br>
                                            - Không chọn: tạo danh mục cấp 1<br>
                                            - Chọn danh mục cấp 1: tạo danh mục cấp 2<br>
                                            - Chọn danh mục cấp 2: tạo danh mục cấp 3
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <!-- Description -->
                                    <div class="mb-3">
                                        <label class="form-label">Mô tả</label>
                                        <textarea name="description" class="form-control" rows="3" 
                                                  placeholder="Nhập mô tả cho danh mục"></textarea>
                                    </div>

                                    <!-- Status -->
                                    <div class="mb-3">
                                        <label class="form-label">Trạng thái</label>
                                        <select name="status" class="form-select">
                                            <option value="active">Hoạt động</option>
                                            <option value="inactive">Không hoạt động</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <!-- Hidden level field -->
                            <input type="hidden" name="level" id="categoryLevel" value="1">

                            <!-- Form Actions -->
                            <div class="d-flex gap-2 mt-4">
                                <a href="categorylists" class="btn btn-secondary">
                                    <i class="fas fa-arrow-left me-2"></i>Quay lại
                                </a>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save me-2"></i>Thêm danh mục
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        
        <script>
            // Form validation
            (function () {
                'use strict'
                var forms = document.querySelectorAll('.needs-validation')
                Array.prototype.slice.call(forms).forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
            })()

            // Auto update level
            document.getElementById('parentCategory').addEventListener('change', function() {
                const selectedOption = this.options[this.selectedIndex];
                const levelInput = document.getElementById('categoryLevel');
                
                if (this.value === '') {
                    levelInput.value = 1;
                } else {
                    const parentLevel = parseInt(selectedOption.dataset.level);
                    levelInput.value = parentLevel + 1;
                }
            });

            // Highlight active menu item
            $(document).ready(function () {
                $('.menu-item').removeClass('active');
                $('.menu-item a[href="categorylists"]').closest('.menu-item').addClass('active');
            });
        </script>
    </body>
</html>