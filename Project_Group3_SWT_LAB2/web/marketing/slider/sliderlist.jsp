<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Slider Management</title>
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
            
            .slider-image {
                width: 120px;
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
            
            .badge-active {
                background-color: #2ecc71;
                color: white;
            }
            
            .badge-inactive {
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

        <div class="main-content">
            <div class="container-fluid p-4">
                <h2 class="page-title">
                    <i class="fas fa-images me-2"></i>Quản lý thanh trượt
                </h2>
                
                <!-- Filter Section -->
                <div class="card filter-card">
                    <div class="card-header">
                        <i class="fas fa-filter me-2"></i>Bộ lọc tìm kiếm
                    </div>
                    <div class="card-body">
                        <form method="get" action="${pageContext.request.contextPath}/marketing/sliderList" class="row g-3 align-items-center">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <span class="input-group-text bg-white">
                                        <i class="fas fa-search text-muted"></i>
                                    </span>
                                    <input type="text" name="search" class="form-control" placeholder="Nhập tiêu đề..." value="${param.search}">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <select name="status" class="form-select">
                                    <option value="">Tất cả trạng thái</option>
                                    <option value="active" ${param.status == 'active' ? 'selected' : ''}>Hiển thị</option>
                                    <option value="inactive" ${param.status == 'inactive' ? 'selected' : ''}>Ẩn</option>
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

                <!-- Sliders Table -->
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <i class="fas fa-list me-2"></i>Danh sách thanh trượt
                        </div>
                        <a href="${pageContext.request.contextPath}/marketing/addSlider" class="btn btn-primary">
                            <i class="fas fa-plus me-2"></i>Thêm thanh trượt mới
                        </a>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered mb-0">
                                <thead>
                                    <tr class="bg-light">
                                        <th class="text-center" style="width: 60px;">STT</th>
                                        <th class="text-center" style="width: 150px;">Hình ảnh</th>
                                        <th>Tiêu đề</th>
                                        <th>Liên kết ngược</th>
                                        <th class="text-center" style="width: 100px;">Thứ tự</th>
                                        <th class="text-center">Trạng thái</th>
                                        <th class="text-center" style="width: 150px;">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty sliders}">
                                            <c:forEach var="slider" items="${sliders}" varStatus="status">
                                                <tr>
                                                    <td class="text-center">${(currentPage - 1) * pageSize + status.index + 1}</td>                                                  
                                                    <td class="text-center">
                                                        <img src="${slider.image_url.startsWith('https')? slider.image_url : pageContext.request.contextPath.concat('/').concat(slider.image_url)}" alt="${slider.title}" class="slider-image">
                                                    </td>
                                                    <td>${slider.title}</td>
                                                    <td>${slider.link}</td>
                                                    <td class="text-center">${slider.display_order}</td>
                                                    <td class="text-center">
                                                        <span class="badge-status ${slider.status == 'active' ? 'badge-active' : 'badge-inactive'}">
                                                            ${slider.status == 'active' ? 'Hiển thị' : 'Ẩn'}
                                                        </span>
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="${pageContext.request.contextPath}/marketing/detailSlider?id=${slider.id}" 
                                                           class="btn btn-primary btn-sm action-btn me-1" 
                                                           title="Chỉnh sửa">
                                                            <i class="fas fa-edit"></i>
                                                        </a>
                                                        <button type="button" 
                                                                class="btn btn-danger btn-sm action-btn"
                                                                onclick="deleteSlider(${slider.id})"
                                                                title="Xóa">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="7" class="empty-state">
                                                    <i class="fas fa-images fa-3x mb-3"></i>
                                                    <p>Không tìm thấy slider nào. Vui lòng thử lại với điều kiện tìm kiếm khác.</p>
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
                <div class="d-flex justify-content-between align-items-center mt-3">
                    <div class="text-muted small">
                        Hiển thị ${sliders.size()} / ${totalItems} thanh trượt
                    </div>
                    
                    <nav>
                        <ul class="pagination mb-0">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/marketing/sliderList?page=${currentPage-1}&search=${param.search}&status=${param.status}">
                                        <i class="fas fa-chevron-left"></i>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="${pageContext.request.contextPath}/marketing/sliderList?page=${i}&search=${param.search}&status=${param.status}">${i}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/marketing/sliderList?page=${currentPage+1}&search=${param.search}&status=${param.status}">
                                        <i class="fas fa-chevron-right"></i>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

        <!-- Delete Confirmation Modal -->
        <div class="modal fade" id="deleteModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Xác nhận xóa</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        Bạn có chắc chắn muốn xóa slider này không?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button type="button" class="btn btn-danger" id="confirmDelete">Xóa</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        
        <script>
            let deleteId = null;
            const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
            
            function deleteSlider(id) {
                deleteId = id;
                deleteModal.show();
            }
            
            document.getElementById('confirmDelete').addEventListener('click', function() {
                if (deleteId) {
                    window.location.href = '${pageContext.request.contextPath}/marketing/deleteSlider?id=' + deleteId;
                }
            });
            
            // Highlight active menu item
            document.addEventListener('DOMContentLoaded', function() {
                const menuItems = document.querySelectorAll('.menu-item');
                menuItems.forEach(item => item.classList.remove('active'));
                document.querySelector('.menu-item a[href*="slider"]')?.closest('.menu-item').classList.add('active');
            });
        </script>
    </body>
</html>