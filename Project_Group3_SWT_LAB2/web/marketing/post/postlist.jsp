<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Blog Posts Management</title>
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
            
            .post-image {
                width: 60px;
                height: 60px;
                object-fit: cover;
                border-radius: 4px;
                border: 1px solid var(--border-color);
            }
            
            .badge-status {
                padding: 5px 10px;
                border-radius: 50px;
                font-weight: 500;
            }
            
            .badge-published {
                background-color: #2ecc71;
                color: white;
            }
            
            .badge-draft {
                background-color: #95a5a6;
                color: white;
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
            
            .empty-state {
                padding: 40px;
                text-align: center;
                color: #6c757d;
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
                <h2 class="page-title">
                    <i class="fas fa-newspaper me-2"></i>Quản lý bài đăng
                </h2>
                
                <!-- Filter Section -->
                <div class="card filter-card">
                    <div class="card-header">
                        <i class="fas fa-filter me-2"></i>Bộ lọc tìm kiếm
                    </div>
                    <div class="card-body">
                        <form method="get" action="${pageContext.request.contextPath}/marketing/postList" class="row g-3 align-items-center">
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-text bg-white">
                                        <i class="fas fa-search text-muted"></i>
                                    </span>
                                    <input type="text" name="search" class="form-control" placeholder="Nhập tiêu đề..." value="${param.search}">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <select name="authorId" class="form-select">
                                    <option value="0">Tất cả tác giả</option>
                                    <c:forEach var="author" items="${authors}">
                                        <option value="${author.id}" ${param.authorId == author.id ? 'selected' : ''}>${author.role}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <select name="status" class="form-select">
                                    <option value="">Tất cả trạng thái</option>
                                    <option value="published" ${param.status == 'published' ? 'selected' : ''}>Đã xuất bản</option>
                                    <option value="draft" ${param.status == 'draft' ? 'selected' : ''}>Bản thảo</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <button type="submit" class="btn btn-primary w-100">
                                    <i class="fas fa-filter me-2"></i>Lọc
                                </button>
                            </div>
                        </form>
                    </div>
                </div>


                <!-- Posts Table -->
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <i class="fas fa-list me-2"></i>Danh sách bài đăng
                        </div>
                        <a href="${pageContext.request.contextPath}/marketing/addPost" class="btn btn-primary">
                            <i class="fas fa-plus me-2"></i>Thêm bài mới
                        </a>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered mb-0">
                                <thead>
                                    <tr class="bg-light">
                                        <th class="text-center" style="width: 60px;">STT</th>
                                        <th style="width: 100px;">Hình ảnh</th>
                                        <th>Tiêu đề</th>
                                        <th>Tác giả</th>
                                        <th>Ngày tạo</th>
                                        <th class="text-center">Trạng thái</th>
                                        <th class="text-center">Nổi bật</th>
                                        <th class="text-center" style="width: 150px;">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty posts}">
                                            <c:forEach var="post" items="${posts}" varStatus="status">
                                                <tr>
                                                    <td class="text-center">${(currentPage - 1) * 10 + status.index + 1}</td>
                                                    <td class="text-center">
                                                        <img src="${post.getThumbnail().contains('https')? post.getThumbnail() : pageContext.request.contextPath.concat('/').concat(post.getThumbnail())}" alt="${post.getTitle()}" class="post-image">
                                                    </td>
                                                    <td>${post.getTitle()}</td>
                                                    <td>${post.getUser().getFullName()}</td>
                                                    <td>${post.getCreatedAt()}</td>
                                                    <td class="text-center">
                                                        <span class="badge-status ${post.getStatus() == 'published' ? 'badge-published' : 'badge-draft'}">
                                                            ${post.getStatus() == 'published' ? 'Đã xuất bản' : 'Bản thảo'}
                                                        </span>
                                                    </td>
                                                    <td class="text-center">
                                                        <i class="fas ${post.isIsFeatured() ? 'fa-star text-warning' : 'fa-star text-muted'}"></i>
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="${pageContext.request.contextPath}/marketing/detailPost?id=${post.getId()}" 
                                                           class="btn btn-primary btn-sm action-btn me-1">
                                                            <i class="fas fa-edit"></i>
                                                        </a>
                                                        <a href="${pageContext.request.contextPath}/marketing/deletePost?id=${post.getId()}" 
                                                           class="btn btn-danger btn-sm action-btn"
                                                           onclick="return confirm('Bạn có chắc chắn muốn xóa bài đăng này?');">
                                                            <i class="fas fa-trash"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="8" class="empty-state">
                                                    <i class="fas fa-newspaper fa-3x mb-3"></i>
                                                    <p>Không tìm thấy bài đăng nào. Vui lòng thử lại với điều kiện tìm kiếm khác.</p>
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
                <!-- Hiển thị số bài đăng (vẫn nằm bên trái) -->
                <!-- Pagination -->
                <div class="d-flex justify-content-between align-items-center mt-3">
                    <div class="text-muted small">
                        Hiển thị ${posts.size()} / ${totalItems} bài đăng
                    </div>
                    <nav>
                        <ul class="pagination">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/marketing/postList?page=${currentPage-1}&search=${param.search}&authorId=${param.authorId}&status=${param.status}" aria-label="Previous">
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
                                            <a class="page-link" href="${pageContext.request.contextPath}/marketing/postList?page=${i}&search=${param.search}&authorId=${param.authorId}&status=${param.status}">${i}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/marketing/postList?page=${currentPage+1}&search=${param.search}&authorId=${param.authorId}&status=${param.status}" aria-label="Next">
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
                
                // Since blog posts are part of content management, highlight that menu item
                $('.menu-item').removeClass('active');
                $('.menu-item a[href="postList"]').closest('.menu-item').addClass('active');
                
                // Open content submenu by default
                $('#contentSubmenu').addClass('show');
                
                // Initialize tooltips
                var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                  return new bootstrap.Tooltip(tooltipTriggerEl)
                });
                
                // Confirm delete action
                $('.btn-delete').on('click', function(e) {
                    return confirm('Bạn có chắc chắn muốn xóa bài đăng này không?');
                });
            });
        </script>
    </body>
</html>