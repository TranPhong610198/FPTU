<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create New Slider</title>
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
                padding: 8px 12px;
            }
            
            .form-control:focus, .form-select:focus {
                border-color: var(--accent-color);
                box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
            }
            
            .preview-image {
                max-width: 200px;
                max-height: 200px;
                object-fit: cover;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                margin-top: 10px;
            }
            
            .btn-submit {
                background-color: var(--accent-color);
                border: none;
                padding: 10px 20px;
                font-weight: 500;
                transition: all 0.3s;
            }
            
            .btn-submit:hover {
                background-color: #2980b9;
                transform: translateY(-2px);
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }
            
            .btn-cancel {
                background-color: #95a5a6;
                border: none;
                padding: 10px 20px;
                font-weight: 500;
                transition: all 0.3s;
            }
            
            .btn-cancel:hover {
                background-color: #7f8c8d;
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
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }
            }
        </style>
        <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
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
                    <i class="fas fa-images me-2"></i>Thêm thanh trượt mới
                </h2>
                
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-pen me-2"></i>Thông tin thanh trượt
                    </div>
                    <div class="card-body">
                        <c:if test="${error != null}">
                            <div class="alert alert-danger" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i>${error}
                            </div>
                        </c:if>

                        <form method="post" action="${pageContext.request.contextPath}/marketing/addSlider" 
                              enctype="multipart/form-data" class="row g-3">
                            <input type="hidden" name="action" value="create">

                            <div class="col-md-12">
                                <label for="title" class="form-label">Tiêu đề</label>
                                <input type="text" class="form-control" id="title" name="title" required>
                            </div>

                            <div class="col-md-12">
                                <label for="image_url" class="form-label">Hình ảnh</label>
                                <input type="file" class="form-control" id="image_url" name="image_url" 
                                       accept="image/*" required onchange="previewImage(this)">
                                <img id="image-preview" class="preview-image mt-2" style="display: none;">
                            </div>

                            <div class="col-md-12">
                                <label for="link" class="form-label">Liên kết ngược</label>
                                <input type="url" class="form-control" id="link" name="link" 
                                       placeholder="https://example.com" required>
                            </div>

                            <div class="col-md-6">
                                <label for="display_order" class="form-label">Thứ tự hiển thị</label>
                                <input type="number" class="form-control" id="display_order" 
                                       name="display_order" min="1" required>
                            </div>

                            <div class="col-md-6">
                                <label for="status" class="form-label">Trạng thái</label>
                                <select class="form-select" id="status" name="status" required>
                                    <option value="active">Hiển thị</option>
                                    <option value="inactive">Ẩn</option>
                                </select>
                            </div>

                            <div class="col-md-12">
                                <label for="notes" class="form-label">Ghi chú</label>
                                <textarea class="form-control" id="notes" name="notes" rows="3"></textarea>
                            </div>

                            <div class="col-12 mt-4">
                                <div class="d-flex justify-content-end gap-2">
                                    <a href="javascript:history.back()" class="btn btn-secondary btn-cancel">
                                        <i class="fas fa-times me-2"></i>Quay lại
                                    </a>
                                    <button type="submit" class="btn btn-primary btn-submit">
                                        <i class="fas fa-save me-2"></i>Lưu thanh trượt
                                    </button>
                                </div>
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
                        if (!$(e.target).closest('.sidebar').length && 
                            !$(e.target).closest('.sidebar-toggle').length) {
                            $('.sidebar').removeClass('active');
                            $('.main-content').removeClass('active');
                            $('.sidebar-toggle').show();
                        }
                    }
                });
                
                // Highlight the slider menu item
                $('.menu-item').removeClass('active');
                $('.menu-item a[href="sliderList"]').closest('.menu-item').addClass('active');
            });
            
            // Image preview functionality
            function previewImage(input) {
                const preview = document.getElementById('image-preview');
                if (input.files && input.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        preview.src = e.target.result;
                        preview.style.display = 'block';
                    }
                    reader.readAsDataURL(input.files[0]);
                } else {
                    preview.style.display = 'none';
                }
            }
            // Initialize CKEditor
            CKEDITOR.replace('notes', {
    filebrowserUploadUrl: '${pageContext.request.contextPath}/upload',
    filebrowserUploadMethod: 'form',
    height: 400
});
        </script>
    </body>
</html>