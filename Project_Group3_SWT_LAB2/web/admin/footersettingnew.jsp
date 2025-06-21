<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thêm cài đặt chân trang mới</title>
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
            
            .form-control, .form-select {
                border-radius: 6px;
                border: 1px solid var(--border-color);
                padding: 10px 15px;
                transition: all 0.3s;
            }
            
            .form-control:focus, .form-select:focus {
                border-color: var(--accent-color);
                box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.25);
            }
            
            .btn-action {
                border-radius: 6px;
                padding: 8px 20px;
                font-weight: 500;
                transition: all 0.3s;
            }
            
            .btn-primary {
                background-color: var(--accent-color);
                border-color: var(--accent-color);
            }
            
            .btn-primary:hover {
                background-color: #2980b9;
                border-color: #2980b9;
            }
            
            .btn-secondary {
                background-color: #95a5a6;
                border-color: #95a5a6;
            }
            
            .btn-secondary:hover {
                background-color: #7f8c8d;
                border-color: #7f8c8d;
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
            
            .preview-image {
                max-width: 200px;
                max-height: 200px;
                border-radius: 4px;
                border: 1px solid var(--border-color);
                margin-top: 10px;
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
            
            /* Ẩn phần chọn hình ảnh ban đầu */
            #imageSection {
                display: none;
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
                    <i class="fas fa-plus-circle me-2"></i>Thêm cài đặt chân trang mới
                </h2>
                
                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i>${error}
                    </div>
                </c:if>
                
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-edit me-2"></i>Thông tin cài đặt
                    </div>
                    <div class="card-body p-4">
                        <form action="${pageContext.request.contextPath}/admin/footer-settings/new" method="post" enctype="multipart/form-data">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="fieldName" class="form-label">
                                        <i class="fas fa-tag me-1"></i>Tên trường <span class="text-danger">*</span>
                                    </label>
                                    <input type="text" class="form-control" id="fieldName" name="fieldName" required 
                                           placeholder="Nhập tên trường">
                                    <div class="form-text text-muted">Tên hiển thị của trường trong chân trang</div>
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="value" class="form-label">
                                        <i class="fas fa-text-width me-1"></i>Giá trị <span class="text-danger">*</span>
                                    </label>
                                    <input type="text" class="form-control" id="value" name="value" required
                                           placeholder="Nhập giá trị">
                                    <div class="form-text text-muted">Giá trị hiển thị cho người dùng</div>
                                </div>
                            </div>
                            
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="type" class="form-label">
                                        <i class="fas fa-list-alt me-1"></i>Loại <span class="text-danger">*</span>
                                    </label>
                                    <select class="form-select" id="type" name="type" required onchange="toggleImageSection()">
                                        <option value="">-- Chọn loại --</option>
                                        <option value="info">Thông tin công ty</option>
                                        <option value="contact">Thông tin liên hệ</option>
                                        <option value="social">Liên kết nhanh</option>
                                    </select>
                                    <div class="form-text text-muted">Loại thông tin sẽ quyết định vị trí hiển thị</div>
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="status" class="form-label">
                                        <i class="fas fa-toggle-on me-1"></i>Trạng thái <span class="text-danger">*</span>
                                    </label>
                                    <select class="form-select" id="status" name="status" required>
                                        <option value="">-- Chọn trạng thái --</option>
                                        <option value="active">Active</option>
                                        <option value="inactive">Inactive</option>
                                    </select>
                                    <div class="form-text text-muted">Chỉ các mục Active mới hiển thị trên website</div>
                                </div>
                            </div>
                            
                            <div class="mb-4" id="imageSection">
                                <label for="image" class="form-label">
                                    <i class="fas fa-image me-1"></i>Hình ảnh (tùy chọn)
                                </label>
                                <input type="file" class="form-control" id="image" name="image" accept="image/*" onchange="previewImage(this)">
                                <div class="form-text text-muted">Hình ảnh icon cho liên kết nhanh (định dạng: JPG, PNG, GIF, WEBP)</div>
                                <div id="imagePreview"></div>
                            </div>
                            
                            <hr class="my-4">
                            
                            <div class="d-flex justify-content-end gap-3">
                                <a href="${pageContext.request.contextPath}/admin/footer-settings" class="btn btn-secondary btn-action">
                                    <i class="fas fa-times me-2"></i>Hủy
                                </a>
                                <button type="submit" class="btn btn-primary btn-action">
                                    <i class="fas fa-save me-2"></i>Lưu
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
                
                // Form validation enhancement
                $('form').on('submit', function(e) {
                    var valid = true;
                    
                    // Validate required fields
                    $(this).find('[required]').each(function() {
                        if ($(this).val().trim() === '') {
                            $(this).addClass('is-invalid');
                            valid = false;
                        } else {
                            $(this).removeClass('is-invalid');
                        }
                    });
                    
                    return valid;
                });
                
                // Reset validation on input
                $('input, select').on('input change', function() {
                    $(this).removeClass('is-invalid');
                });
                
                // Kiểm tra loại khi trang được tải
                toggleImageSection();
            });
            
            // Hàm hiển thị phần chọn hình ảnh khi loại là "social"
            function toggleImageSection() {
                const type = document.getElementById('type').value;
                const imageSection = document.getElementById('imageSection');
                
                if (type === 'social') {
                    imageSection.style.display = 'block';
                } else {
                    imageSection.style.display = 'none';
                    // Xóa file đã chọn khi chuyển sang loại khác
                    document.getElementById('image').value = '';
                    document.getElementById('imagePreview').innerHTML = '';
                }
            }
            
            // Hàm kiểm tra đuôi file
            function isValidImage(file) {
                const allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];
                return allowedTypes.includes(file.type);
            }
            
            // Xem trước ảnh
            function previewImage(input) {
                const preview = document.getElementById('imagePreview');
                preview.innerHTML = '';
                
                if (input.files && input.files[0]) {
                    const file = input.files[0];
                    if (!isValidImage(file)) {
                        alert('Chỉ chấp nhận file ảnh (JPG, PNG, GIF, WEBP).');
                        input.value = ''; // Xóa nội dung không phải ảnh
                        return;
                    }
                    
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        const img = document.createElement('img');
                        img.src = e.target.result;
                        img.className = 'preview-image';
                        preview.appendChild(img);
                    }
                    
                    reader.readAsDataURL(file);
                }
            }
        </script>
    </body>
</html>