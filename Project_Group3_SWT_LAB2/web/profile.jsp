<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="User Profile Management">
        <title>User Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link href="assests/css/profile.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div class="container-profile">
            <div class="row g-4">
                <!-- Profile Info Column -->
                <div class="col-md-3">
                    <div class="profile-card">
                        <div class="avatar-container">
                            <img src="${sessionScope.acc.avatar}" alt="avatar" class="profile-picture" 
                                 onerror="this.src='https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg'">
                            <div class="avatar-overlay" onclick="document.getElementById('avatar').click()">
                                <i class="fas fa-camera"></i>
                            </div>
                        </div>

                        <form action="profile" method="post" enctype="multipart/form-data" id="avatarForm">
                            <input type="hidden" name="action" value="update_avatar">
                            <input type="file" class="form-control d-none" id="avatar" name="avatar" 
                                   accept="image/jpeg,image/png,image/gif,image/webp" onchange="validateAndPreviewImage(this)">
                            <div class="preview-container">
                                <img id="preview" src="#" alt="Preview">
                                <div class="upload-actions d-flex">
                                    <button type="submit" class="btn btn-primary flex-grow-1">
                                        <i class="fas fa-check me-2"></i>Lưu ảnh
                                    </button>
                                    <button type="button" class="btn btn-secondary flex-grow-1" onclick="cancelUpload()">
                                        <i class="fas fa-times me-2"></i>Hủy
                                    </button>
                                </div>
                            </div>
                        </form>

                        <div class="user-info">
                            <h4>${requestScope.user.fullName}</h4>
                            <div class="contact-info">
                                <div><i class="fas fa-envelope"></i>${requestScope.user.email}</div>
                                <div><i class="fas fa-phone"></i>${requestScope.user.mobile}</div>
                            </div>
                            <div class="d-flex justify-content-center gap-3">
                                <a href="changepassword" class="btn btn-primary btn-sm">
                                    <i class="fas fa-key me-2"></i> Đổi mật khẩu
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Personal Info and Shipping Addresses Column -->
                <div class="col-md-9">
                    <div class="profile-card p-4">
                        <h2 class="section-title">
                            <i class="fas fa-user-circle"></i>Thông tin cá nhân
                        </h2>
                        <form action="profile" method="post" class="needs-validation mb-4" novalidate>
                            <input type="hidden" name="action" value="update_profile">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Tài khoản</label>
                                    <input type="text" class="form-control" value="${requestScope.user.username}" readonly>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Họ và tên</label>
                                    <input type="text" class="form-control" name="fullName" 
                                           value="${requestScope.user.fullName}" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Giới tính</label>
                                    <select class="form-control" name="gender" required>
                                        <option value="male" ${requestScope.user.gender == 'male' ? 'selected' : ''}>Nam</option>
                                        <option value="female" ${requestScope.user.gender == 'female' ? 'selected' : ''}>Nữ</option>
                                        <option value="other" ${requestScope.user.gender == 'other' ? 'selected' : ''}>Khác</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Số điện thoại</label>
                                    <input type="text" class="form-control" name="mobile" 
                                           value="${requestScope.user.mobile}" pattern="[0-9]{10}" required>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-save me-2"></i>Lưu thông tin
                                    </button>
                                </div>
                            </div>
                        </form>

                        <!-- Addresses section with modal button -->
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h3 class="section-title mb-0">
                                <i class="fas fa-map-marker-alt"></i>Địa chỉ vận chuyển
                            </h3>
                            <button type="button" class="btn btn-outline-primary" 
                                    data-bs-toggle="modal" data-bs-target="#addAddressModal">
                                <i class="fas fa-plus me-2"></i>Thêm địa chỉ mới
                            </button>
                        </div>

                        <div class="addresses-container mb-4">
                            <c:choose>
                                <c:when test="${empty addresses}">
                                    <div class="alert alert-info">
                                        <p>Bạn chưa có địa chỉ giao hàng nào. Vui lòng thêm địa chỉ mới.</p>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="address" items="${addresses}">
                                        <div class="address-item">
                                            <div class="row align-items-center">
                                                <div class="col">
                                                    <div class="col-auto">
                                                        <c:choose>
                                                            <c:when test="${address.isDefault}">
                                                                <span class="badge bg-warning text-dark">
                                                                    <i class="fas fa-star me-1"></i>Mặc định
                                                                </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <form action="profile" method="post" class="d-inline">
                                                                    <input type="hidden" name="action" value="set_default">
                                                                    <input type="hidden" name="address_id" value="${address.id}">
                                                                    <button type="submit" class="btn btn-link p-0">
                                                                        <i class="fas fa-star text-secondary"></i>Thiết lập mặc định
                                                                    </button>
                                                                </form>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <p><i class="fas fa-user me-2"></i>${address.recipientName}</p>
                                                    <p><i class="fas fa-phone me-2"></i>${address.phone}</p>
                                                    <p class="mb-0"><i class="fas fa-home me-2"></i>${address.address}</p>
                                                </div>
                                                <div class="col-auto">
                                                    <c:if test="${!address.isDefault}">
                                                        <form action="profile" method="post" class="d-inline">
                                                            <input type="hidden" name="action" value="delete">
                                                            <input type="hidden" name="address_id" value="${address.id}">
                                                            <button type="submit" class="btn btn-danger btn-sm" 
                                                                    onclick="return confirm('Bạn có muốn xóa địa chỉ này không?')">
                                                                <i class="fas fa-trash-alt"></i>
                                                            </button>
                                                        </form>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <div class="mt-4 d-flex justify-content-end">
                            <button type="button" class="btn btn-secondary" onclick="window.location.href = '<%= request.getContextPath() %>/home'">
                                <i class="fas fa-arrow-left me-2"></i>Quay lại
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Address Modal -->
        <div class="modal fade" id="addAddressModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Thêm địa chỉ mới</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <form action="profile" method="post">
                        <input type="hidden" name="action" value="add">
                        <div class="modal-body">
                            <div class="mb-3">
                                <label class="form-label">Họ tên người nhận</label>
                                <input type="text" class="form-control" name="recipient_name" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Số điện thoại</label>
                                <input type="tel" class="form-control" name="phone" 
                                       pattern="[0-9]{10}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Tỉnh/Thành phố</label>
                                <select class="form-select" id="province" required>
                                    <option value="">Chọn tỉnh/thành phố</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Quận/Huyện</label>
                                <select class="form-select" id="district" required disabled>
                                    <option value="">Chọn quận/huyện</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Phường/Xã</label>
                                <select class="form-select" id="ward" required disabled>
                                    <option value="">Chọn phường/xã</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Địa chỉ cụ thể</label>
                                <textarea class="form-control" id="specific_address" 
                                          rows="2" placeholder="Số nhà, tên đường" required></textarea>
                            </div>
                            <input type="hidden" name="address" id="full_address">
                            <div class="form-check mb-3">
                                <input type="checkbox" class="form-check-input" 
                                       name="is_default" id="defaultAddress">
                                <label class="form-check-label" for="defaultAddress">
                                    Đặt làm địa chỉ mặc định
                                </label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary">Thêm địa chỉ</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                // API URLs for address selection
                                const API_PROVINCE = 'https://provinces.open-api.vn/api/?depth=1';
                                const API_DISTRICT = 'https://provinces.open-api.vn/api/p/';
                                const API_WARD = 'https://provinces.open-api.vn/api/d/';

                                // Elements for address form
                                const provinceSelect = document.getElementById('province');
                                const districtSelect = document.getElementById('district');
                                const wardSelect = document.getElementById('ward');
                                const specificAddress = document.getElementById('specific_address');
                                const fullAddressInput = document.getElementById('full_address');

                                // Load provinces
                                async function loadProvinces() {
                                    try {
                                        const response = await fetch(API_PROVINCE);
                                        const data = await response.json();
                                        data.forEach(province => {
                                            const option = document.createElement('option');
                                            option.value = province.code;
                                            option.textContent = province.name;
                                            provinceSelect.appendChild(option);
                                        });
                                    } catch (error) {
                                        console.error('Error loading provinces:', error);
                                    }
                                }

                                // Load districts
                                async function loadDistricts(provinceCode) {
                                    try {
                                        const response = await fetch(API_DISTRICT + provinceCode + '?depth=2');
                                        const data = await response.json();

                                        districtSelect.innerHTML = '<option value="">Chọn quận/huyện</option>';
                                        districtSelect.disabled = false;

                                        wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';
                                        wardSelect.disabled = true;

                                        data.districts.forEach(district => {
                                            const option = document.createElement('option');
                                            option.value = district.code;
                                            option.textContent = district.name;
                                            districtSelect.appendChild(option);
                                        });
                                    } catch (error) {
                                        console.error('Error loading districts:', error);
                                    }
                                }

                                // Load wards
                                async function loadWards(districtCode) {
                                    try {
                                        const response = await fetch(API_WARD + districtCode + '?depth=2');
                                        const data = await response.json();

                                        wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';
                                        wardSelect.disabled = false;

                                        data.wards.forEach(ward => {
                                            const option = document.createElement('option');
                                            option.value = ward.code;
                                            option.textContent = ward.name;
                                            wardSelect.appendChild(option);
                                        });
                                    } catch (error) {
                                        console.error('Error loading wards:', error);
                                    }
                                }

                                // Update full address
                                function updateFullAddress() {
                                    const province = provinceSelect.options[provinceSelect.selectedIndex]?.text || '';
                                    const district = districtSelect.options[districtSelect.selectedIndex]?.text || '';
                                    const ward = wardSelect.options[wardSelect.selectedIndex]?.text || '';
                                    const specific = specificAddress.value.trim();

                                    // Tạo mảng chứa các phần tử địa chỉ có giá trị
                                    const addressParts = [];

                                    if (specific)
                                        addressParts.push(specific);
                                    if (ward)
                                        addressParts.push(ward);
                                    if (district)
                                        addressParts.push(district);
                                    if (province)
                                        addressParts.push(province);

                                    // Nối các phần tử bằng dấu phẩy và khoảng trắng
                                    const fullAddress = addressParts.join(', ');

                                    // Cập nhật giá trị vào input ẩn
                                    if (fullAddress) {
                                        fullAddressInput.value = fullAddress;
                                    }
                                }

                                // Event listeners
                                provinceSelect.addEventListener('change', (e) => {
                                    if (e.target.value) {
                                        loadDistricts(e.target.value);
                                    } else {
                                        districtSelect.innerHTML = '<option value="">Chọn quận/huyện</option>';
                                        districtSelect.disabled = true;
                                        wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';
                                        wardSelect.disabled = true;
                                    }
                                    updateFullAddress();
                                });

                                districtSelect.addEventListener('change', (e) => {
                                    if (e.target.value) {
                                        loadWards(e.target.value);
                                    } else {
                                        wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';
                                        wardSelect.disabled = true;
                                    }
                                    updateFullAddress();
                                });

                                wardSelect.addEventListener('change', updateFullAddress);
                                specificAddress.addEventListener('input', updateFullAddress);

                                // Avatar image preview and validation
                                function validateAndPreviewImage(input) {
                                    const allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];
                                    const file = input.files[0];

                                    if (file && !allowedTypes.includes(file.type)) {
                                        alert('Chỉ chấp nhận file ảnh có định dạng: JPG, PNG, GIF, WEBP');
                                        input.value = ''; // Reset input file
                                        return;
                                    }

                                    const maxSize = 10 * 1024 * 1024; // 10MB
                                    if (file && file.size > maxSize) {
                                        alert('Kích thước file không được vượt quá 10MB');
                                        input.value = '';
                                        return;
                                    }

                                    previewImage(input);
                                }

                                function previewImage(input) {
                                    const preview = document.getElementById('preview');
                                    const previewContainer = document.querySelector('.preview-container');
                                    const uploadActions = document.querySelector('.upload-actions');

                                    if (input.files && input.files[0]) {
                                        const reader = new FileReader();

                                        reader.onload = function (e) {
                                            preview.src = e.target.result;
                                            previewContainer.style.display = 'block';
                                            uploadActions.style.display = 'flex';
                                        }

                                        reader.readAsDataURL(input.files[0]);
                                    }
                                }

                                function cancelUpload() {
                                    const form = document.getElementById('avatarForm');
                                    const preview = document.getElementById('preview');
                                    const previewContainer = document.querySelector('.preview-container');
                                    const uploadActions = document.querySelector('.upload-actions');

                                    form.reset();
                                    preview.src = '#';
                                    previewContainer.style.display = 'none';
                                    uploadActions.style.display = 'none';
                                }

                                // Form validation
                                (() => {
                                    'use strict'
                                    const forms = document.querySelectorAll('.needs-validation')
                                    Array.from(forms).forEach(form => {
                                        form.addEventListener('submit', event => {
                                            if (!form.checkValidity()) {
                                                event.preventDefault()
                                                event.stopPropagation()
                                            }
                                            form.classList.add('was-validated')
                                        }, false)
                                    })
                                })()

                                // Initialize on page load
                                document.addEventListener('DOMContentLoaded', function () {
                                    loadProvinces();

                                    // Reset address form when modal is opened
                                    const addressModal = document.getElementById('addAddressModal');
                                    if (addressModal) {
                                        addressModal.addEventListener('show.bs.modal', function () {
                                            const form = addressModal.querySelector('form');
                                            if (form) {
                                                form.reset();
                                                districtSelect.disabled = true;
                                                wardSelect.disabled = true;
                                            }
                                        });
                                    }
                                });
        </script>

        <jsp:include page="footer.jsp" />
    </body>
</html>