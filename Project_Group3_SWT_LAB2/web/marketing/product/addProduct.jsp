<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thêm sản phẩm</title>
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

            .form-control:focus, .form-select:focus {
                border-color: var(--accent-color);
                box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.25);
            }

            .form-text {
                color: #6c757d;
            }

            .btn-primary {
                background-color: var(--accent-color);
                border-color: var(--accent-color);
            }

            .btn-primary:hover {
                background-color: #2980b9;
                border-color: #2980b9;
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

            .alert {
                border-radius: 8px;
            }

            .preview-image {
                max-width: 200px;
                max-height: 200px;
                border-radius: 4px;
                border: 1px solid var(--border-color);
                margin-top: 10px;
            }

            .sub-images-preview {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
                margin-top: 10px;
            }

            .sub-image-preview {
                width: 100px;
                height: 100px;
                object-fit: cover;
                border-radius: 4px;
                border: 1px solid var(--border-color);
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
                <c:if test="${alert != null && !alert.trim().isEmpty()}">
                    <c:choose>
                        <c:when test="${alert.equals('oP_IV')}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                Giá gốc phải lớn hơn 0 và bé hơn 100.000.000
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                        <c:when test="${alert.equals('sP_IV')}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                Giá bán phải lớn hơn 0 và bé hơn 100.000.000
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                        <c:when test="${alert.equals('ER1_IVImg')}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                Chỉ chấp nhận file ảnh (JPG, PNG, GIF, WEBP).
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                        <c:when test="${alert.equals('ER_dp')}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                Sản phẩm đã tồn tại trong hệ thống
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                        <c:when test="${alert.equals('ERR')}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                Lỗi không xác định.
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                    </c:choose>
                </c:if>
                <h2 class="page-title">
                    <i class="fas fa-plus-circle me-2"></i>Thêm sản phẩm mới
                </h2>
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-info-circle me-2"></i>Thông tin sản phẩm
                    </div>
                    <div class="card-body">
                        <form action="addproduct" method="post" enctype="multipart/form-data" class="row g-3">
                            <!-- Tên sản phẩm -->
                            <div class="col-md-6">
                                <label for="title" class="form-label">Tên sản phẩm</label>
                                <input type="text" class="form-control" id="title" name="title" required />
                                <div class="form-text">Nhập tên sản phẩm đầy đủ và chính xác</div>
                            </div>

                            <!-- Chọn danh mục -->
                            <div class="col-md-6">
                                <label for="categoryId" class="form-label">Danh mục</label>
                                <select class="form-select" id="categoryId" name="categoryId" required>
                                    <option value="" selected disabled>Chọn danh mục</option>
                                    <c:forEach var="category" items="${categories}">
                                        <option value="${category.id}">${category.name}</option>
                                    </c:forEach>
                                </select>
                            </div>



                            <!-- Giá gốc -->
                            <div class="col-md-6">
                                <label for="originalPrice" class="form-label">Giá gốc (₫)</label>
                                <input type="text" class="form-control" id="originalPrice" name="originalPrice"required />
                            </div>

                            <!-- Giá khuyến mãi -->
                            <div class="col-md-6">
                                <label for="salePrice" class="form-label">Giá bán (₫)</label>
                                <input type="text" class="form-control" id="salePrice" name="salePrice" required />
                                <div class="form-text">Giá bán phải lớn hơn hoặc bằng giá gốc</div>
                            </div>

                            <!-- Chọn nhóm combo -->
                            <div class="col-md-6 d-flex flex-column justify-content-center align-items-center">
                                <label for="comboGroupId" class="form-label mb-2">
                                    <div class="form-check d-flex justify-content-center align-items-center" style="height: 100%;">
                                        <input class="form-check-input me-2" type="checkbox" id="isCombo" name="isCombo">
                                        <label class="form-check-label" for="isCombo">
                                            Là sản phẩm chính của combo
                                        </label>
                                    </div>
                                </label>
                                <select class="form-select" id="comboGroupId" name="comboGroupId" style="width: 50%;">
                                    <option value="">Không thuộc combo nào</option>
                                    <c:forEach var="comboProduct" items="${comboProducts}">
                                        <option value="${comboProduct.comboGroupId}">${comboProduct.title}</option>
                                    </c:forEach>
                                </select>
                            </div>


                            <!-- Mô tả //// tạm thời ẩn vì chức năng ckeditor upload ảnh lên đang bị lỗi--> 
                            <!--                            <div class="col-12">
                                                            <label for="description" class="form-label">Mô tả sản phẩm</label>
                                                            <textarea class="form-control" id="description" name="description" rows="5" placeholder="Nhập mô tả chi tiết về sản phẩm..."></textarea>
                                                        </div>-->

                            <!-- Ảnh chính -->
                            <div class="col-md-6">
                                <label for="thumbnail" class="form-label">Ảnh chính</label>
                                <input type="file" class="form-control" id="thumbnail" name="thumbnail" accept="image/*" required onchange="previewThumbnail(this)" />
                                <div class="form-text">Kích thước tối ưu: 800x800px, định dạng: JPG, PNG</div>
                                <div id="thumbnailPreview"></div>
                            </div>

                            <!-- Ảnh phụ -->
                            <!--                            <div class="col-md-6">
                                                            <label for="subImages" class="form-label">Ảnh phụ (tối đa 5 ảnh)</label>
                                                            <input type="file" class="form-control" id="subImages" name="subImages" accept="image/*" multiple onchange="previewSubImages(this)" />
                                                            <div class="form-text">Chọn tối đa 5 ảnh chi tiết sản phẩm</div>
                                                            <div id="subImagesPreview" class="sub-images-preview"></div>
                                                        </div>-->

                            <div class="col-12 mt-4">
                                <div class="d-flex gap-2">
                                    <button id="submitTest" type="submit" class="btn btn-primary">
                                        <i class="fas fa-save me-2"></i>Thêm sản phẩm
                                    </button>
                                    <a href="productlist" class="btn btn-secondary">
                                        <i class="fas fa-arrow-left me-2"></i>Quay lại
                                    </a>
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

                                        // In đậm vị trí trang trên sidebar
                                        $('.menu-item').removeClass('active');
                                        $('.menu-item a[href="addproduct"]').closest('.menu-item').addClass('active');
                                        $('#productSubmenu').addClass('show');
                                    });

                                    function formatNumberInput(input) {
                                        let value = input.value.replace(/\D/g, '');
                                        console.log(value);
                                        if (value) {
                                            value = parseInt(value, 10).toLocaleString('vi-VN');
                                            input.value = value;
                                        } else {
                                            input.value = '';
                                        }
                                    }

                                    // Chạy sau khi trang đã tải
                                    document.addEventListener('DOMContentLoaded', function () {
                                        const originalPriceInput = document.getElementById('originalPrice');
                                        const salePriceInput = document.getElementById('salePrice');

                                        originalPriceInput.addEventListener('input', function () {
                                            formatNumberInput(this);
                                            if (originalPriceInput.value.replace(/\./g, '') > 99999999) {
                                                alert('Giới hạn nhập vào là 99.999.999 đ sửa lại đi không lỗi đấy!!!');
//                                                $('#originalPrice').val('0');
                                            }
                                        });


                                        salePriceInput.addEventListener('input', function () {
                                            formatNumberInput(this);
                                            if (salePriceInput.value.replace(/\./g, '') > 99999999) {
                                                alert('Giới hạn nhập vào là 99.999.999 đ sửa lại đi không lỗi đấy!!!');
//                                                $('#salePrice').val('0');
                                            }
                                        });
                                    });

                                    // Kiểm tra tính hợp lệ của giá
                                    $('#salePrice').on('change', function () {
                                        const originalPrice = parseInt($('#originalPrice').val().replace(/\./g, '')) || 0;
                                        const salePrice = parseInt($('#salePrice').val().replace(/\./g, '')) || 0;

                                        if (salePrice < originalPrice) {
                                            alert('Giá bán không được nhỏ hơn giá gốc!');
                                            $('#salePrice').val(parseInt(originalPrice, 10).toLocaleString('vi-VN'));
                                        }
                                    });

                                    // Hàm kiểm tra đuôi file
                                    function isValidImage(file) {
                                        const allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];
                                        return allowedTypes.includes(file.type);
                                    }

                                    // Xem trước ảnh chính
                                    function previewThumbnail(input) {
                                        const preview = document.getElementById('thumbnailPreview');
                                        preview.innerHTML = '';

                                        if (input.files && input.files[0]) {
                                            const file = input.files[0];
                                            if (!isValidImage(file)) {
                                                alert('Chỉ chấp nhận file ảnh (JPG, PNG, GIF, WEBP).');
                                                input.value = ''; //xóa nội dung ko phải ảnh
                                                return;
                                            }
                                            const reader = new FileReader();

                                            reader.onload = function (e) {
                                                const img = document.createElement('img');
                                                img.src = e.target.result;
                                                img.className = 'preview-image';
                                                preview.appendChild(img);
                                            }

                                            reader.readAsDataURL(input.files[0]);
                                        }
                                    }
//
//                                    // Xem trước các ảnh phụ
//                                    function previewSubImages(input) {
//                                        const preview = document.getElementById('subImagesPreview');
//                                        preview.innerHTML = '';
//
//                                        if (input.files) {
//                                            const filesAmount = input.files.length;
//                                            const maxFiles = 5;
//
//                                            for (let i = 0; i < Math.min(filesAmount, maxFiles); i++) {
//                                                const file = input.files[i];
//                                                if (!isValidImage(file)) {
//                                                    alert('Chỉ chấp nhận file ảnh (JPG, PNG, GIF, WEBP).');
//                                                    input.value = ''; //xóa nội dung ko phải ảnh
//                                                    return;
//                                                }
//                                                const reader = new FileReader();
//                                                reader.onload = function (e) {
//                                                    const img = document.createElement('img');
//                                                    img.src = e.target.result;
//                                                    img.className = 'sub-image-preview';
//                                                    preview.appendChild(img);
//                                                }
//
//                                                reader.readAsDataURL(input.files[i]);
//                                            }
//
//                                            if (filesAmount > maxFiles) {
//                                                alert(`Bạn đã chọn ${filesAmount} ảnh. Chỉ 5 ảnh đầu tiên sẽ được hiển thị.`);
//                                            }
//                                        }
//                                    }

                                    $(document).ready(function () {
                                        // Khởi tạo trạng thái ban đầu
                                        updateComboGroupIdVisibility();

                                        // Xử lý khi checkbox isCombo thay đổi
                                        $('#isCombo').change(function () {
                                            updateComboGroupIdVisibility();
                                        });

                                        function updateComboGroupIdVisibility() {
                                            const isCombo = $('#isCombo').is(':checked'); // Kiểm tra trạng thái checkbox
                                            const comboBoxElement = $("#comboGroupId");

                                            if (isCombo) {
                                                // Nếu checkbox được chọn, vô hiệu hóa select và xóa giá trị
                                                comboBoxElement.prop("disabled", true);
                                                comboBoxElement.val(""); // Đặt về option mặc định
                                            } else {
                                                // Nếu checkbox không được chọn, kích hoạt lại select
                                                comboBoxElement.prop("disabled", false);
                                            }
                                        }
                                    });

                                    CKEDITOR.replace('description');
        </script>


    </body>
</html>
