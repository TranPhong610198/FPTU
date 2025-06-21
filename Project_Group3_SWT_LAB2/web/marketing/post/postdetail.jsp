<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${post.title} - Chi tiết bài đăng</title>
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

            /* Main content styles */
            .main-content {
                margin-left: 250px;
                transition: all 0.3s;
                padding: 20px;
                min-height: 100vh;
            }

            .post-header {
                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
                color: white;
                padding: 3rem 0;
                margin-bottom: 2rem;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
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

            .post-thumbnail {
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

            /* Sidebar toggle button */
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

            /* Responsive styles */
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
                    <i class="fas fa-edit me-2"></i>Chi tiết bài đăng
                </h2>

                <c:if test="${error != null}">
                    <div class="alert alert-danger" role="alert">
                        ${error}
                    </div>
                </c:if>

                <div class="row">
                    <!-- Post Preview Section -->
                    <div class="col-lg-6">
                        <div class="card h-100">
                            <div class="card-header">
                                <i class="fas fa-eye me-2"></i>Xem trước bài đăng
                            </div>
                            <div class="card-body">
                                <img src="${post.getThumbnail().contains('https')? post.getThumbnail() : pageContext.request.contextPath.concat('/').concat(post.getThumbnail())}" alt="${post.getTitle()}" class="post-thumbnail">
                                <h3 class="mb-3">${post.getTitle()}</h3>
                                <div class="mb-3">
                                    <small class="text-muted">
                                        <i class="fas fa-user me-2"></i>${post.getUser().getFullName()}
                                        <i class="fas fa-clock ms-3 me-2"></i>${post.getCreatedAt()}
                                        <c:if test="${post.getUpdatedAt() != null}">
                                            <i class="fas fa-edit ms-3 me-2"></i>Cập nhật: ${post.getUpdatedAt()}
                                        </c:if>
                                    </small>
                                </div>
                                <div class="mb-4">
                                    <h5>Thông tin tóm tắt:</h5>
                                    <p class="text-muted">${post.getSummary()}</p>
                                </div>
                                <div>
                                    <h5>Nội dung:</h5>
                                    <div class="content">${post.getContent()}</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Edit Form Section -->
                    <div class="col-lg-6">
                        <div class="card h-100">
                            <div class="card-header">
                                <i class="fas fa-pencil-alt me-2"></i>Chỉnh sửa bài đăng
                            </div>
                            <div class="card-body">
                                <form method="POST" action="${pageContext.request.contextPath}/marketing/detailPost" 
                                      enctype="multipart/form-data" class="needs-validation" novalidate>
                                    <input type="hidden" name="id" value="${post.getId()}">

                                    <div class="mb-3">
                                        <label for="title" class="form-label fw-bold">Tiêu đề</label>
                                        <input type="text" class="form-control" id="title" name="title" 
                                               value="${post.getTitle()}" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="thumbnail" class="form-label fw-bold">Ảnh bìa</label>
                                        <input type="file" class="form-control" id="thumbnail" name="thumbnail" 
                                               accept="image/*">
                                        <input type="hidden" name="old_thumbnail" value="${post.getThumbnail()}">
                                    </div>

                                    <div class="mb-3">
                                        <label for="summary" class="form-label fw-bold">Thông tin tóm tắt</label>
                                        <textarea class="form-control" id="summary" name="summary" 
                                                  rows="3" required>${post.getSummary()}</textarea>
                                    </div>

                                    <div class="mb-3">
                                        <label for="content" class="form-label fw-bold">Nội dung</label>
                                        <textarea class="form-control" id="content" name="content" 
                                                  rows="6" required>${post.getContent()}</textarea>
                                    </div>

                                    <div class="mb-4">
                                        <label for="status" class="form-label fw-bold">Trạng thái</label>
                                        <select class="form-select" id="status" name="status" required>
                                            <option value="published" ${post.getStatus() == 'published' ? 'selected' : ''}>
                                                Đã xuất bản
                                            </option>
                                            <option value="draft" ${post.getStatus() == 'draft' ? 'selected' : ''}>
                                                Bản thảo
                                            </option>
                                        </select>
                                    </div>
                                                
                                            <div class="mb-3 form-check">
                                                <input type="checkbox" class="form-check-input" id="isFeatured" name="isFeatured" 
                                                       ${post.isIsFeatured() ? 'checked' : ''}>
                                                <label class="form-check-label fw-bold" for="isFeatured">
                                                    <i class="fas fa-star text-warning me-2"></i>Đánh dấu là bài viết nổi bật
                                                </label>
                                            </div>            

                                    <div class="d-flex gap-2">
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fas fa-save me-2"></i>Lưu thay đổi
                                        </button>
                                        <a href="javascript:history.back()" class="btn btn-outline-secondary">
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
                $('.menu-item a[href="postList"]').closest('.menu-item').addClass('active');
                
                // Open content submenu by default
                $('#contentSubmenu').addClass('show');
            });

            // Initialize CKEditor
            CKEDITOR.replace('content', {
                filebrowserUploadUrl: '${pageContext.request.contextPath}/upload',
                filebrowserUploadMethod: 'form',
                height: 400
            });
        </script>
    </body>
</html>