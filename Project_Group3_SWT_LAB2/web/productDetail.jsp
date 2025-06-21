<%-- 
    Document   : productDetail
    Created on : Feb 25, 2025, 2:04:38 AM
    Author     : tphon
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>${product.title} - Fashion Store</title>
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

            .product-container {
                background: white;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                padding: 30px;
                margin-bottom: 30px;
            }

            .product-image-main {
                width: 100%;
                height: 400px;
                object-fit: contain;
                margin-bottom: 20px;
                border-radius: 4px;
            }

            .thumbnail-container {
                display: flex;
                gap: 10px;
                margin-bottom: 20px;
                overflow-x: auto;
                padding-bottom: 10px;
            }

            .thumbnail {
                width: 80px;
                height: 80px;
                object-fit: cover;
                border-radius: 4px;
                cursor: pointer;
                border: 2px solid transparent;
                transition: all 0.3s ease;
            }

            .thumbnail:hover, .thumbnail.active {
                border-color: #333;
                transform: translateY(-2px);
            }

            .product-title {
                font-size: 1.8rem;
                font-weight: 600;
                margin-bottom: 15px;
                color: #333;
            }

            .product-price {
                display: flex;
                align-items: baseline;
                gap: 15px;
                margin-bottom: 20px;
            }

            .sale-price {
                font-size: 1.8rem;
                font-weight: 600;
                color: #e44d26;
            }

            .original-price {
                font-size: 1.2rem;
                color: #999;
                text-decoration: line-through;
            }

            .product-description {
                margin-bottom: 30px;
                color: #666;
                line-height: 1.6;
            }

            .quantity-selector {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .quantity-input {
                width: 70px;
                text-align: center;
            }

            .option-selector {
                margin-bottom: 20px;
            }

            .option-label {
                font-weight: 500;
                margin-bottom: 8px;
                display: block;
            }

            .action-buttons {
                display: flex;
                gap: 15px;
                margin-top: 30px;
            }

            .btn-buy-now {
                flex: 1;
                padding: 12px 20px;
                background: #e44d26;
                color: white;
                border: none;
                border-radius: 4px;
                font-size: 1rem;
                cursor: pointer;
                transition: all 0.3s ease;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
            }

            .btn-add-cart {
                flex: 1;
                padding: 12px 20px;
                background: #333;
                color: white;
                border: none;
                border-radius: 4px;
                font-size: 1rem;
                cursor: pointer;
                transition: all 0.3s ease;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
            }

            .btn-buy-now:hover {
                background: #c53d1d;
                transform: translateY(-2px);
            }

            .btn-add-cart:hover {
                background: #000;
                transform: translateY(-2px);
            }

            .product-meta {
                margin-top: 20px;
                padding-top: 20px;
                border-top: 1px solid #eee;
                font-size: 0.9rem;
                color: #777;
            }

            .meta-item {
                margin-bottom: 8px;
            }

            .feedback-section {
                margin-top: 50px;
            }

            .feedback-title {
                font-size: 1.4rem;
                font-weight: 600;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 1px solid #eee;
            }

            .feedback-item {
                padding: 20px;
                border-bottom: 1px solid #eee;
                display: flex;
                gap: 20px;
            }

            .feedback-avatar {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                background: #eee;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #777;
                font-size: 1.2rem;
            }

            .feedback-content {
                flex: 1;
            }

            .feedback-author {
                font-weight: 500;
                margin-bottom: 5px;
            }

            .feedback-rating {
                color: #f5c518;
                margin-bottom: 8px;
            }

            .feedback-text {
                color: #666;
            }

            .feedback-date {
                font-size: 0.8rem;
                color: #999;
                margin-top: 5px;
            }

            /* Các style mới được thêm vào */
            .options-row {
                display: flex;
                flex-wrap: wrap;
                gap: 15px;
                margin-bottom: 20px;
            }

            .options-col {
                flex: 1;
                min-width: 120px;
            }

            .stock-status {
                display: flex;
                align-items: center;
                margin-left: 15px;
                padding: 6px 0;
            }

            .stock-status.in-stock {
                color: #28a745;
            }

            .stock-status.out-of-stock {
                color: #dc3545;
            }

            /* Responsive adjustments */
            @media (max-width: 768px) {
                .action-buttons {
                    flex-direction: column;
                }

                .product-image-main {
                    height: 300px;
                }

                .options-row {
                    flex-direction: column;
                }

                .options-col {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div class="container">
            <div class="product-container">
                <div class="row">
                    <!-- Product Images Column -->
                    <div class="col-md-6">
                        <img src="${product.thumbnail}" class="product-image-main" id="main-product-image" alt="${product.title}">

                        <div class="thumbnail-container">
                            <c:forEach items="${product.subImages}" var="image" varStatus="status">
                                <img src="${image}" class="thumbnail ${status.index == 0 ? 'active' : ''}" 
                                     alt="${product.title} - Image ${status.index + 1}"
                                     onclick="changeMainImage(this.src)">
                            </c:forEach>
                        </div>
                    </div>

                    <!-- Product Details Column -->
                    <div class="col-md-6">
                        <h1 class="product-title">${product.title}</h1>

                        <div class="product-price">
                            <div class="sale-price">
                                <fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                            </div>
                            <%--<c:if test="${product.originalPrice > product.salePrice}">--%>
                            <!--<div class="original-price">-->
                            <%--<fmt:formatNumber value="${product.originalPrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>--%>
                            <!--</div>-->
                            <%--</c:if>--%>
                        </div>
                        <!--Tạm thời ẩn phần mô tả đã do lỗi ckeditor-->
<!--                        <div class="product-description">
                            ${product.description}
                        </div>-->

                        <form action="productdetail" method="POST">
                            <input type="hidden" name="id" value="${product.id}">

                            <!-- Size và Color Selector trên cùng một hàng -->
                            <div class="options-row">
                                <div class="options-col">
                                    <label for="sizeId" class="option-label">Chọn Size</label>
                                    <select id="sizeId" name="sizeId" class="form-select" required="" onchange="this.form.submit()">
                                        <option value="">Chọn Size</option>
                                        <c:forEach items="${sizes}" var="size">
                                            <option value="${size.id}" ${sizeId == size.id ? 'selected' : ''}>${size.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="options-col">
                                    <label for="colorId" class="option-label">Chọn Màu</label>
                                    <select id="colorId" name="colorId" class="form-select" required="" onchange="this.form.submit()">
                                        <option value="">Chọn Màu</option>
                                        <c:forEach items="${colors}" var="color">
                                            <option value="${color.id}" ${colorId == color.id ? 'selected' : ''}>${color.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <!-- Quantity Selector và tình trạng hàng trên cùng một hàng -->
                            <div class="options-row align-items-end">
                                <div class="options-col">
                                    <label for="quantity" class="option-label">Số Lượng</label>
                                    <div class="quantity-selector">
                                        <button type="button" class="btn btn-outline-secondary" onclick="decrementQuantity()">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <input type="number" id="quantity" name="quantity" class="form-control quantity-input" value="1" min="1" max="${product.stock}">
                                        <button type="button" class="btn btn-outline-secondary" onclick="incrementQuantity()">
                                            <i class="fas fa-plus"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="options-col">
                                    <div class="stock-status ${product.stock > 0 ? 'in-stock' : 'out-of-stock'}">
                                        <i class="fas ${product.stock > 0 ? 'fa-check-circle' : 'fa-times-circle'}"></i>
                                        <span class="ms-2">
                                            ${product.stock > 0 ? 'Còn Hàng (' : 'Hết Hàng'} 
                                            ${product.stock > 0 ? product.stock : ''}
                                            ${product.stock > 0 ? ')' : ''}
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <!-- Action Buttons -->
                            <div class="action-buttons">
                                <button type="submit" name="action" value="buyNow" class="btn-buy-now">
                                    <i class="fas fa-bolt"></i> Mua Ngay
                                </button>
                                <button type="submit" name="action" value="addToCart" class="btn-add-cart">
                                    <i class="fas fa-shopping-cart"></i> Thêm Vào Giỏ
                                </button>
                            </div>
                        </form>

                        <!-- Product Metadata -->
                        <div class="product-meta">
                            <div class="meta-item">
                                <strong>Danh Mục:</strong> <a href="listproduct?category=${product.categoryId}">${categoryName}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!---------------------Hiển thị danh sách đánh giá sản phẩm, nhưng chưa phát triển-------------------------------------------------->
            <!-- Feedback Section -->
            <div class="feedback-section">
                <h2 class="feedback-title">Đánh Giá (${feedbacks.size()>0 ? feedbacks.size() : 0})</h2>


                <c:choose>
                    <c:when test="${not empty feedbacks}">
                        <c:forEach items="${feedbacks}" var="feedback">
                            <div class="feedback-item">
                                <div class="feedback-avatar">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div class="feedback-content">
                                    <div class="feedback-author">${feedback.userName}</div>
                                    <div class="feedback-rating">
                                        <c:forEach begin="1" end="5" var="i">
                                            <i class="fas fa-star {
                                                   i <= feedback.rating ? '' : 'text-muted'
                                               }"></i>
                                        </c:forEach>
                                    </div>
                                    <div class="feedback-text">{feedback.comment}</div>
                                    <div class="feedback-date">
                                        <fmt:formatDate value="${feedback.createdAt}" pattern="dd/MM/yyyy" />
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center py-5">
                            <i class="fas fa-comment-alt text-muted" style="font-size: 48px;"></i>
                            <p class="mt-3 text-muted">Chưa có đánh giá nào cho sản phẩm này</p>
                        </div>
                    </c:otherwise>
                </c:choose>
                <!---------------------------------------------------------------------------------------------------------------------->
            </div>
        </div>

        <jsp:include page="footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                                            function changeMainImage(src) {
                                                document.getElementById('main-product-image').src = src;

                                                // Update active thumbnail
                                                const thumbnails = document.querySelectorAll('.thumbnail');
                                                thumbnails.forEach(thumb => {
                                                    if (thumb.src === src) {
                                                        thumb.classList.add('active');
                                                    } else {
                                                        thumb.classList.remove('active');
                                                    }
                                                });
                                            }

                                            function incrementQuantity() {
                                                const quantityInput = document.getElementById('quantity');
                                                const maxQuantity = ${product.stock};

                                                if (parseInt(quantityInput.value) < maxQuantity) {
                                                    quantityInput.value = parseInt(quantityInput.value) + 1;
                                                }
                                            }

                                            function decrementQuantity() {
                                                const quantityInput = document.getElementById('quantity');

                                                if (parseInt(quantityInput.value) > 1) {
                                                    quantityInput.value = parseInt(quantityInput.value) - 1;
                                                }
                                            }

                                            // Validate quantity input
                                            document.getElementById('quantity').addEventListener('change', function () {
                                                const value = parseInt(this.value);
                                                const maxQuantity = ${product.stock};

                                                if (value < 1) {
                                                    this.value = 1;
                                                } else if (value > maxQuantity) {
                                                    this.value = maxQuantity;
                                                    alert('Số lượng tối đa có sẵn là ' + maxQuantity);
                                                }
                                            });
        </script>
    </body>
</html>