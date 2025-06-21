<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chỉnh sửa sản phẩm</title>
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

            .preview-image {
                max-width: 200px;
                max-height: 200px;
                border-radius: 4px;
                border: 1px solid var(--border-color);
                margin-top: 10px;
            }

            .sub-images-container {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
                margin-top: 10px;
            }

            .sub-image-card {
                width: 150px;
                border: 1px solid var(--border-color);
                border-radius: 8px;
                padding: 10px;
                align-items: center;
                text-align: center;
            }

            .sub-image-preview {
                width: 100px;
                height: 100px;
                object-fit: cover;
                border-radius: 4px;
                border: 1px solid var(--border-color);
                cursor: pointer;
            }

            .sub-image-actions {
                margin-top: 10px;
                display: flex;
                justify-content: space-between;
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
        <jsp:include page="../sidebar.jsp" />
        <button class="btn btn-primary sidebar-toggle"><i class="fas fa-bars"></i></button>

        <div class="main-content">
            <div class="container-fluid p-4">
                <h2 class="page-title"><i class="fas fa-edit me-2"></i>Chỉnh sửa sản phẩm</h2>
                <div class="card">
                    <div class="card-header"><i class="fas fa-info-circle me-2"></i>Thông tin sản phẩm</div>
                    <div class="card-body">
                        <form action="editproduct" method="post" enctype="multipart/form-data" class="row g-3">
                            <input type="hidden" name="action" value="updateProduct">
                            <input type="hidden" name="productId" value="${product.id}">
                            <div class="col-md-6">
                                <label for="title" class="form-label">Tên sản phẩm</label>
                                <input type="text" class="form-control" id="title" name="title" value="${product.title}" required />
                            </div>
                            <div class="col-md-6">
                                <label for="categoryId" class="form-label">Danh mục</label>
                                <select class="form-select" id="categoryId" name="categoryId" required>
                                    <c:forEach var="category" items="${categories}">
                                        <option value="${category.id}" ${category.id == product.categoryId ? 'selected' : ''}>${category.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="originalPrice" class="form-label">Giá gốc (₫)</label>
                                <input type="number" class="form-control" id="originalPrice" name="originalPrice" value="${product.originalPrice.intValue()}" step="500" min="0" required />
                            </div>
                            <div class="col-md-6">
                                <label for="salePrice" class="form-label">Giá bán (₫)</label>
                                <input type="number" class="form-control" id="salePrice" name="salePrice" value="${product.salePrice.intValue()}" step="500" min="0" required />
                            </div>
                            <div class="col-md-6 d-flex flex-column justify-content-center align-items-center">
                                <label for="comboGroupId" class="form-label mb-2">
                                    <div class="form-check d-flex justify-content-center align-items-center">
                                        <input class="form-check-input me-2" type="checkbox" id="isCombo" name="isCombo" ${product.isCombo ? 'checked' : ''}>
                                        <label class="form-check-label" for="isCombo">Là sản phẩm chính của combo</label>
                                    </div>
                                </label>
                                <select class="form-select" id="comboGroupId" name="comboGroupId" style="width: 50%;">
                                    <option value="0" ${0 == product.comboGroupId ? 'selected' : ''}>Không thuộc combo nào</option>
                                    <c:forEach var="comboProduct" items="${comboProducts}">
                                        <option value="${comboProduct.comboGroupId}" ${comboProduct.comboGroupId == product.comboGroupId ? 'selected' : ''}>${comboProduct.title}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-6 d-flex flex-column justify-content-center align-items-center">
                                <label for="status" class="form-label mb-2">Trạng thái sản phẩm</label>
                                <select class="form-select" id="status" name="status" style="width: 50%;" ${product.status.equals('EOStock') ? 'disabled' : ''}>
                                    <option value="active" ${product.status eq 'active' ? 'selected' : ''}>Đang Bán</option>
                                    <option value="inactive" ${product.status eq 'inactive' ? 'selected' : ''}>Ngưng Bán</option>
                                    <option value="EOStock" ${product.status.equals('EOStock') ? 'selected' : ''}>Hết hàng</option>
                                </select>
                            </div>

                            <!-- Tạm ẩn chức năng mô tả sản phẩm tại vì đang bi lỗi ckeditor                            
                                                            <div class="col-12">
                                                            <label for="description" class="form-label">Mô tả sản phẩm</label>
                                                            <textarea class="form-control" id="description" name="description">${product.description}</textarea>
                                                        </div>-->


                            <!-- Phần ảnh chính -->
                            <div class="col-md-6 mt-3">
                                <label for="thumbnail" class="form-label">Ảnh chính</label>
                                <input type="file" class="form-control" id="thumbnail" name="thumbnail" accept="image/*" onchange="previewThumbnail(this)" />
                                <img src="${product.thumbnail.contains('https')? product.thumbnail : pageContext.request.contextPath.concat('/').concat(product.thumbnail)}" class="preview-image" alt="Current Thumbnail">
                            </div>

                            <div class="col-12 mt-4">
                                <button type="submit" class="btn btn-primary"><i class="fas fa-save me-2"></i>Lưu thay đổi</button>
                                <a href="productlist" class="btn btn-secondary"><i class="fas fa-arrow-left me-2"></i>Quay lại</a>
                            </div>
                        </form>
                        <!-- Phần ảnh phụ -->
                        <div class="col-12 mt-3">
                            <label class="form-label">Ảnh phụ</label>
                            <div class="sub-images-container">
                                <c:forEach var="subImage" items="${product.subImages}" varStatus="loop">
                                    <div class="sub-image-card">
                                        <img src="${pageContext.request.contextPath}/${subImage}" class="sub-image-preview" alt="Sub Image ${loop.count}" onclick="previewSubImage('${pageContext.request.contextPath}/${subImage}')">
                                        <div class="sub-image-actions">
                                            <form action="editproduct" method="post" enctype="multipart/form-data">
                                                <input type="hidden" name="action" value="replaceSubImage">
                                                <input type="hidden" name="oldSubImg" value="${subImage}">
                                                <input type="hidden" name="productId" value="${product.id}">
                                                <input type="file" class="form-control" name="subImage" accept="image/*" onchange="this.form.submit();">
                                            </form>
                                            <form action="editproduct" method="post" enctype="multipart/form-data" onsubmit="return confirm('Bạn có chắc muốn xóa ảnh này?')">
                                                <input type="hidden" name="action" value="deleteSubImage">
                                                <input type="hidden" name="oldSubImg" value="${subImage}">
                                                <input type="hidden" name="productId" value="${product.id}">
                                                <button type="submit" class="btn btn-danger btn-sm" style="height: 38px">Xóa</button>
                                            </form>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="mt-3">
                                <form action="editproduct" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="action" value="addNewSubImage">
                                    <input type="hidden" name="productId" value="${product.id}">
                                    <input type="file" class="form-control" name="newSubImage" accept="image/*" multiple onchange="this.form.submit();">
                                    <div class="form-text">Thêm ảnh phụ mới (tối đa 5 ảnh)</div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                        // In đậm vị trí trang trên sidebar
                                        $('.menu-item').removeClass('active');
                                        $('.menu-item a[href="addproduct"]').closest('.menu-item').addClass('active');
                                        $('#productSubmenu').addClass('show');
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


                                            $('#salePrice').on('change', function () {
                                                const originalPrice = parseInt($('#originalPrice').val()) || 0;
                                                const salePrice = parseInt($('#salePrice').val()) || 0;

                                                if (salePrice < originalPrice) {
                                                    alert('Giá bán không được nhỏ hơn giá gốc!');
                                                    $('#salePrice').val(originalPrice);
                                                }
                                            });
                                        });

                                        function isValidImage(file) {
                                            const allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];
                                            return allowedTypes.includes(file.type);
                                        }

                                        function previewThumbnail(input) {
                                            const previewImg = input.closest('.col-md-6').querySelector('.preview-image');

                                            if (input.files && input.files[0]) {
                                                const file = input.files[0];

                                                // Kiểm tra xem có phải file ảnh hợp lệ không
                                                const allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];
                                                if (!allowedTypes.includes(file.type)) {
                                                    alert('Chỉ chấp nhận file ảnh (JPG, PNG, GIF, WEBP).');
                                                    input.value = ''; // Xóa file nếu không hợp lệ
                                                    return;
                                                }

                                                // Hiển thị ảnh mới trong preview
                                                const reader = new FileReader();
                                                reader.onload = function (e) {
                                                    previewImg.src = e.target.result;
                                                };
                                                reader.readAsDataURL(file);
                                            }
                                        }

                                        function previewSubImage(imageUrl) {
                                            window.open(imageUrl, '_blank');
                                        }

                                        $(document).ready(function () {
                                            // Xử lý khi checkbox isCombo thay đổi
                                            updateComboGroupIdVisibility();
                                            $('#isCombo').change(function () {
                                                updateComboGroupIdVisibility();
                                            });

                                            function updateComboGroupIdVisibility() {
                                                const isCombo = $('#isCombo').is(':checked'); // Kiểm tra trạng thái checkbox
                                                const comboBoxElement = $("#comboGroupId");

                                                if (isCombo) {
                                                    // Nếu checkbox được chọn, vô hiệu hóa select và xóa giá trị
                                                    comboBoxElement.prop("disabled", true);
                                                    comboBoxElement.val(${requestScope.product.getComboGroupId()}); // Đặt về option mặc định
                                                } else {
                                                    // Nếu checkbox không được chọn, kích hoạt lại select
                                                    comboBoxElement.val(${requestScope.product.getComboGroupId()});
                                                    comboBoxElement.prop("disabled", false);
                                                }
                                            }
                                        });
                                        $('.menu-item a[href="editproduct"]').closest('.menu-item').addClass('active');
                                        CKEDITOR.replace('description');



        </script>

    </body>
</html>