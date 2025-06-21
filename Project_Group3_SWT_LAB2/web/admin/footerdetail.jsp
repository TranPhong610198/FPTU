<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi tiết cài đặt chân trang</title>
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

            .form-label {
                font-weight: 500;
                color: var(--primary-color);
            }

            .form-control:focus, .form-select:focus {
                border-color: var(--accent-color);
                box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.25);
            }

            .required::after {
                content: "*";
                color: red;
                margin-left: 4px;
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

            .action-buttons {
                display: flex;
                justify-content: center;
                gap: 30px;
                margin-top: 30px;
            }

            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                }
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
                    <i class="fas fa-edit me-2"></i>Chi tiết cài đặt chân trang
                </h2>

                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">
                                <i class="fas fa-cog me-2"></i>Thông tin cài đặt
                            </div>
                            <div class="card-body">
                                <c:if test="${not empty error}">
                                    <div class="alert alert-danger" role="alert">
                                        <i class="fas fa-exclamation-circle me-2"></i>${error}
                                    </div>
                                </c:if>

                                <form action="${pageContext.request.contextPath}/admin/footer-settings/edit" 
                                      method="post" class="needs-validation" novalidate
                                      enctype="multipart/form-data">
                                    <input type="hidden" name="id" value="${footer.id}">

                                    <div class="mb-4">
                                        <label for="fieldName" class="form-label required">Tên trường</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light">
                                                <i class="fas fa-tag text-muted"></i>
                                            </span>
                                            <input type="text" class="form-control" id="fieldName" 
                                                   name="fieldName" value="${footer.fieldName}" required>
                                        </div>
                                        <div class="invalid-feedback">
                                            Vui lòng nhập tên trường
                                        </div>
                                    </div>

                                    <div class="mb-4">
                                        <label for="value" class="form-label required">Giá trị</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light">
                                                <i class="fas fa-keyboard text-muted"></i>
                                            </span>
                                            <input type="text" class="form-control" id="value" 
                                                   name="value" value="${footer.value}" required>
                                        </div>
                                        <div class="invalid-feedback">
                                            Vui lòng nhập giá trị
                                        </div>
                                    </div>

                                    <div class="mb-4">
                                        <label for="type" class="form-label required">Loại</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light">
                                                <i class="fas fa-list-alt text-muted"></i>
                                            </span>
                                            <select class="form-select" id="type" name="type" required>                                            
                                                <option value="info" ${footer.type == 'info' ? 'selected' : ''}>Thông tin công ty</option>
                                                <option value="contact" ${footer.type == 'contact' ? 'selected' : ''}>Thông tin liên hệ</option>
                                                <option value="social" ${footer.type == 'social' ? 'selected' : ''}>Liên kết nhanh</option>
                                            </select>
                                        </div>
                                        <div class="invalid-feedback">
                                            Vui lòng chọn loại
                                        </div>
                                    </div>

                                    <div class="mb-4">
                                        <label class="form-label required">Trạng thái</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light">
                                                <i class="fas fa-toggle-on text-muted"></i>
                                            </span>
                                            <select class="form-select" id="status" name="status" required>
                                                <option value="active" ${footer.status == 'active' ? 'selected' : ''}>Hoạt động</option>
                                                <option value="inactive" ${footer.status == 'inactive' ? 'selected' : ''}>Không hoạt động</option>
                                            </select>
                                        </div>
                                        <div class="invalid-feedback">
                                            Vui lòng chọn trạng thái
                                        </div>
                                    </div>

                                    <div class="mb-4" id="imageField" style="display: none;">
                                        <label for="image" class="form-label">Icon</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light">
                                                <i class="fas fa-image text-muted"></i>
                                            </span>
                                            <input type="file" class="form-control" id="image" 
                                                   name="image" accept="image/*" onchange="previewImage(this)">
                                        </div>
                                        <div class="form-text text-muted">
                                            <i class="fas fa-info-circle me-1"></i>
                                            Chọn icon cho liên kết nhanh (nếu có)
                                        </div>
                                        <div id="imagePreview" class="mt-2"></div>
                                        <!-- Hiển thị ảnh hiện tại nếu có -->
                                        <c:if test="${not empty footer.image}">
                                            <div class="mt-2">
                                                <p class="form-text">Icon hiện tại:</p>
                                                <img src="${pageContext.request.contextPath}/${footer.image}" 
                                                     alt="Current Icon" style="max-width: 100px; max-height: 100px;" class="border">
                                                <input type="hidden" name="currentImage" value="${footer.image}">
                                            </div>
                                        </c:if>
                                    </div>

                                    <div class="action-buttons">
                                        <a href="${pageContext.request.contextPath}/admin/footer-settings" 
                                           class="btn btn-secondary">
                                            <i class="fas fa-arrow-left me-2"></i>Quay lại
                                        </a>
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fas fa-save me-2"></i>Lưu thay đổi
                                        </button>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                                                       $(document).ready(function () {
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

                                                           // Show/hide image field based on type selection
                                                           $('#type').change(function () {
                                                               if ($(this).val() === 'social') {
                                                                   $('#imageField').show();
                                                               } else {
                                                                   $('#imageField').hide();
                                                               }
                                                           });

                                                           // Trigger change event on page load
                                                           $('#type').trigger('change');

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
                                                       });
                                                       // Xem trước ảnh icon
                                                       function previewImage(input) {
                                                           const preview = document.getElementById('imagePreview');
                                                           preview.innerHTML = '';

                                                           if (input.files && input.files[0]) {
                                                               const file = input.files[0];
                                                               if (!isValidImage(file)) {
                                                                   alert('Chỉ chấp nhận file ảnh (JPG, PNG, GIF, WEBP).');
                                                                   input.value = ''; // xóa nội dung không phải ảnh
                                                                   return;
                                                               }

                                                               const reader = new FileReader();
                                                               reader.onload = function (e) {
                                                                   const img = document.createElement('img');
                                                                   img.src = e.target.result;
                                                                   img.style.maxWidth = '100px';
                                                                   img.style.maxHeight = '100px';
                                                                   img.className = 'border mt-2';
                                                                   preview.appendChild(img);
                                                               }

                                                               reader.readAsDataURL(input.files[0]);
                                                           }
                                                       }

// Hàm kiểm tra đuôi file
                                                       function isValidImage(file) {
                                                           const allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];
                                                           return allowedTypes.includes(file.type);
                                                       }
        </script>
    </body>
</html>