<%-- 
    Document   : addCoupon
    Created on : Feb 19, 2025, 9:15:00 PM
    Author     : nguye
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thêm mã giảm giá mới</title>
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
                --danger-color: #e74c3c;
                --success-color: #2ecc71;
                --warning-color: #f39c12;
            }

            body {
                background-color: #f8f9fa;
            }

            /* Main content styles */
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

            /* Form styles */
            .form-label {
                font-weight: 500;
                color: var(--primary-color);
            }

            .form-control, .form-select {
                border-radius: 4px;
                border: 1px solid var(--border-color);
                padding: 8px 12px;
            }

            .form-control:focus, .form-select:focus {
                border-color: var(--accent-color);
                box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
            }

            .form-text {
                color: #6c757d;
                font-size: 0.875rem;
            }

            .required-field::after {
                content: ' *';
                color: var(--danger-color);
            }

            /* Toggle button */
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

            /* Form card */
            .form-card {
                background-color: white;
                border-radius: 8px;
                margin-bottom: 20px;
            }

            /* Toggle switch */
            .form-switch .form-check-input {
                width: 3em;
                height: 1.5em;
                margin-top: 0.25em;
            }

            .form-switch .form-check-input:checked {
                background-color: var(--success-color);
                border-color: var(--success-color);
            }

            /* Button styles */
            .btn-submit {
                background-color: var(--accent-color);
                color: white;
                padding: 8px 24px;
                border-radius: 4px;
                transition: all 0.3s;
            }

            .btn-submit:hover {
                background-color: #2980b9;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .btn-cancel {
                background-color: #6c757d;
                color: white;
                padding: 8px 24px;
                border-radius: 4px;
                transition: all 0.3s;
            }

            .btn-cancel:hover {
                background-color: #5a6268;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            /* Responsive */
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
                    <i class="fas fa-tag me-2"></i>Thêm mã giảm giá mới
                </h2>

                <!-- Form Card -->
                <div class="card form-card">
                    <div class="card-header">
                        <i class="fas fa-plus-circle me-2"></i>Thông tin mã giảm giá
                    </div>
                    <div class="card-body">
                        <form action="addCoupon" method="POST" id="couponForm">
                            <!-- Thêm phần hiển thị lỗi chung -->
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    ${error}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </c:if>
                            <!-- Coupon code -->
                            <div class="mb-3">
                                <label for="couponCode" class="form-label required-field">Mã giảm giá</label>
                                <input type="text" class="form-control" 
                                       id="couponCode" name="code" value="${param.code}" required maxlength="20">
                            </div>

                            <!-- Discount type -->
                            <div class="mb-3">
                                <label for="discountType" class="form-label required-field">Loại giảm giá</label>
                                <select class="form-select" id="discountType" name="discount_type" required>
                                    <option value="" selected disabled>-- Chọn loại giảm giá --</option>
                                    <option value="percentage" ${param.discount_type == 'percentage' ? 'selected' : ''}>Phần trăm (%)</option>
                                    <option value="fixed" ${param.discount_type == 'fixed' ? 'selected' : ''}>Cố định (VNĐ)</option>
                                </select>
                            </div>

                            <!-- Discount value -->
                            <div class="mb-3">
                                <label for="discountValue" class="form-label required-field">Giá trị giảm</label>
                                <div class="input-group">
                                    <input type="number" class="form-control" id="discountValue" name="discount_value" value="${param.discount_value}" required>
                                    <span class="input-group-text" id="discountSymbol">₫</span>
                                </div>
                                <span id="discountValueText" class="form-text">text thay đổi theo loại giảm giá</span>
                            </div>

                            <!-- Minimum order amount -->
                            <div class="mb-3">
                                <label for="minOrderAmount" class="form-label required-field">Giá trị đơn hàng tối thiểu</label>
                                <div class="input-group">
                                    <input type="number" class="form-control" id="minOrderAmount" name="min_order_amount" value="${param.min_order_amount}" min="0">
                                    <span class="input-group-text">₫</span>
                                </div>
                            </div>
                                    
                            <!-- Max discount (only for percentage type) -->
                            <div class="mb-3" id="maxDiscountContainer" style="display:none;">
                                <label for="maxDiscount" class="form-label required-field">Giảm tối đa</label>
                                <div class="input-group">
                                    <input type="number" class="form-control"  id="maxDiscount" name="max_discount" value="${param.max_discount}" min="0">
                                    <span class="input-group-text">₫</span>
                                </div>
                            </div>

                            <!-- Usage limit -->
                            <div class="mb-3">
                                <label for="usageLimit" class="form-label required-field">Số lần sử dụng tối đa</label>
                                <input type="number" class="form-control" id="usageLimit" name="usage_limit" value="${param.usage_limit}" min="0">
                            </div>

                            <!-- Expiry date -->
                            <div class="mb-3">
                                <label for="expiryDate" class="form-label required-field">Ngày hết hạn</label>
                                <input type="date" class="form-control" id="expiryDate" name="expiry_date" value="${param.expiry_date}" required>
                            </div>

                            <!-- Status -->
                            <div class="mb-3">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="statusSwitch" name="status" value="active" ${param.status == 'active' ? 'checked' : ''}>
                                </div>
                                <div class="form-text">Bật để kích hoạt mã giảm giá ngay lập tức.</div>
                            </div>

                            <!-- Buttons -->
                            <div class="d-flex justify-content-end mt-4">
                                <a href="couponlist" class="btn btn-cancel me-2">
                                    <i class="fas fa-times me-2"></i>Hủy
                                </a>
                                <button type="submit" class="btn btn-submit">
                                    <i class="fas fa-save me-2"></i>Lưu mã giảm giá
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Add JavaScript for sidebar and form functionality -->
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

                // Highlight current menu item
                $('.menu-item').removeClass('active');
                $('.menu-item a[href="couponlist"]').closest('.menu-item').addClass('active');
            });
        </script>

        <script>
            $(document).ready(function () {
                // Lấy các phần tử một lần để tái sử dụng
                const $discountType = $('#discountType');
                const $discountSymbol = $('#discountSymbol');
                const $maxDiscountContainer = $('#maxDiscountContainer');
                const $maxDiscount = $('#maxDiscount');
                const $discountValueText = $('#discountValueText');

                // Hàm xử lý thay đổi loại giảm giá
                function handleDiscountTypeChange() {
                    const selectedType = $discountType.val();
                    if (selectedType === 'percentage') {
                        $discountSymbol.text('%');
                        $maxDiscountContainer.show();
                        if ($discountValueText.length) {
                            $discountValueText.text('Nhập phần trăm giảm giá (1-50%).');
                        }
                    } else {
                        $discountSymbol.text('₫');
                        $maxDiscountContainer.hide();
                        $maxDiscount.val('');
                        if ($discountValueText.length) {
                            $discountValueText.text('Nhập số tiền giảm giá cố định.');
                        }
                    }
                }

                // Kiểm tra trạng thái ban đầu
                handleDiscountTypeChange();

                // Gán sự kiện change
                $discountType.on('change', handleDiscountTypeChange);

                // Set minimum date for expiry date as today
                const today = new Date().toISOString().split('T')[0];
                $('#expiryDate').attr('min', today);
            });
        </script>
    </body>
</html>