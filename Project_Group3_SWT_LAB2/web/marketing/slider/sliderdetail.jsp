<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${slider.title} - Chi tiết thanh trượt</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <style>
            :root {
                --primary-color: #2c3e50;
                --secondary-color: #34495e;
                --accent-color: #3498db;
                --light-color: #ecf0f1;
                --border-color: #dee2e6;
            }

            body {
                background-color: #f8f9fa;
                font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            }

            .main-content {
                margin-left: 250px;
                transition: all 0.3s;
                padding: 20px;
                min-height: 100vh;
            }

            .card {
                border-radius: 10px;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            .card-header {
                background-color: #fff;
                border-bottom: 1px solid var(--border-color);
                padding: 15px 20px;
                font-weight: 600;
            }

            .slider-image {
                width: 100%;
                height: 300px;
                object-fit: cover;
                border-radius: 10px;
                margin-bottom: 1.5rem;
            }

            .form-control, .form-select {
                border-radius: 8px;
                padding: 0.75rem;
            }

            .btn {
                padding: 0.75rem 1.5rem;
                border-radius: 8px;
                font-weight: 500;
                transition: all 0.3s;
            }

            .btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
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

            .page-title {
                color: var(--primary-color);
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--accent-color);
                display: inline-block;
            }
        </style>
        <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
    </head>
    <body>
        <!-- Include the sidebar -->
        <jsp:include page="../sidebar.jsp" />
        
        <!-- Sidebar Toggle Button -->
        <button class="btn btn-primary sidebar-toggle">
            <i class="fas fa-bars"></i>
        </button>

        <div class="main-content">
            <div class="container-fluid">
                <h2 class="page-title">
                    <i class="fas fa-images me-2"></i>Chi tiết thanh trượt
                </h2>

                <c:if test="${error != null}">
                    <div class="alert alert-danger" role="alert">
                        ${error}
                    </div>
                </c:if>

                <div class="row">
                    <!-- Slider Preview Section -->
                    <div class="col-lg-6">
                        <div class="card h-100">
                            <div class="card-header">
                                <i class="fas fa-eye me-2"></i>Xem trước thanh trượt
                            </div>
                            <div class="card-body">
                                <img src="${slider.image_url.startsWith('https')? slider.image_url : pageContext.request.contextPath.concat('/').concat(slider.image_url)}" alt="${slider.title}" class="slider-image">
                                
                                <h3 class="mb-3">${slider.getTitle()}</h3>
                                <div class="mb-3">
                                    <p><strong>Liên kết:</strong> <a href="${slider.getLink()}" target="_blank">${slider.getLink()}</a></p>
                                    <p><strong>Thứ tự hiển thị:</strong> ${slider.getDisplay_order()}</p>
                                    <p><strong>Trạng thái:</strong> 
                                        <span class="badge ${slider.getStatus() == 'active' ? 'bg-success' : 'bg-secondary'}">
                                            ${slider.getStatus() == 'active' ? 'Hiển thị' : 'Ẩn'}
                                        </span>
                                    </p>
                                </div>
                                <div>
                                    <h5>Ghi chú:</h5>
                                    <p class="text-muted">${slider.getNotes()}</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Edit Form Section -->
                    <div class="col-lg-6">
                        <div class="card h-100">
                            <div class="card-header">
                                <i class="fas fa-pencil-alt me-2"></i>Chỉnh sửa thanh trượt
                            </div>
                            <div class="card-body">
                                <form method="POST" action="${pageContext.request.contextPath}/marketing/detailSlider" 
                                      enctype="multipart/form-data" class="needs-validation" novalidate>
                                    <input type="hidden" name="id" value="${slider.getId()}">

                                    <div class="mb-3">
                                        <label for="title" class="form-label fw-bold">Tiêu đề</label>
                                        <input type="text" class="form-control" id="title" name="title" 
                                               value="${slider.getTitle()}" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="image" class="form-label fw-bold">Hình ảnh</label>
                                        <input type="file" class="form-control" id="image" name="image" 
                                               accept="image/*">
                                        <input type="hidden" name="old_image" value="${slider.getImage_url()}">
                                    </div>

                                    <div class="mb-3">
                                        <label for="link" class="form-label fw-bold">Liên kết ngược</label>
                                        <input type="url" class="form-control" id="link" name="link" 
                                               value="${slider.getLink()}" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="display_order" class="form-label fw-bold">Thứ tự hiển thị</label>
                                        <input type="number" class="form-control" id="display_order" name="display_order" 
                                               value="${slider.getDisplay_order()}" required min="1">
                                    </div>

                                    <div class="mb-3">
                                        <label for="notes" class="form-label fw-bold">Ghi chú</label>
                                        <textarea class="form-control" id="notes" name="notes" 
                                                  rows="4">${slider.getNotes()}</textarea>
                                    </div>

                                    <div class="mb-4">
                                        <label for="status" class="form-label fw-bold">Trạng thái</label>
                                        <select class="form-select" id="status" name="status" required>
                                            <option value="active" ${slider.getStatus() == 'active' ? 'selected' : ''}>
                                                Hiển thị
                                            </option>
                                            <option value="inactive" ${slider.getStatus() == 'inactive' ? 'selected' : ''}>
                                                Ẩn
                                            </option>
                                        </select>
                                    </div>

                                    <div class="d-flex gap-2">
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fas fa-save me-2"></i>Lưu thay đổi
                                        </button>
                                        <a href="${pageContext.request.contextPath}/marketing/sliderList" class="btn btn-outline-secondary">
                                            <i class="fas fa-arrow-left me-2"></i>Quay lại
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        
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
                        if (!$(e.target).closest('.sidebar').length && 
                            !$(e.target).closest('.sidebar-toggle').length) {
                            $('.sidebar').removeClass('active');
                            $('.main-content').removeClass('active');
                            $('.sidebar-toggle').show();
                        }
                    }
                });

                // Highlight the current menu item
                $('.menu-item').removeClass('active');
                $('.menu-item a[href="sliderList"]').closest('.menu-item').addClass('active');
                
                // Form validation
                (function () {
                    'use strict'
                    var forms = document.querySelectorAll('.needs-validation')
                    Array.prototype.slice.call(forms)
                        .forEach(function (form) {
                            form.addEventListener('submit', function (event) {
                                if (!form.checkValidity()) {
                                    event.preventDefault()
                                    event.stopPropagation()
                                }
                                form.classList.add('was-validated')
                            }, false)
                        })
                })()
            });
            // Initialize CKEditor
            CKEDITOR.replace('notes', {
    filebrowserUploadUrl: '${pageContext.request.contextPath}/upload',
    filebrowserUploadMethod: 'form',
    height: 400
});
        </script>
    </body>
</html>