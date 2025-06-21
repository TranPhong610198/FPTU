<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Management</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
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

            .sort-link {
                text-decoration: none;
                color: var(--primary-color);
                font-weight: 600;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .sort-link:hover {
                color: var(--accent-color);
            }

            .sort-icons {
                margin-left: 5px;
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

            .product-thumbnail {
                width: 80px;
                height: 80px;
                object-fit: cover;
                border-radius: 4px;
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

            .action-btn {
                padding: 5px 15px;
                border-radius: 4px;
                transition: all 0.3s;
            }

            .action-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .search-box {
                border-radius: 50px;
                padding-left: 15px;
                border: 1px solid var(--border-color);
            }

            .search-btn {
                border-radius: 50px;
                padding: 8px 20px;
            }

            .filter-card {
                background-color: white;
                border-radius: 8px;
                margin-bottom: 20px;
            }

            .page-title {
                color: var(--primary-color);
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--accent-color);
                display: inline-block;
            }

            .empty-state {
                padding: 40px;
                text-align: center;
                color: #6c757d;
            }

            .combo-product {
                background-color: rgba(52, 152, 219, 0.05);
                border-left: 4px solid var(--accent-color);
            }

            .combo-product td {
                padding: 15px 10px;
            }

            .combo-badge {
                background-color: var(--accent-color);
                color: white;
                padding: 4px 8px;
                border-radius: 4px;
                font-size: 0.8rem;
                margin-right: 8px;
            }

            .status-badge {
                padding: 5px 10px;
                border-radius: 50px;
                font-weight: 500;
                color: white;
            }

            .stock-link {
                color: var(--accent-color);
                text-decoration: none;
                font-weight: 500;
            }

            .stock-link:hover {
                text-decoration: underline;
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

            
            /* Ô input chính */
            .select2-container--default .select2-selection--single {
                height: 38px;
                padding: 5px 15px;
            }

            /* Mũi tên dropdown */
            .select2-container--default .select2-selection--single .select2-selection__arrow {
                height: 38px;
                right: 10px;
            }

            /* Placeholder */
            .select2-container--default .select2-selection--single .select2-selection__placeholder {
                color: #6c757d;
            }

            /* Khi focus */
            .select2-container--default.select2-container--focus .select2-selection--single {
                border-color: var(--accent-color);
                box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
            }

            /* Dropdown kết quả */
            .select2-container--default .select2-dropdown {
                border: 1px solid var(--border-color);
                border-radius: 0px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                background-color: #fff;
                margin-top: 5px;
            }

            /* Option trong dropdown */
            .select2-container--default .select2-results__option {
                padding: 8px 15px;
                color: var(--primary-color);
            }

            /* Option khi hover */
            .select2-container--default .select2-results__option--highlighted[aria-selected] {
                background-color: var(--hover-color);
                color: var(--primary-color);
            }


            /* Ô tìm kiếm trong dropdown */
            .select2-container--default .select2-search--dropdown .select2-search__field {
                border: 1px solid var(--border-color);
                border-radius: 10px;
                padding: 5px 15px;
            }

            /* Xóa lựa chọn (nút x) */
            .select2-container--default .select2-selection--single .select2-selection__clear {
                color: var(--accent-color);
                font-weight: bold;
                margin-right: 10px;
            }
            
            /* Tăng chiều cao tối đa của dropdown */
            .select2-container--default .select2-results > .select2-results__options {
                max-height: 400px; 
                overflow-y: auto; 
            }

            /* Đảm bảo dropdown không bị cắt */
            .select2-container--default .select2-dropdown {
                max-height: none; /* Loại bỏ giới hạn chiều cao của container dropdown */
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
                <c:if test="${alert != null && !alert.trim().isEmpty()}">
                    <c:choose>
                        <c:when test="${alert.equals('ER1_OP')}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                Sản phẩm đang có trong đơn hàng chưa hoàn thành.
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                        <c:when test="${alert.equals('ER2_HS')}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                Sản phẩm còn tồn kho.
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                        <c:when test="${alert.equals('ER1_IVImg')}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                Chỉ chấp nhận file ảnh (JPG, PNG, GIF, WEBP).
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                        <c:when test="${alert.equals('ERR')}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                Lỗi không xác định.
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                        <c:when test="${alert.equals('SSD')}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                Xóa sản phẩm thành công
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                        <c:when test="${alert.equals('SSA')}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                Thêm sản phẩm thành công
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                        <c:when test="${alert.equals('SSU')}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                Sửa sản phẩm thành công
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                        <c:when test="${alert.equals('ER1_FULL')}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                Không thể thêm ảnh mới vì đã đạt tối đa 5 ảnh phụ.
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                    </c:choose>
                </c:if>
                <h2 class="page-title">
                    <i class="fas fa-box me-2"></i>Danh sách sản phẩm
                </h2>

                <!-- Filter Section -->
                <div class="card filter-card">
                    <div class="card-header">
                        <i class="fas fa-filter me-2"></i>Bộ lọc tìm kiếm
                    </div>
                    <div class="card-body">
                        <form action="productlist" method="GET" class="row g-3">
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-text bg-white">
                                        <i class="fas fa-search text-muted"></i>
                                    </span>
                                    <input type="text" name="keyword" value="${keyword}" class="form-control search-box" placeholder="Tìm kiếm sản phẩm...">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <select name="categoryId" class="form-select select2">
                                    <option value="">📑 Tất cả danh mục</option>
                                    <c:forEach items="${categories}" var="category">
                                        <c:choose>
                                            <%-- Level 1 categories (parent categories) --%>
                                            <c:when test="${category.level == 1}">
                                                <option value="${category.id}" ${categoryId == category.id ? 'selected' : ''}>
                                                    🛍 ${category.name}
                                                </option>
                                                <%-- Display child categories --%>
                                                <c:forEach items="${categories}" var="childCat">
                                                    <c:if test="${childCat.parentId == category.id}">
                                                        <option value="${childCat.id}" ${categoryId == childCat.id ? 'selected' : ''}>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;🧷 ${childCat.name}
                                                        </option>
                                                        <%-- Display grandchild categories if any --%>
                                                        <c:forEach items="${categories}" var="grandChildCat">
                                                            <c:if test="${grandChildCat.parentId == childCat.id}">
                                                                <option value="${grandChildCat.id}" ${categoryId == grandChildCat.id ? 'selected' : ''}>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;⤷ ${grandChildCat.name}
                                                                </option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <select name="status" class="form-select">
                                    <option value="all">Tất cả trạng thái</option>
                                    <option value="active" ${status == 'active' ? 'selected' : ''}>Đang bán</option>
                                    <option value="inactive" ${status == 'inactive' ? 'selected' : ''}>Ngưng bán</option>
                                    <option value="EOStock" ${status == 'EOStock' ? 'selected' : ''}>Hết hàng</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <div class="d-grid gap-2 d-md-flex">
                                    <button type="submit" class="btn btn-primary me-md-2">
                                        <i class="fas fa-filter me-2"></i>Lọc
                                    </button>
                                    <a href="productlist" class="btn btn-secondary">
                                        <i class="fas fa-eraser me-2"></i>Xóa bộ lọc
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Products Table -->
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <i class="fas fa-list me-2"></i>Danh sách sản phẩm
                        </div>
                        <a href="addproduct" class="btn btn-success">
                            <i class="fas fa-plus me-2"></i>Thêm sản phẩm
                        </a>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered mb-0">
                                <thead>
                                    <tr>
                                        <!--                                        <th>
                                                                                    <a href="productlist?sortField=id&sortDir=${sortField == 'id' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&keyword=${keyword}&categoryId=${categoryId}&status=${status}" class="sort-link">
                                                                                        STT
                                                                                        <span class="sort-icons">
                                        ${sortField == 'id' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                    </span>
                                </a>
                            </th>--><th class="text-center" style="width: 60px;">STT</th>
                                        <th>Ảnh minh họa</th>
                                        <th>
                                            <a href="productlist?sortField=title&sortDir=${sortField == 'title' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&keyword=${keyword}&categoryId=${categoryId}&status=${status}" class="sort-link">
                                                Tên sản phẩm
                                                <span class="sort-icons">
                                                    ${sortField == 'title' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="productlist?sortField=category_id&sortDir=${sortField == 'category_id' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&keyword=${keyword}&categoryId=${categoryId}&status=${status}" class="sort-link">
                                                Danh mục
                                                <span class="sort-icons">
                                                    ${sortField == 'category_id' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="productlist?sortField=original_price&sortDir=${sortField == 'original_price' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&keyword=${keyword}&categoryId=${categoryId}&status=${status}" class="sort-link">
                                                Giá nhập
                                                <span class="sort-icons">
                                                    ${sortField == 'original_price' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="productlist?sortField=sale_price&sortDir=${sortField == 'sale_price' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&keyword=${keyword}&categoryId=${categoryId}&status=${status}" class="sort-link">
                                                Giá bán
                                                <span class="sort-icons">
                                                    ${sortField == 'sale_price' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="productlist?sortField=status&sortDir=${sortField == 'status' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&keyword=${keyword}&categoryId=${categoryId}&status=${status}" class="sort-link">
                                                Trạng thái
                                                <span class="sort-icons">
                                                    ${sortField == 'status' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th class="text-center">Số lượng</th>
                                        <th class="text-center">Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty products}">
                                            <c:forEach items="${products}" var="product" varStatus="status">
                                                <tr>
                                                    <!--<td>${product.id}</td>-->
                                                    <td class="text-center">${status.index + 1 + (currentPage - 1)*10}</td>
                                                    <td>
                                                        <img src="${product.thumbnail.contains('https')? product.thumbnail : pageContext.request.contextPath.concat('/').concat(product.thumbnail)}" alt="${product.title}" class="product-thumbnail">
                                                    </td>
                                                    <td>${product.title}</td>
                                                    <td>
                                                        <c:forEach items="${categories}" var="cate">
                                                            ${(product.categoryId==cate.id)?cate.name:''}
                                                        </c:forEach>
                                                    </td>
                                                    <td><fmt:formatNumber value="${product.originalPrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                                                    <td><fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                                                    <td>
                                                        <span class="status-badge bg-${product.status == 'active' ? 'success' : product.status == 'inactive' ? 'danger' : 'warning'}">
                                                            ${product.status == 'active' ? 'Đang bán' : product.status == 'inactive' ? 'Ngưng bán' : 'Hết hàng'}
                                                        </span>
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="inventoryDetail?id=${product.id}&source=productlist" class="stock-link">
                                                            ${product.stock}
                                                            <i class="fas fa-external-link-alt ms-1"></i>
                                                        </a>
                                                    </td>
                                                    <td class="text-center">
<!--                                                        <a href="product/view?id=${product.id}" class="btn btn-sm btn-info me-1" title="Xem chi tiết">
                                                            <i class="fas fa-eye"></i>
                                                        </a>-->
                                                        <a href="editproduct?id=${product.id}" class="btn btn-primary btn-sm" title="Chỉnh sửa">
                                                            <i class="fas fa-edit"></i>
                                                        </a>
                                                        <button onclick="deleteProduct(${product.id})" class="btn btn-danger btn-sm" title="Xóa">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="9" class="empty-state">
                                                    <i class="fas fa-box-open fa-3x mb-3"></i>
                                                    <p>Không tìm thấy sản phẩm nào!!!</p>
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
                        Hiển thị ${products.size()} / ${totalItems} sản phẩm
                    </div>
                    <nav>
                        <ul class="pagination">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="productlist?page=${currentPage-1}&keyword=${keyword}&categoryId=${categoryId}&status=${status}&sortField=${sortField}&sortDir=${sortDir}" aria-label="Previous">
                                        <i class="fas fa-chevron-left"></i>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="productlist?page=${i}&keyword=${keyword}&categoryId=${categoryId}&status=${status}&sortField=${sortField}&sortDir=${sortDir}">${i}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="productlist?page=${currentPage+1}&keyword=${keyword}&categoryId=${categoryId}&status=${status}&sortField=${sortField}&sortDir=${sortDir}" aria-label="Next">
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                                                            $(document).ready(function () {
                                                                $('.select2').select2({
                                                                    placeholder: "📑 Chọn danh mục",
                                                                    allowClear: true,
                                                                    width: '100%',
                                                                    matcher: function (params, data) {
                                                                        if (!params.term || params.term.trim() === '') {
                                                                            return data;
                                                                        }
                                                                        var term = params.term.toLowerCase();
                                                                        var text = data.text.toLowerCase();
                                                                        if (text.indexOf(term) > -1) {
                                                                            return data;
                                                                        }
                                                                        return null;
                                                                    }
                                                                });

                                                                $('.sidebar-toggle').on('click', function () {
                                                                    $('.sidebar').toggleClass('active');
                                                                    $('.main-content').toggleClass('active');
                                                                    $(this).hide();
                                                                });

                                                                $(document).on('click', function (e) {
                                                                    if ($(window).width() <= 768) {
                                                                        if (!$(e.target).closest('.sidebar').length && !$(e.target).closest('.sidebar-toggle').length) {
                                                                            $('.sidebar').removeClass('active');
                                                                            $('.main-content').removeClass('active');
                                                                            $('.sidebar-toggle').show();
                                                                        }
                                                                    }
                                                                });

                                                                $('.menu-item').removeClass('active');
                                                                $('.menu-item a[href="productlist"]').closest('.menu-item').addClass('active');

                                                                $('#productSubmenu').addClass('show');

                                                                var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                                                                var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                                                                    return new bootstrap.Tooltip(tooltipTriggerEl)
                                                                });
                                                            });

                                                            function deleteProduct(id) {
                                                                if (confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')) {
                                                                    window.location.href = 'deleteproduct?productId=' + id;
                                                                }
                                                            }
        </script>
    </body>
</html>