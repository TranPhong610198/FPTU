<%-- 
    Document   : productList
    Created on : Feb 24, 2025, 1:40:02 AM
    Author     : tphon
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>${categoryName != null ? categoryName : 'All Products'} - Fashion Store</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }

            .filters {
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                margin-bottom: 30px;
            }

            .filter-title {
                font-size: 1.1rem;
                font-weight: 600;
                margin-bottom: 15px;
                color: #333;
            }

            .price-range {
                display: flex;
                gap: 10px;
                align-items: center;
                margin-bottom: 15px;
            }

            .price-input {
                width: 120px;
            }

            .product-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 25px;
                margin-top: 30px;
            }

            .product-card {
                background: white;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                transition: transform 0.3s ease;
            }

            .product-card:hover {
                transform: translateY(-5px);
            }

            .product-image {
                width: 100%;
                height: 250px;
                object-fit: cover;
            }

            .product-info {
                padding: 15px;
            }

            .product-title {
                font-size: 1rem;
                font-weight: 500;
                margin-bottom: 10px;
                color: #333;
                height: 40px;
                overflow: hidden;
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
            }

            .product-price {
                display: flex;
                align-items: baseline;
                gap: 10px;
                margin-bottom: 15px;
            }

            .product-buttons {
                display: flex;
                gap: 8px;
                margin-top: 10px;
            }

            .btn-buy-now {
                flex: 1;
                padding: 8px;
                background: #e44d26;
                color: white;
                border: none;
                border-radius: 4px;
                font-size: 0.9rem;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .btn-add-cart {
                flex: 1;
                padding: 8px;
                background: #333;
                color: white;
                border: none;
                border-radius: 4px;
                font-size: 0.9rem;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .btn-buy-now:hover {
                background: #c53d1d;
                transform: translateY(-2px);
            }

            .btn-add-cart:hover {
                background: #000;
                transform: translateY(-2px);
            }

            .sale-price {
                font-size: 1.2rem;
                font-weight: 600;
                color: #e44d26;
            }

            .original-price {
                font-size: 0.9rem;
                color: #999;
                text-decoration: line-through;
            }

            .view-button {
                display: block;
                width: 100%;
                padding: 8px;
                background: #333;
                color: white;
                text-align: center;
                text-decoration: none;
                border-radius: 4px;
                transition: background 0.3s ease;
            }

            .view-button:hover {
                background: #000;
                color: white;
            }

            .pagination {
                margin-top: 40px;
                justify-content: center;
            }

            .page-link {
                color: #333;
                border: none;
                margin: 0 5px;
                border-radius: 4px;
                padding: 8px 16px;
            }

            .page-link:hover {
                background: #333;
                color: white;
            }

            .page-item.active .page-link {
                background: #333;
                border-color: #333;
            }

            .sort-select {
                min-width: 200px;
            }

            .search-box {
                position: relative;
            }

            .search-input {
                padding-right: 40px;
            }

            .search-button {
                position: absolute;
                right: 0;
                top: 0;
                height: 100%;
                width: 40px;
                background: none;
                border: none;
                color: #666;
            }

            .search-button:hover {
                color: #333;
            }

            .no-products {
                text-align: center;
                padding: 40px;
                background: white;
                border-radius: 8px;
                margin-top: 30px;
            }

            .no-products i {
                font-size: 48px;
                color: #ddd;
                margin-bottom: 20px;
            }

            .no-products h3 {
                color: #666;
                margin-bottom: 10px;
            }

            .no-products p {
                color: #999;
            }

            /* Responsive adjustments */
            @media (max-width: 768px) {
                .product-grid {
                    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                    gap: 15px;
                }

                .filters .row > div {
                    margin-bottom: 20px;
                }

                .price-range {
                    flex-direction: column;
                    align-items: stretch;
                }

                .price-input {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div class="container">
            <!-- Page Title -->
            <h1 class="h2 mb-4 text-center">${categoryName != null ? categoryName : 'Tất Cả Sản Phẩm'}</h1>

            <!-- Filters Section -->
            <div class="filters">
                <form action="listproduct" method="GET" id="filterForm">
                    <div class="row align-items-end">
                        <div class="col-md-4">
                            <div class="filter-title">Khoảng Giá</div>
                            <div class="d-flex">
                                <input type="number" id="minPrice" name="minPrice" step="500" min="0" class="form-control me-2" placeholder="Thấp Nhất" value="${minPrice}">
                                <span class="align-self-center">-</span>
                                <input type="number" id="maxPrice" name="maxPrice" step="500" min="0" class="form-control ms-2" placeholder="Cao Nhất" value="${maxPrice}">
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="filter-title">Sắp xếp</div>
                            <select name="sortBy" class="form-select">
                                <option value="">Mặc Định</option>
                                <option value="price_asc" ${sortBy == 'price_asc' ? 'selected' : ''}>Giá: Thấp đến Cao</option>
                                <option value="price_desc" ${sortBy == 'price_desc' ? 'selected' : ''}>Giá: Cao xuống Thấp</option>
                                <option value="newest" ${sortBy == 'newest' ? 'selected' : ''}>Mới nhất</option>
                            </select>
                        </div>

                        <div class="col-md-1">
                            <button class="btn btn-outline-secondary w-50" type="submit">
                                <i class="fa-solid fa-filter"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>

            <!-- Products Grid -->
            <c:choose>
                <c:when test="${not empty products}">
                    <div class="product-grid">
                        <c:if test="${not empty product.comboProducts}">
                            <c:if test="${product.id == product.comboProducts.get(comboProducts.size()).id}">
                                <c:forEach items="${products}" var="product">
                                    <div class="product-card">
                                        <a href="productdetail?id=${product.id}" style="text-decoration:none;">
                                            <img src="${product.thumbnail}" class="product-image" alt="${product.title}">
                                            <div class="product-info">
                                                <h5 class="product-title"> <i class="fas fa-box-open me-1"></i>Combo ${product.title}</h5>
                                                <div class="product-price">
                                                    <fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>                                                                                        
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </c:if>
                        <c:if test="${empty product.comboProducts}">
                            <c:forEach items="${products}" var="product">
                                <div class="product-card">
                                    <a href="productdetail?id=${product.id}" style="text-decoration:none;">
                                        <img src="${product.thumbnail}" class="product-image" alt="${product.title}">
                                        <div class="product-info">
                                            <h5 class="product-title">${product.title}</h5>
                                            <div class="product-price">
                                                <fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>                                                                                        
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="no-products">
                        <i class="fas fa-box-open"></i>
                        <h3>No Products Found</h3>
                        <p>Try adjusting your search criteria or browse our categories</p>
                    </div>
                </c:otherwise>
            </c:choose>

            <!-- Pagination -->
            <c:if test="${totalPages > 1}">
                <nav aria-label="Product pagination">
                    <ul class="pagination">
                        <!-- Previous page -->
                        <c:if test="${currentPage > 1}">

                            <li class="page-item">
                                <a class="page-link" href="listproduct?page=${currentPage - 1}&keyword=${keyword}&category=${selectedCategory}&minPrice=${minPrice}&maxPrice=${maxPrice}&sortBy=${sortBy}">
                                    <i class="fas fa-chevron-left"></i>
                                </a>
                            </li>
                        </c:if>

                        <!-- Page numbers -->
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                <a class="page-link" href="listproduct?page=${i}&keyword=${keyword}&category=${selectedCategory}&minPrice=${minPrice}&maxPrice=${maxPrice}&sortBy=${sortBy}">
                                    ${i}
                                </a>
                            </li>
                        </c:forEach>

                        <!-- Next page -->
                        <c:if test="${currentPage < totalPages}">
                            <li class="page-item">
                                <a class="page-link" href="listproduct?page=${currentPage + 1}&keyword=${keyword}&category=${selectedCategory}&minPrice=${minPrice}&maxPrice=${maxPrice}&sortBy=${sortBy}">
                                    <i class="fas fa-chevron-right"></i>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </c:if>
        </div>

        <jsp:include page="footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            $('#maxPrice').on('change', function () {
                const maxPrice = parseFloat($('#maxPrice').val()) || 0;
                const minPrice = parseFloat($('#minPrice').val()) || 0;

                if (maxPrice < minPrice) {
                    alert('Giá khuyến mãi không được nhỏ hơn giá gốc!');
                    $('#maxPrice').val(minPrice);
                }
            });
        </script>
    </body>
</html>
