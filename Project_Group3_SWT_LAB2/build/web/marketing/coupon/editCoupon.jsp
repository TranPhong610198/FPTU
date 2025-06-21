<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chỉnh sửa mã giảm giá</title>
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

            .form-card {
                background-color: white;
                border-radius: 8px;
                margin-bottom: 20px;
            }

            .form-switch .form-check-input {
                width: 3em;
                height: 1.5em;
                margin-top: 0.25em;
            }

            .form-switch .form-check-input:checked {
                background-color: var(--success-color);
                border-color: var(--success-color);
            }

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
                    <i class="fas fa-edit me-2"></i>Chỉnh sửa mã giảm giá
                </h2>

                <!-- Form Card -->
                <div class="card form-card">
                    <div class="card-header">
                        <i class="fas fa-pen-square me-2"></i>Thông tin mã giảm giá
                    </div>
                    <div class="card-body">
                        <form action="editCoupon" method="POST" id="couponForm">
                            <input type="hidden" name="id" value="${coupon.id}">
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    ${error}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </c:if>

                            <!-- Coupon code -->
                            <div class="mb-3">
                                <label for="code" class="form-label required-field">Mã giảm giá</label>
                                <input type="text" class="form-control" id="code" name="code" value="${param.code != null ? param.code : coupon.code}" required maxlength="20">
                                <div class="form-text">Nhập mã giảm giá không quá 20 ký tự, chỉ sử dụng chữ cái, số và dấu gạch dưới.</div>
                            </div>

                            <!-- Discount type -->
                            <div class="mb-3">
                                <label for="discount_type" class="form-label required-field">Loại giảm giá</label>
                                <select class="form-select" id="discount_type" name="discount_type" required>
                                    <option value="percentage" ${param.discount_type == 'percentage' || (param.discount_type == null && coupon.discount_type == 'percentage') ? 'selected' : ''}>Phần trăm (%)</option>
                                    <option value="fixed" ${param.discount_type == 'fixed' || (param.discount_type == null && coupon.discount_type == 'fixed') ? 'selected' : ''}>Cố định (VNĐ)</option>
                                </select>
                            </div>

                            <!-- Discount value -->
                            <div class="mb-3">
                                <label for="discount_value" class="form-label required-field">Giá trị giảm</label>
                                <div class="input-group">
                                    <input type="number" class="form-control" id="discount_value" name="discount_value" value="${param.discount_value != null ? param.discount_value : coupon.discount_value}" required step="1" maxFractionDigits="0">
                                    <span class="input-group-text" id="discountSymbol">₫</span>
                                </div>
                                <div class="form-text" id="discountValueText">Nhập giá trị giảm giá.</div>
                            </div>

                            <!-- Minimum order amount -->
                            <div class="mb-3">
                                <label for="min_order_amount" class="form-label required-field">Giá trị đơn hàng tối thiểu</label>
                                <div class="input-group">
                                    <input type="number" class="form-control" id="min_order_amount" name="min_order_amount" value="${param.min_order_amount != null ? param.min_order_amount : coupon.min_order_amount}" min="0">
                                    <span class="input-group-text">₫</span>
                                </div>
                            </div>

                            <!-- Max discount -->
                            <div class="mb-3" id="maxDiscountContainer">
                                <label for="max_discount" class="form-label required-field">Giảm tối đa</label>
                                <div class="input-group">
                                    <input type="number" class="form-control" id="max_discount" name="max_discount" value="${param.max_discount != null ? param.max_discount : coupon.max_discount}" min="0">
                                    <span class="input-group-text">₫</span>
                                </div>
                            </div>

                            <!-- Usage limit -->
                            <div class="mb-3">
                                <label for="usage_limit" class="form-label required-field">Số lần sử dụng tối đa</label>
                                <input type="number" class="form-control" id="usage_limit" name="usage_limit" value="${param.usage_limit != null ? param.usage_limit : coupon.usage_limit}" min="0">
                            </div>

                            <!-- Expiry date -->
                            <div class="mb-3">
                                <label for="expiry_date" class="form-label required-field">Ngày hết hạn</label>
                                <input type="date" class="form-control" id="expiry_date" name="expiry_date" value="${param.expiry_date != null ? param.expiry_date : coupon.expiry_date}" required>
                            </div>

                            <!-- Status -->
                            <div class="mb-3">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="statusSwitch" name="status" value="active" ${param.status == 'active' || (param.status == null && coupon.status == 'active') ? 'checked' : ''}>
                                </div>
                                <div class="form-text">Bật để kích hoạt mã giảm giá.</div>
                            </div>

                            <!-- Buttons -->
                            <div class="d-flex justify-content-end mt-4">
                                <a href="couponlist" class="btn btn-cancel me-2">
                                    <i class="fas fa-times me-2"></i>Hủy
                                </a>
                                <button type="submit" class="btn btn-submit">
                                    <i class="fas fa-save me-2"></i>Cập nhật
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
                // Set minimum date for expiry date as today
                const today = new Date();
                const formattedDate = today.toISOString().split('T')[0];
                $('#expiry_date').attr('min', formattedDate);

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

                // Handle discount type change
                function updateDiscountType() {
                    const selectedType = $('#discount_type').val();
                    if (selectedType === 'percentage') {
                        $('#discountSymbol').text('%');
                        $('#maxDiscountContainer').show();
                        $('#discountValueText').text('Nhập phần trăm giảm giá (1-50%).');
                    } else {
                        $('#discountSymbol').text('₫');
                        $('#maxDiscountContainer').hide();
                        $('#discountValueText').text('Nhập số tiền giảm giá cố định.');
                    }
                }

                $('#discount_type').on('change', updateDiscountType);
                updateDiscountType(); // Run on page load
            });
        </script>
    </body>
</html>