<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi tiết giỏ hàng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <style>
            :root {
                --primary-color: #3b82f6;
                --secondary-color: #0f172a;
                --accent-color: #ff6b6b;
                --light-bg: #f8fafc;
                --border-radius: 10px;
                --box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            }
            
            body {
                background-color: var(--light-bg);
                font-family: 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;
            }
            
            .container {
                max-width: 1200px;
            }
            
            .card {
                border: none;
                border-radius: var(--border-radius);
                box-shadow: var(--box-shadow);
                transition: transform 0.3s;
            }
            
            .product-image {
                width: 80px;
                height: 80px;
                object-fit: cover;
                border-radius: 8px;
                transition: transform 0.3s;
            }
            
            .product-image:hover {
                transform: scale(1.05);
            }
            
            .table th {
                font-weight: 600;
                color: var(--secondary-color);
                border-top: none;
                border-bottom: 2px solid #e2e8f0;
                padding: 16px 12px;
            }
            
            .table td {
                padding: 16px 12px;
                vertical-align: middle;
                border-bottom: 1px solid #f1f5f9;
            }
            
            .table tr:last-child td {
                border-bottom: none;
            }
            
            .quantity-control {
                max-width: 130px;
            }
            
            .quantity-control .form-control {
                border-color: #e2e8f0;
                text-align: center;
                font-weight: 500;
                height: 38px;
            }
            
            .quantity-control .btn {
                width: 38px;
                height: 38px;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 0;
                background-color: #f1f5f9;
                border-color: #e2e8f0;
                color: var(--secondary-color);
            }
            
            .quantity-control .btn:hover {
                background-color: #e2e8f0;
            }
            
            .btn-primary {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
                font-weight: 500;
                padding: 10px 24px;
                transition: all 0.3s;
            }
            
            .btn-primary:hover {
                background-color: #2563eb;
                border-color: #2563eb;
                transform: translateY(-2px);
            }
            
            .btn-outline-primary {
                color: var(--primary-color);
                border-color: var(--primary-color);
                font-weight: 500;
                padding: 10px 24px;
            }
            
            .btn-outline-primary:hover {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
            }
            
            .form-check-input:checked {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
            }
            
            .form-select {
                border-color: #e2e8f0;
                padding: 10px 12px;
                cursor: pointer;
            }
            
            .text-danger {
                color: var(--accent-color) !important;
            }
            
            .empty-cart-container {
                padding: 40px 0;
            }
            
            .empty-cart-icon {
                color: #cbd5e1;
                font-size: 64px;
                margin-bottom: 16px;
            }
            
            .page-header {
                margin-bottom: 24px;
                position: relative;
            }
            
            .page-header h1 {
                font-weight: 700;
                color: var(--secondary-color);
            }
            
            .page-header:after {
                content: '';
                display: block;
                width: 60px;
                height: 4px;
                background-color: var(--primary-color);
                margin-top: 8px;
                border-radius: 2px;
            }
            
            .cart-summary {
                background-color: white;
                border-radius: var(--border-radius);
                padding: 24px;
            }
            
            .summary-item {
                display: flex;
                justify-content: space-between;
                margin-bottom: 16px;
                color: #64748b;
            }
            
            .summary-total {
                display: flex;
                justify-content: space-between;
                font-size: 18px;
                font-weight: 700;
                color: var(--secondary-color);
                margin-top: 16px;
                padding-top: 16px;
                border-top: 2px solid #f1f5f9;
            }
            
            .summary-total .price {
                color: var(--primary-color);
            }
            
            .checkout-btn {
                padding: 14px;
                font-weight: 600;
                font-size: 16px;
                margin-top: 16px;
            }
            
            .discount-badge {
                display: inline-block;
                background-color: #f0fdf4;
                color: #16a34a;
                font-size: 14px;
                font-weight: 600;
                padding: 4px 12px;
                border-radius: 16px;
            }
            
            .links-card {
                transition: all 0.3s ease;
            }
            
            .links-card a {
                color: #64748b;
                transition: all 0.3s ease;
                font-weight: 500;
            }
            
            .links-card a:hover {
                color: var(--primary-color);
                transform: translateY(-2px);
            }
            
            .links-card a i {
                margin-right: 8px;
                color: var(--primary-color);
            }
            
            .product-title {
                font-weight: 600;
                color: var(--secondary-color);
                margin-bottom: 4px;
            }
            
            .product-meta {
                font-size: 13px;
                color: #64748b;
            }
            
            .price {
                font-weight: 600;
                color: var(--secondary-color);
            }
            
            .coupon-section {
                border-bottom: 1px solid #f1f5f9;
                padding-bottom: 20px;
                margin-bottom: 20px;
            }
            
            .btn-delete {
                color: #94a3b8;
                transition: all 0.2s;
            }
            
            .btn-delete:hover {
                color: var(--accent-color);
                transform: scale(1.1);
            }
            
            @media (max-width: 768px) {
                .quantity-control {
                    max-width: 100px;
                }
                
                .table-responsive {
                    border: none;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="/header.jsp" />
        <div class="container py-5">
            <!-- Header -->
            <div class="page-header mb-4">
                <h1 class="h3">Giỏ hàng của bạn</h1>
            </div>

            <!-- Links -->
            <div class="card mb-4 links-card">
                <div class="card-body py-3">
                    <div class="row text-center">
                        <div class="col-md-4 mb-2 mb-md-0">
                            <a href="contact" class="text-decoration-none d-inline-block">
                                <i class="fas fa-envelope"></i>Liên hệ
                            </a>
                        </div>
                        <div class="col-md-4 mb-2 mb-md-0">
                            <a href="about" class="text-decoration-none d-inline-block">
                                <i class="fas fa-info-circle"></i>Về chúng tôi
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="help" class="text-decoration-none d-inline-block">
                                <i class="fas fa-question-circle"></i>Trợ giúp
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-4">
                <!-- Cart Items -->
                <div class="col-lg-8">
                    <div class="card mb-4">
                        <div class="card-body p-0 p-md-3">
                            <c:choose>
                                <c:when test="${empty cart.items}">
                                    <div class="text-center empty-cart-container">
                                        <i class="fas fa-shopping-cart empty-cart-icon"></i>
                                        <h5 class="mb-3">Giỏ hàng trống</h5>
                                        <p class="text-muted mb-4">Hãy thêm sản phẩm vào giỏ hàng của bạn</p>
                                        <a href="listproduct" class="btn btn-primary">
                                            <i class="fas fa-shopping-bag me-2"></i>Chọn sản phẩm
                                        </a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <form id="checkoutForm" action="cartdetail" method="POST">
                                        <input type="hidden" name="action" value="checkout">
                                        <div class="table-responsive">
                                            <table class="table align-middle mb-0">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">
                                                            <div class="form-check">
                                                                <input type="checkbox" class="form-check-input" id="selectAll" onchange="toggleAllProducts()">
                                                                <label class="form-check-label" for="selectAll">Tất cả</label>
                                                            </div>
                                                        </th>
                                                        <th scope="col">Sản phẩm</th>
                                                        <th scope="col">Giá</th>
                                                        <th scope="col">Số lượng</th>
                                                        <th scope="col"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${cart.items}" var="item">
                                                        <tr data-id="${item.id}">
                                                            <td>
                                                                <div class="form-check">
                                                                    <input type="checkbox" class="form-check-input product-select" 
                                                                           name="selectedItems" value="${item.id}"
                                                                           onchange="updateTotalAmount()">
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="d-flex align-items-center">
                                                                    <img src="${item.productThumbnail}" alt="${item.productTitle}" 
                                                                         class="product-image me-3">
                                                                    <div>
                                                                        <h6 class="product-title">${item.productTitle}</h6>
                                                                        <div class="product-meta">
                                                                            Size: <span class="fw-semibold">${item.size}</span> | Màu: <span class="fw-semibold">${item.color}</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="price">
                                                                    <fmt:formatNumber value="${item.productPrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="quantity-control">
                                                                    <div class="input-group">
                                                                        <button type="button" class="btn btn-outline-secondary" 
                                                                                onclick="updateQuantity(this, -1)">
                                                                            <i class="fas fa-minus"></i>
                                                                        </button>
                                                                        <input type="number" value="${item.quantity}" min="1" 
                                                                               class="form-control text-center quantity-input"
                                                                               data-item-id="${item.id}"
                                                                               onchange="handleQuantityChange(this)">
                                                                        <button type="button" class="btn btn-outline-secondary" 
                                                                                onclick="updateQuantity(this, 1)">
                                                                            <i class="fas fa-plus"></i>
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <button type="button" class="btn btn-delete" 
                                                                        onclick="deleteItem(${item.id})">
                                                                    <i class="fas fa-trash"></i>
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <div class="text-center mb-4">
                        <a href="listproduct" class="btn btn-outline-primary">
                            <i class="fas fa-plus me-2"></i>Tiếp tục mua sắm
                        </a>
                    </div>
                </div>

                <!-- Cart Summary -->
                <div class="col-lg-4">
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title fw-bold mb-3">Mã giảm giá</h5>
                            <select class="form-select" name="couponCode" onchange="updateTotalAmount()">
                                <option value="">Chọn mã giảm giá</option>
                                <c:forEach items="${availableCoupons}" var="coupon">
                                    <option value="${coupon.code}" 
                                            data-type="${coupon.discount_type}"
                                            data-value="${coupon.discount_value}"
                                            data-min="${coupon.min_order_amount}"
                                            data-max="${coupon.max_discount}">
                                        ${coupon.code} - 
                                        <c:choose>
                                            <c:when test="${coupon.discount_type == 'percentage'}">
                                                Giảm ${coupon.discount_value}%
                                            </c:when>
                                            <c:otherwise>
                                                Giảm ₫<fmt:formatNumber value="${coupon.discount_value}" type="number"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title fw-bold mb-4">Tổng đơn hàng</h5>
                            
                            <div class="summary-item">
                                <span>Số sản phẩm đã chọn:</span>
                                <span id="selectedCount" class="fw-semibold">0</span>
                            </div>
                            
                            <div class="summary-item">
                                <span>Tổng tiền hàng:</span>
                                <span id="selectedTotal" class="fw-semibold">₫0</span>
                            </div>
                            
                            <div class="summary-item text-success" id="discountRow" style="display: none;">
                                <span>Giảm giá:</span>
                                <span id="discountAmount" class="fw-semibold">-₫0</span>
                            </div>
                            
                            <div class="summary-total">
                                <span>Tổng thanh toán:</span>
                                <span id="finalTotal" class="price">₫0</span>
                            </div>

                            <button type="button" onclick="submitCheckout()" class="btn btn-primary w-100 checkout-btn" id="checkoutBtn" disabled>
                                Thanh toán<i class="fas fa-arrow-right ms-2"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            // Sửa lại hàm submitCheckout() trong cartdetail.jsp
            function submitCheckout() {
                const form = document.getElementById('checkoutForm');
                const checkboxes = document.getElementsByClassName('product-select');
                let hasSelectedItems = false;

                // Thêm input hidden cho số lượng của từng sản phẩm được chọn
                for (let checkbox of checkboxes) {
                    if (checkbox.checked) {
                        hasSelectedItems = true;
                        const row = checkbox.closest('tr');
                        const itemId = checkbox.value;
                        const quantity = row.querySelector('.quantity-input').value;

                        // Thêm input hidden cho số lượng
                        const quantityInput = document.createElement('input');
                        quantityInput.type = 'hidden';
                        quantityInput.name = 'quantity_' + itemId;
                        quantityInput.value = quantity;
                        form.appendChild(quantityInput);
                    }
                }

                if (!hasSelectedItems) {
                    alert('Vui lòng chọn ít nhất một sản phẩm');
                    return;
                }

                // Thêm thông tin mã giảm giá vào form
                const couponSelect = document.querySelector('select[name="couponCode"]');
                if (couponSelect.value) {
                    const couponInput = document.createElement('input');
                    couponInput.type = 'hidden';
                    couponInput.name = 'couponCode';
                    couponInput.value = couponSelect.value;
                    form.appendChild(couponInput);
                }

                // Gửi form không cần kiểm tra đăng nhập
                form.submit();
            }

            function updateTotalAmount() {
                const checkboxes = document.getElementsByClassName('product-select');
                let totalAmount = 0;
                let selectedCount = 0;

                for (let checkbox of checkboxes) {
                    if (checkbox.checked) {
                        const row = checkbox.closest('tr');
                        const priceText = row.querySelector('td:nth-child(3)').textContent;
                        const price = parseFloat(priceText.replace(/[^\d]/g, ''));
                        const quantity = parseInt(row.querySelector('.quantity-input').value);
                        totalAmount += price * quantity;
                        selectedCount++;
                    }
                }

                document.getElementById('selectedCount').textContent = selectedCount;
                document.getElementById('selectedTotal').textContent = formatCurrency(totalAmount);

                let discount = calculateDiscount(totalAmount);
                updateDiscountDisplay(discount);

                const finalTotal = Math.max(0, totalAmount - discount);
                document.getElementById('finalTotal').textContent = formatCurrency(finalTotal);

                document.getElementById('checkoutBtn').disabled = selectedCount === 0;
                
                // Update selectAll checkbox status
                const selectAll = document.getElementById('selectAll');
                if (checkboxes.length > 0) {
                    selectAll.checked = selectedCount === checkboxes.length;
                    selectAll.indeterminate = selectedCount > 0 && selectedCount < checkboxes.length;
                }
            }

            function calculateDiscount(totalAmount) {
                let discount = 0;
                const select = document.querySelector('select[name="couponCode"]');
                if (select.value && totalAmount > 0) {
                    const option = select.options[select.selectedIndex];
                    const type = option.dataset.type;
                    const value = parseFloat(option.dataset.value);
                    const minAmount = parseFloat(option.dataset.min || 0);
                    const maxDiscount = parseFloat(option.dataset.max || 0);

                    if (totalAmount >= minAmount) {
                        if (type === 'percentage') {
                            discount = (totalAmount * value) / 100;
                            if (maxDiscount > 0 && discount > maxDiscount) {
                                discount = maxDiscount;
                            }
                        } else {
                            discount = value;
                        }
                    }
                }
                return discount;
            }

            function updateDiscountDisplay(discount) {
                const discountRow = document.getElementById('discountRow');
                if (discount > 0) {
                    document.getElementById('discountAmount').textContent = '-' + formatCurrency(discount);
                    discountRow.style.display = 'flex';
                } else {
                    discountRow.style.display = 'none';
                }
            }

            function formatCurrency(amount) {
                return '₫' + amount.toLocaleString('vi-VN');
            }

            function toggleAllProducts() {
                const selectAll = document.getElementById('selectAll');
                const checkboxes = document.getElementsByClassName('product-select');
                for (let checkbox of checkboxes) {
                    checkbox.checked = selectAll.checked;
                }
                updateTotalAmount();
            }

            function updateQuantity(button, change) {
                const input = button.parentElement.querySelector('input');
                const currentValue = parseInt(input.value) || 1; // Đảm bảo giá trị luôn là số
                const newValue = currentValue + change;

                if (newValue >= 1) {
                    input.value = newValue;
                    const itemId = input.dataset.itemId;
                    if (itemId) {
                        updateQuantityOnServer(itemId, newValue);
                        updateTotalAmount();
                    }
                }
            }

            function handleQuantityChange(input) {
                let value = parseInt(input.value) || 1; // Đảm bảo giá trị luôn là số

                // Đảm bảo giá trị tối thiểu là 1
                if (value < 1) {
                    value = 1;
                }

                input.value = value; // Cập nhật giá trị input

                const itemId = input.dataset.itemId;
                if (itemId) {
                    updateQuantityOnServer(itemId, value);
                    updateTotalAmount();
                }
            }

            function updateQuantityOnServer(itemId, quantity) {
                // Kiểm tra tính hợp lệ của dữ liệu
                if (!itemId || !quantity || quantity < 1) {
                    console.error('Invalid itemId or quantity');
                    return;
                }

                const formData = new URLSearchParams();
                formData.append('action', 'update');
                formData.append('cartItemId', itemId);
                formData.append('quantity', quantity);

                fetch('cartdetail', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: formData.toString()
                })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                    })
                    .catch(error => {
                        console.error('Error updating quantity:', error);
                        // Có thể thêm thông báo lỗi cho người dùng ở đây
                    });
            }
            
            function deleteItem(itemId) {
                if (confirm('Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng?')) {
                    const formData = new URLSearchParams();
                    formData.append('action', 'delete');
                    formData.append('cartItemId', itemId);

                    fetch('cartdetail', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: formData.toString()
                    })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok');
                            }
                            // Nếu xóa thành công, cập nhật UI
                            location.reload(); // Tải lại trang để cập nhật giỏ hàng
                        })
                        .catch(error => {
                            console.error('Error deleting item:', error);
                            alert('Có lỗi xảy ra khi xóa sản phẩm. Vui lòng thử lại sau.');
                        });
                }
            }
            
            // Initialize the page
            document.addEventListener('DOMContentLoaded', function() {
                // Check if there are any items in the cart
                const checkboxes = document.getElementsByClassName('product-select');
                if (checkboxes.length > 0) {
                    updateTotalAmount();
                }
            });
        </script>
    </body>
</html>